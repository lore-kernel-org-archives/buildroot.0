From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Jul 2016 16:45:49 -0500
Subject: [Buildroot] [PATCH] nginx_upload_module: new package
Message-ID: <1468532749-63693-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>

This is an external style nginx module.

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                                    |  1 +
 package/nginx/nginx.mk                               |  5 +++++
 package/nginx_upload_module/Config.in                |  8 ++++++++
 package/nginx_upload_module/nginx_upload_module.hash |  2 ++
 package/nginx_upload_module/nginx_upload_module.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/nginx_upload_module/Config.in
 create mode 100644 package/nginx_upload_module/nginx_upload_module.hash
 create mode 100644 package/nginx_upload_module/nginx_upload_module.mk

diff --git a/package/Config.in b/package/Config.in
index 1910251..f702f32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1494,6 +1494,7 @@ menu "Networking applications"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
+	source "package/nginx_upload_module/Config.in"
 	source "package/ngircd/Config.in"
 	source "package/ngrep/Config.in"
 	source "package/nload/Config.in"
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5eb5488..aaa6dfb 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -277,4 +277,9 @@ define NGINX_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50nginx
 endef
 
+ifeq ($(BR2_PACKAGE_NGINX_UPLOAD_MODULE),y)
+NGINX_CONF_OPTS += $(addprefix --add-module=,$(NGINX_UPLOAD_MODULE_SRCDIR))
+NGINX_DEPENDENCIES += nginx_upload_module
+endif
+
 $(eval $(generic-package))
diff --git a/package/nginx_upload_module/Config.in b/package/nginx_upload_module/Config.in
new file mode 100644
index 0000000..10fc0dd
--- /dev/null
+++ b/package/nginx_upload_module/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NGINX_UPLOAD_MODULE
+	bool "nginx_upload_module"
+	select BR2_PACKAGE_NGINX
+	help
+	  A module for nginx web server for handling file uploads using
+	  multipart/form-data encoding (RFC 1867).
+
+	  https://github.com/vkholodkov/nginx-upload-module
diff --git a/package/nginx_upload_module/nginx_upload_module.hash b/package/nginx_upload_module/nginx_upload_module.hash
new file mode 100644
index 0000000..43ca430
--- /dev/null
+++ b/package/nginx_upload_module/nginx_upload_module.hash
@@ -0,0 +1,2 @@
+#Locally Computed:
+sha256 8cd1d9d968ffba807de2e546ea9cad5e1ae294ec60b4927b2d60a98bdb4a1144  nginx_upload_module-aba1e3f34c754551f4f49e572bc86863d535609d.tar.gz
diff --git a/package/nginx_upload_module/nginx_upload_module.mk b/package/nginx_upload_module/nginx_upload_module.mk
new file mode 100644
index 0000000..b6dc145
--- /dev/null
+++ b/package/nginx_upload_module/nginx_upload_module.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nginx_upload_module
+#
+################################################################################
+
+NGINX_UPLOAD_MODULE_VERSION = aba1e3f34c754551f4f49e572bc86863d535609d
+NGINX_UPLOAD_MODULE_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_MODULE_VERSION))
+NGINX_UPLOAD_MODULE_LICENSE = BSD-3c
+NGINX_UPLOAD_MODULE_LICENSE_FILES = LICENCE
+
+$(eval $(generic-package))
-- 
1.9.1
