From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:15 +0200
Subject: [Buildroot] [PATCH 24/28] Improve TARGETS handling for bootloaders
	and kernel
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <85fcbcf2b1accc07759fdc51446c2dcb581e3fd0.1309895466.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the kernel and bootloaders do not use the normal BR2_PACKAGE_*
Kconfig options, their target name was not automatically added to the
global TARGETS variable. Each bootloader .mk and the linux.mk had to
add their own target manually to TARGETS, and the package
infrastructure was making tests on non-existing Kconfig variables.

This commit improves the package infrastructure so that it looks at
BR2_PACKAGE_<pkg> for packages, BR2_BOOT_<pkg> for bootloaders and at
the special BR2_LINUX_KERNEL for the linux package.

This allows to simplify a little bit the bootloaders and linux .mk
files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk         |    8 --------
 boot/at91dataflashboot/at91dataflashboot.mk |    9 ---------
 boot/barebox/barebox.mk                     |    2 --
 boot/grub/grub.mk                           |    9 ---------
 boot/syslinux/syslinux.mk                   |    9 ---------
 boot/u-boot/u-boot.mk                       |    2 --
 linux/linux.mk                              |    5 -----
 package/Makefile.package.in                 |   16 +++++++++++++---
 8 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 46627de..1750557 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -31,19 +31,11 @@ endef
 
 $(eval $(call GENTARGETS,boot,at91bootstrap))
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
 ifeq ($(BR2_BOOT_AT91BOOTSTRAP),y)
-TARGETS+=at91bootstrap
-
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(AT91BOOTSTRAP_BOARD),)
 $(error No AT91Bootstrap board name set. Check your BR2_BOOT_AT91BOOTSTRAP_BOARD setting)
 endif
 endif
-
 endif
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index fb698ce..769542c 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -20,12 +20,3 @@ define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
 endef
 
 $(eval $(call GENTARGETS,boot,at91dataflashboot))
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_BOOT_AT91DATAFLASHBOOT),y)
-TARGETS+=at91dataflashboot
-endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index b844d43..2745213 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -54,8 +54,6 @@ endif
 $(eval $(call GENTARGETS,boot,barebox))
 
 ifeq ($(BR2_BOOT_BAREBOX),y)
-TARGETS+=barebox
-
 # we NEED a board defconfig file unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 93238cb..aed89d0 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -83,12 +83,3 @@ define GRUB_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call AUTOTARGETS,boot,grub))
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_BOOT_GRUB),y)
-TARGETS+=grub
-endif
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 1f50ed5..be1f0ca 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -27,12 +27,3 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 endef
 
 $(eval $(call GENTARGETS,boot,syslinux))
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_BOOT_SYSLINUX),y)
-TARGETS+=syslinux
-endif
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index d6fb881..97d7921 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -117,12 +117,10 @@ $(eval $(call GENTARGETS,boot,u-boot))
 #
 #############################################################
 ifeq ($(BR2_BOOT_U_BOOT),y)
-TARGETS+=u-boot
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(U_BOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_BOOT_U_BOOT_BOARDNAME setting)
 endif
 endif
-
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index e3a485e..0012ca9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -197,11 +197,6 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
-
-ifeq ($(BR2_LINUX_KERNEL),y)
-TARGETS+=linux
-endif
-
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 0236024..cfb5cb4 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -522,10 +522,20 @@ $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
+# Compute the name of the Kconfig option that correspond to the
+# package being enabled. We handle three cases: the special Linux
+# kernel case, the bootloaders case, and the normal packages case.
+ifeq ($(1),linux)
+$(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
+else ifeq ($(4),boot)
+$(2)_KCONFIG_VAR = BR2_BOOT_$(2)
+else
+$(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
+endif
+
 # add package to the general list of targets if requested by the buildroot
 # configuration
-
-ifeq ($$(BR2_PACKAGE_$(2)),y)
+ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 TARGETS += $(1)
 
@@ -537,7 +547,7 @@ else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
 endif # SITE_METHOD
 
-endif # BR2_PACKAGE_$(2)
+endif # $(2)_KCONFIG_VAR
 endef # GENTARGETS_INNER
 
 ################################################################################
-- 
1.7.4.1
