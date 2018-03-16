From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:30 +0000
Subject: [Buildroot] [PATCH v3 5/7] package/rpi-bt-firmware: change to
 LibreELEC github repo
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316180232.18829-6-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include BCM4345C0.hcd for the rpi3 b+

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changed v2 -> v3
 - new in v3
---
 package/rpi-bt-firmware/Config.in            |  5 +++--
 package/rpi-bt-firmware/rpi-bt-firmware.hash |  2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 13 +++++++------
 3 files changed, 11 insertions(+), 9 deletions(-)

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
index f1d06e8ca8..922e0666d4 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5d9c9364277414ffd67b4a266cdf88e92f28eb937e5a413750e87b7a94161bef  rpi-bt-firmware-a439f892bf549ddfefa9ba7ad1999cc515f233bf.tar.gz
+sha256 2a6e8f492878ca1de5347f17ab239006db61215c48276fa6ea6e578f3cc5b58d  rpi-bt-firmware-f0dc870f707118fa000f6ee47ec05e7eaa57b917.tar.gz
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 255da19262..ed76586fd6 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
-RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
-RPI_BT_FIRMWARE_SITE_METHOD = git
+RPI_BT_FIRMWARE_VERSION = f0dc870f707118fa000f6ee47ec05e7eaa57b917
+RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
-RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+
+RPI_BT_FIRMWARE_FILES = brcm/BCM43430A1.hcd BCM4345C0.hcd
 
 # The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
 # compatibility symlink.
 define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
 	ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware
-	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
-		$(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
+	for file in $(RPI_BT_FIRMWARE_FILES); do \
+		$(INSTALL) -D -m 0644 $(@D)/firmware/$${file} $(TARGET_DIR)/lib/firmware/$${file##*/}; \
+	done
 endef
 
 $(eval $(generic-package))
-- 
2.16.2
