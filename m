From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  7 Jun 2013 00:23:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: update
In-Reply-To: <cover.1370557253.git.yann.morin.1998@free.fr>
References: <cover.1370557253.git.yann.morin.1998@free.fr>
Message-ID: <befcfb0a8116543c85dab87238f0048c918f795e.1370557253.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Updating brings in a new bootloader that enables more free codecs:
    MJPEG, VP6, VP8, Ogg Theora and Ogg Vorbis

Also, the command-line definition has moved to its own file, now.
Although the legacy 'cmdline' variable seems to still be supported
for a little while, better switch now than forget when we upgrade
later.

Update the RPi board readme accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/cmdline.txt     | 1 +
 package/rpi-firmware/config.txt      | 1 -
 package/rpi-firmware/rpi-firmware.mk | 5 ++++-
 3 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/rpi-firmware/cmdline.txt

diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
new file mode 100644
index 0000000..061e54b
--- /dev/null
+++ b/package/rpi-firmware/cmdline.txt
@@ -0,0 +1 @@
+dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index a818762..994972b 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -12,4 +12,3 @@ gpu_mem_256=100
 gpu_mem_512=100
 sdram_freq=400
 over_voltage=0
-cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait"
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ba0e04a..391a418 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
+RPI_FIRMWARE_VERSION = 06f6c909e285beceeb7e51f71ba6ffe754f073e8
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -13,9 +13,12 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(BINARIES_DIR)/rpi-firmware/start_cd.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/start_x.elf $(BINARIES_DIR)/rpi-firmware/start_x.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_x.dat $(BINARIES_DIR)/rpi-firmware/fixup_x.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.2
