From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 May 2020 23:38:22 +0200
Subject: [Buildroot] [git commit branch/next] package/freescale-imx: Add
 option for DDR FW need
Message-ID: <20200529212301.9114E91D24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bb7f3b81092e7005470c7d689a566dbc1d059c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Only some i.MX8 needs a DDR training firmware (8M, 8MM, 8MN). Some other
i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.

Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
[yann.morin.1998 at free.fr:
  - use the new variable to drive the firmware installation
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/Config.in                    | 6 ++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8436..0be37ce956 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -45,12 +45,15 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	bool "imx8mm"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	bool "imx8mn"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
@@ -96,6 +99,9 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
+	bool
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index cd0dafb3de..7309d21b7a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -18,7 +18,7 @@ define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 define FIRMWARE_IMX_PREPARE_LPDDR4_FW
