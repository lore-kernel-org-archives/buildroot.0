From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:47:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20061117114704.778C848612@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:47:04 -0800 (Fri, 17 Nov 2006)
New Revision: 16554

Log:
- also allow grub for x86_64
- bump version


Modified:
   trunk/buildroot/target/x86/grub/Config.in
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/Config.in
===================================================================
--- trunk/buildroot/target/x86/grub/Config.in	2006-11-17 11:37:47 UTC (rev 16553)
+++ trunk/buildroot/target/x86/grub/Config.in	2006-11-17 11:47:04 UTC (rev 16554)
@@ -1,7 +1,7 @@
 config BR2_TARGET_GRUB
 	bool "grub"
 	default n
-	depends on BR2_i386
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  The GRand Unified Bootloader for x86 systems.
 

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2006-11-17 11:37:47 UTC (rev 16553)
+++ trunk/buildroot/target/x86/grub/grub.mk	2006-11-17 11:47:04 UTC (rev 16554)
@@ -1,20 +1,38 @@
+GRUB_SUPPORTED_ARCH=n
 ifeq ($(ARCH),i386)
+GRUB_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i486)
+GRUB_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i586)
+GRUB_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i686)
+GRUB_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),x86_64)
+GRUB_SUPPORTED_ARCH=y
+endif
+ifeq ($(GRUB_SUPPORTED_ARCH),y)
 #############################################################
 #
 # grub
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH=grub_0.97-5.diff.gz
+GRUB_PATCH=grub_0.97-18.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub
 GRUB_TARGET_BINARY:=bin/grub
 
+GRUB_TARGET_FILES:=
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 GRUB_CONFIGURE_ARGS+=--enable-graphics
-GRUB_SPLASHIMAGE=splash.xpm.gz
+GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
+GRUB_TARGET_FILES+=$(GRUB_SPLASHIMAGE)
 endif
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
 
@@ -56,7 +74,11 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
 
 grub-target_binary: $(GRUB_DIR)/$(GRUB_BINARY)
+	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/sbin/
+	test -d $(TARGET_DIR)/boot/grub || mkdir -p $(TARGET_DIR)/boot/grub
+	cp $(GRUB_DIR)/stage1/stage1 $(GRUB_DIR)/stage2/*1_5 $(GRUB_DIR)/stage2/stage2 $(TARGET_DIR)/boot/grub/
 
+
 grub: grub-target_binary
 
 grub-clean:
