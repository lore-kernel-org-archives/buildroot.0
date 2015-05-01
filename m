From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:19 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: change output selection
	mechanism
Message-ID: <20150501205734.4C55081DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=181e570a433411c408d4790580c507c5a1b94677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move output selection to Config.in. It easier to add new backends selection
(wayland, directfb, ...).

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |    5 +++++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    8 +-------
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
index 24ea57c..4884616 100644
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
