From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Fri, 10 Jul 2020 14:00:42 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/freescale-imx: Move DDR FW
 choice down to firmware-imx package
In-Reply-To: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1594382445-4464-2-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DDR FW along with all other FW code that need to be used in
bootloader or installed on target are related to the firmware-imx package.

This patch does this job as well as fixing the conjugation of NEED*s* in
the symbol name. Also take advantage of this patch to make the DDR FW
dependant on BR2_PACKAGE_FIRMWARE_IMX.

Note that BR2_PACKAGE_FIRMWARE_IMX_xxx is the preferred naming
convention for the upcoming couple of patches.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
--
v2:
- Fix attributes order (make check-package)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 configs/freescale_imx8mnevk_defconfig              |  2 +-
 package/freescale-imx/Config.in                    |  6 ------
 package/freescale-imx/firmware-imx/Config.in       | 15 +++++++++++----
 package/freescale-imx/firmware-imx/firmware-imx.mk |  6 +++---
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index a859d1c..6d91e3a 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
 BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_PACKAGE_FIRMWARE_DDRFW_DDR4=y
+BR2_PACKAGE_FIRMWARE_IMX_DDR4=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 0be37ce..b0c7de8 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -45,15 +45,12 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
-	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	bool "imx8mm"
-	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	bool "imx8mn"
-	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
@@ -99,9 +96,6 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
-config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
-	bool
-
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 4962992..7ff37ed 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -9,22 +9,29 @@ config BR2_PACKAGE_FIRMWARE_IMX
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-if BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+
+if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
 choice
 	bool "DDR training binaries"
-	default BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
+	default BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	help
 	  Choose the DDR training binaries to be used depending on the
 	  kind of memory that is available on the target board (DDR4,
 	  LPDDR4, etc...).
 
-config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
+config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	bool "lpddr4"
 	help
 	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
 
-config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
+config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 	bool "DDR4"
 	help
 	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 6beacc0..55ca6fc 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -18,10 +18,10 @@ define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW),y)
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4),y)
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 define FIRMWARE_IMX_PREPARE_LPDDR4_FW
 	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
@@ -46,7 +46,7 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
 	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
 endef
-else ifeq ($(BR2_PACKAGE_FIRMWARE_DDRFW_DDR4),y)
+else ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 define FIRMWARE_IMX_PREPARE_DDR4_FW
 	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
-- 
2.7.4
