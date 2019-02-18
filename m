From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon, 18 Feb 2019 21:48:02 +0100
Subject: [Buildroot] [PATCH/next v3 1/6] package/freescale-imx: Add support
 for i.MX8X
In-Reply-To: <20190218204807.16815-1-nerv@dawncrow.de>
References: <20190218204807.16815-1-nerv@dawncrow.de>
Message-ID: <20190218204807.16815-2-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andr? Hentschel <andre.hentschel@zf.com>

Signed-off-by: Andr? Hentschel <andre.hentschel@zf.com>
---
 package/freescale-imx/Config.in                    | 3 +++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 95c0aab08c..9001764437 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -42,6 +42,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	bool "imx8x"
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index f9db09dae8..0e2ff7bba2 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -45,6 +45,14 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
 		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	# SECO firmware is needed when generating imx8-boot-sd.bin which
+	# is done in post-image script.
+	cp $(@D)/firmware/seco/ahab-container.img \
+		$(BINARIES_DIR)/ahab-container.img
+endef
 else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-- 
2.17.1
