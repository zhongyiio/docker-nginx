
ARG IMAGE_ARG_IMAGE_TAG

FROM nginx:${IMAGE_ARG_IMAGE_TAG:-1.15} as base

# see https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile

FROM scratch

COPY --from=base / /

EXPOSE 80 8070

STOPSIGNAL SIGTERM

VOLUME ["/etc/nginx/conf.d", "/var/log/nginx", "/usr/share/nginx"]

CMD ["nginx", "-g", "daemon off;"]

