From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  5 Jan 2013 23:55:16 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-firmware: New package
In-Reply-To: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
References: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
Message-ID: <033a0b8264805de1fb670bf727c756b94d4eb34b.1357426077.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introducing a package to install pre-built binaries for the bootloader and the
GPU firmware for the RaspberryPi board.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                    |    1 +
 package/rpi-firmware/Config.in       |    9 +++++++++
 package/rpi-firmware/config.txt      |   13 +++++++++++++
 package/rpi-firmware/rpi-firmware.mk |   21 +++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/rpi-firmware/Config.in
 create mode 100644 package/rpi-firmware/config.txt
 create mode 100644 package/rpi-firmware/rpi-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 17205fe..30c39ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -202,6 +202,7 @@ menu "Hardware handling"
 menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"
+source "package/rpi-firmware/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
new file mode 100644
index 0000000..5723dea
--- /dev/null
+++ b/package/rpi-firmware/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RPI_FIRMWARE
+	bool "RaspberryPi Firmware"
+	depends on BR2_arm
+	help
+	  RaspberryPi Firmware
+	  Pre-compiled binaries of the current bootloader and GPU firmware
+
+	  https://github.com/raspberrypi/firmware
+
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
new file mode 100644
index 0000000..14d320d
--- /dev/null
+++ b/package/rpi-firmware/config.txt
@@ -0,0 +1,13 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using a post-build script.
+# See http://buildroot.uclibc.org/downloads/manual/manual.html#rootfs-custom 
+
+arm_freq=700
+core_freq=250
+disable_overscan=1
+gpu_mem_256=100
+gpu_mem_512=100
+sdram_freq=400
+over_voltage=0
+cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
new file mode 100644
index 0000000..74a7409
--- /dev/null
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# rpi-firmware
+#
+#############################################################
+RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
+RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
+RPI_FIRMWARE_LICENSE = BSD-3c
+RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom
+
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 package/rpi-fw/cmdline.txt $(TARGET_DIR)/boot/
+	$(INSTALL) -D -m 0644 package/rpi-fw/config.txt $(TARGET_DIR)/boot/
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
