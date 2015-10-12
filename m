From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:40:18 +0200
Subject: [Buildroot] [git commit] imx-gpu-viv: add G2D libs and GPU tools
	selection
Message-ID: <20151012214026.C558980412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f640a6659f6c5f9c99684a98de006bbccfded128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPU package now includes libraries for GPU2D as well as several tools to
monitor and debug the GPUs.

GPU2D libraries have been tested with the example provided in the
package:
 # /usr/share/examples/fsl-samples/g2d/overlay_test/g2d_overlay_test
 Overlay rendering time 53861us .

The tools have been tested with the following commands:
 # cd /usr/share/examples/viv_samples/vdk/
 # apitrace trace --api egl ./tutorial7 &
 # gmem_info
 ... display memory use per PID ...
 # killall tutorial7
 #??apitrace replay tutorial7.trace
 #??eglretrace tutorial7.trace

[Thomas: tweak the installation logic to be more explicit about paths
being copied, and to use cp -dpfr consistently.]

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      |   21 ++++++++++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk |   37 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 2a0cf84..1c00eaa 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -58,6 +58,16 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "imx-gpu-viv"
 
+config BR2_PACKAGE_IMX_GPU_VIV_APITRACE
+	bool "install apitrace tools"
+	select BR2_PACKAGE_IMX_GPU_VIV_G2D
+	help
+	  Copy the apitrace tool to the target. Apitrace consists
+	  of a set of tools to trace, replay and/or inspect OpenGL,
+	  OpenGL ES APIs calls
+
+	  http://apitrace.github.io/
+
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	bool "install examples"
 	help
@@ -65,4 +75,15 @@ config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 
 	  Warning: examples take approximately 150 MB of disk space.
 
+config BR2_PACKAGE_IMX_GPU_VIV_G2D
+	bool "install G2D libraries"
+	help
+	  Copy the GPU2D libraries to the target.
+
+config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
+	bool "install gmem_info tool"
+	help
+	  Copy the gmem_info tool to the target which provides
+	  information about GPU memory consumption.
+
 endif
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index aa1e3b6..a66c82e 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -62,9 +62,17 @@ define IMX_GPU_VIV_FIXUP_FB_HEADERS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_G2D),y)
+define IMX_GPU_VIV_INSTALL_G2D_STAGING
+	cp -dpfr $(@D)/g2d/usr/include/* $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/g2d/usr/lib/* $(STAGING_DIR)/usr/lib/
+endef
+endif
+
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
 	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
+	$(IMX_GPU_VIV_INSTALL_G2D_STAGING)
 	for lib in egl glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
@@ -72,6 +80,20 @@ define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	done
 endef
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_APITRACE),y)
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+define IMX_GPU_VIV_INSTALL_APITRACE
+	cp -dpfr $(@D)/apitrace/x11/usr/bin/* $(TARGET_DIR)/usr/bin/
+	cp -dpfr $(@D)/apitrace/x11/usr/lib/* $(TARGET_DIR)/usr/lib/
+endef
+else
+define IMX_GPU_VIV_INSTALL_APITRACE
+	cp -dpfr $(@D)/apitrace/non-x11/usr/bin/* $(TARGET_DIR)/usr/bin/
+	cp -dpfr $(@D)/apitrace/non-x11/usr/lib/* $(TARGET_DIR)/usr/lib/
+endef
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES),y)
 define IMX_GPU_VIV_INSTALL_EXAMPLES
 	mkdir -p $(TARGET_DIR)/usr/share/examples/
@@ -79,11 +101,26 @@ define IMX_GPU_VIV_INSTALL_EXAMPLES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_G2D),y)
+define IMX_GPU_VIV_INSTALL_G2D
+	cp -dpfr $(@D)/g2d/usr/lib/* $(TARGET_DIR)/usr/lib/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO),y)
+define IMX_GPU_VIV_INSTALL_GMEM_INFO
+	cp -dpfr $(@D)/gpu-tools/gmem-info/usr/bin/* $(TARGET_DIR)/usr/bin/
+endef
+endif
+
 # On the target, remove the unused libraries.
 # Note that this is _required_, else ldconfig may create symlinks
 # to the wrong library
 define IMX_GPU_VIV_INSTALL_TARGET_CMDS
+	$(IMX_GPU_VIV_INSTALL_APITRACE)
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
+	$(IMX_GPU_VIV_INSTALL_G2D)
+	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
 	for lib in EGL GAL VIVANTE GLESv2; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
