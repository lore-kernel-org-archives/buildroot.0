From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 13:56:34 -0500
Subject: [Buildroot] [PATCH 1/2] fm-ucode-firmware: new package
Message-ID: <1382727395-23441-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/Config.in                              |    1 +
 package/fm-ucode-firmware/Config.in            |   19 +++++++++++++
 package/fm-ucode-firmware/fm-ucode-firmware.mk |   34 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/fm-ucode-firmware/Config.in
 create mode 100644 package/fm-ucode-firmware/fm-ucode-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..fa62781 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -252,6 +252,7 @@ menu "Hardware handling"
 menu "Misc devices firmwares"
 source "package/am33x-cm3/Config.in"
 source "package/b43-firmware/Config.in"
+source "package/fm-ucode-firmware/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
 source "package/sunxi-boards/Config.in"
diff --git a/package/fm-ucode-firmware/Config.in b/package/fm-ucode-firmware/Config.in
new file mode 100644
index 0000000..85a92a8
--- /dev/null
+++ b/package/fm-ucode-firmware/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FM_UCODE_FIRMWARE
+	bool "fm-ucode-firmware"
+	depends on BR2_powerpc_e500mc # Only relevant for PowerPC e500mc
+	help
+	  Firmware binaries for the Frame Manager hardware block in the
+	  QorIQ products.
+
+	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fm-ucode.git/
+
+comment "fm-ucode-firmware depends on PowerPC e500mc architecture"
+	depends on !BR2_powerpc_e500mc
+
+config BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE
+	string "FMan UCode Firmware Filename"
+	depends on BR2_PACKAGE_FM_UCODE_FIRMWARE
+	help
+	  Specify the FMan UCode firmware binary file that should
+	  be placed in the BINARIES_DIR as fm-ucode.bin
+
diff --git a/package/fm-ucode-firmware/fm-ucode-firmware.mk b/package/fm-ucode-firmware/fm-ucode-firmware.mk
new file mode 100644
index 0000000..da8e286
--- /dev/null
+++ b/package/fm-ucode-firmware/fm-ucode-firmware.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# fm-ucode-firmware
+#
+################################################################################
+
+FM_UCODE_FIRMWARE_VERSION = fsl-sdk-v1.4
+FM_UCODE_FIRMWARE_SITE = git://git.freescale.com/ppc/sdk/fm-ucode.git
+FM_UCODE_FIRMWARE_SITE_METHOD = git
+
+FM_UCODE_FIRMWARE_LICENSE = Freescale Semiconductor Software License Agreement
+FM_UCODE_FIRMWARE_LICENSE_FILES = EULA
+
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+FM_UCODE_FIRMWARE_REDISTRIBUTE = NO
+
+FM_UCODE_BINARY_FILE = $(call qstrip,$(BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE))
+# The name of the file to be deliveried in the BINARIES_DIR
+FM_UCODE_DELIVERY_FILE = fm-ucode.bin
+
+# we NEED binary file
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(FM_UCODE_BINARY_FILE),)
+$(error No FMan UCode binary file. Check your BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE setting)
+endif
+endif
+
+define FM_UCODE_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(FM_UCODE_BINARY_FILE) $(BINARIES_DIR)/$(FM_UCODE_DELIVERY_FILE)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
