From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 12 Apr 2018 14:35:22 +0200
Subject: [Buildroot] [PATCH 1/4] firmware-imx: add support for iMX8M firmware
Message-ID: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
 package/freescale-imx/firmware-imx/Config.in       |  2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index fca280a..56d5b80 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FIRMWARE_IMX
 	bool "firmware-imx"
-	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
 	help
 	  Firmware blobs for the Freescale i.MX SoCs.
 
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index d5387b3..93a4c1a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -18,6 +18,33 @@ define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+define FIRMWARE_IMX_PREPARE_LPDDR4_FW
+	(cd $(@D)/firmware/ddr/synopsys/ && \
+		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
+			lpddr4_pmu_train_$(1)_imem.bin \
+			lpddr4_pmu_train_$(1)_imem_pad.bin && \
+		$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
+			lpddr4_pmu_train_$(1)_dmem.bin \
+			lpddr4_pmu_train_$(1)_dmem_pad.bin && \
+		cat lpddr4_pmu_train_$(1)_imem_pad.bin lpddr4_pmu_train_$(1)_dmem_pad.bin > \
+			lpddr4_pmu_train_$(1)_fw.bin \
+	)
+endef
+
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
+	# lpddr4_pmu_train_fw.bin isneeded when generating imx-boot-imx8mqevk-sd.bin
+	# which is done in post-image script.
+	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,1d)
+	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,2d)
+	cat $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_1d_fw.bin \
+		$(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_2d_fw.bin > \
+		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
+	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin $(BINARIES_DIR)/signed_hdmi_imx8m.bin
+endef
+else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
 	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
@@ -27,5 +54,6 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
+endif
 
 $(eval $(generic-package))
-- 
2.7.4
