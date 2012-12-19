From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Dec 2012 00:37:33 +0100
Subject: [Buildroot] [PATCH RFC 3/6] firmware-imx: new package
In-Reply-To: <1355960256-10786-1-git-send-email-arnout@mind.be>
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
Message-ID: <1355960256-10786-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>


Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                    |    1 +
 package/firmware-imx/Config.in       |   13 ++++++++++++
 package/firmware-imx/firmware-imx.mk |   38 ++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/firmware-imx/Config.in
 create mode 100644 package/firmware-imx/firmware-imx.mk

diff --git a/package/Config.in b/package/Config.in
index ac2488e..52bb408 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -213,6 +213,7 @@ source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
 source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
+source "package/firmware-imx/Config.in"
 source "package/fis/Config.in"
 source "package/fmtools/Config.in"
 source "package/fxload/Config.in"
diff --git a/package/firmware-imx/Config.in b/package/firmware-imx/Config.in
new file mode 100644
index 0000000..dd96d88
--- /dev/null
+++ b/package/firmware-imx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FIRMWARE_IMX
+	bool "firmware-imx"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Firmware blobs for the Freescale i.MX SoCs.
+
+	  It contains blobs for Atheros AR6003, SDMA and VPU.
+
+	  Note: it also contains a blob for ar3k/30101 but upstream
+	  linux-firmware has that as well.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/firmware-imx/firmware-imx.mk b/package/firmware-imx/firmware-imx.mk
new file mode 100644
index 0000000..5072288
--- /dev/null
+++ b/package/firmware-imx/firmware-imx.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# buildroot makefile for firmware-imx
+#
+#############################################################
+
+FIRMWARE_IMX_VERSION = 12.09.01
+# No official download site from freescale, just this mirror
+FIRMWARE_IMX_SITE = http://download.ossystems.com.br/bsp/freescale/source
+FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
+FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
+	Atheros license (ath6k)
+FIRMWARE_IMX_LICENSE_FILES = licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+FIRMWARE_IMX_REDISTRIBUTE = NO
+
+FIRMWARE_IMX_BLOBS = ath6k sdma vpu
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (firmware-imx-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+define FIRMWARE_IMX_EXTRACT_CMDS
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(FIRMWARE_IMX_SOURCE) --force --auto-accept
+endef
+
+
+define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
+		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
