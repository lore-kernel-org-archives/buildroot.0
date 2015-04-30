From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 30 Apr 2015 17:12:21 +0200
Subject: [Buildroot] [PATCH v7 06/13] gpu-viv-bin-mx6q: change output
	selection mechanism
In-Reply-To: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
Message-ID: <1430406748-8493-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move output selection to Config.in. It easier to add new backends selection
(wayland, directfb, ...).

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 5 +++++
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 8 +-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 9611379..db2a10e 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -44,6 +44,11 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
 
 endchoice
 
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
+	string
+	default "x11" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index d2288fe..6885012 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -19,13 +19,7 @@ GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
 GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
-
-# DirectFB is not supported (wrong version)
-ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
-GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
-else
-GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
-endif
+GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
 
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
-- 
1.9.1
