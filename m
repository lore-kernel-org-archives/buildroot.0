From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 14 Nov 2008 08:54:58 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable patching
Message-ID: <200811140854.58814.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches in target/u-boot/ can conflict with custom board specific
patches, so this option is necessary.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 target/u-boot/Config.in   |    8 ++++++++
 target/u-boot/Makefile.in |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 8159485..84b2ef5 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -12,6 +12,14 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
 
+config BR2_TARGET_UBOOT_DISABLE_GENERAL_PATCHES
+	bool "disable general patches"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Select this option to disable patching U-Boot with the patches from
+	  target/u-boot/. This can be necessary if they conflict with your
+	  custom patch.
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
 	depends on BR2_TARGET_UBOOT
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 4df575a..0ea4b75 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -46,9 +46,11 @@ $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
+ifneq ($(strip $(BR2_TARGET_UBOOT_DISABLE_GENERAL_PATCHES)),y)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/ \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
+endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	@mkdir -p $(U_BOOT_PATCH_DIR)
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
-- 
1.6.0.4.620.g87fa
