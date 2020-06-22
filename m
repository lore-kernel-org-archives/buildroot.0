From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:44:41 +0200
Subject: [Buildroot] [git commit] package/nginx: add stream geoip support
Message-ID: <20200622204309.46A2D81312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dee2af32d429eece214fb80c7ad783eece4034d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stream geoip module has been added in version 1.11.3 with
https://github.com/nginx/nginx/commit/4cf0e2848372b7566f49a9cb4b8dcf9dbad43597

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 09af4680ee..9f742e3e6b 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -334,6 +334,12 @@ config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	help
 	  Enable ngx_stream_ssl_module
 
+config BR2_PACKAGE_NGINX_STREAM_GEOIP_MODULE
+	bool "ngx_stream_geoip_module"
+	select BR2_PACKAGE_GEOIP
+	help
+	  Enable ngx_stream_geoip_module
+
 config BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE
 	bool "ngx_stream_limit_conn_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9fdc53fc2a..8a5739cbb4 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -229,6 +229,11 @@ NGINX_DEPENDENCIES += openssl
 NGINX_CONF_OPTS += --with-stream_ssl_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_GEOIP_MODULE),y)
+NGINX_DEPENDENCIES += geoip
+NGINX_CONF_OPTS += --with-stream_geoip_module
+endif
+
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
