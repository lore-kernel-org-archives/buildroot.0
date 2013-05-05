From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:38:11 +0200
Subject: [Buildroot] [git commit] webp: new package
Message-ID: <20130505204340.5AB4699B55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d91863709c8667fe511b6ca2267787bcfa2911c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix white space errors]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/webp/Config.in |    7 +++++++
 package/webp/webp.mk   |   30 ++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e743dc8..0f8fe7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ source "package/poppler/Config.in"
 source "package/tiff/Config.in"
 source "package/wayland/Config.in"
 source "package/webkit/Config.in"
+source "package/webp/Config.in"
 source "package/zxing/Config.in"
 endmenu
 
diff --git a/package/webp/Config.in b/package/webp/Config.in
new file mode 100644
index 0000000..e385b5e
--- /dev/null
+++ b/package/webp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WEBP
+	bool "webp"
+	help
+	  WebP is a new image format that provides lossless and lossy
+	  compression for images on the web
+
+	  https://developers.google.com/speed/webp/
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
new file mode 100644
index 0000000..0099c3c
--- /dev/null
+++ b/package/webp/webp.mk
@@ -0,0 +1,30 @@
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
+WEBP_CONF_OPT += \
+	--with-jpegincludedir=$(STAGING_DIR)/usr/include \
+	--with-jpeglibdir=$(STAGING_DIR)/usr/lib \
+	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
+	--with-tifflibdir=$(STAGING_DIR)/usr/lib
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+WEBP_DEPENDENCIES += libpng
+WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+else
+WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=/bin/false
+endif
+
+WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
+WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
+
+$(eval $(autotools-package))
