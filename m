From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 16:13:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070819231307.E3573A5D35@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 16:13:06 -0700 (Sun, 19 Aug 2007)
New Revision: 19582

Log:
Add kernel patches, if at91 or avr32 is selected

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-19 22:57:25 UTC (rev 19581)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-19 23:13:06 UTC (rev 19582)
@@ -44,18 +44,20 @@
 
 LINUX26_COPYTO:=/tftpboot
 
+ifeq	($(DEFAULT_KERNEL_HEADERS),2.6.22.1)
+KERNEL_HEADERS_PATCH_DIR:=target/device/Atmel/linux/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
+else
 # Patch during kernel header build
 ifeq ($(BR2_avr32),y)
-LINUX26_KERNEL_PATCH_DIR:=target/device/Atmel/arch-avr32/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
+KERNEL_HEADERS_PATCH_DIR:=target/device/Atmel/arch-avr32/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
 endif
-
 # Patch during kernel build
 ifeq ($(BR2_arm),y)
 #LINUX26_PATCH_DIR:=target/device/Atmel/arch-at91/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
-LINUX26_KERNEL_PATCH_DIR:=target/device/Atmel/arch-at91/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
+KERNEL_HEADERS_PATCH_DIR:=target/device/Atmel/arch-arm/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
 endif
+endif
 
-
 # The board specific Makefile.in can redefine BOARD_NAME's
 LINUX_BOARD_NAME:=$(BOARD_NAME)
 UBOOT_BOARD_NAME:=$(BOARD_NAME)
@@ -98,6 +100,7 @@
 	@echo DOWNLOAD_LINUX26_VERSION=$(DOWNLOAD_LINUX26_VERSION)
 	@echo LINUX_SOURCE=$(LINUX_SOURCE)
 	@echo TARGETS=$(TARGETS)
+	@echo LINUX26_HEADERS_PATCH_DIR=$(LINUX26_HEADERS_PATCH_DIR)
 
 #TARGETS+=atmel_status
 endif
