From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 23:19:12 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/nginx: use /run
 instead of /var/run
Message-ID: <20201030082143.DBAD486391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b18bd17aab0e916d5961bb21870a238e47ff4b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This is a follow-up to 4027ba29f448 ("package/nginx: use /run for
PIDFile"), in which we missed that nginx is still built with /var/run
paths.

This commit changes the compile options to use /run instead of
/var/run for pid and lock file to make it consistent.

Further dropping the passing of the pid option in the service file as
this isn't neccessary. Neither debian nor nginx default .service does
it.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d200ceffb2eab5c097684c5b9a2e6c6097b1f698)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.mk      | 4 ++--
 package/nginx/nginx.service | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6b0b318247..64dc71fb90 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -49,8 +49,8 @@ NGINX_CONF_OPTS += \
 	--prefix=/usr \
 	--conf-path=/etc/nginx/nginx.conf \
 	--sbin-path=/usr/sbin/nginx \
-	--pid-path=/var/run/nginx.pid \
-	--lock-path=/var/run/lock/nginx.lock \
+	--pid-path=/run/nginx.pid \
+	--lock-path=/run/lock/nginx.lock \
 	--user=www-data \
 	--group=www-data \
 	--error-log-path=/var/log/nginx/error.log \
diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 9fd215fd3e..f203cecdc0 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -6,10 +6,10 @@ After=syslog.target network.target
 Type=forking
 PIDFile=/run/nginx.pid
 ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
-ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
-ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
-ExecReload=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;' -s reload
-ExecStop=/usr/sbin/nginx -g 'pid /var/run/nginx.pid;' -s quit
+ExecStartPre=/usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
+ExecStart=/usr/sbin/nginx -g 'daemon on; master_process on;'
+ExecReload=/usr/sbin/nginx -g 'daemon on; master_process on;' -s reload
+ExecStop=/usr/sbin/nginx -s quit
 PrivateDevices=yes
 
 [Install]
