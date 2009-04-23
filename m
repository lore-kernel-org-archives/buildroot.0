From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 11:45:02 +0000 (UTC)
Subject: [Buildroot] svn commit: [26194] trunk/buildroot/toolchain/gcc: 4.4.0
Message-ID: <20090423114502.A15BC76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 11:45:02 +0000 (Thu, 23 Apr 2009)
New Revision: 26194

Log:
toolchain/gcc: add 4.4.0

Added:
   trunk/buildroot/toolchain/gcc/4.4.0/
   trunk/buildroot/toolchain/gcc/4.4.0/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.4.0/301-missing-execinfo_h.patch
   trunk/buildroot/toolchain/gcc/4.4.0/302-c99-snprintf.patch
   trunk/buildroot/toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch
   trunk/buildroot/toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.4.0/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.4.0/100-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.4.0/100-uclibc-conf.patch	2009-04-23 11:45:02 UTC (rev 26194)
@@ -0,0 +1,33 @@
+--- gcc/gcc/config/--- gcc/contrib/regression/objs-gcc.sh
++++ gcc/contrib/regression/objs-gcc.sh
+@@ -105,6 +105,10 @@
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
+--- gcc/libjava/classpath/ltconfig
++++ gcc/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1251,7 +1251,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no

Added: trunk/buildroot/toolchain/gcc/4.4.0/301-missing-execinfo_h.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.4.0/301-missing-execinfo_h.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.4.0/301-missing-execinfo_h.patch	2009-04-23 11:45:02 UTC (rev 26194)
@@ -0,0 +1,11 @@
+--- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
++++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
+@@ -500,7 +500,7 @@
+ #ifdef __linux__
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif

Added: trunk/buildroot/toolchain/gcc/4.4.0/302-c99-snprintf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.4.0/302-c99-snprintf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.4.0/302-c99-snprintf.patch	2009-04-23 11:45:02 UTC (rev 26194)
@@ -0,0 +1,13 @@
+Index: gcc-4.3.0/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(revision 129202)
++++ gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(working copy)
+@@ -144,7 +144,7 @@
+ 
+ _GLIBCXX_END_NAMESPACE
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined __UCLIBC__
+ 
+ #undef snprintf
+ #undef vfscanf

Added: trunk/buildroot/toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch	2009-04-23 11:45:02 UTC (rev 26194)
@@ -0,0 +1,49 @@
+Index: gcc-4.2/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
++++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
+@@ -427,7 +427,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -437,7 +437,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -447,7 +447,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -456,7 +456,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -465,7 +465,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */

Added: trunk/buildroot/toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch	2009-04-23 11:45:02 UTC (rev 26194)
@@ -0,0 +1,38 @@
+[PATCH] add the correct symbols to libgcc for uclibc arm softfloat
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ gcc/config/arm/linux-elf.h |    2 +-
+ gcc/config/arm/t-linux     |    6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+Index: gcc-4.4.0/gcc/config/arm/t-linux
+===================================================================
+--- gcc-4.4.0.orig/gcc/config/arm/t-linux
++++ gcc-4.4.0/gcc/config/arm/t-linux
+@@ -4,7 +4,11 @@
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_arm_addsubdf3 _arm_addsubsf3
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
+Index: gcc-4.4.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.4.0.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.4.0/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-04-23 11:44:58 UTC (rev 26193)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-04-23 11:45:02 UTC (rev 26194)
@@ -61,6 +61,10 @@
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.3.3"
 
+	config BR2_GCC_VERSION_4_4_X
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "gcc 4.4.x"
+
 #	config BR2_GCC_VERSION_4_3
 #		depends on !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
@@ -101,6 +105,7 @@
 	default "4.3.1"     if BR2_GCC_VERSION_4_3_1
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
+	default "4.4.0"     if BR2_GCC_VERSION_4_4_X
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
