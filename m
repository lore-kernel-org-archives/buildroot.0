From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:52:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080306185243.AAE5A1202C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:52:43 -0800 (Thu, 06 Mar 2008)
New Revision: 21253

Log:
added support for kernel 2.6.24

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-03-06 18:52:01 UTC (rev 21252)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-03-06 18:52:43 UTC (rev 21253)
@@ -40,7 +40,7 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.23.1"
+	default "2.6.24"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
@@ -51,6 +51,7 @@
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.24" if BR2_LINUX_2_6_24
 	default "2.6.23" if BR2_LINUX_2_6_23
 	default "2.6.22" if BR2_LINUX_2_6_22
 	default "2.6.21" if BR2_LINUX_2_6_21
@@ -58,15 +59,15 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.23" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.24" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_MM_VERSION
 	string
-	default "2.6.23-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.24-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.23-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.24-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config BR2_KERNEL_SITE
 	string
@@ -124,10 +125,16 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.23)"
+	bool "The latest stable Linux kernel (2.6.24)"
 	help
-	  Linux 2.6.23
+	  Linux 2.6.24
 
+config BR2_LINUX_2_6_24
+	bool "Linux 2.6.24"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.24
+
 config BR2_LINUX_2_6_23
 	bool "Linux 2.6.23"
 	select BR2_KERNEL_BASE

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-06 18:52:01 UTC (rev 21252)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-06 18:52:43 UTC (rev 21253)
@@ -91,7 +91,7 @@
 ifeq ($(BR2_i386),y)
 LINUX26_KCONFIG:=$(BOARD_PATH)/linux26.config
 else
-LINUX26_KCONFIG:=$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(LINUX26_VERSION).config
+LINUX26_KCONFIG:=$(BR2_BOARD_PATH)/linux-$(LINUX26_VERSION).config
 endif
 endif
 endif
@@ -139,15 +139,29 @@
 # --------------
 # BZIMAGE
 ifeq ($(LINUX26_FORMAT),bzImage)
-LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
-KERNEL_EXT:=.bz
+LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
+KERNEL_EXT:=
 endif
 
 endif
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
+ifeq ($(LINUX26_FORMAT),uImage)
+LINUX26_KERNEL_NAME:="uImage"
+endif
+ifeq ($(LINUX26_FORMAT),bzImage)
+LINUX26_KERNEL_NAME:="bzImage"
+endif
+ifeq ($(LINUX26_FORMAT),vmlinux)
+LINUX26_KERNEL_NAME:="vmlinux"
+endif
+ifeq ($(LINUX26_FORMAT),zImage)
+LINUX26_KERNEL_NAME:="zImage"
+endif
+ifeq ($(LINUX26_FORMAT),custom)
 LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+endif
 
 ifndef LINUX26_KERNEL
 LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
@@ -260,9 +274,7 @@
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif
 ifneq ($(LINUX26_PATCH_DIR),)
-	if [ -d $(LINUX26_PATCH_DIR) ] ; then \
-		toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) linux-$(LINUX26_VERSION)-\*.patch ; \
-	fi
+		toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) linux-$(LINUX26_VERSION)-\*.patch ; 
 endif
 	touch $@
 
