From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 12:06:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc:  4.3.1
Message-ID: <20080619190606.260DD3C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-19 12:06:04 -0700 (Thu, 19 Jun 2008)
New Revision: 22453

Log:
toolchain/gcc: add 4.3.1

Based on Bernhards tree.


Added:
   trunk/buildroot/toolchain/gcc/4.3.1/
   trunk/buildroot/toolchain/gcc/4.3.1/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch
   trunk/buildroot/toolchain/gcc/4.3.1/302-c99-snprintf.patch
   trunk/buildroot/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch
   trunk/buildroot/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch
   trunk/buildroot/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch
   trunk/buildroot/toolchain/gcc/4.3.1/995-short-enums.diff
   trunk/buildroot/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch

Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.3.1/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/100-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/100-uclibc-conf.patch	2008-06-19 19:06:04 UTC (rev 22453)
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

Added: trunk/buildroot/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/104-gnuhurd-uclibc-conf.patch	2008-06-19 19:06:04 UTC (rev 22453)
@@ -0,0 +1,13 @@
+diff -rdup gcc-4.2.1.oorig/gcc/config.gcc gcc-4.2.1/gcc/config.gcc
+--- gcc-4.2.1.oorig/gcc/config.gcc	2007-10-01 11:52:52.000000000 +0200
++++ gcc-4.2.1/gcc/config.gcc	2007-10-01 13:22:12.000000000 +0200
+@@ -494,6 +494,9 @@ case ${target} in
+     alpha*)
+       tm_file="${cpu_type}/${cpu_type}.h alpha/elf.h alpha/linux.h alpha/linux-elf.h gnu.h ${tm_file}"
+       ;;
++    i[34567]86-*hurd*-*)
++      tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h i386/gnu.h gnu.h ${tm_file}"
++      ;;
+     i[34567]86-*-*)
+       tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h linux.h i386/linux.h gnu.h ${tm_file}"
+       ;;

Added: trunk/buildroot/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/301-missing-execinfo_h.patch	2008-06-19 19:06:04 UTC (rev 22453)
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

Added: trunk/buildroot/toolchain/gcc/4.3.1/302-c99-snprintf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/302-c99-snprintf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/302-c99-snprintf.patch	2008-06-19 19:06:04 UTC (rev 22453)
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

Added: trunk/buildroot/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/305-libmudflap-susv3-legacy.patch	2008-06-19 19:06:04 UTC (rev 22453)
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

Added: trunk/buildroot/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/810-arm-softfloat-libgcc.patch	2008-06-19 19:06:04 UTC (rev 22453)
@@ -0,0 +1,29 @@
+Index: gcc-4.3.0/gcc/config/arm/t-linux
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/t-linux	(revision 129896)
++++ gcc-4.3.0/gcc/config/arm/t-linux	(working copy)
+@@ -3,7 +3,10 @@
+ TARGET_LIBGCC2_CFLAGS = -fomit-frame-pointer -fPIC
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+-LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
++LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
++      _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
++      _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
++      _fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
+Index: gcc-4.3.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/linux-elf.h	(revision 129896)
++++ gcc-4.3.0/gcc/config/arm/linux-elf.h	(working copy)
+@@ -48,7 +62,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 

Added: trunk/buildroot/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/993-arm_insn-opinit-RTX_CODE-fixup.patch	2008-06-19 19:06:04 UTC (rev 22453)
@@ -0,0 +1,41 @@
+gcc/ChangeLog
+2007-11-27  Bernhard Fischer  <>
+
+	* config/arm/arm-protos.h (arm_vector_mode_supported_p,
+	arm_hard_regno_mode_ok, const_ok_for_arm): Do not hide non-rtx related
+	function prototypes in RTX_CODE.
+	* genopinit.c: Include tm_p.h.
+
+Index: gcc-4.3.0/gcc/config/arm/arm-protos.h
+===================================================================
+--- gcc-4.3.0/gcc/config/arm/arm-protos.h	(revision 130463)
++++ gcc-4.3.0/gcc/config/arm/arm-protos.h	(working copy)
+@@ -40,15 +40,14 @@
+ 							       unsigned int);
+ extern unsigned int arm_dbx_register_number (unsigned int);
+ extern void arm_output_fn_unwind (FILE *, bool);
+-  
+ 
+ #ifdef TREE_CODE
+ extern int arm_return_in_memory (const_tree);
+ #endif
+-#ifdef RTX_CODE
+ extern bool arm_vector_mode_supported_p (enum machine_mode);
+ extern int arm_hard_regno_mode_ok (unsigned int, enum machine_mode);
+ extern int const_ok_for_arm (HOST_WIDE_INT);
++#ifdef RTX_CODE
+ extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
+ 			       HOST_WIDE_INT, rtx, rtx, int);
+ extern RTX_CODE arm_canonicalize_comparison (RTX_CODE, enum machine_mode,
+Index: gcc-4.3.0/gcc/genopinit.c
+===================================================================
+--- gcc-4.3.0/gcc/genopinit.c	(revision 130463)
++++ gcc-4.3.0/gcc/genopinit.c	(working copy)
+@@ -486,6 +486,7 @@
+   printf ("#include \"expr.h\"\n");
+   printf ("#include \"optabs.h\"\n");
+   printf ("#include \"reload.h\"\n\n");
++  printf ("#include \"tm_p.h\"\n\n");
+ 
+   printf ("void\ninit_all_optabs (void)\n{\n");
+ 

Added: trunk/buildroot/toolchain/gcc/4.3.1/995-short-enums.diff
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/995-short-enums.diff	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/995-short-enums.diff	2008-06-19 19:06:04 UTC (rev 22453)
@@ -0,0 +1,42 @@
+see gcc PR34205
+Index: gcc-4.3.0/gcc/tree.h
+===================================================================
+--- gcc-4.3.0/gcc/tree.h	(revision 130511)
++++ gcc-4.3.0/gcc/tree.h	(working copy)
+@@ -38,6 +38,7 @@
+ 
+   LAST_AND_UNUSED_TREE_CODE	/* A convenient way to get a value for
+ 				   NUM_TREE_CODES.  */
++  ,__LAST_AND_UNUSED_TREE_CODE=32767 /* Force 16bit width.  */
+ };
+ 
+ #undef DEFTREECODE
+Index: gcc-4.3.0/gcc/rtl.h
+===================================================================
+--- gcc-4.3.0/gcc/rtl.h	(revision 130511)
++++ gcc-4.3.0/gcc/rtl.h	(working copy)
+@@ -48,9 +48,11 @@
+ #include "rtl.def"		/* rtl expressions are documented here */
+ #undef DEF_RTL_EXPR
+ 
+-  LAST_AND_UNUSED_RTX_CODE};	/* A convenient way to get a value for
++  LAST_AND_UNUSED_RTX_CODE	/* A convenient way to get a value for
+ 				   NUM_RTX_CODE.
+ 				   Assumes default enum value assignment.  */
++  ,__LAST_AND_UNUSED_RTX_CODE=32767 /* Force 16bit width.  */
++};
+ 
+ #define NUM_RTX_CODE ((int) LAST_AND_UNUSED_RTX_CODE)
+ 				/* The cast here, saves many elsewhere.  */
+Index: gcc-4.3.0/gcc/c-common.h
+===================================================================
+--- gcc-4.3.0/gcc/c-common.h	(revision 130511)
++++ gcc-4.3.0/gcc/c-common.h	(working copy)
+@@ -125,6 +125,7 @@
+   RID_LAST_AT = RID_AT_IMPLEMENTATION,
+   RID_FIRST_PQ = RID_IN,
+   RID_LAST_PQ = RID_ONEWAY
++  ,__LAST_AND_UNUSED_RID=32767 /* Force 16bit width.  */
+ };
+ 
+ #define OBJC_IS_AT_KEYWORD(rid) \

Added: trunk/buildroot/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/998-gcc-4.3.0-fix-header.00.patch	2008-06-19 19:06:04 UTC (rev 22453)
@@ -0,0 +1,15 @@
+\\\\
+\\ gcc PR33200
+Index: gcc-4.3.0/gcc/config.gcc
+===================================================================
+--- gcc-4.3.0/gcc/config.gcc	(revision 131628)
++++ gcc-4.3.0/gcc/config.gcc	(working copy)
+@@ -2302,7 +2305,7 @@ sh-*-symbianelf* | sh[12346l]*-*-symbian
+ 	if test x${enable_incomplete_targets} = xyes ; then
+ 		tm_defines="$tm_defines SUPPORT_SH1=1 SUPPORT_SH2E=1 SUPPORT_SH4=1 SUPPORT_SH4_SINGLE=1 SUPPORT_SH2A=1 SUPPORT_SH2A_SINGLE=1 SUPPORT_SH5_32MEDIA=1 SUPPORT_SH5_32MEDIA_NOFPU=1 SUPPORT_SH5_64MEDIA=1 SUPPORT_SH5_64MEDIA_NOFPU=1"
+ 	fi
+-	use_fixproto=yes
++	# XXX: why? use_fixproto=yes
+ 	;;
+ sh-*-rtemscoff*)
+ 	tmake_file="sh/t-sh t-rtems sh/t-rtems"

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-06-19 19:05:59 UTC (rev 22452)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-06-19 19:06:04 UTC (rev 22453)
@@ -38,6 +38,10 @@
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.2.4"
 
+	config BR2_GCC_VERSION_4_3_1
+		depends on !BR2_avr32 && !BR2_nios2
+		bool "gcc 4.3.1"
+
 #	config BR2_GCC_VERSION_4_3
 #		depends !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
@@ -75,6 +79,7 @@
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
 	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
+	default "4.3.1"     if BR2_GCC_VERSION_4_3_1
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-19 19:05:59 UTC (rev 22452)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-19 19:06:04 UTC (rev 22453)
@@ -219,12 +219,22 @@
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
+	# gcc >= 4.3.0 have to also build all-target-libgcc
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc all-target-libgcc
+else
 	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
+endif
 	touch $@
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
 $(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
+	# gcc >= 4.3.0 have to also install install-target-libgcc
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc install-target-libgcc
+else
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
+endif
 	touch $(gcc_initial)
 
 gcc_initial: uclibc-configured binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
