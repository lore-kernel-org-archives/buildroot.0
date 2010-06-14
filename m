From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: re-add infrastructure
	to specify custom tarball
Message-ID: <20100614203437.A33B380E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f15702a97f2c614840b687cae80df127433d1b44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bootloader being very specific to the hardware, being able to
build U-Boot from an arbitrary tarball available on the web might be
needed.

Therefore, for U-Boot, we provide two methods :

 * Get a given stable version from U-Boot official FTP server

 * Get an arbitrary tarball

This should hopefully satisfy most needs, without complicating too
much the U-Boot build procedure on Buildroot side.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |   11 +++++++++++
 boot/u-boot/u-boot.mk |   16 ++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index a4f5fd9..79c5c3d 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -25,13 +25,24 @@ config BR2_TARGET_UBOOT_2009_11
 config BR2_TARGET_UBOOT_2009_08
 	bool "u-boot-2009.08"
 
+config BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
+if BR2_TARGET_UBOOT_CUSTOM_TARBALL
+
+config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
+	string "URL of custom U-Boot tarball"
+
+endif
+
 config BR2_UBOOT_VERSION
 	string
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
+	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 90a45b8..ee56611 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -14,9 +14,17 @@ ifeq ($(U_BOOT_VERSION),)
 U_BOOT_VERSION=2010.03
 endif
 
+ifeq ($(U_BOOT_VERSION),custom)
+# Handle custom U-Boot tarballs as specified by the configuration
+U_BOOT_TARBALL=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
+U_BOOT_SITE:=$(dir $(U_BOOT_TARBALL))
+U_BOOT_SOURCE:=$(notdir $(U_BOOT_TARBALL))
+else
+# Handle stable official U-Boot versions
+U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
+endif
 
-U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
@@ -51,9 +59,9 @@ $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(call DOWNLOAD,$(U_BOOT_SITE),$(U_BOOT_SOURCE))
 
 $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
-	$(U_BOOT_CAT) $(DL_DIR)/$(U_BOOT_SOURCE) \
-		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	mkdir -p $(U_BOOT_DIR)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(U_BOOT_SOURCE))) $(DL_DIR)/$(U_BOOT_SOURCE) \
+		| tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
-- 
1.7.1
