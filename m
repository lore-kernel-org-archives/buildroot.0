From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu,  4 Jul 2013 19:18:00 -0700
Subject: [Buildroot] [PATCH] ocrad: new package
Message-ID: <1372990680-16147-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU Ocrad is an OCR (Optical Character Recognition) program
based on a feature extraction method.
It reads images in pbm (bitmap), pgm (greyscale) or ppm (color) formats
and produces text in byte (8-bit) or UTF-8 formats.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in       |    1 +
 package/ocrad/Config.in |   16 ++++++++++++++++
 package/ocrad/ocrad.mk  |   26 ++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/ocrad/Config.in
 create mode 100644 package/ocrad/ocrad.mk

diff --git a/package/Config.in b/package/Config.in
index 7c24dab..62fbba0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -131,6 +131,7 @@ source "package/fb-test-app/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
+source "package/ocrad/Config.in"
 source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
new file mode 100644
index 0000000..1065f01
--- /dev/null
+++ b/package/ocrad/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OCRAD
+	bool "ocrad"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  GNU Ocrad is an OCR (Optical Character Recognition) program
+	  based on a feature extraction method. 
+	  It reads images in pbm (bitmap), pgm (greyscale) or 
+	  ppm (color) formats and produces text in byte (8-bit) or 
+	  UTF-8 formats.
+
+	  http://www.gnu.org/software/ocrad/
+
+comment "ocrad needs a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
new file mode 100644
index 0000000..4f4b793
--- /dev/null
+++ b/package/ocrad/ocrad.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# ocrad
+#
+################################################################################
+
+OCRAD_VERSION = 0.21
+OCRAD_SITE = http://ftp.gnu.org/gnu/ocrad
+OCRAD_LICENSE = GPLv3+
+OCRAD_LICENSE_FILES = COPYING
+
+# This is not a true autotools package.
+define OCRAD_CONFIGURE_CMDS
+	(cd $(@D); \
+	./configure $(TARGET_CONFIGURE_OPTS) )
+endef
+
+define OCRAD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define OCRAD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/ocrad $(TARGET_DIR)/usr/bin/ocrad
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
