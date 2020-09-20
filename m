From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 10:13:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/nginx: add stream ssl preread module
In-Reply-To: <20200920081354.663762-1-fontaine.fabrice@gmail.com>
References: <20200920081354.663762-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920081354.663762-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stream ssl preread is available since version 1.11.5 and
https://github.com/nginx/nginx/commit/5a7afb1b0d3f74d0ff96d4d9c519c26deb0fde39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/Config.in | 5 +++++
 package/nginx/nginx.mk  | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 507b4dcfb4..30947e50fe 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -345,6 +345,11 @@ config BR2_PACKAGE_NGINX_STREAM_GEOIP_MODULE
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
index 2fcdf91b0c..7d9214baff 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -238,6 +238,10 @@ NGINX_DEPENDENCIES += geoip
 NGINX_CONF_OPTS += --with-stream_geoip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_PREREAD_MODULE),y)
+NGINX_CONF_OPTS += --with-stream_ssl_preread_module
+endif
+
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
-- 
2.28.0
