From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:28 +0200
Subject: [Buildroot] [PATCH 07/11] gpu-viv-bin-mx6q: change output selection
	mecanism
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 5a58cd8..64a7c91 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -24,14 +24,7 @@ GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
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
 
 # The archive is a shell-self-extractor of a bzipped tar. It happens
 # to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
@@ -48,13 +41,17 @@ endef
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
2.1.0
