From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 22:09:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20090303220951.E40FB7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 22:09:50 +0000 (Tue, 03 Mar 2009)
New Revision: 25513

Log:
binutils: add 2.19.1

Modified:
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2009-03-03 21:23:34 UTC (rev 25512)
+++ trunk/buildroot/toolchain/binutils/Config.in	2009-03-03 22:09:50 UTC (rev 25513)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_19
+	default BR2_BINUTILS_VERSION_2_19_1
 	help
 	  Select the version of binutils you wish to use.
 
@@ -20,6 +20,7 @@
 
 	config BR2_BINUTILS_VERSION_2_18
 		depends on !BR2_nios2
+		depends on BR2_DEPRECATED
 		depends on BR2_EXT_BINUTILS_VERSION_2_18
 		bool "binutils 2.18"
 
@@ -50,7 +51,13 @@
 
 	config BR2_BINUTILS_VERSION_2_19
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "binutils 2.19"
+
+	config BR2_BINUTILS_VERSION_2_19_1
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "binutils 2.19.1"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -65,6 +72,7 @@
 	default "2.18.50.0.8"	if BR2_BINUTILS_VERSION_2_18_50_0_8
 	default "2.18.50.0.9"	if BR2_BINUTILS_VERSION_2_18_50_0_9
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
+	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2009-03-03 21:23:34 UTC (rev 25512)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2009-03-03 22:09:50 UTC (rev 25513)
@@ -9,6 +9,9 @@
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"))
 BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
+ifeq ($(BINUTILS_VERSION),2.19.1)
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
+endif
 ifeq ($(BINUTILS_VERSION),2.19)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
