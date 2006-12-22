From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 03:45:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061222114520.D98EB4858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 03:45:20 -0800 (Fri, 22 Dec 2006)
New Revision: 17046

Log:
- add gfortran support


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2006-12-22 11:43:06 UTC (rev 17045)
+++ trunk/buildroot/toolchain/gcc/Config.in	2006-12-22 11:45:20 UTC (rev 17046)
@@ -127,8 +127,16 @@
 	help
 	    Build/install Objective-C compiler and runtime?
 
+config BR2_INSTALL_FORTRAN
+	bool "Build/install Fortran compiler and runtime?"
+	default n
+	select BR2_PACKAGE_LIBMPFR
+	help
+	    Build/install Fortran compiler and runtime?
+
 config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
 	default y
 	help
 	    Build/install a shared libgcc library
+

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:43:06 UTC (rev 17045)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:45:20 UTC (rev 17046)
@@ -51,8 +51,17 @@
 TARGET_LANGUAGES:=$(TARGET_LANGUAGES),objc
 endif
 
+TARGET_PREREQ =
+STAGING_PREREQ= $(STAGING_DIR)/lib/libc.a
+
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 TARGET_LANGUAGES:=$(TARGET_LANGUAGES),fortran
+TARGET_PREREQ += $(TARGET_DIR)/lib/libmpfr.so
+STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.a
+GCC_WITH_TARGET_GMP:=--with-gmp=$(STAGING_DIR)
+GCC_WITH_TARGET_MPFR:=--with-mpfr=$(STAGING_DIR)
+GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
+GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 endif
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
@@ -61,6 +70,11 @@
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
+ifneq ($(BR2_ENABLE_LOCALE),y)
+GCC_ENABLE_CLOCALE:=--disable-clocale
+endif
+
+
 #############################################################
 #
 # build the first pass gcc compiler
@@ -169,7 +183,7 @@
 # guarantees.  mjn3
 
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
-$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(STAGING_DIR)/lib/libc.a
+$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important!  Required for limits.h to be fixed.
 	ln -snf ../include $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/sys-include
@@ -184,6 +198,8 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		$(GCC_WITH_HOST_GMP) \
+		$(GCC_WITH_HOST_MPFR) \
 		$(GCC_SHARED_LIBGCC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
@@ -311,6 +327,8 @@
 		--enable-target-optspace \
 		--with-gnu-ld \
 		$(GCC_SHARED_LIBGCC) \
+		$(GCC_WITH_HOST_GMP) \
+		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
