From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:49:22 +0100
Subject: [Buildroot] [git commit] wilink-bt-firmware: new package
Message-ID: <20170318144951.EA3D382240@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d3573e0f32197e8c83870801433ee41dd59affb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware files for the UART attached Bluetooth on TI Wilink series
wireless connectivity combo chips.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Thomas: rename config option so that it has the BR2_PACKAGE_ prefix.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/wilink-bt-firmware/Config.in               |  7 +++++++
 package/wilink-bt-firmware/wilink-bt-firmware.hash |  2 ++
 package/wilink-bt-firmware/wilink-bt-firmware.mk   | 17 +++++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e9648a0..52b4f36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ menu "Firmware"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
+	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
diff --git a/package/wilink-bt-firmware/Config.in b/package/wilink-bt-firmware/Config.in
new file mode 100644
index 0000000..2668304
--- /dev/null
+++ b/package/wilink-bt-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WILINK_BT_FIRMWARE
+	bool "wilink-bt-firmware"
+	help
+	  Texas Instruments Wilink7 and Wilink8 (wl12xx/wl18xx) UART
+	  attached Bluetooth firmware.
+
+	  https://github.com/TI-ECS/bt-firmware
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
new file mode 100644
index 0000000..2cb6c88
--- /dev/null
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b99700f6d504d76878de83ac50f18a0270b6edd0b52a0458c60fc606ed3332f0 wilink-bt-firmware-169b2df5b968f0ede32ea9044859942fc220c435.tar.gz
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.mk b/package/wilink-bt-firmware/wilink-bt-firmware.mk
new file mode 100644
index 0000000..180a85e
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
