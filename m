From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 20:08:27 +0100
Subject: [Buildroot] [git commit] New package: linux-firmware
Message-ID: <20120126190846.26A559058F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce2977d9e0850b689a213d3bf0714ec5e5f626f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add infrastructure for closed binary blobs

[Peter: whitespace/Kconfig fixes, use tar to copy to TARGET_DIR]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/linux-firmware/Config.in         |   44 ++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk |   59 ++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b245da8..251da85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -185,6 +185,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
+source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
new file mode 100644
index 0000000..9ce1a75
--- /dev/null
+++ b/package/linux-firmware/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_LINUX_FIRMWARE
+	bool "linux-firmware"
+	help
+	  This package provides various binary firmware files (closed
+	  binary blobs) for such devices like LAN, WLAN cards etc.
+
+	  https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git
+
+if BR2_PACKAGE_LINUX_FIRMWARE
+
+menu "Ralink"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
+	bool "Ralink rt2501/rt61"
+	help
+	  Ralink rt2501/rt61
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73
+	bool "Ralink rt73"
+	help
+	  Ralink rt73
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
+	bool "Ralink rt27xx/rt28xx/rt30xx"
+	help
+	  Ralink rt27xx/rt28xx/rt30xx
+
+endmenu
+
+menu "Texas Instruments"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
+	bool "wl127X"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
+
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
+	bool "wl128X"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl128x
+
+endmenu
+
+endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
new file mode 100644
index 0000000..d5987ab
--- /dev/null
+++ b/package/linux-firmware/linux-firmware.mk
@@ -0,0 +1,59 @@
+#############################################################
+#
+# linux-firmware
+#
+#############################################################
+LINUX_FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
+LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
+LINUX_FIRMWARE_SITE_METHOD = git
+
+# rt2501/rt61
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61) += \
+	rt2561.bin rt2561s.bin rt2661.bin LICENCE.ralink-firmware.txt
+
+
+# rt73
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73) += \
+	rt73.bin LICENCE.ralink-firmware.txt
+
+# rt2xx
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
+	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
+	LICENCE.ralink-firmware.txt
+
+# wl127x
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
+	ti-connectivity/wl1271-fw-2.bin				\
+	ti-connectivity/wl1271-fw-ap.bin			\
+	ti-connectivity/wl1271-fw.bin				\
+	ti-connectivity/wl1271-nvs.bin				\
+	ti-connectivity/wl127x-fw-3.bin				\
+	ti-connectivity/wl127x-fw-plt-3.bin			\
+	ti-connectivity/wl127x-nvs.bin				\
+	ti-connectivity/TIInit_7.2.31.bts 			\
+	LICENCE.ti-connectivity
+
+# wl128x
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
+	ti-connectivity/wl128x-fw-3.bin				\
+	ti-connectivity/wl128x-fw-ap.bin			\
+	ti-connectivity/wl128x-fw-plt-3.bin			\
+	ti-connectivity/wl128x-fw.bin				\
+	ti-connectivity/wl1271-nvs.bin				\
+	ti-connectivity/wl128x-nvs.bin				\
+	ti-connectivity/wl12xx-nvs.bin				\
+	ti-connectivity/TIInit_7.2.31.bts 			\
+	LICENCE.ti-connectivity
+
+
+ifneq ($(LINUX_FIRMWARE_FILES_y),)
+
+define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	$(TAR) c -C $(@D) $(LINUX_FIRMWARE_FILES_y) | \
+		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+endef
+
+endif
+
+$(eval $(call GENTARGETS))
