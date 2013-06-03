From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jun 2013 22:15:51 +0200
Subject: [Buildroot] [PATCH 5/6] package/rpi-firmware: add options to select
	what firmware to install
In-Reply-To: <cover.1370289131.git.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <30f6d94a556efedb7d999a778bb6e32071efdda0.1370289131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add two options to rpi-firmware:
  - the first option to select the firmware being booted, amongst:
    - the default one
    - the cut-down one, for emergency
  - the second to also install all firmwares

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt         |  8 -------
 package/rpi-firmware/Config.in       | 45 ++++++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk | 20 ++++++++++++----
 3 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 3287795..720a0ac 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -34,9 +34,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware
     |?? +-- bootcode.bin
     |?? +-- config.txt
-    |?? +-- fixup_cd.dat
     |?? +-- fixup.dat
-    |?? +-- start_cd.elf
     |?? `-- start.elf
     `-- zImage
 
@@ -52,9 +50,7 @@ At the root of the partition, the RaspberryPi must find the following files:
 
  * bootcode.bin
  * config.txt
- * fixup_cd.dat
  * fixup.dat
- * start_cd.elf
  * start.elf
  * zImage
 
@@ -83,9 +79,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware
     |?? +-- bootcode.bin
     |?? +-- config.txt
-    |?? +-- fixup_cd.dat
     |?? +-- fixup.dat
-    |?? +-- start_cd.elf
     |?? `-- start.elf
     `-- zImage
 
@@ -104,9 +98,7 @@ You must copy theses files at the root of partition:
 
  * bootcode.bin
  * config.txt
- * fixup_cd.dat
  * fixup.dat
- * start_cd.elf
  * start.elf
  * zImage
 
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index eb10a8a..4573204 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -7,3 +7,48 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 	  https://github.com/raspberrypi/firmware
 
+if BR2_PACKAGE_RPI_FIRMWARE
+
+choice
+	bool "Firmware to boot"
+	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	help
+	  There are two different firmware files:
+	    - the default firmware, that enables standard GPU features;
+	    - the cut-down firmware, for emergency situations, with only
+	      features required to boot a Linux kernel.
+
+config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	bool "default"
+	help
+	  The default firmware, that enables standard GPU features.
+
+config BR2_PACKAGE_RPI_FIRMWARE_CD
+	bool "cut-down ('cd', emergency)"
+	help
+	  The cut-down firmware, for emergency situations, with only
+	  features required to boot a Linux kernel.
+
+endchoice
+
+config BR2_PACKAGE_RPI_FIRMWARE_BOOT
+	string
+	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
+
+config BR2_PACKAGE_RPI_FIRMWARE_ALL
+	bool "Install all firmwares"
+	default y
+	help
+	  If you say 'y' here (the default), then all firmware files will
+	  be installed, so you can later switch to an alternate firmware.
+	  The firmware files will be installed thusly:
+	    - the 'default'  will be denoted with '_default' in filenames
+	    - the 'cut-down' will be denoted with '_cd'      in filenames
+
+	  If you say 'n', then only the firmware you choose above will be
+	  installed.
+
+	  Unless you are sure about it, say 'y'.
+
+endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index dcda6b0..ebcd753 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -9,13 +9,25 @@ RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
-define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS_BASE
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_ALL),y)
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS_EXTRA
+	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start_default.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(BINARIES_DIR)/rpi-firmware/start_cd.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup_default.dat
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+endif
+
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+$(RPI_FIRMWARE_INSTALL_TARGET_CMDS_BASE)
+$(RPI_FIRMWARE_INSTALL_TARGET_CMDS_EXTRA)
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.2
