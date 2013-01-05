From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  5 Jan 2013 15:10:54 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introducing a package to install pre-built binaries for the bootloader and the
GPU firmware for the RaspberryPi board.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in          |    1 +
 package/rpi-fw/Config.in   |    9 +++++++++
 package/rpi-fw/cmdline.txt |    1 +
 package/rpi-fw/config.txt  |    7 +++++++
 package/rpi-fw/rpi-fw.mk   |   22 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/rpi-fw/Config.in
 create mode 100644 package/rpi-fw/cmdline.txt
 create mode 100644 package/rpi-fw/config.txt
 create mode 100644 package/rpi-fw/rpi-fw.mk

diff --git a/package/Config.in b/package/Config.in
index 604ed1b..e21045f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -253,6 +253,7 @@ source "package/owl-linux/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
+source "package/rpi-fw/Config.in"
 source "package/read-edid/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sane-backends/Config.in"
diff --git a/package/rpi-fw/Config.in b/package/rpi-fw/Config.in
new file mode 100644
index 0000000..4b5a1e8
--- /dev/null
+++ b/package/rpi-fw/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RPI_FW
+	bool "RaspberryPi Firmware"
+	depends on BR2_arm
+	help
+	  RaspberryPi Firmware
+	  Pre-compiled binaries of the current bootloader and GPU firmware
+
+	  https://github.com/raspberrypi/firmware
+
diff --git a/package/rpi-fw/cmdline.txt b/package/rpi-fw/cmdline.txt
new file mode 100644
index 0000000..010ee3f
--- /dev/null
+++ b/package/rpi-fw/cmdline.txt
@@ -0,0 +1 @@
+dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
diff --git a/package/rpi-fw/config.txt b/package/rpi-fw/config.txt
new file mode 100644
index 0000000..ab9f7ff
--- /dev/null
+++ b/package/rpi-fw/config.txt
@@ -0,0 +1,7 @@
+arm_freq=700
+core_freq=250
+disable_overscan=1
+gpu_mem_256=100
+gpu_mem_512=100
+sdram_freq=400
+over_voltage=0
diff --git a/package/rpi-fw/rpi-fw.mk b/package/rpi-fw/rpi-fw.mk
new file mode 100644
index 0000000..e7b8674
--- /dev/null
+++ b/package/rpi-fw/rpi-fw.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# rpi-fw
+#
+#############################################################
+RPI_FW_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
+RPI_FW_SITE = http://github.com/raspberrypi/firmware/tarball/master
+RPI_FW_LICENSE = FOSS
+RPI_FW_LICENSE_FILE = LICENCE.broadcom
+RPI_FW_INSTALL_STAGING = NO
+
+define RPI_FW_INSTALL_TARGET_CMDS
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
