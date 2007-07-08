From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 02:10:49 +0200
Subject: [Buildroot] improved deps [was Re: svn commit: trunk/buildroot:
	package/config]
In-Reply-To: <20070708000018.9AFEEA686B@busybox.net>
References: <20070708000018.9AFEEA686B@busybox.net>
Message-ID: <20070708001049.GC4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 05:00:18PM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-07-07 17:00:17 -0700 (Sat, 07 Jul 2007)
>New Revision: 19025
>
>Log:
>- silence a cosmetic warning (closes several issues in mantis).
>  This also provides a nice up-to-date filestamp if something got reconfigured (e.g. c++ support got toggled) that can be used in the future to depend accordingly.

e.g.:
Index: toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- toolchain/gcc/gcc-uclibc-4.x.mk	(revision 19022)
+++ toolchain/gcc/gcc-uclibc-4.x.mk	(working copy)
@@ -48,10 +48,14 @@ endif
 #
 #############################################################
 
+GCC_TARGET_PREREQ =
+GCC_STAGING_PREREQ= $(STAGING_DIR)/usr/lib/libc.a
+
 GCC_TARGET_LANGUAGES:=c
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
+GCC_TARGET_PREREQ += $(BASE_DIR)/include/config/br2/install/libstdcpp.h
 endif
 
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
@@ -62,9 +66,6 @@ ifeq ($(BR2_INSTALL_OBJC),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
 
-GCC_TARGET_PREREQ =
-GCC_STAGING_PREREQ= $(STAGING_DIR)/usr/lib/libc.a
-
 ifndef GCC_NO_MPFR
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
@@ -75,6 +76,7 @@ GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGU
 #GCC_STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
+GCC_TARGET_PREREQ += $(BASE_DIR)/include/config/br2/install/fortran.h
 endif
 endif # ifndef GCC_NO_MPFR

or the like. This potentially fixes the situation where you previously
could not really do a full build, then turn e.g. c++ support on and
execute make again. Patches welcome.
