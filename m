From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 23 Oct 2007 02:49:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target toolchain
	toolchain/gcc
Message-ID: <20071023094957.2D3F4A6804@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-23 02:49:56 -0700 (Tue, 23 Oct 2007)
New Revision: 20317

Log:
Ensure AVR32 FPU config is always correct

Modified:
   trunk/buildroot/target/Config.in.arch
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2007-10-22 15:53:34 UTC (rev 20316)
+++ trunk/buildroot/target/Config.in.arch	2007-10-23 09:49:56 UTC (rev 20317)
@@ -12,6 +12,8 @@
 	bool "armeb"
 config BR2_avr32
 	bool "avr32"
+	select BR2_SOFT_FLOAT
+
 config BR2_cris
 	bool "cris"
 config BR2_ia64

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-10-22 15:53:34 UTC (rev 20316)
+++ trunk/buildroot/toolchain/Config.in.2	2007-10-23 09:49:56 UTC (rev 20317)
@@ -48,7 +48,7 @@
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	default n
-	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
+	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU) or a
 	  kernel FPU emulator, but you still wish to support floating point

Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-10-22 15:53:34 UTC (rev 20316)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-10-23 09:49:56 UTC (rev 20317)
@@ -11,14 +11,6 @@
 EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
 #"))
 
-# AVR32 GCC configuration
-ifeq ($(strip $(BR2_avr32)),y)
-EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-EXTRA_GCC_CONFIG_OPTIONS+=--disable-libssp
-EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-#EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
-endif
-
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
 #"))
 GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
@@ -71,6 +63,15 @@
 endif
 endif
 
+# AVR32 GCC configuration
+ifeq ($(strip $(BR2_avr32)),y)
+EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+SOFT_FLOAT_CONFIG_OPTION:=
+EXTRA_GCC_CONFIG_OPTIONS+=--disable-libssp
+EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
+#EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
+endif
+
 TARGET_GCC_FLAGS= CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 	CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 	CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
