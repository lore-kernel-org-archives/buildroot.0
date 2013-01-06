From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 23:01:50 +0100
Subject: [Buildroot] [git commit] rpi-firmware: New package
Message-ID: <20130106221239.2F44D9A5E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f511fe31229ab9fd2182aa0ebda0ecf205ab12b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introducing a package to install pre-built binaries for the bootloader and
the GPU firmware for the RaspberryPi board.

[Peter: rename to rpi-firmware, add link to http://elinux.org/RPiconfig]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/rpi-firmware/Config.in       |    9 +++++++++
 package/rpi-firmware/config.txt      |   14 ++++++++++++++
 package/rpi-firmware/rpi-firmware.mk |   21 +++++++++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 69bc254..11e6f3a 100644
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
index 0000000..eb10a8a
--- /dev/null
+++ b/package/rpi-firmware/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RPI_FIRMWARE
+	bool "rpi-firmware"
+	depends on BR2_arm
+	help
+	  RaspberryPi Firmware
+	  Pre-compiled binaries of the current bootloader and GPU firmware
+
+	  https://github.com/raspberrypi/firmware
+
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
new file mode 100644
index 0000000..2cabd68
--- /dev/null
+++ b/package/rpi-firmware/config.txt
@@ -0,0 +1,14 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using a post-build script.
+# See http://buildroot.org/downloads/manual/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
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
index 0000000..5a65e34
--- /dev/null
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# rpi-firmware
+#
+#############################################################
+
+RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
+RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
+RPI_FIRMWARE_LICENSE = BSD-3c
+RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom
+
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
+	$(INSTALL) -D -m 0644 $(@D)/boot/start.elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf $(BINARIES_DIR)/rpi-firmware/start_cd.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
+	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+
+$(eval $(generic-package))
