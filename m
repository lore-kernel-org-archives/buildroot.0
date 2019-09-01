From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 11:36:32 +0200
Subject: [Buildroot] [git commit] boot/ts4800-mrboot: remove package
Message-ID: <20190901093512.4F842888CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aba1d2dcb43d49e6d57bd1ac1cece02b0fc968ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the ts4800_defconfig has been removed, the ts4800-mrboot package
is no longer useful, therefore we drop it.

Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                        |  8 ++++++++
 boot/Config.in                          |  1 -
 boot/ts4800-mbrboot/Config.in           |  7 -------
 boot/ts4800-mbrboot/ts4800-mbrboot.hash |  2 --
 boot/ts4800-mbrboot/ts4800-mbrboot.mk   | 21 ---------------------
 5 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 190b98f5a5..83dce8b3c8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_TARGET_TS4800_MBRBOOT
+	bool "ts4800-mbrboot package was removed"
+	select BR2_LEGACY
+	help
+	  The defconfig for the TS4800 platform has been removed, so
+	  the ts4800-mbrboot package, containing the boot code for
+	  this specific platform has been removed as welL.
+
 config BR2_PACKAGE_LIBAMCODEC
 	bool "liamcodec package was removed"
 	select BR2_LEGACY
diff --git a/boot/Config.in b/boot/Config.in
index 97bd3de6e9..ac1a997f00 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,7 +19,6 @@ source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
-source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 
diff --git a/boot/ts4800-mbrboot/Config.in b/boot/ts4800-mbrboot/Config.in
deleted file mode 100644
index 7ed0b21382..0000000000
--- a/boot/ts4800-mbrboot/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_TARGET_TS4800_MBRBOOT
-	bool "ts4800-mbrboot"
-	depends on BR2_ARM_CPU_ARMV7A
-	help
-	  First level bootloader for TS4800 board
-
-	  https://github.com/embeddedarm/ts4800-mbrboot
diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.hash b/boot/ts4800-mbrboot/ts4800-mbrboot.hash
deleted file mode 100644
index 04e7072810..0000000000
--- a/boot/ts4800-mbrboot/ts4800-mbrboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 617c70dcf50b7ad35ed3f40666ff2a9a654a5440b522ad73662abdf9f843cee9  ts4800-mbrboot-cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca.tar.gz
diff --git a/boot/ts4800-mbrboot/ts4800-mbrboot.mk b/boot/ts4800-mbrboot/ts4800-mbrboot.mk
deleted file mode 100644
index 3dde6c6ab3..0000000000
--- a/boot/ts4800-mbrboot/ts4800-mbrboot.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# ts4800-mbrboot
-#
-################################################################################
-
-TS4800_MBRBOOT_VERSION = cf8f7072ed5a4a4e48fcb9841b2e31e519ec5dca
-TS4800_MBRBOOT_SITE = $(call github,embeddedarm,ts4800-mbrboot,$(TS4800_MBRBOOT_VERSION))
-TS4800_MBRBOOT_LICENSE = BSD-2-Clause
-TS4800_MBRBOOT_LICENSE_FILES = LICENSE
-TS4800_MBRBOOT_INSTALL_IMAGES = YES
-
-define TS4800_MBRBOOT_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define TS4800_MBRBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/mbrboot.bin $(BINARIES_DIR)/mbrboot.bin
-endef
-
-$(eval $(generic-package))
