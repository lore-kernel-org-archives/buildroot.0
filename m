From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 22 Feb 2018 11:02:57 +0100
Subject: [Buildroot] [PATCH v2 2/3] firmware-imx: add support for iMX8M
 firmware
In-Reply-To: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1519293778-5185-3-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/freescale-imx/Config.in                    | 4 +++-
 package/freescale-imx/firmware-imx/Config.in       | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b5e5ab2..b5df642 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_FREESCALE_IMX
 	bool "Freescale i.MX libraries"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  Those packages provide hardware acceleration for GPU or VPU,
 	  hardware optimization or some hardware tools for Freescale
@@ -40,6 +40,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	bool "imx7d/imx7ulp"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	bool "imx8m"
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
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
