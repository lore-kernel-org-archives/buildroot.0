From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 05:50:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070708125007.B1814A6839@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 05:50:06 -0700 (Sun, 08 Jul 2007)
New Revision: 19034

Log:
- we have to reconfigure iff some compiler-config was changed.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 12:20:58 UTC (rev 19033)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 12:50:06 UTC (rev 19034)
@@ -48,8 +48,14 @@
 #
 #############################################################
 
+GCC_TARGET_PREREQ =
+GCC_STAGING_PREREQ= $(STAGING_DIR)/usr/lib/libc.a
+
 GCC_TARGET_LANGUAGES:=c
 
+GCC_TARGET_PREREQ += $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran*)
+GCC_STAGING_PREREQ+= $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran*)
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
@@ -62,9 +68,6 @@
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
 
-GCC_TARGET_PREREQ =
-GCC_STAGING_PREREQ= $(STAGING_DIR)/usr/lib/libc.a
-
 ifndef GCC_NO_MPFR
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
