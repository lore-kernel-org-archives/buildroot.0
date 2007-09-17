From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 04:19:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070917111904.07F7E3004C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 04:19:04 -0700 (Mon, 17 Sep 2007)
New Revision: 19864

Log:
- add binutils-2.18 and binutils-2.18.50.0.1


Added:
   trunk/buildroot/toolchain/binutils/2.18.50.0.1/
   trunk/buildroot/toolchain/binutils/2.18/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.18 (from rev 19861, trunk/buildroot/toolchain/binutils/2.17.50.0.17)

Copied: trunk/buildroot/toolchain/binutils/2.18.50.0.1 (from rev 19861, trunk/buildroot/toolchain/binutils/2.17.50.0.17)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-09-17 09:26:47 UTC (rev 19863)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-09-17 11:19:04 UTC (rev 19864)
@@ -21,7 +21,7 @@
 		bool "binutils 2.15.94.0.2.2"
 
 	config BR2_BINUTILS_VERSION_2_16_1
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.1"
 
 	config BR2_BINUTILS_VERSION_2_16_90_0_3
@@ -37,11 +37,11 @@
 		bool "binutils 2.16.91.0.6"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_7
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.91.0.7"
 
 	config BR2_BINUTILS_VERSION_2_17
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_2
@@ -81,7 +81,7 @@
 		bool "binutils 2.17.50.0.10"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_12
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.12"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_14
@@ -93,8 +93,16 @@
 		bool "binutils 2.17.50.0.16"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_17
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
+		bool "binutils 2.17.50.0.17"
+
+	config BR2_BINUTILS_VERSION_2_18
 		depends !BR2_avr32 && !BR2_nios2
-		bool "binutils 2.17.50.0.17"
+		bool "binutils 2.18"
+
+	config BR2_BINUTILS_VERSION_2_18_50_0_1
+		depends !BR2_avr32 && !BR2_nios2
+		bool "binutils 2.18.50.0.1"
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -121,9 +129,12 @@
 	default "2.17.50.0.14"    if BR2_BINUTILS_VERSION_2_17_50_0_14
 	default "2.17.50.0.16"    if BR2_BINUTILS_VERSION_2_17_50_0_16
 	default "2.17.50.0.17"    if BR2_BINUTILS_VERSION_2_17_50_0_17
+	default "2.18"            if BR2_BINUTILS_VERSION_2_18
+	default "2.18.50.0.1"     if BR2_BINUTILS_VERSION_2_18_50_0_1
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
 	help
-	  Any additional binutils options you may want to include ...
+	  Any additional binutils options you may want to include.
+

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-17 09:26:47 UTC (rev 19863)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-17 11:19:04 UTC (rev 19864)
@@ -9,6 +9,9 @@
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"))
 BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
+ifeq ($(BINUTILS_VERSION),2.18)
+BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+endif
 ifeq ($(BINUTILS_VERSION),2.17)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
 endif
