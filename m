From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 22:39:03 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx:
 clarify installation of firmware files
Message-ID: <20200711204122.875B785B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fad2df39b9f64b54ca6b0d3372d213ec73865d28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The newly introduced BR2_PACKAGE_FIRMWARE_IMX_NEEDS_xxx symbols are
used in lieu of the SoC type when installing images or binaries on
target.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 89 ++++++++++++++++------
 1 file changed, 65 insertions(+), 24 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index c4ac5f7413..ed8a81bcc5 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -12,14 +12,17 @@ FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
-FIRMWARE_IMX_BLOBS = sdma vpu
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+
+FIRMWARE_IMX_PLATFORM_LOWER = $(shell echo $(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) | tr A-Z a-z | head -c 5)
 
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
-ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW),y)
-FIRMWARE_IMX_INSTALL_IMAGES = YES
+#
+# DDR firmware
+#
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
@@ -35,7 +38,7 @@ define FIRMWARE_IMX_PREPARE_LPDDR4_FW
 		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_$(1)_fw.bin
 endef
 
-define FIRMWARE_IMX_PREPARE_DDR_FW
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
 	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
@@ -46,7 +49,9 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
 		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
 	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
 endef
-else ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
+endif
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 define FIRMWARE_IMX_PREPARE_DDR4_FW
 	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
@@ -60,7 +65,7 @@ define FIRMWARE_IMX_PREPARE_DDR4_FW
 		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_$(1)_201810_fw.bin
 endef
 
-define FIRMWARE_IMX_PREPARE_DDR_FW
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 	# Create padded versions of ddr4_* and generate ddr4_fw.bin.
 	# ddr4_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
@@ -73,34 +78,70 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
-define FIRMWARE_IMX_PREPARE_HDMI_FW
+#
+# HDMI firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),y)
+define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
 	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
 		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
 endef
 endif
 
-define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
-	$(FIRMWARE_IMX_PREPARE_DDR_FW)
-	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
-endef
-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
-define FIRMWARE_IMX_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
-		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
-	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
-		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
-endef
-else
-define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+#
+# EPDC firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW),y)
+define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
-		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware/imx; \
-	done
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
 endif
 
+#
+# SDMA firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)
+define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma
+	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_PLATFORM_LOWER)*.bin \
+	       $(TARGET_DIR)/lib/firmware/imx/sdma/
+endef
+endif
+
+#
+# VPU firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW),y)
+# special case for i.MX8X, which uses the same firmware as i.MX8
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+FIRMWARE_IMX_VPU_PLATFORM = imx8
+else
+FIRMWARE_IMX_VPU_PLATFORM = $(FIRMWARE_IMX_PLATFORM_LOWER)
+endif
+
+define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
+	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_PLATFORM)*.bin \
+		$(TARGET_DIR)/lib/firmware/imx/vpu/
+endef
+endif
+
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	$(FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW)
+	$(FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW)
+endef
+
+define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	$(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
+	$(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
+	$(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)
+endef
+
 $(eval $(generic-package))
