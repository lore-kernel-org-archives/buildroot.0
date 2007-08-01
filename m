From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:58:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070801085815.9AA62A6128@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:58:14 -0700 (Wed, 01 Aug 2007)
New Revision: 19383

Log:
Simplify AVR32 gcc build (libmudflap, doesn't work, so applied even though objections)

Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/Config.in.2
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-08-01 08:54:56 UTC (rev 19382)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-08-01 08:58:14 UTC (rev 19383)
@@ -140,16 +140,6 @@
 	  proper stack unwinding during exception handling.  Most people
 	  can leave this set to n.
 
-config BR2_GCC_AVR32_CONFIGURATION
-	bool "Enable default AVR32 GCC configuration"
-	default y
-	depends BR2_avr32
-	help
-	  For the AVR32 platform there is some configuration which are not
-	  supported.
-
-	  Currently this will add "--disable-libmudflap" to configure.
-
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
 	default ""

Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2007-08-01 08:54:56 UTC (rev 19382)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2007-08-01 08:58:14 UTC (rev 19383)
@@ -2,19 +2,9 @@
 	bool "native toolchain in the target filesystem"
 	default n
 	help
-	  If you want the target system to be able to run 
+	  If you want the target system to be able to run
 	  binutils/gcc and compile native code, say Y here.
 
-config BR2_GCC_TARGET_AVR32_CONFIGURATION
-	bool "Enable default AVR32 GCC configuration"
-	default y
-	depends BR2_avr32 && BR2_PACKAGE_GCC_TARGET
-	help
-	  For the AVR32 platform there is some configuration which are not
-	  supported.
-
-	  Currently this will add "--disable-libmudflap" to configure.
-
 config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	string "Additional target gcc options"
 	default ""

Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-08-01 08:54:56 UTC (rev 19382)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-08-01 08:58:14 UTC (rev 19383)
@@ -12,7 +12,7 @@
 #"))
 
 # AVR32 GCC configuration
-ifeq ($(strip $(BR2_GCC_AVR32_CONFIGURATION)),y)
+ifeq ($(strip $(BR2_avr32)),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 endif
 
@@ -86,7 +86,7 @@
 endif # BR2_PREFER_IMA=y
 
 # AVR32 target GCC configuration
-ifeq ($(strip $(BR2_GCC_TARGET_AVR32_CONFIGURATION)),y)
+ifeq ($(strip $(BR2_avr32)),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 endif
 
