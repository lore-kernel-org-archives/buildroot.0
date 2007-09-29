From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Sep 2007 13:44:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070929204431.CC50F300D6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-29 13:44:30 -0700 (Sat, 29 Sep 2007)
New Revision: 20126

Log:
Revert modification of gcc, and make it AVR32 specific

Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-09-29 20:21:38 UTC (rev 20125)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-09-29 20:44:30 UTC (rev 20126)
@@ -14,6 +14,9 @@
 # AVR32 GCC configuration
 ifeq ($(strip $(BR2_avr32)),y)
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
+#EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
@@ -79,6 +82,9 @@
 # AVR32 target GCC configuration
 ifeq ($(strip $(BR2_avr32)),y)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libmudflap
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--disable-libssp
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
+#EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--with-as=$(TARGET_CROSS)as
 endif
 
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-29 20:21:38 UTC (rev 20125)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-29 20:44:30 UTC (rev 20126)
@@ -187,7 +187,6 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
-		--with-as=$(TARGET_CROSS)as \
 		--disable-shared \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -252,8 +251,7 @@
 		--enable-languages=$(GCC_CROSS_LANGUAGES) \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
-		--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin \
-		--disable-libssp \
+		--with-gnu-ld \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(GCC_SHARED_LIBGCC) \
