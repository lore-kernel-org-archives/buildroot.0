From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 26 Aug 2007 14:00:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070826210057.34C5FA6AB7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-26 14:00:56 -0700 (Sun, 26 Aug 2007)
New Revision: 19704

Log:
- make sure to honour user flags


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-08-26 20:55:02 UTC (rev 19703)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-08-26 21:00:56 UTC (rev 19704)
@@ -74,8 +74,16 @@
 	BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)"
 
 ifeq ($(strip $(BR2_PACKAGE_GCC_TARGET)),y)
-# pull in config opts from the user
-EXTRA_TARGET_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS)))
+EXTRA_TARGET_GCC_CONFIG_OPTIONS:=
+
+# AVR32 target GCC configuration
+ifeq ($(strip $(BR2_avr32)),y)
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+endif
+
+
+# and finally pull in config opts from the user
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(strip $(subst ",, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS)))
 #"))
 
 ifeq ($(BR2_PREFER_IMA),y)
@@ -85,10 +93,5 @@
 endif
 endif # BR2_PREFER_IMA=y
 
-# AVR32 target GCC configuration
-ifeq ($(strip $(BR2_avr32)),y)
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-endif
-
 TARGETS+=gcc_target
 endif
