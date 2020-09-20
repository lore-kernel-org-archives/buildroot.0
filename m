From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:31:40 +0200
Subject: [Buildroot] [git commit] package/nginx: add stream realip option
Message-ID: <20200920132339.951EE82658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=456aa0fb7e8d31e6bfbad4353264ca53c574f764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stream realip is available since version 1.11.4 and
https://github.com/nginx/nginx/commit/fe2774a9d689fa1bf201dd0e89449e3d9e4ad926

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 5 +++++
 package/nginx/nginx.mk  | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 6dba7e0ead..507b4dcfb4 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -328,6 +328,11 @@ config BR2_PACKAGE_NGINX_STREAM
 
 if BR2_PACKAGE_NGINX_STREAM
 
+config BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE
+	bool "ngx_stream_realip_module"
+	help
+	  Enable ngx_stream_realip_module
+
 config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	bool "ngx_stream_ssl_module"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6b0b318247..9696d6b37d 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -224,6 +224,10 @@ endif # BR2_PACKAGE_NGINX_MAIL
 ifeq ($(BR2_PACKAGE_NGINX_STREAM),y)
 NGINX_CONF_OPTS += --with-stream
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE),y)
+NGINX_CONF_OPTS += --with-stream_realip_module
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
 NGINX_DEPENDENCIES += openssl
 NGINX_CONF_OPTS += --with-stream_ssl_module
