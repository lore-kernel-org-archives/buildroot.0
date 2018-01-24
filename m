From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 24 Jan 2018 18:10:50 +0100
Subject: [Buildroot] [PATCH] imx-m4fwloader: new package
Message-ID: <20180124171050.11445-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides a tool to load a firmware to the Cortex-M4 core
available in some i.MX processors such as i.MX6SX or i.MX7.

This package was tested on a i.MX7D Nitrogen7 platform:
 # imx-m4fwloader hello_world.bin 0x007F8000

Upstream repository:
https://github.com/codeauroraforum/imx-m4fwloader

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-m4fwloader/Config.in     |  9 +++++++++
 .../imx-m4fwloader/imx-m4fwloader.hash             |  2 ++
 .../freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/freescale-imx/imx-m4fwloader/Config.in
 create mode 100644 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
 create mode 100644 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index e1dbdfb3e2..b5e5ab23dc 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
diff --git a/package/freescale-imx/imx-m4fwloader/Config.in b/package/freescale-imx/imx-m4fwloader/Config.in
new file mode 100644
index 0000000000..b5d27a6856
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IMX_M4FWLOADER
+	bool "imx-m4fwloader"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  This package provides a tool to load a firmware to the
+	  Cortex-M4 core available in some i.MX processors.
+
+	  Upstream repository:
+	  https://github.com/codeauroraforum/imx-m4fwloader
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
new file mode 100644
index 0000000000..0331fd0880
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fb6334900972fe389e808845417dd9045fb0f7eb47952fc22a00f4cdaf94af1a  imx-m4fwloader-8cf4d17a09ba23250d43381b49ba00d92406fad9.tar.gz
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
new file mode 100644
index 0000000000..ad80b839f5
--- /dev/null
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# imx-m4fwloader
+#
+################################################################################
+
+IMX_M4FWLOADER_VERSION = 8cf4d17a09ba23250d43381b49ba00d92406fad9
+IMX_M4FWLOADER_SITE = $(call github,codeauroraforum,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
+IMX_M4FWLOADER_LICENSE = GPL-2.0+
+IMX_M4FWLOADER_LICENSE_FILES = LICENSE
+
+define IMX_M4FWLOADER_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/imx-m4fwloader \
+		$(@D)/m4fwloader.c
+endef
+
+define IMX_M4FWLOADER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/imx-m4fwloader \
+		$(TARGET_DIR)/usr/bin/imx-m4fwloader
+endef
+
+$(eval $(generic-package))
-- 
2.15.1
