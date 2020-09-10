From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Thu, 10 Sep 2020 16:18:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx: custom
 padding
Message-ID: <20200910141843.3030855-1-pieter.degendt@basalte.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tibault Damman <tibault.damman@basalte.be>

Some derivatives (such as Variscite imx8mm) require the training data to
be padded to a different loading address.

Signed-off-by: Tibault Damman <tibault.damman@basalte.be>
Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
---
 package/freescale-imx/firmware-imx/Config.in       | 12 ++++++++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk |  6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 5becf8b6a9..c947248ee1 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -69,6 +69,18 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 
 endchoice # DDR training FW
 
+config BR2_PACKAGE_FIRMWARE_IMX_IMEM_ADDR
+	hex "(lp)ddr imem load address"
+	default 0x8000
+	help
+	  The training FW will be padded to start at this load address
+
+config BR2_PACKAGE_FIRMWARE_IMX_DMEM_ADDR
+	hex "(lp)ddr dmem load address"
+	default 0x4000
+	help
+	  The training FW will be padded to start at this load address
+
 endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
 endif # BR2_PACKAGE_FIRMWARE_IMX
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index eb8595f022..1ace002d5b 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -23,10 +23,12 @@ endef
 #
 
 define FIRMWARE_IMX_PREPARE_DDR_FW
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
+	$(TARGET_OBJCOPY) -I binary -O binary \
+		--pad-to $(BR2_PACKAGE_FIRMWARE_IMX_IMEM_ADDR) --gap-fill=0x0 \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1)).bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
+	$(TARGET_OBJCOPY) -I binary -O binary \
+		--pad-to $(BR2_PACKAGE_FIRMWARE_IMX_DMEM_ADDR) --gap-fill=0x0 \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2)).bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2))_pad.bin
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin \
-- 
2.25.1
