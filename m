From: James Hebden <james@hebden.net.au>
Date: Fri, 13 Feb 2015 20:55:13 +1100
Subject: [Buildroot] [PATCH 1/1] Bump rpi-firmware version for RPi2
In-Reply-To: <1423820943-32256-1-git-send-email-james@hebden.net.au>
References: <1423820943-32256-1-git-send-email-james@hebden.net.au>
Message-ID: <54DDCA01.7050709@hebden.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


From: James Hebden <james@hebden.net.au>

Signed-off-by: James Hebden <james@hebden.net.au>

This patch bumps the rpi-firmware package to include RPi2 support. It also removes the workaround previously required when installing DTBs for the pi, as they are now in the same branch as the latest firmware.
It also adds the install commands to install the DTB for BCM2709 (RPi2 B)

---
  package/rpi-firmware/rpi-firmware.mk | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 03178d5..a343cbe 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
  #
  ################################################################################

-RPI_FIRMWARE_VERSION = 393dcc0e76f18f6ac1b67ba45d36058410670034
+RPI_FIRMWARE_VERSION = 47bd0f0f46bc053d8e21655e3a69c4a73ae19b41
  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
  RPI_FIRMWARE_LICENSE = BSD-3c
  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -13,13 +13,10 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES

  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
  RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
-# The Device Tree blobs are not yet in the master branch of the
-# raspberrypi firmware project, so we have to use a separate branch
-# for now.
-RPI_FIRMWARE_VERSION = 09627457b9e15bf4ea4e6751d3c173a3fb65df07
  define RPI_FIRMWARE_INSTALL_DTB
  	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
  	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
+	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
  	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
  		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
  	done
-- 
2.1.4
