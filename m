From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 05:05:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils gcc
Message-ID: <20070209130544.94ED248638@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 05:05:43 -0800 (Fri, 09 Feb 2007)
New Revision: 17832

Log:
- fix crosscompiler prerequisites


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-02-09 12:32:21 UTC (rev 17831)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-02-09 13:05:43 UTC (rev 17832)
@@ -40,8 +40,15 @@
 # We do not rely on the host's gmp/mpfr but use a known working one
 BINUTILS_HOST_PREREQ:=
 BINUTILS_TARGET_PREREQ:=
+
+ifeq ($(findstring 3.,$(GCC_VERSION)),3.)
+BINUTILS_NO_MPFR:=y
+endif
+ifeq ($(findstring 4.0,$(GCC_VERSION)),4.0)
+BINUTILS_NO_MPFR:=y
+endif
+
 ifndef BINUTILS_NO_MPFR
-
 BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp.so \
 	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-09 12:32:21 UTC (rev 17831)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-09 13:05:43 UTC (rev 17832)
@@ -72,7 +72,7 @@
 GCC_TARGET_PREREQ =
 GCC_STAGING_PREREQ= $(STAGING_DIR)/lib/libc.a
 
-ifndef $(GCC_NO_MPFR)
+ifndef GCC_NO_MPFR
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 
