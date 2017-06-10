From: Jens Maus <mail@jens-maus.de>
Date: Sat, 10 Jun 2017 09:00:50 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpi-firmware: updated to 4.9.31
	firmware (ca9116f)
Message-ID: <20170610070050.20782-1-mail@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the rpi-firmware package to the latest 4.9.31
compatible commit (ca9116ffd0cea06fdeb876ac7d19790bf2631d8c) and
uses a for() to install DTS files in case BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
is used.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 11655eef3..80cbf7d3b 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 84f44265c7e9bfe3e54a326b95ea7067870cfe08a9aae12f00aec8d47f6fc353 rpi-firmware-4b24a81a2ce94afd4458d1af4ea1e73d58e69848.tar.gz
+sha256 c88c6fbec9a38a12a51724cb65fbf176fc127a82ba9ad797fbd81868a0749fd3 rpi-firmware-ca9116ffd0cea06fdeb876ac7d19790bf2631d8c.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 134fcebb5..4c3d37375 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 4b24a81a2ce94afd4458d1af4ea1e73d58e69848
+RPI_FIRMWARE_VERSION = ca9116ffd0cea06fdeb876ac7d19790bf2631d8c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -12,10 +12,9 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2710-rpi-3-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2710-rpi-3-b.dtb
+	for dtb in $(@D)/boot/*.dtb; do \
+		$(INSTALL) -D -m 0644 $${dtb} $(BINARIES_DIR)/rpi-firmware/$${dtb##*/} || exit 1; \
+	done
 endef
 endif
 
-- 
2.11.0
