From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 15 Jul 2016 11:00:59 -0400
Subject: [Buildroot] [PATCH v6 1/2] ts4800-mbrboot: new package
In-Reply-To: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1468594860-14932-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This MBR routine is based on TS' original bootloader.  It is loaded by
the bootrom stored in the companion FPGA, and chainloads an executable
located at the beginning of the first non-fs (0xda) partition.

Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
---
Changes v5->v6:
	- removed mbrboot source as it was published by Technologic System
Changes v4->v5 (after Peter Korsgaard's review):
	- remove the unnecessary section from output binary to fix build with
Linaro toolchain
	- cleanup Makefile

 package/Config.in                        |  1 +
 package/ts4800-mbrboot/Config.in         |  5 +++++
 package/ts4800-mbrboot/ts4800-mbrboot.mk | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/ts4800-mbrboot/Config.in
 create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk

diff --git a/package/Config.in b/package/Config.in
index 1910251..3c099c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
+	source "package/ts4800-mbrboot/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/ts4800-mbrboot/Config.in b/package/ts4800-mbrboot/Config.in
new file mode 100644
index 0000000..556b0ec
--- /dev/null
+++ b/package/ts4800-mbrboot/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TS4800_MBRBOOT
+	bool "ts4800-mbrboot"
+	depends on BR2_ARM_CPU_ARMV7A
+	help
+	  This package generate the ts4800 bootloader.
diff --git a/package/ts4800-mbrboot/ts4800-mbrboot.mk b/package/ts4800-mbrboot/ts4800-mbrboot.mk
new file mode 100644
index 0000000..825a66b
--- /dev/null
+++ b/package/ts4800-mbrboot/ts4800-mbrboot.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ts4800-mbrboot
+#
+################################################################################
+
+TS4800_MBRBOOT_VERSION = master
+TS4800_MBRBOOT_SITE = $(call github,embeddedarm,ts4800-mbrboot,$(TS4800_MBRBOOT_VERSION))
+TS4800_MBRBOOT_LICENSE = BSD-2c
+TS4800_MBRBOOT_LICENSE_FILES = LICENSE
+
+define TS4800_MBRBOOT_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define TS4800_MBRBOOT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/mbrboot.bin
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
