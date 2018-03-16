From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:31 +0000
Subject: [Buildroot] [PATCH v3 6/7] package/rpi-wifi-firmware: change to
 LibreELEC github repo
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316180232.18829-7-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include brcmfmac43455-sdio.txt for the rpi3 b+

Signed-off-by: Martin Bark <martin@barkynet.com>
Cc: Jens Maus <mail@jens-maus.de>

---
Changes v2 -> v3
 - New in v3 (suggested by Jens Maus)
---
 package/rpi-wifi-firmware/Config.in              |  5 +++--
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash |  2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 17 +++++++----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/rpi-wifi-firmware/Config.in b/package/rpi-wifi-firmware/Config.in
index 2c87c75842..c2d6e675e2 100644
--- a/package/rpi-wifi-firmware/Config.in
+++ b/package/rpi-wifi-firmware/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RPI_WIFI_FIRMWARE
 	select BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX # runtime
 	help
 	  Raspberry Pi 3 and Zero W Broadcom BCM43430 wifi module
-	  NVRAM data.
+	  NVRAM data. Raspberry Pi 3 Model B+ Broadcom BCM43455
+	  wifi module NVRAM data.
 
-	  https://github.com/RPi-Distro/firmware-nonfree/
+	  https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index c20506536f..c3ea553c7d 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  872fde4f9942d9aba805880d6eaddfe050305626fd58ad955bfe77c04f6b75a5  brcmfmac43430-sdio.txt
+sha256 2a6e8f492878ca1de5347f17ab239006db61215c48276fa6ea6e578f3cc5b58d  rpi-wifi-firmware-f0dc870f707118fa000f6ee47ec05e7eaa57b917.tar.gz
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 6c855a8e14..77d4945414 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,20 +4,17 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 54bab3d6a6d43239c71d26464e6e10e5067ffea7
-# brcmfmac43430-sdio.bin comes from linux-firmware
-RPI_WIFI_FIRMWARE_SOURCE = brcmfmac43430-sdio.txt
-# git repo contains a lot of unrelated files
-RPI_WIFI_FIRMWARE_SITE = https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$(RPI_WIFI_FIRMWARE_VERSION)/brcm80211/brcm
+RPI_WIFI_FIRMWARE_VERSION = f0dc870f707118fa000f6ee47ec05e7eaa57b917
+RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 
-define RPI_WIFI_FIRMWARE_EXTRACT_CMDS
-	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
-endef
+# brcmfmac43430-sdio.bin and brcmfmac43455-sdio.bin come from linux-firmware
+RPI_WIFI_FIRMWARE_FILES = brcmfmac43430-sdio.txt brcmfmac43455-sdio.txt
 
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/$(RPI_WIFI_FIRMWARE_SOURCE) \
-		$(TARGET_DIR)/lib/firmware/brcm/$(RPI_WIFI_FIRMWARE_SOURCE)
+	for file in $(RPI_WIFI_FIRMWARE_FILES); do \
+		$(INSTALL) -D -m 0644 $(@D)/firmware/brcm/$${file} $(TARGET_DIR)/lib/firmware/brcm/$${file}; \
+	done
 endef
 
 $(eval $(generic-package))
-- 
2.16.2
