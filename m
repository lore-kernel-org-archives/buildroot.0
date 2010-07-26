From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Jul 2010 16:14:41 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: add Marvell u-boot.kwb
	support
Message-ID: <20100726141846.1699E8262B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3cd5174ed796400a9566c0ea52f3551cba52bfe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Marvell boards like the sheevaplug needs a special .kwb image format,
so add an option for it similar to how we handle zImage/uImage/..
for the kernel.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/Config.in |   12 ++++++++++++
 boot/u-boot/u-boot.mk |    8 +++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index d445145..ce79a8a 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -57,6 +57,18 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+choice
+	prompt "U-Boot binary format"
+
+config BR2_TARGET_UBOOT_FORMAT_BIN
+	bool "u-boot.bin"
+
+config BR2_TARGET_UBOOT_FORMAT_KWB
+	depends on BR2_arm
+	bool "u-boot.kwb (Marvell)"
+
+endchoice
+
 config BR2_TARGET_UBOOT_TOOL_MKIMAGE
 	bool "mkimage tool in target"
 	help
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index c21166f..60a4676 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -27,7 +27,13 @@ endif
 
 U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_CAT:=$(BZCAT)
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+U_BOOT_BIN:=u-boot.kwb
+U_BOOT_MAKE_OPT:=$(U_BOOT_BIN)
+else
 U_BOOT_BIN:=u-boot.bin
+endif
 
 MKIMAGE:=$(HOST_DIR)/usr/bin/mkimage
 
@@ -124,7 +130,7 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
-		 -C $(U_BOOT_DIR)
+		$(U_BOOT_MAKE_OPT) -C $(U_BOOT_DIR)
 
 # Copy the result to the images/ directory
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
-- 
1.7.1
