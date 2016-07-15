From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 23:15:12 +0200
Subject: [Buildroot] [git commit] boot: add ts4800-mbrboot package
Message-ID: <20160715211559.5383182257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42ec02282225490257c1da26ec306198afe193c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This MBR routine is based on TS' original bootloader.  It is loaded by
the bootrom stored in the companion FPGA, and chainloads an executable
located at the beginning of the first non-fs (0xda) partition.

Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
[Thomas:
 - add hash file.
 - install image in INSTALL_IMAGES_CMDS instead of
   INSTALL_TARGET_CMDS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                          |  1 +
 boot/ts4800-mbrboot/Config.in           |  7 +++++++
 boot/ts4800-mbrboot/ts4800-mbrboot.hash |  2 ++
 boot/ts4800-mbrboot/ts4800-mbrboot.mk   | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)

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
index 0000000..7ed0b21
--- /dev/null
+++ b/boot/ts4800-mbrboot/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_TS4800_MBRBOOT
+	bool "ts4800-mbrboot"
+	depends on BR2_ARM_CPU_ARMV7A
+	help
+	  First level bootloader for TS4800 board
+
+	  https://github.com/embeddedarm/ts4800-mbrboot
diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.hash b/boot/ts4800-mbrboot/ts4800-mbrboot.hash
new file mode 100644
index 0000000..04e7072
--- /dev/null
+++ b/boot/ts4800-mbrboot/ts4800-mbrboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 617c70dcf50b7ad35ed3f40666ff2a9a654a5440b522ad73662abdf9f843cee9  ts4800-mbrboot-cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca.tar.gz
diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.mk b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
new file mode 100644
index 0000000..9862092
--- /dev/null
+++ b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
@@ -0,0 +1,21 @@
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
+TS4800_MBRBOOT_INSTALL_IMAGES = YES
+
+define TS4800_MBRBOOT_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define TS4800_MBRBOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/mbrboot.bin
+endef
+
+$(eval $(generic-package))
