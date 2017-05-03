From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 May 2017 22:12:06 +0200
Subject: [Buildroot] [git commit] rpi-bt-firmware: new package
Message-ID: <20170503201434.62DB382616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f94f1aaab2e786542a83327358570a828d68f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware file for the Raspberry Pi 3 and Zero W Bluetooth module.

Note that to successfully download the firmware bluez5_utils needs a patch[1].

Even though the firmware file name (BCM43430A1.hcd) only mentions the
Bluetooth module, it is most likely tailored for the Raspberry Pi boards.
Firmware for the same BT module on other boards look different. For this
reason the name of the package is rpi-bt-firmware.

[1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html

[Peter: correct Config.in ordering]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/rpi-bt-firmware/Config.in          |  8 ++++++++
 package/rpi-bt-firmware/rpi-bt-firmware.mk | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index aaecd61..acaf43c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -346,6 +346,7 @@ menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
+	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
diff --git a/package/rpi-bt-firmware/Config.in b/package/rpi-bt-firmware/Config.in
new file mode 100644
index 0000000..dfc1cee
--- /dev/null
+++ b/package/rpi-bt-firmware/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RPI_BT_FIRMWARE
+	bool "rpi-bt-firmware"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Raspberry Pi 3 and Zero W Broadcom BCM43438 Bluetooth module
+	  firmware.
+
+	  https://aur.archlinux.org/packages/pi-bluetooth
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
new file mode 100644
index 0000000..255da19
--- /dev/null
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rpi-bt-firmware
+#
+################################################################################
+
+RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
+RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
+RPI_BT_FIRMWARE_SITE_METHOD = git
+RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
+RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+
+# The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
+# compatibility symlink.
+define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
+	ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware
+	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
+		$(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
+endef
+
+$(eval $(generic-package))
