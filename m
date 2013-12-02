From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 21:49:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: only install one
	firmware file
In-Reply-To: <cover.1386017298.git.yann.morin.1998@free.fr>
References: <cover.1386017298.git.yann.morin.1998@free.fr>
Message-ID: <631bcb8e1ae930cb7502e1f2840f045bfea776da.1386017298.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since only one firmware is used to boot the Raspberry Pi, there is no
reason to install all of them.

Add an option to select what firmware to install.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpi-firmware/Config.in       | 39 ++++++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk |  8 ++------
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index eb10a8a..cd45be4 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -7,3 +7,42 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 	  https://github.com/raspberrypi/firmware
 
+if BR2_PACKAGE_RPI_FIRMWARE
+
+choice
+	bool "Firmware to boot"
+	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	help
+	  There are three different firmware files:
+	    - the default firmware, that enables standard GPU features;
+	    - the extended firmware, that enables additional GPU features
+	      (eg. more audio/video codecs);
+	    - the cut-down firmware, for emergency situations, with only
+	      features required to boot a Linux kernel.
+
+config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	bool "default"
+	help
+	  The default firmware, that enables standard GPU features.
+
+config BR2_PACKAGE_RPI_FIRMWARE_X
+	bool "extended ('x', more codecs)"
+	help
+	  The extended firmware, that enables additional GPU features
+	  (eg. more audio/video codecs).
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
+	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
+	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
+
+endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f0882d4..25eab69 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -11,12 +11,8 @@ RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(BINARIES_DIR)/rpi-firmware/start_cd.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/start_x.elf $(BINARIES_DIR)/rpi-firmware/start_x.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_x.dat $(BINARIES_DIR)/rpi-firmware/fixup_x.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 endef
-- 
1.8.1.2
