From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:31:42 +0200
Subject: [Buildroot] [git commit] package/nginx: add stream ssl preread
 module
Message-ID: <20200920132339.B5285818AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=483114fda6ce85021de97f58133814d3f7ee24ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stream ssl preread is available since version 1.11.5 and
https://github.com/nginx/nginx/commit/5a7afb1b0d3f74d0ff96d4d9c519c26deb0fde39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 5 +++++
 package/nginx/nginx.mk  | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 15e63f4a76..6ae790a949 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -351,6 +351,11 @@ config BR2_PACKAGE_NGINX_STREAM_GEOIP_MODULE
 	help
 	  Enable ngx_stream_geoip_module
 
+config BR2_PACKAGE_NGINX_STREAM_SSL_PREREAD_MODULE
+	bool "ngx_stream_ssl_preread_module"
+	help
+	  Enable ngx_stream_ssl_preread_module
+
 config BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE
 	bool "ngx_stream_limit_conn_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 06fc49d246..6ecd6a9a80 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -239,6 +239,10 @@ NGINX_DEPENDENCIES += geoip
 NGINX_CONF_OPTS += --with-stream_geoip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_PREREAD_MODULE),y)
+NGINX_CONF_OPTS += --with-stream_ssl_preread_module
+endif
+
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
