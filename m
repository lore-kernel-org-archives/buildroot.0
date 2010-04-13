From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:23 +0200
Subject: [Buildroot] [PATCH 11/35] u-boot: simplify custom patch handling
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e709f11d7cd172d9ee4f9a8f474a26fb92b88f9.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |    9 ++++++---
 boot/u-boot/u-boot.mk |   10 ++--------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index a9698d1..6ec4061 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -35,10 +35,13 @@ config BR2_UBOOT_VERSION
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 
-config BR2_TARGET_UBOOT_CUSTOM_PATCH
-	string "custom patch"
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	string "custom patch dir"
 	help
-	  If your board requires a custom patch, add the path to the file here.
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named u-boot-<version>-<something>.patch.
+
 	  Most users may leave this empty
 
 choice
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 4edef12..efde3ea 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -9,7 +9,6 @@ U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
 U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
-U_BOOT_PATCH_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TARGET_BIN:=u-boot-$(U_BOOT_VERSION)-$(DATE).bin
@@ -69,13 +68,8 @@ $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) boot/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
-ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_ARCH_PATCH_DIR) \*.patch
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
-	@mkdir -p $(U_BOOT_PATCH_DIR)
-	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) \*.patch
+ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
 endif
 	touch $@
 
-- 
1.6.3.3
