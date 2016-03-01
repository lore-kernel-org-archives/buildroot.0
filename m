From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Tue,  1 Mar 2016 13:39:46 +0100
Subject: [Buildroot] [PATCH] imx-gpu-viv: fix build dependencies when
	linking against libGAL.so
Message-ID: <1456835986-16764-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages like QT5 Base with OpenGL and X support link against libGAL.so
at build time. This results in an error because some X functions used
in libGAL.so aren't referenced as the libXdamage, libXext and libXfixes
packages aren't built and installed into sysroot at the time. Fix this
by adding these three packages as build dependencies of imx-gpu-viv.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 5 +++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 1c00eaa8c658..c38676539609 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -33,8 +33,9 @@ choice
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "X11"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE # Runtime dependency
-	select BR2_PACKAGE_XLIB_LIBXEXT # Runtime dependency
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
 
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 133632b403c7..61710804b791 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -22,6 +22,14 @@ IMX_GPU_VIV_REDISTRIBUTE = NO
 IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+# The libGAL.so library provided by imx-gpu-viv uses X functions. Packages
+# may want to link against libGAL.so (QT5 Base with OpenGL and X support
+# does so). For this to work we need build dependencies to libXdamage,
+# libXext and libXfixes so that X functions used in libGAL.so are referenced.
+IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
+endif
+
 define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
-- 
2.7.2
