From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:54:18 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: bump to 5.0.11.p4.1
Message-ID: <20150711112619.9EEBD7FC81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15cd6fe2222f0738713bf7e6fde53abfc643438a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the Vivante drivers to 5.0.11.p4.1. The version scheme has changed
and 5.0.11.p4.1 is indeed the latest version.

In addition to the version bump, other changes are done to handle the
new directory organisation.

The work behind this commit was funded by ECA Group
<http://www.ecagroup.com>. ECA Group is the copyright owner of the
contributed code.

Changelog:
- Package version is changed to use Vivante version
- imx-gpu-viv includes separate sub packages for demos and tools
  to support flexible package additions
- Graphics package is reorganized to improve library layout
- New GPU tool apitrace is added - supported only for X11 backend (not
  supported yet)
- gpu-viv-g2d shares same package with imx-gpu-viv (not supported yet)

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9639f6f20991ab64ea75177a017f8749a

[Gary:
  1- used the pkgconfig files provided in the package from now on
  2- extend the commit log
  3 - add a symlink for libGAL_egl.so as it wasn't working on X
    - had to do a fixup as for some reason the lib is called libGAL_egl.dri.so
    Without that last symlink change, the tutorial examples were
    missing some symbols and qtbase wouldn't build.

This package has been tested with both X11 and Framebuffer backends;
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7 ]

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-correct-HAL-include.patch                 |   16 -------
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |   10 ----
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |   10 ----
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   47 ++++++++++++--------
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |   10 ----
 5 files changed, 28 insertions(+), 65 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch b/package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
deleted file mode 100644
index c83cd55..0000000
--- a/package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Correct the directory path for gc_hal_eglplatform_type.h
-
-Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
-
-diff -rup gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h
---- gpu-viv-bin-mx6q-1.1.0-orig/usr/include/gc_vdk_types.h	2012-12-18 10:35:55.000000000 +0100
-+++ gpu-viv-bin-mx6q-1.1.0/usr/include/gc_vdk_types.h	2013-05-09 21:09:28.080138681 +0200
-@@ -39,7 +39,7 @@ extern "C" {
- #endif
- 
- #include <EGL/egl.h>
--#include "gc_hal_eglplatform_type.h"
-+#include <HAL/gc_hal_eglplatform_type.h>
- 
- 
- /*******************************************************************************
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
deleted file mode 100644
index d1d09a0..0000000
--- a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: egl
-Description: Freescale gpu-viv-bin-mx6q implementation of EGL
-Version: 1.0
-Libs: -L${libdir} -lGAL -lEGL
-Cflags: -I${includedir}/
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
deleted file mode 100644
index 74ce792..0000000
--- a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: glesv2
-Description: Freescale gpu-viv-bin-mx6q implementation of OpenGL ESv2
-Version: 2.0
-Libs: -L${libdir} -lGAL -lEGL -lGLESv2
-Cflags: -I${includedir}/
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index ec779a4..678bfdf 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-GPU_VIV_BIN_MX6Q_BASE_VERSION = 3.10.17-1.0.1
+GPU_VIV_BIN_MX6Q_BASE_VERSION = 5.0.11.p4.1
 ifeq ($(BR2_ARM_EABIHF),y)
 GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-hfp
 else
 GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-sfp
 endif
 GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
-GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
+GPU_VIV_BIN_MX6Q_SOURCE = imx-gpu-viv-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
 
@@ -26,27 +26,36 @@ define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
 endef
 
+# For some reason libGAL_egl for x11 is called libGAL_egl.dri.so
+ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),x11)
+define GPU_VIV_BIN_MX6Q_FIXUP_SYMLINKS
+	ln -sf libGAL_egl.dri.so $(@D)/gpu-core/usr/lib/libGAL_egl.so
+endef
+endif
+
 # Instead of building, we fix up the inconsistencies that exist
 # in the upstream archive here.
 # Make sure these commands are idempotent.
 define GPU_VIV_BIN_MX6Q_BUILD_CMDS
-	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
-	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
-	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
-	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1
-	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1.0
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2
-	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2.0.0
-	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libVIVANTE.so
-	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGAL.so
+	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
+	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
+	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
+	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
+	ln -sf libGAL_egl.$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL_egl.so
+	$(GPU_VIV_BIN_MX6Q_FIXUP_SYMLINKS)
 endef
 
 ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),fb)
 define GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS
-	$(SED) '/#define EGLAPIENTRY/ a \
+	$(SED) '39i\
 		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
 		#define EGL_API_FB \n\
 		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h
@@ -54,11 +63,11 @@ endef
 endif
 
 define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
-	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
+	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
 	$(GPU_VIV_BIN_MX6Q_FIXUP_FB_HEADERS)
 	for lib in egl glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
-			package/freescale-imx/gpu-viv-bin-mx6q/$${lib}.pc \
+			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
 	done
 endef
@@ -66,7 +75,7 @@ endef
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES),y)
 define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
 	mkdir -p $(TARGET_DIR)/usr/share/examples/
-	cp -r $(@D)/opt/* $(TARGET_DIR)/usr/share/examples/
+	cp -r $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
 endef
 endif
 
@@ -75,7 +84,7 @@ endif
 # to the wrong library
 define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
 	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
-	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
+	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
 	for lib in EGL GAL VIVANTE GLESv2; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc b/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
deleted file mode 100644
index 677a7ee..0000000
--- a/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: vg
-Description: Freescale gpu-viv-bin-mx6q implementation of OpenVG
-Version: 1.1
-Libs: -L${libdir} -lGAL -lEGL -lOpenVG
-Cflags: -I${includedir}/
