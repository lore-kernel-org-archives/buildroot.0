From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:26:44 +0200
Subject: [Buildroot] [git commit] package/freescale-imx: move DDR FW choice
 down to firmware-imx package
Message-ID: <20200711204122.6F1A785BD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbb9568626f0dca3d9b643761b6d90e9ca48af6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DDR FW along with all other FW code that need to be used in
bootloader or installed on target are related to the firmware-imx
package.

This patch does this job as well as fixing the conjugation of NEED*s*
in the symbol name. Also take advantage of this patch to make the DDR
FW dependant on BR2_PACKAGE_FIRMWARE_IMX.

In addition, the BR2_PACKAGE_FIRMWARE_DDRFW_* option was incorrect, as
there is no package matching this name. So we rename them to
BR2_PACKAGE_FIRMWARE_IMX_*, and add the appropriate Config.in.legacy
handling.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   | 14 ++++++++++++++
 configs/freescale_imx8mnevk_defconfig              |  2 +-
 package/freescale-imx/Config.in                    |  6 ------
 package/freescale-imx/firmware-imx/Config.in       | 20 +++++++++++++++-----
 package/freescale-imx/firmware-imx/firmware-imx.mk |  6 +++---
 5 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7a5435188b..8be7a9df91 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
+	bool "i.MX LPDDR4 option renamed"
+	select BR2_LEGACY
+	help
+	  The option BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 was renamed to
+	  BR2_PACKAGE_FIRMWARE_IMX_LPDDR4.
+
+config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
+	bool "i.MX DDR4 option renamed"
+	select BR2_LEGACY
+	help
+	  The option BR2_PACKAGE_FIRMWARE_DDRFW_DDR4 was renamed to
+	  BR2_PACKAGE_FIRMWARE_IMX_DDR4.
+
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils version 2.31.1 support removed"
 	select BR2_LEGACY
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index a859d1c743..6d91e3ac6f 100644
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
index 0be37ce956..b0c7de8436 100644
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
index 4962992346..2cedff5485 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -9,26 +9,36 @@ config BR2_PACKAGE_FIRMWARE_IMX
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-if BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
+if BR2_PACKAGE_FIRMWARE_IMX
+
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
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
 
 endchoice # DDR training FW
 
-endif
+endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+
+endif # BR2_PACKAGE_FIRMWARE_IMX
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index beaf6ef779..c4ac5f7413 100644
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
