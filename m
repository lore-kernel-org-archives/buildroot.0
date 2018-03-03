From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sat,  3 Mar 2018 09:17:39 +0100
Subject: [Buildroot] [PATCH v4 3/4] firmware-imx: add support for iMX8M
 firmware
In-Reply-To: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1520065060-20046-4-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
v4: No changes
v3: Split v2 commit into two commits (suggested by Garry B.)
v2: Split v1 commit into two commits (suggested by Baruch)
---
 package/freescale-imx/firmware-imx/Config.in       | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 630afca..f03daf2 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -18,6 +18,13 @@ define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	cp $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_*.bin $(BINARIES_DIR)
+	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin $(BINARIES_DIR)
+endef
+else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
 	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
@@ -27,5 +34,6 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
+endif
 
 $(eval $(generic-package))
-- 
2.7.4
