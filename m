From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Jul 2016 22:10:17 -0500
Subject: [Buildroot] [PATCH v2] nginx-upload-module: new package
Message-ID: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>

A module for nginx web server for handling file uploads using
multipart/form-data encoding (RFC 1867).

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
v1 -> v2
[Matt W.
 - Removed select of nginx in module Config.in
   and instead added external module section
   in nginx Config.in (copied nginx-naxsi patch)
 - Renamed to use dash instead of underscore
 - Moved conditional enable in nginx .mk up
   with other module enables
 - Added openssl dependency
---

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/nginx-upload-module/Config.in                |  8 ++++++++
 package/nginx-upload-module/nginx-upload-module.hash |  2 ++
 package/nginx-upload-module/nginx-upload-module.mk   | 13 +++++++++++++
 package/nginx/Config.in                              |  3 +++
 package/nginx/nginx.mk                               |  6 ++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/nginx-upload-module/Config.in
 create mode 100644 package/nginx-upload-module/nginx-upload-module.hash
 create mode 100644 package/nginx-upload-module/nginx-upload-module.mk

diff --git a/package/nginx-upload-module/Config.in b/package/nginx-upload-module/Config.in
new file mode 100644
index 0000000..348d522
--- /dev/null
+++ b/package/nginx-upload-module/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NGINX_UPLOAD_MODULE
+	bool "nginx-upload-module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A module for nginx web server for handling file uploads using
+	  multipart/form-data encoding (RFC 1867).
+
+	  https://github.com/vkholodkov/nginx-upload-module
diff --git a/package/nginx-upload-module/nginx-upload-module.hash b/package/nginx-upload-module/nginx-upload-module.hash
new file mode 100644
index 0000000..5c3b908
--- /dev/null
+++ b/package/nginx-upload-module/nginx-upload-module.hash
@@ -0,0 +1,2 @@
+#Locally Computed:
+sha256 8cd1d9d968ffba807de2e546ea9cad5e1ae294ec60b4927b2d60a98bdb4a1144  nginx-upload-module-aba1e3f34c754551f4f49e572bc86863d535609d.tar.gz
diff --git a/package/nginx-upload-module/nginx-upload-module.mk b/package/nginx-upload-module/nginx-upload-module.mk
new file mode 100644
index 0000000..127e442
--- /dev/null
+++ b/package/nginx-upload-module/nginx-upload-module.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# nginx-upload-module
+#
+################################################################################
+
+NGINX_UPLOAD_MODULE_VERSION = aba1e3f34c754551f4f49e572bc86863d535609d
+NGINX_UPLOAD_MODULE_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_MODULE_VERSION))
+NGINX_UPLOAD_MODULE_LICENSE = BSD-3c
+NGINX_UPLOAD_MODULE_LICENSE_FILES = LICENCE
+NGINX_UPLOAD_MODULE_DEPENDENCIES = openssl
+
+$(eval $(generic-package))
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index e6f2d96..9f2ba21 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -380,4 +380,7 @@ config BR2_PACKAGE_NGINX_ADD_MODULES
 	help
 	  Space separated list of urls of the additional modules
 
+comment "external modules"
+	source "package/nginx-upload-module/Config.in"
+
 endif
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5eb5488..97f6a7c 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -234,6 +234,12 @@ NGINX_CONF_OPTS += \
 
 endif # BR2_PACKAGE_NGINX_STREAM
 
+# external modules
+ifeq ($(BR2_PACKAGE_NGINX_UPLOAD_MODULE),y)
+NGINX_CONF_OPTS += $(addprefix --add-module=,$(NGINX_UPLOAD_MODULE_DIR))
+NGINX_DEPENDENCIES += nginx-upload-module
+endif
+
 # Debug logging
 NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
 
-- 
1.9.1
