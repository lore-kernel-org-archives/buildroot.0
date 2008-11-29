From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Nov 2008 13:56:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081129215625.D168F3C674@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-11-29 13:56:25 -0800 (Sat, 29 Nov 2008)
New Revision: 24189

Log:
Update Linux versions

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-11-29 21:45:14 UTC (rev 24188)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-11-29 21:56:25 UTC (rev 24189)
@@ -32,7 +32,8 @@
 # --- These 'constants' requires regular maintenance, so put them first
 config BR2_KERNEL_PATCH_LEVEL
 	string
-	default "3" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "7" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "8" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -43,10 +44,11 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.26.3"
+	default "2.6.27.7"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.29" if BR2_LINUX_2_6_28
 	default "2.6.28" if BR2_LINUX_2_6_27
 	default "2.6.27" if BR2_LINUX_2_6_26
 	default "2.6.26" if BR2_LINUX_2_6_25
@@ -58,6 +60,7 @@
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.29" if BR2_LINUX_2_6_29
 	default "2.6.28" if BR2_LINUX_2_6_28
 	default "2.6.27" if BR2_LINUX_2_6_27
 	default "2.6.26" if BR2_LINUX_2_6_26
@@ -70,15 +73,15 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.27-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.28-rc6" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.27-rc4-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.28-rc6-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
-	default "2.6.27-rc1-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
 
 config BR2_KERNEL_SITE
 	string
@@ -136,10 +139,16 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.26.3)"
+	bool "The latest stable Linux kernel (2.6.27.7)"
 	help
-	  Linux 2.6.26.3
+	  Linux 2.6.27.7
 
+config BR2_LINUX_2_6_27
+	bool "Linux 2.6.27"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.27
+
 config BR2_LINUX_2_6_26
 	bool "Linux 2.6.26"
 	select BR2_KERNEL_BASE
@@ -207,18 +216,18 @@
 	help
 	  Linux 2.6.20
 
-config BR2_LINUX_2_6_27
-	bool "Linux 2.6.27"
-	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.27
-
 config BR2_LINUX_2_6_28
 	bool "Linux 2.6.28"
 	select BR2_KERNEL_BASE
 	help
 	  Linux 2.6.28
 
+config BR2_LINUX_2_6_29
+	bool "Linux 2.6.29"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.29
+
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 	help

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-29 21:45:14 UTC (rev 24188)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-29 21:56:25 UTC (rev 24189)
@@ -300,6 +300,7 @@
 KERNEL_EXTRA_VERSION:=$(strip $(subst ",,$(BR2_EXTRA_VERSION)))
 #"))
 
+lxcf:	$(LINUX26_DIR)/.config
 
 $(LINUX26_DIR)/.config:	$(LINUX26_DIR)/.patched.board
 ifeq ($(BR2_PACKAGE_LINUX_USE_DEFCONFIG),y)
@@ -314,6 +315,7 @@
 		cp -dpf $(LINUX26_KCONFIG) $@ ; \
 	fi
 	# Try to get a config for this linux version in the board directory
+	echo "LINUX26_VERSION = $(LINUX26_VERSION)"
 	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
 	    if [ -f "$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config" ] ; then \
 		cp -dpf $(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config $@ ; \
