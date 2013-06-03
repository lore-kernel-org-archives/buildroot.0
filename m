From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jun 2013 22:15:52 +0200
Subject: [Buildroot] [PATCH 6/6] package/rpi-firmware: update
In-Reply-To: <cover.1370289131.git.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <a72081fb5d6b38ae6a661e2777003e4dd109e18c.1370289131.git.yann.morin.1998@free.fr>
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
 board/raspberrypi/readme.txt         |  4 ++++
 package/rpi-firmware/Config.in       | 12 +++++++++++-
 package/rpi-firmware/cmdline.txt     |  1 +
 package/rpi-firmware/config.txt      |  1 -
 package/rpi-firmware/rpi-firmware.mk |  5 ++++-
 5 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 package/rpi-firmware/cmdline.txt

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 720a0ac..78d1910 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -34,6 +34,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware
     |?? +-- bootcode.bin
     |?? +-- config.txt
+    |?? +-- cmdline.txt
     |?? +-- fixup.dat
     |?? `-- start.elf
     `-- zImage
@@ -49,6 +50,7 @@ Your SDCard must have its first partition using fat32 and marked bootable.
 At the root of the partition, the RaspberryPi must find the following files:
 
  * bootcode.bin
+ * cmdline.txt
  * config.txt
  * fixup.dat
  * start.elf
@@ -78,6 +80,7 @@ After building, you should obtain this tree:
     +-- rootfs.tar
     +-- rpi-firmware
     |?? +-- bootcode.bin
+    |?? +-- cmdline.txt
     |?? +-- config.txt
     |?? +-- fixup.dat
     |?? `-- start.elf
@@ -97,6 +100,7 @@ The first partition will contain everything used to boot the RaspberryPi.
 You must copy theses files at the root of partition:
 
  * bootcode.bin
+ * cmdline.txt
  * config.txt
  * fixup.dat
  * start.elf
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 4573204..85a9478 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -13,8 +13,10 @@ choice
 	bool "Firmware to boot"
 	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
 	help
-	  There are two different firmware files:
+	  There are three different firmware files:
 	    - the default firmware, that enables standard GPU features;
+	    - the extended firmware, that enables additional GPU features
+	      (eg. more audio/video codecs);
 	    - the cut-down firmware, for emergency situations, with only
 	      features required to boot a Linux kernel.
 
@@ -23,6 +25,12 @@ config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
 	help
 	  The default firmware, that enables standard GPU features.
 
+config BR2_PACKAGE_RPI_FIRMWARE_X
+	bool "extended ('x', more codecs)"
+	help
+	  The extended firmware, that enables additional GPU features
+	  (eg. more audio/video codecs).
+
 config BR2_PACKAGE_RPI_FIRMWARE_CD
 	bool "cut-down ('cd', emergency)"
 	help
@@ -34,6 +42,7 @@ endchoice
 config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	string
 	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
 config BR2_PACKAGE_RPI_FIRMWARE_ALL
@@ -44,6 +53,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_ALL
 	  be installed, so you can later switch to an alternate firmware.
 	  The firmware files will be installed thusly:
 	    - the 'default'  will be denoted with '_default' in filenames
+	    - the 'extended' will be denoted with '_x'       in filenames
 	    - the 'cut-down' will be denoted with '_cd'      in filenames
 
 	  If you say 'n', then only the firmware you choose above will be
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
index ebcd753..32bc180 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
+RPI_FIRMWARE_VERSION = 57b604530d3c86edd5093d2a58c9d026fdfa7a7a
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -14,13 +14,16 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS_BASE
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 endef
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_ALL),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS_EXTRA
 	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start_default.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/start_x.elf $(BINARIES_DIR)/rpi-firmware/start_x.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(BINARIES_DIR)/rpi-firmware/start_cd.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup_default.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_x.dat $(BINARIES_DIR)/rpi-firmware/fixup_x.dat
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
 endef
 endif
-- 
1.8.1.2
