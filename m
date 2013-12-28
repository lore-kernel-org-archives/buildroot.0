From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Sat, 28 Dec 2013 11:00:39 -0200
Subject: [Buildroot] [PATCH] fswebcam: Add package
Message-ID: <1388235639-3008-1-git-send-email-lucas.de.marchi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
---
 package/Config.in            |  1 +
 package/fswebcam/Config.in   | 15 +++++++++++++++
 package/fswebcam/fswebcam.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/fswebcam/Config.in
 create mode 100644 package/fswebcam/fswebcam.mk

diff --git a/package/Config.in b/package/Config.in
index c4b6ec1..d1bc654 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -167,6 +167,7 @@ comment "Graphic applications"
 source "package/gnuplot/Config.in"
 source "package/jhead/Config.in"
 source "package/rrdtool/Config.in"
+source "package/fswebcam/Config.in"
 
 comment "Graphic libraries"
 source "package/cegui06/Config.in"
diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
new file mode 100644
index 0000000..d085dd6
--- /dev/null
+++ b/package/fswebcam/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FSWEBCAM
+	bool "fswebcam"
+	select BR2_PACKAGE_GD
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  fswebcam is a neat and simple webcam app. It captures images from a
+	  V4L1/V4L2 compatible device or file, averages them to reduce noise
+	  and draws a caption using the GD Graphics Library which also handles
+	  compressing the image to PNG or JPEG. The resulting image is saved to
+	  a file or sent to stdio where it can be piped to something like
+	  ncftpput or scp.
+
+	  http://www.firestorm.cx/fswebcam/
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
new file mode 100644
index 0000000..865e915
--- /dev/null
+++ b/package/fswebcam/fswebcam.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# fswebcam
+#
+################################################################################
+
+FSWEBCAM_VERSION = 20110717
+FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files/
+FSWEBCAM_LICENSE = GPLv2
+FSWEBCAM_LICENSE_FILES = LICENSE
+
+FSWEBCAM_DEPENDENCIES += freetype \
+			 jpeg \
+			 libpng \
+			 gd
+
+define FSWEBCAM_CONFIGURE_CMDS
+	(cd $(@D); \
+		./configure --prefix=/usr \
+	)
+endef
+
+define FSWEBCAM_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -DHAVE_CONFIG_H" \
+	LFLAGS="$(TARGET_LDFLAGS) $(FSWEBCAM_LDFLAGS)" -C $(@D)
+endef
+
+define FSWEBCAM_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define FSWEBCAM_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+define FSWEBCAM_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.2
