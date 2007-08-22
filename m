From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 22 Aug 2007 14:53:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91bootstrap u-boot
Message-ID: <20070822215314.3968AA611E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-22 14:53:13 -0700 (Wed, 22 Aug 2007)
New Revision: 19662

Log:
bzcat => $(BZCAT) for u-boot and at91bootstrap

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-22 21:47:56 UTC (rev 19661)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-22 21:53:13 UTC (rev 19662)
@@ -14,7 +14,7 @@
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP)))
 #"))
-AT91BOOTSTRAP_ZCAT:=bzcat
+AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
 AT91BOOTSTRAP_MEMORY:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
 #"))
@@ -24,7 +24,9 @@
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
 AT91BOOTSTRAP_JUMP_ADDR:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_JUMP_ADDR)))
+#"))
 AT91BOOTSTRAP_IMG_SIZE:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
+#"))
 
 AT91_CUSTOM_FLAGS:=
 ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
@@ -43,8 +45,6 @@
 	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
-atbu: $(AT91BOOTSTRAP_DIR)/.unpacked
-
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
 	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
@@ -71,6 +71,8 @@
 
 at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 
+at91bootstrap-unpacked: $(AT91BOOTSTRAP_DIR)/.unpacked
+
 .PHONY: at91bootstrap-clean at91bootstrap-dirclean
 
 at91bootstrap-clean:

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-22 21:47:56 UTC (rev 19661)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-22 21:53:13 UTC (rev 19662)
@@ -17,7 +17,7 @@
 #UBOOT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/u-boot
 UBOOT_SITE:=$(ATMEL_MIRROR)/Source
 UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)/Source
-UBOOT_CAT:=bzcat
+UBOOT_CAT:=$(BZCAT)
 UBOOT_PATCH_SOURCE:=u-boot-1.2.0-atmel-patch.tar.bz2
 
 MKIMAGE_BINLOC:=$(UBOOT_BUILD_DIR)/tools/mkimage
