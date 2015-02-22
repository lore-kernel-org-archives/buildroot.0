From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 21:10:12 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version
In-Reply-To: <cover.1424635766.git.yann.morin.1998@free.fr>
References: <cover.1424635766.git.yann.morin.1998@free.fr>
Message-ID: <852fc99d65f5055e0b04ec84925bc1559fb0bfff.1424635766.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hebden <james@hebden.net.au>

Misc fixes and improvements for: DT; hdmi and EDID; video decoding,
latency and cropping; voltage calculations...

Also: support for RPi-2. :-)

Also remove the workaround previously required when installing DTBs, ad
they are now in the same branch as the latest firmware.

Signed-off-by: James Hebden <james@hebden.net.au>
Signed-off-by: "Guillermo A. Amaral" <g@maral.me>
[yann.morin.1998 at free.fr: further bump, fix and trim commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 03178d5..1db1f0e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,27 +4,22 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 393dcc0e76f18f6ac1b67ba45d36058410670034
+RPI_FIRMWARE_VERSION = 69b787b2cf9d1ba19bb018d74549699aeae075fb
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_TARGET = NO
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
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
 endef
-endif
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-- 
1.9.1
