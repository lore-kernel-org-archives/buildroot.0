From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:35 +0200
Subject: [Buildroot] [PATCH 01/49] bootloaders: move bootloader build code
	to boot/
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <649b5b92509dba021ed47ef4c04f358de83ba36f.1276352307.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                          |    2 ++
 Makefile                                           |    3 ++-
 boot/Config.in                                     |   12 ++++++++++++
 .../device/Atmel => boot}/at91bootstrap/Config.in  |    5 ++---
 .../Atmel => boot}/at91bootstrap/at91bootstrap.mk  |    2 +-
 .../at91dataflashboot}/Config.in                   |    6 +++---
 .../at91dataflashboot/at91dataflashboot.mk         |    0
 boot/common.mk                                     |    1 +
 {target/x86 => boot}/grub/Config.in                |    0
 .../x86 => boot}/grub/grub.100-autoreconf.patch    |    0
 .../grub/grub.200-fix_mbr_handling.patch           |    0
 .../grub/grub.300-honor_UCLIBC_HAS_LFS.patch       |    0
 .../grub/grub.400-nic_update2.patch.bz2            |  Bin 328903 -> 328903 bytes
 {target/x86 => boot}/grub/grub.mk                  |    2 +-
 {target/x86 => boot}/grub/menu.lst                 |    0
 {target/x86 => boot}/grub/splash.xpm.gz            |  Bin 45185 -> 45185 bytes
 {target/x86 => boot}/grub2/Config.in               |    0
 .../grub2/grub-1.95-001-fix-grub-install.patch     |    0
 {target/x86 => boot}/grub2/grub2.mk                |    2 +-
 {target/x86 => boot}/syslinux/Config.in            |    0
 .../syslinux/syslinux-3.82-makefile.patch          |    0
 {target/x86 => boot}/syslinux/syslinux.mk          |    2 +-
 {target => boot}/u-boot/Config.in                  |    0
 {target => boot}/u-boot/Makefile.in                |    2 +-
 ...boot-2009.01-include_asm-avr32_io.h.patch.avr32 |    0
 {target/powerpc => boot}/yaboot/Config.in          |    0
 {target/powerpc => boot}/yaboot/yaboot.mk          |    0
 target/Config.in                                   |    9 ---------
 target/Makefile.in                                 |    8 --------
 target/device/Atmel/Config.in                      |    4 ----
 target/device/Atmel/Makefile.in                    |   12 ------------
 target/powerpc/Makefile.in                         |    1 -
 target/x86/Makefile.in                             |    3 ---
 33 files changed, 27 insertions(+), 49 deletions(-)
 create mode 100644 boot/Config.in
 rename {target/device/Atmel => boot}/at91bootstrap/Config.in (92%)
 rename {target/device/Atmel => boot}/at91bootstrap/at91bootstrap.mk (96%)
 rename {target/device/Atmel/DataFlashBoot => boot/at91dataflashboot}/Config.in (76%)
 rename target/device/Atmel/DataFlashBoot/DataflashBoot.mk => boot/at91dataflashboot/at91dataflashboot.mk (100%)
 create mode 100644 boot/common.mk
 rename {target/x86 => boot}/grub/Config.in (100%)
 rename {target/x86 => boot}/grub/grub.100-autoreconf.patch (100%)
 rename {target/x86 => boot}/grub/grub.200-fix_mbr_handling.patch (100%)
 rename {target/x86 => boot}/grub/grub.300-honor_UCLIBC_HAS_LFS.patch (100%)
 rename {target/x86 => boot}/grub/grub.400-nic_update2.patch.bz2 (100%)
 rename {target/x86 => boot}/grub/grub.mk (98%)
 rename {target/x86 => boot}/grub/menu.lst (100%)
 rename {target/x86 => boot}/grub/splash.xpm.gz (100%)
 rename {target/x86 => boot}/grub2/Config.in (100%)
 rename {target/x86 => boot}/grub2/grub-1.95-001-fix-grub-install.patch (100%)
 rename {target/x86 => boot}/grub2/grub2.mk (98%)
 rename {target/x86 => boot}/syslinux/Config.in (100%)
 rename {target/x86 => boot}/syslinux/syslinux-3.82-makefile.patch (100%)
 rename {target/x86 => boot}/syslinux/syslinux.mk (96%)
 rename {target => boot}/u-boot/Config.in (100%)
 rename {target => boot}/u-boot/Makefile.in (99%)
 rename {target => boot}/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 (100%)
 rename {target/powerpc => boot}/yaboot/Config.in (100%)
 rename {target/powerpc => boot}/yaboot/yaboot.mk (100%)
 delete mode 100644 target/powerpc/Makefile.in
 delete mode 100644 target/x86/Makefile.in

diff --git a/Config.in b/Config.in
index 435d4bd..f5eb859 100644
--- a/Config.in
+++ b/Config.in
@@ -293,4 +293,6 @@ source "package/Config.in"
 
 source "fs/Config.in"
 
+source "boot/Config.in"
+
 source "target/Config.in"
diff --git a/Makefile b/Makefile
index 68732fa..67e41ae 100644
--- a/Makefile
+++ b/Makefile
@@ -320,8 +320,9 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
-# target stuff is last so it can override anything else
+include boot/common.mk
 include target/Makefile.in
+include fs/common.mk
 
 TARGETS+=erase-fakeroots
 
diff --git a/boot/Config.in b/boot/Config.in
new file mode 100644
index 0000000..6f2796f
--- /dev/null
+++ b/boot/Config.in
@@ -0,0 +1,12 @@
+menu "Bootloaders"
+
+source "boot/grub/Config.in"
+source "boot/grub2/Config.in"
+source "boot/syslinux/Config.in"
+source "boot/yaboot/Config.in"
+source "boot/u-boot/Config.in"
+source "boot/at91bootstrap/Config.in"
+source "boot/at91dataflashboot/Config.in"
+
+endmenu
+
diff --git a/target/device/Atmel/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
similarity index 92%
rename from target/device/Atmel/at91bootstrap/Config.in
rename to boot/at91bootstrap/Config.in
index 91e0b08..44db8f5 100644
--- a/target/device/Atmel/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,7 +1,6 @@
 menuconfig BR2_TARGET_AT91BOOTSTRAP
-	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9260PF || \
-	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9G20DFC
-	bool "Build AT91 Bootstrap for selected chip"
+	depends on BR2_arm
+	bool "AT91 Bootstrap"
 
 if	BR2_TARGET_AT91BOOTSTRAP
 
diff --git a/target/device/Atmel/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
similarity index 96%
rename from target/device/Atmel/at91bootstrap/at91bootstrap.mk
rename to boot/at91bootstrap/at91bootstrap.mk
index f681fa9..2072c6b 100644
--- a/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -39,7 +39,7 @@ $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(BUILD_DIR)
 	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) boot/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
diff --git a/target/device/Atmel/DataFlashBoot/Config.in b/boot/at91dataflashboot/Config.in
similarity index 76%
rename from target/device/Atmel/DataFlashBoot/Config.in
rename to boot/at91dataflashboot/Config.in
index 1da5e62..c6711c4 100644
--- a/target/device/Atmel/DataFlashBoot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,6 +1,6 @@
-config BR2_TARGET_DATAFLASHBOOT
-       depends on BR2_TARGET_AT91RM9200 || BR2_TARGET_AT91SAM9261 || BR2_TARGET_AT91SAM9261S
-	bool "Build Dataflashboot for selected chip"
+menuconfig BR2_TARGET_DATAFLASHBOOT
+       depends on BR2_arm
+       bool "AT91 DataFlashBoot"
 
 choice
 	prompt "Target Architecture"
diff --git a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
similarity index 100%
rename from target/device/Atmel/DataFlashBoot/DataflashBoot.mk
rename to boot/at91dataflashboot/at91dataflashboot.mk
diff --git a/boot/common.mk b/boot/common.mk
new file mode 100644
index 0000000..dc0bfb4
--- /dev/null
+++ b/boot/common.mk
@@ -0,0 +1 @@
+include boot/*/*.mk
\ No newline at end of file
diff --git a/target/x86/grub/Config.in b/boot/grub/Config.in
similarity index 100%
rename from target/x86/grub/Config.in
rename to boot/grub/Config.in
diff --git a/target/x86/grub/grub.100-autoreconf.patch b/boot/grub/grub.100-autoreconf.patch
similarity index 100%
rename from target/x86/grub/grub.100-autoreconf.patch
rename to boot/grub/grub.100-autoreconf.patch
diff --git a/target/x86/grub/grub.200-fix_mbr_handling.patch b/boot/grub/grub.200-fix_mbr_handling.patch
similarity index 100%
rename from target/x86/grub/grub.200-fix_mbr_handling.patch
rename to boot/grub/grub.200-fix_mbr_handling.patch
diff --git a/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch b/boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
similarity index 100%
rename from target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
rename to boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
diff --git a/target/x86/grub/grub.mk b/boot/grub/grub.mk
similarity index 98%
rename from target/x86/grub/grub.mk
rename to boot/grub/grub.mk
index af46244..80f9b6d 100644
--- a/target/x86/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -75,7 +75,7 @@ $(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
 	for i in `grep -v "^#" $(GRUB_DIR)/debian/patches/00list`; do \
 		cat $(GRUB_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB_DIR); \
 	done
-	toolchain/patch-kernel.sh $(GRUB_DIR) target/x86/grub grub.\*.patch{,.bz2}
+	toolchain/patch-kernel.sh $(GRUB_DIR) boot/grub grub.\*.patch{,.bz2}
 	touch $@
 
 $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
diff --git a/target/x86/grub/menu.lst b/boot/grub/menu.lst
similarity index 100%
rename from target/x86/grub/menu.lst
rename to boot/grub/menu.lst
diff --git a/target/x86/grub2/Config.in b/boot/grub2/Config.in
similarity index 100%
rename from target/x86/grub2/Config.in
rename to boot/grub2/Config.in
diff --git a/target/x86/grub2/grub-1.95-001-fix-grub-install.patch b/boot/grub2/grub-1.95-001-fix-grub-install.patch
similarity index 100%
rename from target/x86/grub2/grub-1.95-001-fix-grub-install.patch
rename to boot/grub2/grub-1.95-001-fix-grub-install.patch
diff --git a/target/x86/grub2/grub2.mk b/boot/grub2/grub2.mk
similarity index 98%
rename from target/x86/grub2/grub2.mk
rename to boot/grub2/grub2.mk
index 46c6471..119397b 100644
--- a/target/x86/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -75,7 +75,7 @@ $(GRUB2_DIR)/.unpacked: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
 	for i in `grep -v "^#" $(GRUB2_DIR)/debian/patches/00list`; do \
 		cat $(GRUB2_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB2_DIR); \
 	done
-	toolchain/patch-kernel.sh $(GRUB2_DIR) target/x86/grub2 grub-\*.patch
+	toolchain/patch-kernel.sh $(GRUB2_DIR) boot/grub2 grub-\*.patch
 	touch $@
 
 $(GRUB2_DIR)/.configured: $(GRUB2_DIR)/.unpacked
diff --git a/target/x86/syslinux/Config.in b/boot/syslinux/Config.in
similarity index 100%
rename from target/x86/syslinux/Config.in
rename to boot/syslinux/Config.in
diff --git a/target/x86/syslinux/syslinux-3.82-makefile.patch b/boot/syslinux/syslinux-3.82-makefile.patch
similarity index 100%
rename from target/x86/syslinux/syslinux-3.82-makefile.patch
rename to boot/syslinux/syslinux-3.82-makefile.patch
diff --git a/target/x86/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
similarity index 96%
rename from target/x86/syslinux/syslinux.mk
rename to boot/syslinux/syslinux.mk
index 75d4ad4..df27b6d 100644
--- a/target/x86/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -38,7 +38,7 @@ syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
 
 $(SYSLINUX_DIR)/Makefile: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
 	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSLINUX_DIR) target/x86/syslinux/ \*.patch
+	toolchain/patch-kernel.sh $(SYSLINUX_DIR) boot/syslinux/ \*.patch
 	touch -c $@
 
 $(SYSLINUX_DIR)/isolinux.bin $(SYSLINUX_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/Makefile
diff --git a/target/u-boot/Config.in b/boot/u-boot/Config.in
similarity index 100%
rename from target/u-boot/Config.in
rename to boot/u-boot/Config.in
diff --git a/target/u-boot/Makefile.in b/boot/u-boot/Makefile.in
similarity index 99%
rename from target/u-boot/Makefile.in
rename to boot/u-boot/Makefile.in
index d1bb5e5..a875f2b 100644
--- a/target/u-boot/Makefile.in
+++ b/boot/u-boot/Makefile.in
@@ -70,7 +70,7 @@ $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot \
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) boot/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
 ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),)
diff --git a/target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 b/boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
similarity index 100%
rename from target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
rename to boot/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
diff --git a/target/powerpc/yaboot/Config.in b/boot/yaboot/Config.in
similarity index 100%
rename from target/powerpc/yaboot/Config.in
rename to boot/yaboot/Config.in
diff --git a/target/powerpc/yaboot/yaboot.mk b/boot/yaboot/yaboot.mk
similarity index 100%
rename from target/powerpc/yaboot/yaboot.mk
rename to boot/yaboot/yaboot.mk
diff --git a/target/Config.in b/target/Config.in
index 5d53635..2d96793 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -1,12 +1,3 @@
-menu "Bootloaders"
-
-source "target/x86/grub/Config.in"
-#source "target/x86/grub2/Config.in"
-source "target/x86/syslinux/Config.in"
-source "target/powerpc/yaboot/Config.in"
-source "target/u-boot/Config.in"
-endmenu
-
 menu "Kernel"
 choice
 	prompt "Kernel type"
diff --git a/target/Makefile.in b/target/Makefile.in
index ffcdbb6..8feb564 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -54,16 +54,8 @@ include target/generic/Makefile.in
 
 # this eventually adds the kernel target to TARGETS:
 include target/device/Makefile.in
-include target/x86/Makefile.in
-include target/powerpc/Makefile.in
 include target/xtensa/Makefile.in
 
-ifeq ($(BR2_TARGET_UBOOT),y)
-include target/u-boot/Makefile.in
-endif
-
-include fs/common.mk
-
 # kernel rules
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
diff --git a/target/device/Atmel/Config.in b/target/device/Atmel/Config.in
index 4e36b90..870c537 100644
--- a/target/device/Atmel/Config.in
+++ b/target/device/Atmel/Config.in
@@ -66,8 +66,4 @@ config BR2_BOARD_PATH
 
 endmenu
 
-source "target/device/Atmel/DataFlashBoot/Config.in"
-
-source "target/device/Atmel/at91bootstrap/Config.in"
-
 endif
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index c5dfffd..6de54d7 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -66,18 +66,6 @@ include target/device/Atmel/*/Makefile.in
 UBOOT_CONFIG:=$(UBOOT_BOARD_NAME)_config
 UBOOT_CONFIG_FILE:=$(BOARD_PATH)/u-boot/$(UBOOT_BOARD_NAME).h
 
-#ifeq ($(BR2_TARGET_UBOOT_AT91),y)
-#include $(ATMEL_PATH)/u-boot/u-boot.mk
-#endif
-
-ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
-include $(ATMEL_PATH)/DataFlashBoot/DataflashBoot.mk
-endif
-
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
-include $(ATMEL_PATH)/at91bootstrap/at91bootstrap.mk
-endif
-
 atmel_status:
 	@echo BUILD_DIR=$(BUILD_DIR)
 	@echo BOARD_NAME=$(BOARD_NAME)
diff --git a/target/powerpc/Makefile.in b/target/powerpc/Makefile.in
deleted file mode 100644
index 0d4698d..0000000
--- a/target/powerpc/Makefile.in
+++ /dev/null
@@ -1 +0,0 @@
-include target/powerpc/*/*.mk
diff --git a/target/x86/Makefile.in b/target/x86/Makefile.in
deleted file mode 100644
index 115035c..0000000
--- a/target/x86/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(BR2_i386),y)
-include target/x86/*/*.mk
-endif
-- 
1.7.0.4
