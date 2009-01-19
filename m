From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 19 Jan 2009 21:27:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090119212705.D080A77182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-19 21:27:04 +0000 (Mon, 19 Jan 2009)
New Revision: 24912

Log:
Fix some bugs in advanced linux configuration, remove some arbitrary combinations of major/minor directly supported, general cleanup

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Config.in.versions
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-19 16:38:30 UTC (rev 24911)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-19 21:27:04 UTC (rev 24912)
@@ -28,13 +28,12 @@
 # BR2_LINUX_COPYTO_TFTPBOOT
 # BR2_LINUX_COPYTO
 #
-# ---------------------------------------------------------------------------
-# --- These 'constants' requires regular maintenance, so put them first
 
 source "target/linux/Config.in.versions"
 
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default $(BR2_KERNEL_LATEST_2_6_28) if BR2_LINUX_2_6_28 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_27) if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_26) if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_25) if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -72,7 +71,7 @@
 
 config BR2_KERNEL_SITE
 	string
-	default "http://ftp.kernel.org/pub/linux/kernel/v2.6/"
+	default "http://ftp.kernel.org/pub/linux/kernel/v2.6"
 
 config BR2_MM_PATCH_SITE
 	string
@@ -89,11 +88,15 @@
 
 config BR2_KERNEL_PATCH_SITE
 	string
-	default "http://ftp.kernel.org/pub/linux/kernel/v2.6/" if BR2_KERNEL_ADD_MINORPATCH
-	default "http://ftp.kernel.org/pub/linux/kernel/v2.6/testing/" if BR2_KERNEL_ADD_RC_PATCH || BR2_KERNEL_ADD_LATEST_RC_PATCH
-	default "http://ftp.kernel.org/pub/linux/kernel/v2.6/snapshots/" if BR2_KERNEL_ADD_SNAPSHOT || BR2_KERNEL_ADD_LATEST_SNAPSHOT
-	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if BR2_KERNEL_ADD_MM_PATCH || BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default $(BR2_CUSTOM_LINUX26_PATCH_SITE) if BR2_LINUX26_CUSTOM
+	default "$(BR2_KERNEL_SITE)" if 			BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "$(BR2_KERNEL_SITE)" if 			BR2_KERNEL_ADD_MINORPATCH
+	default "$(BR2_KERNEL_SITE)/testing" if 		BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "$(BR2_KERNEL_SITE)/testing" if 		BR2_KERNEL_ADD_RC_PATCH
+	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_SNAPSHOT
+	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_MM_PATCH
+	default $(BR2_CUSTOM_LINUX26_PATCH_SITE) if 		BR2_LINUX26_CUSTOM
 
 config BR2_LINUX26_RC_VERSION
 	string
@@ -124,7 +127,7 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.28)"
+	bool "The latest stable Linux kernel (2.6.28.1)"
 
 config BR2_LINUX_2_6_28
 	bool "Linux 2.6.28"
@@ -150,26 +153,10 @@
 	bool "Linux 2.6.23"
 	select BR2_KERNEL_BASE
 
-config BR2_LINUX_2_6_22_10
-	bool "Linux 2.6.22.10"
-	select BR2_KERNEL_PREPATCHED
-
-config BR2_LINUX_2_6_22_1
-	bool "Linux 2.6.22.1"
-	select BR2_KERNEL_PREPATCHED
-
 config BR2_LINUX_2_6_22
 	bool "Linux 2.6.22"
 	select BR2_KERNEL_BASE
 
-config BR2_LINUX_2_6_21_7
-	bool "Linux 2.6.21.7"
-	select BR2_KERNEL_PREPATCHED
-
-config BR2_LINUX_2_6_21_5
-	bool "Linux 2.6.21.5"
-	select BR2_KERNEL_PREPATCHED
-
 config BR2_LINUX_2_6_21
 	bool "Linux 2.6.21"
 	select BR2_KERNEL_BASE
@@ -190,28 +177,27 @@
 if BR2_LINUX26_CUSTOM
 config BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION
 	string "Linux Tarball version"
-	default "linux-2.6.22"
+	default "2.6.28"
 	help
 	  Specify any .tar.bz2 file
 
 config BR2_CUSTOM_LINUX26_VERSION
 	string "Linux Version"
-	default "linux-2.6.22-version"
+	default "2.6.29-rc2"
 	help
 	  Specify what the linux version will be called
 
 config BR2_CUSTOM_LINUX26_PATCH
 	string "patch name"
-	default "patch-2.6.22-rc6-mm1.bz2"
+	default "patch-2.6.29-rc2.bz2"
 	help
 	  Specify a patch to be downloaded
 
 config BR2_CUSTOM_LINUX26_PATCH_SITE
 	string "patch site"
-	default "http://"
+	default "http://www.kernel.org/pub/linux/kernel/v2.6/testing"
 	help
 	  Specify from where the patch will be downloaded.
-
 endif
 
 # -----------------------------------------------
@@ -292,17 +278,17 @@
 	depends on BR2_KERNEL_ADD_MINORPATCH
 
 config BR2_KERNEL_RC_LEVEL
-	string "-rc patch Level"
+	string "-rc patch level"
 	default ""
 	depends on BR2_KERNEL_ADD_RC_PATCH || BR2_KERNEL_ADD_SNAPSHOT
 
 config BR2_KERNEL_GIT_LEVEL
-	string "-git patch Level"
+	string "-git patch level"
 	default ""
 	depends on BR2_KERNEL_ADD_SNAPSHOT
 
 config BR2_KERNEL_MM_LEVEL
-	string "-mm patch Level"
+	string "-mm patch level"
 	default ""
 	depends on BR2_KERNEL_ADD_MM_PATCH
 
@@ -318,23 +304,27 @@
 
 config BR2_KERNEL_PATCH
 	string
-	default "patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2" if BR2_KERNEL_ADD_MINORPATCH || BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "patch-$(LINUX26_LATEST_RC_VERSION).bz2" if BR2_KERNEL_ADD_LATEST_RC_PATCH
-	default "patch-$(BR2_LINUX26_RC_VERSION).bz2" if BR2_KERNEL_ADD_RC_PATCH
-	default "patch-$(LINUX26_LATEST_GIT_VERSION).bz2" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
-	default "patch-$(BR2_LINUX26_SNAPSHOT_VERSION).bz2" if BR2_KERNEL_ADD_SNAPSHOT
-	default "$(LINUX26_LATEST_MM_VERSION).bz2" if BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_LINUX26_MM_VERSION).bz2" if BR2_KERNEL_ADD_MM_PATCH
-	default $(BR2_CUSTOM_LINUX26_PATCH) if BR2_LINUX26_CUSTOM
+	default "patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2" if	BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2" if	BR2_KERNEL_ADD_MINORPATCH
+	default "patch-$(LINUX26_LATEST_RC_VERSION).bz2" if					BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "patch-$(BR2_LINUX26_RC_VERSION).bz2" if					BR2_KERNEL_ADD_RC_PATCH
+	default "patch-$(LINUX26_LATEST_GIT_VERSION).bz2" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "patch-$(BR2_LINUX26_SNAPSHOT_VERSION).bz2" if					BR2_KERNEL_ADD_SNAPSHOT
+	default "$(LINUX26_LATEST_MM_VERSION).bz2" if						BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "$(BR2_LINUX26_MM_VERSION).bz2"	if						BR2_KERNEL_ADD_MM_PATCH
+	default "$(BR2_CUSTOM_LINUX26_PATCH)" if						BR2_LINUX26_CUSTOM
 
 config BR2_EXTRA_VERSION
 	string
-	default ".$(BR2_KERNEL_PATCH_LEVEL)"	if  BR2_KERNEL_ADD_MINORPATCH || BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "$(BR2_KERNEL_RC_LEVEL)"	if BR2_KERNEL_ADD_LATEST_RC_PATCH
-	default "$(BR2_KERNEL_RC_LEVEL)"	if BR2_KERNEL_ADD_RC_PATCH
-	default "BR2_KERNEL_GIT_LEVEL"		if BR2_KERNEL_ADD_LATEST_SNAPSHOT
-	default	"$(BR2_KERNEL_MM_LEVEL)"	if BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default	"$(BR2_KERNEL_MM_LEVEL)"	if BR2_KERNEL_ADD_MM_PATCH
+	default ".$(BR2_KERNEL_PATCH_LEVEL)" if					BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default ".$(BR2_KERNEL_PATCH_LEVEL)" if					BR2_KERNEL_ADD_MINORPATCH
+	default "$(BR2_KERNEL_RC_LEVEL)" if					BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "$(BR2_KERNEL_RC_LEVEL)" if					BR2_KERNEL_ADD_RC_PATCH
+	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_SNAPSHOT
+	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_MM_PATCH
+	default	"$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
 endmenu
 
 # -----------------------------------------------
@@ -350,31 +340,24 @@
 
 config BR2_DOWNLOAD_LINUX26_VERSION
 	string
-	default "$(BR2_KERNEL_THIS_VERSION)" if BR2_KERNEL_BASE
-	default "2.6.21.5" if BR2_LINUX_2_6_21_5
-	default "2.6.21.7" if BR2_LINUX_2_6_21_7
-	default "2.6.22.1" if BR2_LINUX_2_6_22_1
-	default "2.6.22.10" if BR2_LINUX_2_6_22_10
-	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
-	default "$(BR2_DEFAULT_KERNEL_HEADERS)" if BR2_KERNEL_LINUX_HEADERS_VERSION
-	default $(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
+	default "$(BR2_KERNEL_THIS_VERSION)" if					BR2_KERNEL_BASE
+	default "$(BR2_KERNEL_CURRENT_VERSION)" if				BR2_LINUX_2_6_STABLE
+	default "$(BR2_DEFAULT_KERNEL_HEADERS)" if				BR2_KERNEL_LINUX_HEADERS_VERSION
+	default  $(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION) if			BR2_LINUX26_CUSTOM
 
 config BR2_LINUX26_VERSION
 	string
-	default "$(BR2_KERNEL_THIS_VERSION).$(BR2_KERNEL_PATCH_LEVEL)" if BR2_KERNEL_BASE && BR2_KERNEL_ADD_MINORPATCH
-	default "$(LINUX26_LATEST_RC_VERSION)" if BR2_KERNEL_ADD_LATEST_RC_PATCH
-	default "$(LINUX26_LATEST_MM_VERSION)" if BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(LINUX26_LATEST_GIT_VERSION)" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
-	default "$(BR2_LINUX26_RC_VERSION)" if BR2_KERNEL_BASE && BR2_KERNEL_ADD_RC_PATCH
-	default "$(BR2_LINUX26_SNAPSHOT_VERSION)" if BR2_KERNEL_BASE && BR2_KERNEL_ADD_SNAPSHOT
-	default "$(BR2_LINUX26_MM_VERSION)" if BR2_KERNEL_BASE && BR2_KERNEL_ADD_MM_PATCH
-	default "$(BR2_KERNEL_THIS_VERSION)" if BR2_KERNEL_BASE && ! BR2_KERNEL_ADD_PATCH
-	default "2.6.21.5" if BR2_LINUX_2_6_21_5
-	default "2.6.21.7" if BR2_LINUX_2_6_21_7
-	default "2.6.22.1" if BR2_LINUX_2_6_22_1
-	default "2.6.22.10" if BR2_LINUX_2_6_22_10
-	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
-	default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
+	default "$(BR2_KERNEL_THIS_VERSION).$(BR2_KERNEL_PATCH_LEVEL)" if	BR2_KERNEL_ADD_LATEST_MINORPATCH&& BR2_KERNEL_BASE
+	default "$(BR2_KERNEL_THIS_VERSION).$(BR2_KERNEL_PATCH_LEVEL)" if	BR2_KERNEL_ADD_MINORPATCH	&& BR2_KERNEL_BASE
+	default "$(LINUX26_LATEST_RC_VERSION)" if				BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "$(BR2_LINUX26_RC_VERSION)" if					BR2_KERNEL_ADD_RC_PATCH		&& BR2_KERNEL_BASE
+	default "$(LINUX26_LATEST_GIT_VERSION)" if 				BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "$(BR2_LINUX26_SNAPSHOT_VERSION)" if				BR2_KERNEL_ADD_SNAPSHOT		&& BR2_KERNEL_BASE
+	default "$(LINUX26_LATEST_MM_VERSION)" if 				BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "$(BR2_LINUX26_MM_VERSION)" if					BR2_KERNEL_ADD_MM_PATCH		&& BR2_KERNEL_BASE
+	default "$(BR2_KERNEL_THIS_VERSION)" if				      ! BR2_KERNEL_ADD_PATCH		&& BR2_KERNEL_BASE
+	default "$(BR2_KERNEL_CURRENT_VERSION)"if				BR2_LINUX_2_6_STABLE
+	default "$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
 
 menu "Linux Kernel Configuration"
 
@@ -458,33 +441,26 @@
 config BR2_LINUX_BIN_BZIMAGE
 	bool "bzImage"
 	depends on BR2_PACKAGE_LINUX
-	help
-	  Linux 2.6.19.2
 
 config BR2_LINUX_BIN_UIMAGE
 	bool "uImage"
 	depends on BR2_PACKAGE_LINUX
 	select BR2_TARGET_UBOOT
-	help
-	  Build uImage binary
 
 config BR2_LINUX_BIN_VMLINUX
 	bool "vmlinux"
 	depends on BR2_PACKAGE_LINUX
-	help
-	  Build vmlinux binary
 
 config BR2_LINUX_BIN_ZIMAGE
 	bool "zImage"
 	depends on BR2_PACKAGE_LINUX
-	help
-	  Linux 2.6.19.2
 
 config BR2_LINUX_BIN_CUSTOM
 	bool "<custom> Linux binary"
 	depends on BR2_PACKAGE_LINUX
 	help
 	  Build custom Linux binary format
+
 endchoice
 
 config BR2_LINUX_BIN_CUSTOM_BIN

Modified: trunk/buildroot/target/linux/Config.in.versions
===================================================================
--- trunk/buildroot/target/linux/Config.in.versions	2009-01-19 16:38:30 UTC (rev 24911)
+++ trunk/buildroot/target/linux/Config.in.versions	2009-01-19 21:27:04 UTC (rev 24912)
@@ -5,13 +5,13 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.29-rc1" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.29-rc2" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 	help
 	  Not really available as of 20090103
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.29-rc1-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.29-rc2-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
@@ -19,17 +19,17 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.28"
+	default "2.6.28.1"
+	help
+	  This is the latest stable kernel (including minor version)
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
 	default "1"
-	help
-	  Not really available as of 20090103
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "10"
+	default "12"
 
 config BR2_KERNEL_LATEST_2_6_26
 	string

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-19 16:38:30 UTC (rev 24911)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-19 21:27:04 UTC (rev 24912)
@@ -71,8 +71,7 @@
 LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
 #"))
 
-LINUX26_PATCH_SITE:=$(strip $(subst ",,$(BR2_KERNEL_SITE)))
-#"))
+LINUX_HEADERS_DEPENDS:= $(DL_DIR)/$(LINUX26_PATCH_SOURCE) $(LINUX26_BSP_PATCH)
 
 # ------------------------------------
 # kernel patches provided by buildroot
