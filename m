From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 07:27:17 +0000 (UTC)
Subject: [Buildroot] svn commit: [26182] trunk/buildroot/toolchain/gcc
Message-ID: <20090422072717.E0819776C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-22 07:27:17 +0000 (Wed, 22 Apr 2009)
New Revision: 26182

Log:
toolchain/gcc: don't enable libssp support

It's broken anyway as we don't install libssp* into TARGET_DIR, and we
should use the SSP support in uClibc if we want stack protection.

Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2009-04-22 02:53:02 UTC (rev 26181)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2009-04-22 07:27:17 UTC (rev 26182)
@@ -74,7 +74,6 @@
 ifeq ($(BR2_avr32),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 SOFT_FLOAT_CONFIG_OPTION:=
-EXTRA_GCC_CONFIG_OPTIONS+=--disable-libssp
 EXTRA_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
 #EXTRA_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
@@ -90,7 +89,6 @@
 # AVR32 target GCC configuration
 ifeq ($(BR2_avr32),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-04-22 02:53:02 UTC (rev 26181)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-04-22 07:27:17 UTC (rev 26182)
@@ -181,6 +181,7 @@
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-shared \
+		--disable-libssp \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
@@ -246,6 +247,7 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		--disable-libssp \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(GCC_SHARED_LIBGCC) \
@@ -396,6 +398,7 @@
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
 		--with-gnu-as \
+		--disable-libssp \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-22 02:53:02 UTC (rev 26181)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-22 07:27:17 UTC (rev 26182)
@@ -205,6 +205,7 @@
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-shared \
+		--disable-libssp \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
@@ -279,6 +280,7 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		--disable-libssp \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -407,6 +409,7 @@
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
+		--disable-libssp \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \
