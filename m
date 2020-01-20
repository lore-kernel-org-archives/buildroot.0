From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon, 20 Jan 2020 10:16:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/nginx: use StateDirectory
Message-ID: <20200120091633.6062-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

move
  http-client-body-temp-path
  http-proxy-temp-path
  http-fastcgi-temp-path
  http-scgi-temp-path
  http-uwsgi-temp-path

from /var/tmp/nginx to /var/lib/nginx

this allows the use of systemd constructs

  LogsDirectory=nginx
  StateDirectory=nginx

to replace

  ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx

as there isn't similar construct for /var/tmp

as a sidenote, ubuntu also uses /var/lib/nginx

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/nginx/S50nginx      |  2 +-
 package/nginx/nginx.mk      | 10 +++++-----
 package/nginx/nginx.service |  3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
index 964652b..db41099 100644
--- a/package/nginx/S50nginx
+++ b/package/nginx/S50nginx
@@ -9,7 +9,7 @@ PIDFILE=/var/run/nginx.pid
 case "$1" in
   start)
 	echo "Starting nginx..."
-	mkdir -p /var/log/nginx /var/tmp/nginx
+	mkdir -p /var/log/nginx /var/lib/nginx
 	start-stop-daemon -S -x "$NGINX" -p "$PIDFILE"
 	;;
   stop)
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 59fddbb..9a9dd94 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -56,11 +56,11 @@ NGINX_CONF_OPTS += \
 	--group=www-data \
 	--error-log-path=/var/log/nginx/error.log \
 	--http-log-path=/var/log/nginx/access.log \
-	--http-client-body-temp-path=/var/tmp/nginx/client-body \
-	--http-proxy-temp-path=/var/tmp/nginx/proxy \
-	--http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
-	--http-scgi-temp-path=/var/tmp/nginx/scgi \
-	--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
+	--http-client-body-temp-path=/var/lib/nginx/client-body \
+	--http-proxy-temp-path=/var/lib/nginx/proxy \
+	--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
+	--http-scgi-temp-path=/var/lib/nginx/scgi \
+	--http-uwsgi-temp-path=/var/lib/nginx/uwsgi
 
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 320df9a..d2f5f38 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -4,8 +4,9 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
+LogsDirectory=nginx
+StateDirectory=nginx
 PIDFile=/var/run/nginx.pid
-ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
 ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecReload=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;' -s reload
-- 
2.7.4
