From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:29 +0100
Subject: [Buildroot] [PATCH 03/16] imx-gpu-viv: bump to version 6.2.2.p0
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New features:
- Added mutex protection for referencing gctSIGNAL in gckOS_MapSignal to
  fix a MT race issue.
- Streamlined GPU address calculation base on MC20 (0/1) and MMU (0/1)
  combinations.
- Fixed multiple Android HWC 2.0 rendering issues. Refined HWC 2.0 driver
  implementation.
- Improved HWC2.0 composition performance by composing damaged regions
  only.
- Enabled offline/online compiler IR assembly dump function for users.
- Implemented the direct rendering support (no-resolve) for Wayland
  platform.
- Added EGL_EXT_buffer_age extension for Wayland and fbdev platforms.
- Updated wayland-viv protocol to support tile status sync from client
  to server.
- Improved OpenCL 1.2 builtin function support with native GPU
  instructions.
- Enabled OpenCL 1.2 API trace dump function controlled by VIV_TRACE
  environment variable.
- Support for OpenGL4.0
- Cleaned up driver code issues reported by Klocwork and Coverity.

Full changelog:
http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/GraphicsChangeLogv6?h=imx-morty

Note that the apitrace tool and the G2D libraries are not part of the
package any longer. Those will be added as separate packages later on.

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7
 # gmem_info
 ... display memory use per PID ...

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in        | 16 ----------
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 36 ++--------------------
 3 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index dba378c2d2..cf58ad475c 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -60,17 +60,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "imx-gpu-viv"
 
-config BR2_PACKAGE_IMX_GPU_VIV_APITRACE
-	bool "install apitrace tools"
-	select BR2_PACKAGE_IMX_GPU_VIV_G2D
-	select BR2_PACKAGE_LIBPNG
-	help
-	  Copy the apitrace tool to the target. Apitrace consists
-	  of a set of tools to trace, replay and/or inspect OpenGL,
-	  OpenGL ES APIs calls
-
-	  http://apitrace.github.io/
-
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	bool "install examples"
 	help
@@ -78,11 +67,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 
 	  Warning: examples take approximately 150 MB of disk space.
 
-config BR2_PACKAGE_IMX_GPU_VIV_G2D
-	bool "install G2D libraries"
-	help
-	  Copy the GPU2D libraries to the target.
-
 config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
 	bool "install gmem_info tool"
 	help
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 6c526c5876..894bc90dae 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1 +1 @@
-sha256	caaabd59a259e29aa5b7f9d1d7f3fe71cff9336ba44904485d258baef276351f  imx-gpu-viv-5.0.11.p8.6-hfp.bin
+sha256	4f93a4412c93ca5959aa2437bfed2ecbaf983b5b272be5977f76a967de5db150  imx-gpu-viv-6.2.2.p0-aarch32.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 961f574c8b..5d3d9c671b 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_VERSION = 5.0.11.p8.6-hfp
+IMX_GPU_VIV_VERSION = 6.2.2.p0-aarch32
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
 
@@ -45,6 +45,7 @@ define IMX_GPU_VIV_BUILD_CMDS
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
 	ln -sf libVIVANTE-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
 	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
+	ln -sf libVDK-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVDK.so
 endef
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
@@ -56,17 +57,9 @@ define IMX_GPU_VIV_FIXUP_FB_HEADERS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_G2D),y)
-define IMX_GPU_VIV_INSTALL_G2D_STAGING
-	cp -dpfr $(@D)/g2d/usr/include/* $(STAGING_DIR)/usr/include/
-	cp -dpfr $(@D)/g2d/usr/lib/* $(STAGING_DIR)/usr/lib/
-endef
-endif
-
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
 	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
-	$(IMX_GPU_VIV_INSTALL_G2D_STAGING)
 	for lib in egl glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
@@ -74,21 +67,6 @@ define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	done
 endef
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_APITRACE),y)
-IMX_GPU_VIV_DEPENDENCIES += libpng
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-define IMX_GPU_VIV_INSTALL_APITRACE
-	cp -dpfr $(@D)/apitrace/x11/usr/bin/* $(TARGET_DIR)/usr/bin/
-	cp -dpfr $(@D)/apitrace/x11/usr/lib/* $(TARGET_DIR)/usr/lib/
-endef
-else
-define IMX_GPU_VIV_INSTALL_APITRACE
-	cp -dpfr $(@D)/apitrace/non-x11/usr/bin/* $(TARGET_DIR)/usr/bin/
-	cp -dpfr $(@D)/apitrace/non-x11/usr/lib/* $(TARGET_DIR)/usr/lib/
-endef
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES),y)
 define IMX_GPU_VIV_INSTALL_EXAMPLES
 	mkdir -p $(TARGET_DIR)/usr/share/examples/
@@ -96,12 +74,6 @@ define IMX_GPU_VIV_INSTALL_EXAMPLES
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_G2D),y)
-define IMX_GPU_VIV_INSTALL_G2D
-	cp -dpfr $(@D)/g2d/usr/lib/* $(TARGET_DIR)/usr/lib/
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO),y)
 define IMX_GPU_VIV_INSTALL_GMEM_INFO
 	cp -dpfr $(@D)/gpu-tools/gmem-info/usr/bin/* $(TARGET_DIR)/usr/bin/
@@ -112,12 +84,10 @@ endif
 # Note that this is _required_, else ldconfig may create symlinks
 # to the wrong library
 define IMX_GPU_VIV_INSTALL_TARGET_CMDS
-	$(IMX_GPU_VIV_INSTALL_APITRACE)
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
-	$(IMX_GPU_VIV_INSTALL_G2D)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
-	for lib in EGL GAL VIVANTE GLESv2; do \
+	for lib in EGL GAL VIVANTE GLESv2 VDK; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
 				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \
-- 
2.15.1
