From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 15 Jul 2016 15:23:07 -0400
Subject: [Buildroot] [PATCH v7 1/2] boot: add ts4800-mbrboot package
In-Reply-To: <1468610588-9709-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468610588-9709-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1468610588-9709-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
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
Changes v6->v7:
	- moved package to boot/
Changes v5->v6:
	- removed mbrboot source as it was published by Technologic System
Changes v4->v5:
	- remove the unnecessary section from mbrboot binary to fix build
with Linaro toolchain
	- cleanup Makefile

 boot/Config.in                        |  1 +
 boot/ts4800-mbrboot/Config.in         |  7 +++++++
 boot/ts4800-mbrboot/ts4800-mbrboot.mk | 20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 boot/ts4800-mbrboot/Config.in
 create mode 100644 boot/ts4800-mbrboot/ts4800-mbrboot.mk

diff --git a/boot/Config.in b/boot/Config.in
index cd10cd8..677e5f0 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -13,6 +13,7 @@ source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
 
diff --git a/boot/ts4800-mbrboot/Config.in b/boot/ts4800-mbrboot/Config.in
new file mode 100644
index 0000000..b63e2fc
--- /dev/null
+++ b/boot/ts4800-mbrboot/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_TS4800_MBRBOOT
+	bool "ts4800-mbrboot"
+	depends on BR2_ARM_CPU_ARMV7A
+	help
+	  1st level bootloader for TS4800 board
+
+	  https://github.com/embeddedarm/ts4800-mbrboot
diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.mk b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
new file mode 100644
index 0000000..91649d6
--- /dev/null
+++ b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ts4800-mbrboot
+#
+################################################################################
+
+TS4800_MBRBOOT_VERSION = cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca
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
