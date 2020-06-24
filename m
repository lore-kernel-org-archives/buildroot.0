From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Wed, 24 Jun 2020 17:23:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-imx: Clean
 up the image/target semantic
In-Reply-To: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1593012228-18959-3-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The newly introduced BR2_PACKAGE_FREESCALE_IMX_NEED_xxx_FW symbols shall
be used in lieue of the SoC type when installing images or binaries on
target.

These new symbols let us define FIRMWARE_IMX_INSTALL_IMAGES_CMDS and
FIRMWARE_IMX_INSTALL_TARGET_CMDS based on platform needs rather than
SoC type.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 70 +++++++++++++++++-----
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 6beacc0..62f97e6 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -12,12 +12,13 @@ FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
-FIRMWARE_IMX_BLOBS = sdma vpu
-
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
+# firmware-imx install images section:
+######################################
+
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
@@ -71,36 +72,73 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
 		$(BINARIES_DIR)/ddr4_201810_fw.bin
 	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
 endef
-endif
+endif # DDRFW_LPDDR4 || DDRFW_DDR4
+endif # NEED_DDR_FW
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
 define FIRMWARE_IMX_PREPARE_HDMI_FW
 	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
 		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
 endef
-endif
+endif # NEED_HDMI_FW
 
 define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	$(FIRMWARE_IMX_PREPARE_DDR_FW)
 	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
 endef
-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
-define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+
+# firmware-imx install target section:
+######################################
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW),y)
+FIRMWARE_IMX_INSTALL_TARGET = YES
+
+define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
+	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
+		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+endef
+endif # NEED_EPDC_FW
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW),y)
+FIRMWARE_IMX_INSTALL_TARGET = YES
+
+define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
+endef
+endif # NEED_SDMA_FW
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW),y)
+FIRMWARE_IMX_INSTALL_TARGET = YES
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_VPUFW_GENERIC),y)
+
+define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
+endef
+
+endif
+ifeq ($(BR2_PACKAGE_FIRMWARE_VPUFW_IMX8),y)
+
+define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
 	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
 		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
 	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
 		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
 endef
-else
+
+endif
+endif # NEED_VPU_FW
+
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
-		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
-	done
-	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
-	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
-		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+	$(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
+	$(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
+	$(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)
 endef
-endif
 
 $(eval $(generic-package))
-- 
2.7.4
