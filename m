From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 May 2017 11:31:43 +0200
Subject: [Buildroot] [git commit] rpi-wifi-firmware: new package
Message-ID: <20170506095014.89C4880438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5634f4028403dade0ba4b37bcb7f1338863dd919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware (NVRAM data) for the Raspberry Pi 3 and Zero W wifi module.

Notice that linux-firmware provides the main firmware
(brcmfmac43430-sdio.bin), but the module also needs board specific
configuration (NVRAM) data.

For the rpi, this data is available in the RPI firmware-nonfree git repo.
As this repo contains a lot of unrelated data (~70MB), simply download the
single NVRAM file instead of cloning the entire repo.

A similar approach is used by openwrt and opensuse:

https://dev.openwrt.org/browser/trunk/package/firmware/brcmfmac43430-firmware/Makefile?rev=49139
https://build.opensuse.org/package/view_file/hardware/bcm43xx-firmware/bcm43xx-firmware.spec?rev=b1628448b36c85abc9215eab4785ef29

[Peter: add _FIRMWARE_LICENSE as suggested by Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |  1 +
 package/rpi-wifi-firmware/Config.in              | 10 ++++++++++
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash |  2 ++
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 23 +++++++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1af8150..d57813c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -348,6 +348,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
+	source "package/rpi-wifi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
diff --git a/package/rpi-wifi-firmware/Config.in b/package/rpi-wifi-firmware/Config.in
new file mode 100644
index 0000000..2c87c75
--- /dev/null
+++ b/package/rpi-wifi-firmware/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RPI_WIFI_FIRMWARE
+	bool "rpi-wifi-firmware"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LINUX_FIRMWARE
+	select BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX # runtime
+	help
+	  Raspberry Pi 3 and Zero W Broadcom BCM43430 wifi module
+	  NVRAM data.
+
+	  https://github.com/RPi-Distro/firmware-nonfree/
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
new file mode 100644
index 0000000..c205065
--- /dev/null
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  872fde4f9942d9aba805880d6eaddfe050305626fd58ad955bfe77c04f6b75a5  brcmfmac43430-sdio.txt
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
new file mode 100644
index 0000000..6c855a8
--- /dev/null
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rpi-wifi-firmware
+#
+################################################################################
+
+RPI_WIFI_FIRMWARE_VERSION = 54bab3d6a6d43239c71d26464e6e10e5067ffea7
+# brcmfmac43430-sdio.bin comes from linux-firmware
+RPI_WIFI_FIRMWARE_SOURCE = brcmfmac43430-sdio.txt
+# git repo contains a lot of unrelated files
+RPI_WIFI_FIRMWARE_SITE = https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$(RPI_WIFI_FIRMWARE_VERSION)/brcm80211/brcm
+RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
+
+define RPI_WIFI_FIRMWARE_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+endef
+
+define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(RPI_WIFI_FIRMWARE_SOURCE) \
+		$(TARGET_DIR)/lib/firmware/brcm/$(RPI_WIFI_FIRMWARE_SOURCE)
+endef
+
+$(eval $(generic-package))
