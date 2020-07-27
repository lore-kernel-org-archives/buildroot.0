From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:15:51 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx:
 refactor DDR firmware preparation
Message-ID: <20200727191108.3693180E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc23ea2a19999c2328693579f7a5209236b23c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic doing the padding and concatenation of DDR firmware was
duplicated between the DDR4 and LPDDR4 cases. This commit refactors
this logic into a single function FIRMWARE_IMX_PREPARE_DDR_FW.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 44 ++++++++++------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 5cfff2da05..eb8595f022 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -22,26 +22,29 @@ endef
 # DDR firmware
 #
 
-ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
-FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
-define FIRMWARE_IMX_PREPARE_LPDDR4_FW
+define FIRMWARE_IMX_PREPARE_DDR_FW
 	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_imem.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_imem_pad.bin
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1)).bin \
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin
 	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_dmem.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_dmem_pad.bin
-	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_imem_pad.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_dmem_pad.bin > \
-		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_fw.bin
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2)).bin \
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2))_pad.bin
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin \
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2))_pad.bin > \
+		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(3)).bin
 endef
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
 define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
 	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
-	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,1d)
-	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,2d)
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		lpddr4_pmu_train_1d_imem,lpddr4_pmu_train_1d_dmem,lpddr4_pmu_train_1d_fw)
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		lpddr4_pmu_train_2d_imem,lpddr4_pmu_train_2d_dmem,lpddr4_pmu_train_2d_fw)
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
@@ -51,24 +54,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
-define FIRMWARE_IMX_PREPARE_DDR4_FW
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin
-	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_imem_$(1)_201810_pad.bin \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_dmem_$(1)_201810_pad.bin > \
-		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_$(1)_201810_fw.bin
-endef
 
 define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# Create padded versions of ddr4_* and generate ddr4_fw.bin.
 	# ddr4_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
-	$(call FIRMWARE_IMX_PREPARE_DDR4_FW,1d)
-	$(call FIRMWARE_IMX_PREPARE_DDR4_FW,2d)
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		ddr4_imem_1d_201810,ddr4_dmem_1d_201810,ddr4_1d_201810_fw)
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		ddr4_imem_2d_201810,ddr4_dmem_2d_201810,ddr4_2d_201810_fw)
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr4_1d_201810_fw.bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
 		$(BINARIES_DIR)/ddr4_201810_fw.bin
