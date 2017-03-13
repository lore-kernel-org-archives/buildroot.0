From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Mar 2017 16:35:27 +0200
Subject: [Buildroot] [PATCH] wilink-bt-firmware: new package
Message-ID: <cbd5997af99067109143dbe87a830b237198451f.1489415727.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add firmware files for the UART attached Bluetooth on TI Wilink series
wireless connectivity combo chips.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Config.in                                  |  1 +
 package/wilink-bt-firmware/Config.in               |  7 +++++++
 package/wilink-bt-firmware/wilink-bt-firmware.hash |  2 ++
 package/wilink-bt-firmware/wilink-bt-firmware.mk   | 17 +++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/wilink-bt-firmware/Config.in
 create mode 100644 package/wilink-bt-firmware/wilink-bt-firmware.hash
 create mode 100644 package/wilink-bt-firmware/wilink-bt-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 2bacd92da42f..ec88685d0f1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,6 +345,7 @@ menu "Firmware"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
+	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
diff --git a/package/wilink-bt-firmware/Config.in b/package/wilink-bt-firmware/Config.in
new file mode 100644
index 000000000000..b18998ed4bc5
--- /dev/null
+++ b/package/wilink-bt-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_WILINK_BT_FIRMWARE
+	bool "wilink-bt-firmware"
+	help
+	  Texas Instruments Wilink7 and Wilink8 (wl12xx/wl18xx) UART
+	  attached Bluetooth firmware.
+
+	  https://github.com/TI-ECS/bt-firmware
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
new file mode 100644
index 000000000000..2cb6c880e646
--- /dev/null
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b99700f6d504d76878de83ac50f18a0270b6edd0b52a0458c60fc606ed3332f0 wilink-bt-firmware-169b2df5b968f0ede32ea9044859942fc220c435.tar.gz
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.mk b/package/wilink-bt-firmware/wilink-bt-firmware.mk
new file mode 100644
index 000000000000..180a85e28a0d
--- /dev/null
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# wilink-bt-firmware
+#
+################################################################################
+
+WILINK_BT_FIRMWARE_VERSION = 169b2df5b968f0ede32ea9044859942fc220c435
+WILINK_BT_FIRMWARE_SITE = $(call github,TI-ECS,bt-firmware,$(WILINK_BT_FIRMWARE_VERSION))
+WILINK_BT_FIRMWARE_LICENSE = PROPRIETARY
+WILINK_BT_FIRMWARE_LICENSE_FILES = LICENCE
+
+define WILINK_BT_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/ti-connectivity
+	cp $(@D)/TIInit_*.bts $(TARGET_DIR)/lib/firmware/ti-connectivity
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
