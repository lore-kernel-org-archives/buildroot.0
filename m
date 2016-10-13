From: Dagg Stompler <daggs@gmx.com>
Date: Thu, 13 Oct 2016 20:41:23 +0300
Subject: [Buildroot] [PATCH 1/2] X11/odroidc2-driver: New Package.
Message-ID: <20161013174124.9639-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add the X11 driver for odroid c2 boards.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/x11r7/Config.in                            |  1 +
 ...001-c2_mali_ddx-support-cross-compilation.patch | 40 ++++++++++++++++++++++
 .../x11r7/xdriver_xf86-video-odroidc2/Config.in    | 13 +++++++
 .../xdriver_xf86-video-odroidc2.hash               |  2 ++
 .../xdriver_xf86-video-odroidc2.mk                 | 24 +++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 40aa80c..1c5ff7e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -174,6 +174,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
 		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
+		source package/x11r7/xdriver_xf86-video-odroidc2/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-qxl/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
new file mode 100644
index 0000000..c85f38b
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
@@ -0,0 +1,40 @@
+From 622c02622665c0cbb35433c8f9969d41b25e028a Mon Sep 17 00:00:00 2001
+From: Dagg Stompler <daggs@gmx.com>
+Date: Sat, 6 Aug 2016 09:19:08 +0300
+Subject: [PATCH] c2_mali_ddx: support cross compilation
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+---
+ src/Makefile.am | 2 +-
+ src/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7fec079..6b49a16 100755
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -27,7 +27,7 @@ mali_drv_la_LDFLAGS = -module -avoid-version -L$(MALI_DDK)/lib -lMali -lUMP -lpt
+ mali_drv_ladir = @moduledir@/drivers
+ 
+ AM_CFLAGS = @XORG_CFLAGS@ \
+-	-I/usr/include/libdrm \
++	-I$(SYSROOT)/usr/include/libdrm \
+ 	-I$(MALI_DDK)/include \
+ 	-I$(MALI_DDK)/internal/include/khronos \
+ 	-I$(MALI_DDK)/src/ump/include \
+diff --git a/src/Makefile.in b/src/Makefile.in
+index b30194b..2952cdc 100755
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -350,7 +350,7 @@ mali_drv_la_LTLIBRARIES = mali_drv.la
+ mali_drv_la_LDFLAGS = -module -avoid-version -L$(MALI_DDK)/lib -lMali -lUMP -lpthread
+ mali_drv_ladir = @moduledir@/drivers
+ AM_CFLAGS = @XORG_CFLAGS@ \
+-	-I/usr/include/libdrm \
++	-I/$(SYSROOT)/usr/include/libdrm \
+ 	-I$(MALI_DDK)/include \
+ 	-I$(MALI_DDK)/internal/include/khronos \
+ 	-I$(MALI_DDK)/src/ump/include \
+-- 
+2.9.2
+
diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/Config.in b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
new file mode 100644
index 0000000..b2088c8
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
+	bool "xf86-video-odroidc2"
+	depends on BR2_aarch64
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+	help
+	 odroid c2 mali 450 GPU ddx video driver
+
+comment "xf86-video-odroidc2 needs egl support from odroid-mali and ARM64 arch"
+	depends on !BR2_PACKAGE_ODROID_MALI || !BR2_aarch64
diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
new file mode 100644
index 0000000..37cd236
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
@@ -0,0 +1,2 @@
+# Computed Locally
+sha256 c442a06c1a528a64b444721ec91b903b84da36120a1b78b965196cc854c7acef  xdriver_xf86-video-odroidc2-2d8e1595da7231f152b78ef8a9b9583fb585883a.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
new file mode 100644
index 0000000..cad2432
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# xdriver_xf86-video-odroidc2
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ODROIDC2_VERSION = 2d8e1595da7231f152b78ef8a9b9583fb585883a
+XDRIVER_XF86_VIDEO_ODROIDC2_SITE = $(call github,mdrjr,c2_mali_ddx,$(XDRIVER_XF86_VIDEO_ODROIDC2_VERSION))
+XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE = ARM EULA
+XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
+XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
+	odroid-mali \
+	xproto_fontsproto \
+	xproto_xproto \
+	mesa3d \
+	xserver_xorg-server
+
+define XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/src/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
+endef
+
+XDRIVER_XF86_VIDEO_ODROIDC2_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
-- 
2.10.1
