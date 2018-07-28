From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:11:52 +0200
Subject: [Buildroot] [PATCH] uboot: add option to depend on host-lzop
Message-ID: <20180728201152.5094-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some U-Boot configurations use lzop, which may not be available on the
build machine since it's not a mandatory dependency of Buildroot.

To solve this, a new option BR2_TARGET_UBOOT_NEEDS_LZOP is introduced,
and handled in a similar way to the existing
BR2_TARGET_UBOOT_NEEDS_OPENSSL option.

This fixes the build of the dra7xx_evm U-Boot defconfig as of U-Boot
2018.07, on a build machine without lzop installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8e369cec04..9e40c11fa1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -159,6 +159,14 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	  typically the case when the board configuration has
 	  CONFIG_FIT_SIGNATURE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_LZOP
+	bool "U-Boot needs lzop"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires lzop to be available on the host. This is typically
+	  the case when the board configuration has CONFIG_SPL_LZO
+	  enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 04c759be34..3e05f38046 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -152,6 +152,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
 UBOOT_DEPENDENCIES += host-openssl
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_LZOP),y)
+UBOOT_DEPENDENCIES += host-lzop
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.14.4
