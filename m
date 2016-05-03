From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 10:36:55 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/nginx: add support for stream
	proxy modules
In-Reply-To: <1462268217-31545-1-git-send-email-martin@barkynet.com>
References: <1462268217-31545-1-git-send-email-martin@barkynet.com>
Message-ID: <1462268217-31545-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - no changes
---
 package/nginx/Config.in | 43 +++++++++++++++++++++++++++++++++++++++++++
 package/nginx/nginx.mk  | 18 ++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 0c39a63..f925cc7 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -304,6 +304,49 @@ config BR2_PACKAGE_NGINX_MAIL_SMTP_MODULE
 
 endif #BR2_PACKAGE_NGINX_MAIL
 
+config BR2_PACKAGE_NGINX_STREAM
+	bool "stream proxy modules"
+
+if BR2_PACKAGE_NGINX_STREAM
+
+config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
+	bool "ngx_stream_ssl_module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable ngx_stream_ssl_module
+
+config BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE
+	bool "ngx_stream_limit_conn_module"
+	default y
+	help
+	  Enable ngx_stream_limit_conn_module
+
+config BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE
+	bool "ngx_stream_access_module"
+	default y
+	help
+	  Enable ngx_stream_access_module
+
+config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE
+	bool "ngx_stream_upstream_hash_module"
+	default y
+	help
+	  Enable ngx_stream_upstream_hash_module
+
+config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE
+	bool "ngx_stream_upstream_least_conn_module"
+	default y
+	help
+	  Enable ngx_stream_upstream_least_conn_module
+
+config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE
+	bool "ngx_stream_upstream_zone_module"
+	default y
+	help
+	  Enable ngx_stream_upstream_zone_module
+
+endif #BR2_PACKAGE_NGINX_STREAM
+
 comment "misc. modules"
 
 config BR2_PACKAGE_NGINX_SELECT_MODULE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 25fb9a8..7f3b075 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -207,6 +207,24 @@ NGINX_CONF_OPTS += \
 
 endif # BR2_PACKAGE_NGINX_MAIL
 
+# stream modules
+ifeq ($(BR2_PACKAGE_NGINX_STREAM),y)
+NGINX_CONF_OPTS += --with-stream
+
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
+NGINX_DEPENDENCIES += openssl
+NGINX_CONF_OPTS += --with-stream_ssl_module
+endif
+
+NGINX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE),,--without-stream_upstream_hash_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE),,--without-stream_upstream_least_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE),,--without-stream_upstream_zone_module)
+
+endif # BR2_PACKAGE_NGINX_STREAM
+
 define NGINX_DISABLE_WERROR
 	$(SED) 's/-Werror//g' -i $(@D)/auto/cc/*
 endef
-- 
2.7.4
