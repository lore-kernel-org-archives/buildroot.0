From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  2 Dec 2014 10:59:04 +0100
Subject: [Buildroot] [PATCH v4 06/14] gpu-viv-bin-mx6q: change output
	selection mechanism
In-Reply-To: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
Message-ID: <1417514352-8825-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  - Move output selection to Config.in. It easier to add new
    backends selection (wayland, directfb, ...).
  - Remove useless build time dependencies xlib_libXdamage
    and xlib_libXext (gpu-viv-bin-mx6q is provided as binary
    package)
  - Also create libraries symbolic links with version numbers.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in    |  5 +++++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk            | 21 +++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 904b011..489e68e 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -45,6 +45,11 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
 
 endchoice
 
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
+	string
+	default "x11" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 7895023..501b124 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -19,14 +19,7 @@ GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
 GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
-
-# DirectFB is not supported (wrong version)
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
-GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
-GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
-else
-GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
-endif
+GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
 
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
@@ -37,13 +30,17 @@ endef
 # Make sure these commands are idempotent.
 define GPU_VIV_BIN_MX6Q_BUILD_CMDS
 	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
-	for lib in EGL GAL VIVANTE GLESv2; do \
-		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
-			$(@D)/usr/lib/lib$${lib}.so; \
-	done
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1.0
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2.0.0
+	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libVIVANTE.so
+	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGAL.so
 endef
 
 define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
-- 
1.9.1
