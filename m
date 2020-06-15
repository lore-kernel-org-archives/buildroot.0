From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Jun 2020 15:06:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx: install
 sdma firmware for i.MX8M{, M, N}
Message-ID: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX8M, i.MX8MM and i.MX8MN have sdma controllers so install sdma
firmware for these SoCs. Mainline and NXP kernels expect the sdma
firmware to be in /lib/firmware/imx/sdma so fix the install path at the
same time.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 .../freescale-imx/firmware-imx/firmware-imx.mk  | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 9fd1c54b48..725f275948 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -12,7 +12,7 @@ FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
-FIRMWARE_IMX_BLOBS = sdma vpu
+FIRMWARE_IMX_BLOBS = sdma epdc
 
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
@@ -84,23 +84,16 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	$(FIRMWARE_IMX_PREPARE_DDR_FW)
 	$(FIRMWARE_IMX_PREPARE_HDMI_FW)
 endef
-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
-define FIRMWARE_IMX_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
-		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
-	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
-		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
-endef
-else
+endif
+
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
 	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
-		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
+		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware/imx; \
 	done
-	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
-endif
 
 $(eval $(generic-package))
-- 
2.26.2
