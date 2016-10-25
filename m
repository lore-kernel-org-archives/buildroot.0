From: Dagg Stompler <daggs@gmx.com>
Date: Tue, 25 Oct 2016 20:54:15 +0300
Subject: [Buildroot] [PATCH v2 1/3] xdriver_xf86-video-odroidc2: new package
Message-ID: <20161025175417.25901-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v1 -> v2: (Arnout Vandecappelle)
 - mail subject renamed.
 - upstream updated
 - removed depemdency on mesa
 - added more explicit info to the patch.
 - license updated
 - xorg.conf is installed to /usr/share/X11 instead of /etc/X11
 - added dependecy on BR2_PACKAGE_ODROID_MALI_X11

...001-c2_mali_ddx-support-cross-compilation.patch | 42 ++++++++++++++++++++++
 .../x11r7/xdriver_xf86-video-odroidc2/Config.in    | 18 ++++++++++
 .../xdriver_xf86-video-odroidc2.hash               |  2 ++
 .../xdriver_xf86-video-odroidc2.mk                 | 23 ++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk

diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
new file mode 100644
index 0000000..1557226
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
@@ -0,0 +1,42 @@
+From 622c02622665c0cbb35433c8f9969d41b25e028a Mon Sep 17 00:00:00 2001
+From: Dagg Stompler <daggs@gmx.com>
+Date: Sat, 6 Aug 2016 09:19:08 +0300
+Subject: [PATCH] c2_mali_ddx: support cross compilation
+
+patch both Makefile.am and Makefile.in to support cross compilation.
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
index 0000000..31ba9df
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
+	bool "xf86-video-odroidc2"
+	depends on BR2_aarch64 # odroid-mali X11
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_ODROID_MALI
+	select BR2_PACKAGE_ODROID_MALI_X11
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	help
+	  odroid c2 mali 450 GPU ddx video driver
+	  c2 upstream: https://github.com/mdrjr/c2_mali
+	  arm upstream: http://malideveloper.arm.com/downloads/drivers/DX910/r7p0-00rel0/DX910-SW-99003-r7p0-00rel0.tgz
+	  this driver needs a xorg.conf file which can be found
+	  at /usr/share/X11 of the resulting image.
+	  in addition to run a proper desktop DE, mesa swrast must be selected too.
+
+comment "xf86-video-odroidc2 needs X11 egl support from odroid-mali"
+	depends on !BR2_PACKAGE_ODROID_MALI_X11
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
index 0000000..6431e18
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# xdriver_xf86-video-odroidc2
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ODROIDC2_VERSION = 2d8e1595da7231f152b78ef8a9b9583fb585883a
+XDRIVER_XF86_VIDEO_ODROIDC2_SITE = $(call github,mdrjr,c2_mali_ddx,$(XDRIVER_XF86_VIDEO_ODROIDC2_VERSION))
+XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE = MIT
+XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
+XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
+	libdrm \
+	odroid-mali \
+	xserver_xorg-server \
+	xproto_dri2proto
+
+define XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
+        $(INSTALL) -m 0644 -D $(@D)/src/xorg.conf $(TARGET_DIR)/usr/share/X11/xorg.conf.odroidc2
+endef
+
+XDRIVER_XF86_VIDEO_ODROIDC2_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
-- 
2.10.1
