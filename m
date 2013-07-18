From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 23:47:52 +0200
Subject: [Buildroot] [PATCH v2 3/3] arc: gcc: Go from 4.4.7 to 4.8 for ARC
In-Reply-To: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
References: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1374184072-6531-4-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes multiple issues, including:
 - 'operand out of range' errors (due to defaulting to
   medium calls instead of short calls)
 - library dependencies that were not being found

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gcc/4.8-arc/100-uclibc-conf.patch          |   15 ++
 package/gcc/4.8-arc/301-missing-execinfo_h.patch   |   13 ++
 package/gcc/4.8-arc/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.8-arc/305-libmudflap-susv3-legacy.patch  |   49 +++++++
 package/gcc/4.8-arc/disable_gc_sections.patch      |  145 ++++++++++++++++++++
 .../fix_branch_out_of_range.patch                  |    2 +-
 package/gcc/Config.in.host                         |   13 +-
 package/gcc/gcc.mk                                 |    2 +-
 8 files changed, 244 insertions(+), 8 deletions(-)
 create mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
 create mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
 create mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
 rename package/gcc/{4.4.7-arc => 4.8-arc}/fix_branch_out_of_range.patch (96%)

diff --git a/package/gcc/4.8-arc/100-uclibc-conf.patch b/package/gcc/4.8-arc/100-uclibc-conf.patch
new file mode 100644
index 0000000..d56bf0a
--- /dev/null
+++ b/package/gcc/4.8-arc/100-uclibc-conf.patch
@@ -0,0 +1,15 @@
+Index: gcc-4.8.0/contrib/regression/objs-gcc.sh
+===================================================================
+--- gcc-4.8.0.orig/contrib/regression/objs-gcc.sh	2009-04-09 17:00:19.000000000 +0200
++++ gcc-4.8.0/contrib/regression/objs-gcc.sh	2013-03-23 17:39:04.000000000 +0100
+@@ -106,6 +106,10 @@
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
diff --git a/package/gcc/4.8-arc/301-missing-execinfo_h.patch b/package/gcc/4.8-arc/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..00efda2
--- /dev/null
+++ b/package/gcc/4.8-arc/301-missing-execinfo_h.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.8.0/boehm-gc/include/gc.h
+===================================================================
+--- gcc-4.8.0.orig/boehm-gc/include/gc.h	2007-04-23 23:10:09.000000000 +0200
++++ gcc-4.8.0/boehm-gc/include/gc.h	2013-03-23 17:39:20.000000000 +0100
+@@ -503,7 +503,7 @@
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/package/gcc/4.8-arc/302-c99-snprintf.patch b/package/gcc/4.8-arc/302-c99-snprintf.patch
new file mode 100644
index 0000000..cd4d2cc
--- /dev/null
+++ b/package/gcc/4.8-arc/302-c99-snprintf.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.8.0/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- gcc-4.8.0.orig/libstdc++-v3/include/c_global/cstdio	2013-02-03 18:54:05.000000000 +0100
++++ gcc-4.8.0/libstdc++-v3/include/c_global/cstdio	2013-03-23 17:39:32.000000000 +0100
+@@ -138,7 +138,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined __UCLIBC__
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..35d5f50
--- /dev/null
+++ b/package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,49 @@
+Index: gcc-4.8.0/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.8.0.orig/libmudflap/mf-hooks2.c	2013-02-03 18:48:05.000000000 +0100
++++ gcc-4.8.0/libmudflap/mf-hooks2.c	2013-03-23 17:39:43.000000000 +0100
+@@ -424,7 +424,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -434,7 +434,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -444,7 +444,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -453,7 +453,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -462,7 +462,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/package/gcc/4.8-arc/disable_gc_sections.patch b/package/gcc/4.8-arc/disable_gc_sections.patch
new file mode 100644
index 0000000..46a3a26
--- /dev/null
+++ b/package/gcc/4.8-arc/disable_gc_sections.patch
@@ -0,0 +1,145 @@
+From be904b178fc0858ad41a3c2fbc13b388bd1ff465 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Mon, 15 Jul 2013 11:50:20 +0200
+Subject: [PATCH] libstdc++: Disable gc-sections to work around binutils bug
+
+This is to work around the following error message:
+BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:2140
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ libstdc++-v3/acinclude.m4 |    3 ---
+ libstdc++-v3/configure    |   33 ---------------------------------
+ 2 files changed, 36 deletions(-)
+
+diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
+index e131214..aa2e375 100644
+--- a/libstdc++-v3/acinclude.m4
++++ b/libstdc++-v3/acinclude.m4
+@@ -296,9 +296,6 @@ AC_DEFUN([GLIBCXX_CHECK_LINKER_FEATURES], [
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     AC_MSG_RESULT($ac_gcsections)
+ 
+     if test "$ac_test_CFLAGS" = set; then
+diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
+index ed049cf..d325e3e 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -20653,9 +20653,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -27688,9 +27685,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -33619,9 +33613,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -45496,9 +45487,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -45710,9 +45698,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -46185,9 +46170,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -52470,9 +52452,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -58386,9 +58365,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -58553,9 +58529,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -58781,9 +58754,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+@@ -64697,9 +64667,6 @@ rm -f core conftest.err conftest.$ac_objext \
+       fi
+       rm -f conftest.c conftest.o conftest
+     fi
+-    if test "$ac_gcsections" = "yes"; then
+-      SECTION_LDFLAGS="-Wl,--gc-sections $SECTION_LDFLAGS"
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_gcsections" >&5
+ $as_echo "$ac_gcsections" >&6; }
+ 
+-- 
+1.7.9.5
+
diff --git a/package/gcc/4.4.7-arc/fix_branch_out_of_range.patch b/package/gcc/4.8-arc/fix_branch_out_of_range.patch
similarity index 96%
rename from package/gcc/4.4.7-arc/fix_branch_out_of_range.patch
rename to package/gcc/4.8-arc/fix_branch_out_of_range.patch
index e39b1cc..5340a3b 100644
--- a/package/gcc/4.4.7-arc/fix_branch_out_of_range.patch
+++ b/package/gcc/4.8-arc/fix_branch_out_of_range.patch
@@ -24,7 +24,7 @@ index ff602c0..b3ca4c4 100644
  		  if (op0 != cmp0)
   		    cc_clob_rtx = gen_rtx_REG (CC_ZNmode, CC_REG);
 - 		  else if ((offset >= -140 && offset < 140)
-+ 		  else if ((offset >= -120 && offset < 120)
++		  else if ((offset >= -120 && offset < 120)
  			   && rtx_equal_p (op1, const0_rtx)
  			   && compact_register_operand (op0, VOIDmode)
  			   && (GET_CODE (op) == EQ
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 972f81f..c49b8ed 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -7,15 +7,11 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
-	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
+	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_7_X
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_4_7_ARC
-		depends on BR2_arc
-		bool "gcc 4.4.7-arc"
-
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
@@ -55,6 +51,11 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
+	config BR2_GCC_VERSION_4_8_ARC
+		depends on BR2_arc
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.8-arc"
+
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
@@ -84,11 +85,11 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
-	default "4.4.7-arc" if BR2_GCC_VERSION_4_4_7_ARC
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
+	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ae2a363..c0d821b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -133,7 +133,7 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
-ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
+ifeq ($(BR2_arc),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
-- 
1.7.9.5
