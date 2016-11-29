From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 29 Nov 2016 17:47:51 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
Message-ID: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nginx built-in support for webdav is missing support for two commands:
PROPFIND and OPTIONS. Add an external module and an option in the nginx
package to provide full webdav support.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/nginx-dav-ext/Config.in          |  7 +++++++
 package/nginx-dav-ext/nginx-dav-ext.hash |  2 ++
 package/nginx-dav-ext/nginx-dav-ext.mk   | 12 ++++++++++++
 package/nginx/Config.in                  | 10 ++++++++++
 package/nginx/nginx.mk                   |  5 +++++
 6 files changed, 37 insertions(+)
 create mode 100644 package/nginx-dav-ext/Config.in
 create mode 100644 package/nginx-dav-ext/nginx-dav-ext.hash
 create mode 100644 package/nginx-dav-ext/nginx-dav-ext.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..687c600 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1544,6 +1544,7 @@ menu "Networking applications"
 	source "package/nginx/Config.in"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
+	source "package/nginx-dav-ext/Config.in"
 	source "package/nginx-naxsi/Config.in"
 	source "package/nginx-upload/Config.in"
 endmenu
diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
new file mode 100644
index 0000000..bf197dc
--- /dev/null
+++ b/package/nginx-dav-ext/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NGINX_DAV_EXT
+	bool "nginx-dav-ext"
+	select BR2_PACKAGE_EXPAT
+	help
+	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
+
+	  https://github.com/arut/nginx-dav-ext-module
diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
new file mode 100644
index 0000000..ea7eb86
--- /dev/null
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d  nginx-dav-ext-v0.0.3.tar.gz
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
new file mode 100644
index 0000000..6c2b3a2
--- /dev/null
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nginx-dav-ext
+#
+################################################################################
+
+NGINX_DAV_EXT_VERSION = v0.0.3
+NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
+
+NGINX_DAV_EXT_DEPENDENCIES = expat
+
+$(eval $(generic-package))
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..6f339c7 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -85,6 +85,16 @@ config BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
 	help
 	  Enable ngx_http_dav_module
 
+if BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
+
+config BR2_PACKAGE_NGINX_HTTP_DAV_EXT_MODULE
+	bool "ngx_http_dav_ext_module"
+	select BR2_PACKAGE_NGINX_DAV_EXT
+	help
+	  Enable ngx_http_dav_ext_module
+
+endif # BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
+
 config BR2_PACKAGE_NGINX_HTTP_FLV_MODULE
 	bool "ngx_http_flv_module"
 	help
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6563627..c99139b 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -167,6 +167,11 @@ else
 NGINX_CONF_OPTS += --without-http_rewrite_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_DAV_EXT_MODULE)$(BR2_PACKAGE_NGINX_DAV_EXT),yy)
+NGINX_DEPENDENCIES += nginx-dav-ext
+NGINX_CONF_OPTS += --add-module=$(NGINX_DAV_EXT_DIR)
+endif
+
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_REALIP_MODULE),--with-http_realip_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_ADDITION_MODULE),--with-http_addition_module) \
-- 
2.7.4
