From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  2 Aug 2017 10:50:09 -0400
Subject: [Buildroot] [PATCH 1/1] nginx: support libressl
Message-ID: <20170802145009.9037-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx/Config.in | 10 +++++-----
 package/nginx/nginx.mk  | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 36fa69cd2..beb9345bb 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -34,13 +34,13 @@ if BR2_PACKAGE_NGINX_HTTP
 
 config BR2_PACKAGE_NGINX_HTTP_CACHE
 	bool "http cache support"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 
 comment "http modules"
 
 config BR2_PACKAGE_NGINX_HTTP_SSL_MODULE
 	bool "ngx_http_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Enable ngx_http_ssl_module
 
@@ -119,7 +119,7 @@ config BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE
 
 config BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE
 	bool "ngx_http_secure_link_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Enable ngx_http_secure_link_module
 
@@ -288,7 +288,7 @@ if BR2_PACKAGE_NGINX_MAIL
 
 config BR2_PACKAGE_NGINX_MAIL_SSL_MODULE
 	bool "ngx_mail_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Enable ngx_mail_ssl_module
 
@@ -319,7 +319,7 @@ if BR2_PACKAGE_NGINX_STREAM
 
 config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	bool "ngx_stream_ssl_module"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Enable ngx_stream_ssl_module
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ceb80229d..e5c71c295 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -110,7 +110,11 @@ endif
 # http server modules
 ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_CACHE),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NGINX_DEPENDENCIES += libressl
+else
 NGINX_DEPENDENCIES += openssl
+endif
 else
 NGINX_CONF_OPTS += --without-http-cache
 endif
@@ -121,7 +125,11 @@ NGINX_CONF_OPTS += --with-http_v2_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_SSL_MODULE),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NGINX_DEPENDENCIES += libressl
+else
 NGINX_DEPENDENCIES += openssl
+endif
 NGINX_CONF_OPTS += --with-http_ssl_module
 endif
 
@@ -146,7 +154,11 @@ NGINX_CONF_OPTS += --with-http_gzip_static_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NGINX_DEPENDENCIES += libressl
+else
 NGINX_DEPENDENCIES += openssl
+endif
 NGINX_CONF_OPTS += --with-http_secure_link_module
 endif
 
@@ -205,7 +217,11 @@ ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
 NGINX_CONF_OPTS += --with-mail
 
 ifeq ($(BR2_PACKAGE_NGINX_MAIL_SSL_MODULE),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NGINX_DEPENDENCIES += libressl
+else
 NGINX_DEPENDENCIES += openssl
+endif
 NGINX_CONF_OPTS += --with-mail_ssl_module
 endif
 
@@ -221,7 +237,11 @@ ifeq ($(BR2_PACKAGE_NGINX_STREAM),y)
 NGINX_CONF_OPTS += --with-stream
 
 ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+NGINX_DEPENDENCIES += libressl
+else
 NGINX_DEPENDENCIES += openssl
+endif
 NGINX_CONF_OPTS += --with-stream_ssl_module
 endif
 
-- 
2.13.3
