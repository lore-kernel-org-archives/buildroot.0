From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 22:05:33 +0200
Subject: [Buildroot] [git commit] package/rpi-bt-firmware: change to
 LibreELEC github repo
Message-ID: <20180406201114.1932881272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f49bd05ea91d89fd511fd8e721743f8319e9e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include BCM4345C0.hcd for the rpi3 b+

Signed-off-by: Martin Bark <martin@barkynet.com>
[Thomas: rebase on master, use make foreach loop instead of shell for
loop.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-bt-firmware/Config.in            |  5 +++--
 package/rpi-bt-firmware/rpi-bt-firmware.hash |  3 ++-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 12 +++++++-----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/rpi-bt-firmware/Config.in b/package/rpi-bt-firmware/Config.in
index dfc1cee06c..45643d6a52 100644
--- a/package/rpi-bt-firmware/Config.in
+++ b/package/rpi-bt-firmware/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RPI_BT_FIRMWARE
 	depends on BR2_arm || BR2_aarch64
 	help
 	  Raspberry Pi 3 and Zero W Broadcom BCM43438 Bluetooth module
-	  firmware.
+	  firmware. Raspberry Pi 3 Model B+ Broadcom BCM4345C0
+	  Bluetooth module firmware.
 
-	  https://aur.archlinux.org/packages/pi-bluetooth
+	  https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index f1d06e8ca8..553a7e4298 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 5d9c9364277414ffd67b4a266cdf88e92f28eb937e5a413750e87b7a94161bef  rpi-bt-firmware-a439f892bf549ddfefa9ba7ad1999cc515f233bf.tar.gz
+sha256 beade89c5c072158b6cf18cf741d2695980fd6a4533dab3897bebf90c0631a30  rpi-bt-firmware-18d7c931aff0a8a78360b9b9eaeb15d1224fb907.tar.gz
+sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 644fdc6d5f..bbb40854e8 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
-RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
-RPI_BT_FIRMWARE_SITE_METHOD = git
+RPI_BT_FIRMWARE_VERSION = 18d7c931aff0a8a78360b9b9eaeb15d1224fb907
+RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 
+RPI_BT_FIRMWARE_FILES = brcm/BCM43430A1.hcd BCM4345C0.hcd
+
 define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
-		$(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
+	$(foreach file,$(RPI_BT_FIRMWARE_FILES),\
+		$(INSTALL) -D -m 0644 $(@D)/firmware/$(file) $(TARGET_DIR)/lib/firmware/$(notdir $(file))
+	)
 endef
 
 $(eval $(generic-package))
