From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 11:31:42 -0600
Subject: [Buildroot] [PATCH v2 2/5] gcc: add microblaze internal toolchain
In-Reply-To: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384277505-11503-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gcc/4.9-microblaze/100-uclibc-conf.patch   |   15 ++
 .../4.9-microblaze/301-missing-execinfo_h.patch    |   13 ++
 package/gcc/4.9-microblaze/302-c99-snprintf.patch  |   13 ++
 .../305-libmudflap-susv3-legacy.patch              |   49 +++++++
 .../gcc/4.9-microblaze/disable_gc_sections.patch   |  145 ++++++++++++++++++++
 package/gcc/Config.in.host                         |   36 ++++--
 package/gcc/gcc.mk                                 |   12 ++-
 7 files changed, 271 insertions(+), 12 deletions(-)
 create mode 100644 package/gcc/4.9-microblaze/100-uclibc-conf.patch
 create mode 100644 package/gcc/4.9-microblaze/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/4.9-microblaze/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.9-microblaze/305-libmudflap-susv3-legacy.patch
 create mode 100644 package/gcc/4.9-microblaze/disable_gc_sections.patch

diff --git a/package/gcc/4.9-microblaze/100-uclibc-conf.patch b/package/gcc/4.9-microblaze/100-uclibc-conf.patch
new file mode 100644
index 0000000..d56bf0a
--- /dev/null
+++ b/package/gcc/4.9-microblaze/100-uclibc-conf.patch
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
diff --git a/package/gcc/4.9-microblaze/301-missing-execinfo_h.patch b/package/gcc/4.9-microblaze/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..00efda2
--- /dev/null
+++ b/package/gcc/4.9-microblaze/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/4.9-microblaze/302-c99-snprintf.patch b/package/gcc/4.9-microblaze/302-c99-snprintf.patch
new file mode 100644
index 0000000..cd4d2cc
--- /dev/null
+++ b/package/gcc/4.9-microblaze/302-c99-snprintf.patch
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
diff --git a/package/gcc/4.9-microblaze/305-libmudflap-susv3-legacy.patch b/package/gcc/4.9-microblaze/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..35d5f50
--- /dev/null
+++ b/package/gcc/4.9-microblaze/305-libmudflap-susv3-legacy.patch
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
diff --git a/package/gcc/4.9-microblaze/disable_gc_sections.patch b/package/gcc/4.9-microblaze/disable_gc_sections.patch
new file mode 100644
index 0000000..46a3a26
--- /dev/null
+++ b/package/gcc/4.9-microblaze/disable_gc_sections.patch
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
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 41c1213..1c8beba 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,11 +3,18 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
+# Until gcc 4.7, a three stage build process was needed when using
+# NPTL. This hidden option tells whether gcc is a version that
+# requires this three stage build process.
+config BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
+	default BR2_GCC_VERSION_4_9_MICROBLAZE if BR2_microblaze
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
 	default BR2_GCC_VERSION_4_7_X
 	help
@@ -16,39 +23,44 @@ choice
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		# VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
+		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
@@ -57,8 +69,13 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8-arc"
 
+	config BR2_GCC_VERSION_4_9_MICROBLAZE
+		depends on BR2_microblaze
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.9-microblaze"
+
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
@@ -89,8 +106,9 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
+	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
 	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
+	default "4.9-microblaze" if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
@@ -143,7 +161,7 @@ config BR2_GCC_ENABLE_TLS
 
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
+	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
 	help
 	  Enable OpenMP support for the compiler
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 41600ef..7414d6d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -17,15 +17,21 @@ endif
 
 ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
 GCC_SITE = $(BR2_ARC_SITE)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+else ifeq ($(findstring microblaze,$(GCC_VERSION)),microblaze)
+MBGCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543
+GCC_SITE = http://github.com/Xilinx/gcc/tarball/$(MBGCC_VERSION)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-endif
-
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+endif
 
 #
 # Xtensa special hook
@@ -60,7 +66,7 @@ endef
 #
 
 define HOST_GCC_EXTRACT_CMDS
-	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+	$(call suitable-extractor,$(GCC_SOURCE),$(BZCAT)) $(DL_DIR)/$(GCC_SOURCE) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
 		--exclude='libjava/*' \
 		--exclude='libgo/*' \
-- 
1.7.1
