From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 13 Nov 2013 17:13:15 +0100
Subject: [Buildroot] [PATCH v2 3/5] gcc: arc: Download from github instead
	of Synopsys website
In-Reply-To: <1384359197-22168-1-git-send-email-mjonker@synopsys.com>
References: <1384359197-22168-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384359197-22168-4-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The github release mechanism only supports .tar.gz, hence the ugly
GCC_UNPACK variable.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gcc/4.8-arc/100-uclibc-conf.patch          |   15 --
 package/gcc/4.8-arc/301-missing-execinfo_h.patch   |   13 --
 package/gcc/4.8-arc/302-c99-snprintf.patch         |   13 --
 .../gcc/4.8-arc/305-libmudflap-susv3-legacy.patch  |   49 -------
 package/gcc/4.8-arc/disable_gc_sections.patch      |  145 --------------------
 package/gcc/4.8-arc/fix_branch_out_of_range.patch  |   30 ----
 package/gcc/Config.in.host                         |    2 +-
 package/gcc/gcc.mk                                 |    9 +-
 8 files changed, 6 insertions(+), 270 deletions(-)
 delete mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
 delete mode 100644 package/gcc/4.8-arc/fix_branch_out_of_range.patch

diff --git a/package/gcc/4.8-arc/100-uclibc-conf.patch b/package/gcc/4.8-arc/100-uclibc-conf.patch
deleted file mode 100644
index d56bf0a..0000000
--- a/package/gcc/4.8-arc/100-uclibc-conf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: gcc-4.8.0/contrib/regression/objs-gcc.sh
-===================================================================
---- gcc-4.8.0.orig/contrib/regression/objs-gcc.sh	2009-04-09 17:00:19.000000000 +0200
-+++ gcc-4.8.0/contrib/regression/objs-gcc.sh	2013-03-23 17:39:04.000000000 +0100
-@@ -106,6 +106,10 @@
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
diff --git a/package/gcc/4.8-arc/301-missing-execinfo_h.patch b/package/gcc/4.8-arc/301-missing-execinfo_h.patch
deleted file mode 100644
index 00efda2..0000000
--- a/package/gcc/4.8-arc/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.8.0/boehm-gc/include/gc.h
-===================================================================
---- gcc-4.8.0.orig/boehm-gc/include/gc.h	2007-04-23 23:10:09.000000000 +0200
-+++ gcc-4.8.0/boehm-gc/include/gc.h	2013-03-23 17:39:20.000000000 +0100
-@@ -503,7 +503,7 @@
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/4.8-arc/302-c99-snprintf.patch b/package/gcc/4.8-arc/302-c99-snprintf.patch
deleted file mode 100644
index cd4d2cc..0000000
--- a/package/gcc/4.8-arc/302-c99-snprintf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.8.0/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- gcc-4.8.0.orig/libstdc++-v3/include/c_global/cstdio	2013-02-03 18:54:05.000000000 +0100
-+++ gcc-4.8.0/libstdc++-v3/include/c_global/cstdio	2013-03-23 17:39:32.000000000 +0100
-@@ -138,7 +138,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if _GLIBCXX_USE_C99 || defined __UCLIBC__
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 35d5f50..0000000
--- a/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: gcc-4.8.0/libmudflap/mf-hooks2.c
-===================================================================
---- gcc-4.8.0.orig/libmudflap/mf-hooks2.c	2013-02-03 18:48:05.000000000 +0100
-+++ gcc-4.8.0/libmudflap/mf-hooks2.c	2013-03-23 17:39:43.000000000 +0100
-@@ -424,7 +424,7 @@
- {
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
--  bzero (s, n);
-+  memset (s, 0, n);
- }
- 
- 
-@@ -434,7 +434,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
-   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
--  bcopy (src, dest, n);
-+  memmove (dest, src, n);
- }
- 
- 
-@@ -444,7 +444,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
-   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
--  return bcmp (s1, s2, n);
-+  return n == 0 ? 0 : memcmp (s1, s2, n);
- }
- 
- 
-@@ -453,7 +453,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
--  return index (s, c);
-+  return strchr (s, c);
- }
- 
- 
-@@ -462,7 +462,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
--  return rindex (s, c);
-+  return strrchr (s, c);
- }
- 
- /* XXX:  stpcpy, memccpy */
diff --git a/package/gcc/4.8-arc/disable_gc_sections.patch b/package/gcc/4.8-arc/disable_gc_sections.patch
deleted file mode 100644
index 46a3a26..0000000
--- a/package/gcc/4.8-arc/disable_gc_sections.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From be904b178fc0858ad41a3c2fbc13b388bd1ff465 Mon Sep 17 00:00:00 2001
-From: Mischa Jonker <mjonker@synopsys.com>
-Date: Mon, 15 Jul 2013 11:50:20 +0200
-Subject: [PATCH] libstdc++: Disable gc-sections to work around binutils bug
-
-This is to work around the following error message:
-BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:2140
-
-Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
----
- libstdc++-v3/acinclude.m4 |    3 ---
- libstdc++-v3/configure    |   33 ---------------------------------
- 2 files changed, 36 deletions(-)
-
-diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
-index e131214..aa2e375 100644
---- a/libstdc++-v3/acinclude.m4
-+++ b/libstdc++-v3/acinclude.m4
-@@ -296,9 +296,6 @@ AC_DEFUN([GLIBCXX_CHECK_LINKER_FEATURES], [
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     AC_MSG_RESULT($ac_gcsections)
- 
-     if test "$ac_test_CFLAGS" = set; then
-diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index ed049cf..d325e3e 100755
---- a/libstdc++-v3/configure
-+++ b/libstdc++-v3/configure
-@@ -20653,9 +20653,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -27688,9 +27685,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -33619,9 +33613,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -45496,9 +45487,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -45710,9 +45698,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -46185,9 +46170,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -52470,9 +52452,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -58386,9 +58365,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -58553,9 +58529,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -58781,9 +58754,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
-@@ -64697,9 +64667,6 @@ rm -f core conftest.err conftest.$ac_objext \
-       fi
-       rm -f conftest.c conftest.o conftest
-     fi
--    if test "$ac_gcsections" = "yes"; then
--      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
- $as_echo "$ac_gcsections" >&6; }
- 
--- 
-1.7.9.5
-
diff --git a/package/gcc/4.8-arc/fix_branch_out_of_range.patch b/package/gcc/4.8-arc/fix_branch_out_of_range.patch
deleted file mode 100644
index 5340a3b..0000000
--- a/package/gcc/4.8-arc/fix_branch_out_of_range.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-arc: Fix operand-out-of-range errors
-
-brcc_s instructions can generate operand-out-of-range errors. While a
-better solution is being discussed by the compiler team, this workaround
-ensures that the chances of running into this issue are low.
-
-Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index ff602c0..b3ca4c4 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -6565,7 +6565,7 @@ estimate required size increase).
- 	      rtx *ccp = &XEXP (XVECEXP (pat, 0, 1), 0);
- 
- 	      offset = branch_dest (insn) - INSN_ADDRESSES (INSN_UID (insn));
--	      if ((offset >= -140 && offset < 140)
-+	      if ((offset >= -120 && offset < 120)
- 		  && rtx_equal_p (XEXP (op, 1), const0_rtx)
-  		  && compact_register_operand (XEXP (op, 0), VOIDmode)
- 		  && equality_comparison_operator (op, VOIDmode))
-@@ -6687,7 +6687,7 @@ estimate required size increase).
- 
- 		  if (op0 != cmp0)
-  		    cc_clob_rtx = gen_rtx_REG (CC_ZNmode, CC_REG);
-- 		  else if ((offset >= -140 && offset < 140)
-+		  else if ((offset >= -120 && offset < 120)
- 			   && rtx_equal_p (op1, const0_rtx)
- 			   && compact_register_operand (op0, VOIDmode)
- 			   && (GET_CODE (op) == EQ
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 41c1213..2f04457 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -90,7 +90,7 @@ config BR2_GCC_VERSION
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
-	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
+	default "7466697995233cc3aab5b9427bf843e3c7fabd80" if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 41600ef..e8f5ee1 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -19,13 +19,14 @@ ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
-else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
-GCC_SITE = $(BR2_ARC_SITE)
+else ifeq ($(BR2_arc),y)
+GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
 
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
 
 #
 # Xtensa special hook
@@ -60,7 +61,7 @@ endef
 #
 
 define HOST_GCC_EXTRACT_CMDS
-	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+	$(call suitable-extractor,$(GCC_SOURCE)) $(DL_DIR)/$(GCC_SOURCE) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
 		--exclude='libjava/*' \
 		--exclude='libgo/*' \
-- 
1.7.9.5
