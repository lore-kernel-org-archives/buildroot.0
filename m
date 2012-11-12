From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 12 Nov 2012 18:41:38 +0100
Subject: [Buildroot] [PATCH v2 2/6] ux500-firmware: new package
In-Reply-To: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1352742102-19010-3-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                        |    1 +
 package/ux500-firmware/Config.in         |    7 +++++++
 package/ux500-firmware/ux500-firmware.mk |   20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/ux500-firmware/Config.in
 create mode 100644 package/ux500-firmware/ux500-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index cb78d2f..6da6e73 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,6 +261,7 @@ source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
+source "package/ux500-firmware/Config.in"
 source "package/wipe/Config.in"
 endmenu
 
diff --git a/package/ux500-firmware/Config.in b/package/ux500-firmware/Config.in
new file mode 100644
index 0000000..7e8a94b
--- /dev/null
+++ b/package/ux500-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UX500_FIRMWARE
+	bool "ux500-firmware"
+	help
+	  This package provides various binary firmware files (closed binary blobs)
+	  for the Azurewave AW-NH580 combo module (wifi, bt, gps).
+
+	  https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
new file mode 100644
index 0000000..522113a
--- /dev/null
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# ux500-firmware
+#
+#############################################################
+UX500_FIRMWARE_VERSION = 1.1.3-6
+UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
+UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
+UX500_FIRMWARE_LICENSE = Snowball click-wrap license
+UX500_FIRMWARE_REDISTRIBUTE = NO
+
+define UX500_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/* $(TARGET_DIR)/lib/firmware/
+	for f in $(TARGET_DIR)/lib/firmware/CG2900* ; do \
+		mv $$f $${f/CG2900/CG29XX}; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
