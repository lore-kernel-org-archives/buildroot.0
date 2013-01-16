From: gilles.talis at gmail.com <gilles.talis@gmail.com>
Date: Wed, 16 Jan 2013 14:14:32 -0800
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1358374472-11291-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Talis <gilles.talis@gmail.com>

WebP is a new image format that provides lossless
and lossy compression for images on the web

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in      |    1 +
 package/webp/Config.in |    7 +++++++
 package/webp/webp.mk   |   22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/webp/Config.in
 create mode 100644 package/webp/webp.mk

diff --git a/package/Config.in b/package/Config.in
index ba03b3c..1e8c4da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -433,6 +433,7 @@ source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
+source "package/webp/Config.in"
 source "package/zxing/Config.in"
 endmenu
 
diff --git a/package/webp/Config.in b/package/webp/Config.in
new file mode 100644
index 0000000..a2acdff
--- /dev/null
+++ b/package/webp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WEBP
+	bool "webp"
+	help
+	  WebP is a new image format that provides lossless and
+	  lossy compression for images on the web
+
+	  https://developers.google.com/speed/webp/
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
new file mode 100644
index 0000000..3dcb13c
--- /dev/null
+++ b/package/webp/webp.mk
@@ -0,0 +1,22 @@
+#####################################################################
+#
+# webp
+#
+#####################################################################
+
+WEBP_VERSION = 0.2.1
+WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
+WEBP_SITE = https://webp.googlecode.com/files
+WEBP_LICENSE = BSD-3c
+WEBP_LICENSE_FILES = COPYING
+WEBP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+WEBP_DEPENDENCIES += libpng
+WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+endif
+
+WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
+WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
+
+$(eval $(autotools-package))
-- 
1.7.4.1
