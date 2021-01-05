From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 23:32:03 +0100
Subject: [Buildroot] [git commit] package/nginx: use /var/cache/nginx
 instead of /var/tmp/nginx
Message-ID: <20210105221432.1CE708360B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=856a6518750ca170c27ac9b81dc7c9cc2dbd0bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

move
  http-client-body-temp-path
  http-proxy-temp-path
  http-fastcgi-temp-path
  http-scgi-temp-path
  http-uwsgi-temp-path

from /var/tmp/nginx to /var/cache/nginx

this allows the use of systemd constructs

  LogsDirectory=nginx
  CacheDirectory=nginx

to replace

  ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx

as there isn't a similar construct for /var/tmp.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/S50nginx      |  2 +-
 package/nginx/nginx.mk      | 10 +++++-----
 package/nginx/nginx.service |  3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
index 964652b922..6c243f40b3 100644
--- a/package/nginx/S50nginx
+++ b/package/nginx/S50nginx
@@ -9,7 +9,7 @@ PIDFILE=/var/run/nginx.pid
 case "$1" in
   start)
 	echo "Starting nginx..."
-	mkdir -p /var/log/nginx /var/tmp/nginx
+	mkdir -p /var/log/nginx /var/cache/nginx
 	start-stop-daemon -S -x "$NGINX" -p "$PIDFILE"
 	;;
   stop)
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 00fb147682..fb06108ab3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -55,11 +55,11 @@ NGINX_CONF_OPTS += \
 	--group=www-data \
 	--error-log-path=/var/log/nginx/error.log \
 	--http-log-path=/var/log/nginx/access.log \
-	--http-client-body-temp-path=/var/tmp/nginx/client-body \
-	--http-proxy-temp-path=/var/tmp/nginx/proxy \
-	--http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
-	--http-scgi-temp-path=/var/tmp/nginx/scgi \
-	--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
+	--http-client-body-temp-path=/var/cache/nginx/client-body \
+	--http-proxy-temp-path=/var/cache/nginx/proxy \
+	--http-fastcgi-temp-path=/var/cache/nginx/fastcgi \
+	--http-scgi-temp-path=/var/cache/nginx/scgi \
+	--http-uwsgi-temp-path=/var/cache/nginx/uwsgi
 
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index f203cecdc0..11ccd62237 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -4,8 +4,9 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
+LogsDirectory=nginx
+CacheDirectory=nginx
 PIDFile=/run/nginx.pid
-ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
 ExecStartPre=/usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'daemon on; master_process on;'
 ExecReload=/usr/sbin/nginx -g 'daemon on; master_process on;' -s reload
