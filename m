From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Tue, 15 Sep 2020 15:04:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 custom padding
In-Reply-To: <20200910141843.3030855-1-pieter.degendt@basalte.be>
References: <20200910141843.3030855-1-pieter.degendt@basalte.be>
Message-ID: <20200915130414.3286332-1-pieter.degendt@basalte.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tibault Damman <tibault.damman@basalte.be>

Some derivatives (such as Variscite imx8mm) expect the (LP)DDR4
training data to be padded to a different length.

eg: https://github.com/varigit/uboot-imx/commit/5f8d814f

This patch makes the padding length configurable.

Signed-off-by: Tibault Damman <tibault.damman@basalte.be>
Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>

---
Changes v1 -> v2:
  - improved description
  - renamed variables to match U-Boot (suggested by Gary Bisson)

Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
---
 package/freescale-imx/firmware-imx/Config.in       | 12 ++++++++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk |  6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 5becf8b6a9..587f402426 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -69,6 +69,18 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 
 endchoice # DDR training FW
 
+config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
+	hex "(LP)DDR IMEM padding length"
+	default 0x8000
+	help
+	  The IMEM firmware will be padded to this length
+
+config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
+	hex "(LP)DDR DMEM padding length"
+	default 0x4000
+	help
+	  The DMEM firmware will be padded to this length
+
 endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
 endif # BR2_PACKAGE_FIRMWARE_IMX
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index eb8595f022..fb3cfe640b 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -23,10 +23,12 @@ endef
 #
 
 define FIRMWARE_IMX_PREPARE_DDR_FW
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 \
+	$(TARGET_OBJCOPY) -I binary -O binary \
+		--pad-to $(BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN) --gap-fill=0x0 \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1)).bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin
-	$(TARGET_OBJCOPY) -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 \
+	$(TARGET_OBJCOPY) -I binary -O binary \
+		--pad-to $(BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN) --gap-fill=0x0 \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2)).bin \
 		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(2))_pad.bin
 	cat $(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(1))_pad.bin \
-- 
2.25.1
