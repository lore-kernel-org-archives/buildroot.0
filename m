From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:30:05 +0200
Subject: [Buildroot] [git commit] package/nginx: add support for stream
	proxy modules
Message-ID: <20160505204505.B5A2181ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=621ec32677082d901806338e6f50f03349dceb76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
