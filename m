From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:25:57 +0100
Subject: [Buildroot] [git commit branch/next] gcc: remove 4.5.x
Message-ID: <20160228212634.867C580AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c0a367d0a2cb370e94804a500f94fe8c1ccd925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's been deprecated for some time now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: move option to Config.in.legacy, as noticed by Peter.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   7 +
 package/gcc/4.5.4/100-uclibc-conf.patch            |  13 -
 ...00-powerpc-link-with-math-lib.patch.conditional | 125 --------
 package/gcc/4.5.4/301-missing-execinfo_h.patch     |  11 -
 package/gcc/4.5.4/302-c99-snprintf.patch           |  13 -
 .../gcc/4.5.4/305-libmudflap-susv3-legacy.patch    |  49 ---
 package/gcc/4.5.4/810-arm-softfloat-libgcc.patch   |  38 ---
 package/gcc/4.5.4/820-arm-unbreak-armv4t.patch     |  14 -
 package/gcc/4.5.4/830-arm-pr43440.patch            | 345 ---------------------
 package/gcc/Config.in.host                         |  27 --
 10 files changed, 7 insertions(+), 635 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ea8c7d..1cd2697 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_GCC_VERSION_4_5_X
+	bool "gcc 4.5.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 4.5.x version of gcc has been removed. Use a newer
+	  version instead.
+
 config BR2_PACKAGE_SQLITE_READLINE
 	bool "command-line editing support was updated"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/gcc/4.5.4/100-uclibc-conf.patch b/package/gcc/4.5.4/100-uclibc-conf.patch
deleted file mode 100644
index 6bad179..0000000
--- a/package/gcc/4.5.4/100-uclibc-conf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- gcc/gcc/config/--- gcc/contrib/regression/objs-gcc.sh
-+++ gcc/contrib/regression/objs-gcc.sh
-@@ -105,6 +105,10 @@
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
diff --git a/package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
deleted file mode 100644
index 7e75e87..0000000
--- a/package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
+++ /dev/null
@@ -1,125 +0,0 @@
-http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
-
-On glibc the libc.so carries a copy of the math function copysignl() but
-on uClibc math functions like copysignl() live in libm. Since libgcc_s
-contains unresolved symbols, any attempt to link against libgcc_s
-without explicitely specifying -lm fails, resulting in a broken
-bootstrap of the compiler.
-
-Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
---- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
-+++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
-@@ -27,7 +27,7 @@
- SHLIB_OBJS = @shlib_objs@
- SHLIB_DIR = @multilib_dir@
- SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
--SHLIB_LC = -lc
-+SHLIB_LC = @libgcc_libm@ -lc
- SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
- SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
-diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
---- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
-+++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
-@@ -39,6 +39,7 @@
- decimal_float = @decimal_float@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- 
-@@ -798,9 +799,10 @@
- 		@multilib_dir@,$(MULTIDIR),$(subst \
- 		@shlib_objs@,$(objects),$(subst \
- 		@shlib_base_name@,libgcc_s,$(subst \
-+		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
- 		@shlib_map_file@,$(mapfile),$(subst \
- 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
--		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
-+		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
- 
- libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
- 	# @multilib_flags@ is still needed because this may use
-diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
---- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
-+++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
-@@ -557,6 +557,7 @@
- extra_parts
- tmake_file
- set_use_emutls
-+LIBGCC_LIBM
- set_have_cc_tls
- vis_hide
- fixed_point
-@@ -3847,6 +3848,37 @@
-   set_use_emutls="-DUSE_EMUTLS"
- fi
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+echo "$as_me:$LINENO: checking for library containing copysignl" >&5
-+echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
-+if test "${libgcc_cv_copysignl_lib+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+
-+fi
-+echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
-+echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
- 
- # Conditionalize the makefile for this target machine.
- tmake_file_=
-diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
---- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
-+++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
-@@ -238,6 +238,27 @@
- fi
- AC_SUBST(set_have_cc_tls)
- 
-+# On powerpc libgcc_s references copysignl which is a libm function but
-+# glibc apparently also provides it via libc as opposed to uClibc where
-+# it lives in libm.
-+AC_CACHE_CHECK
-+  libgcc_cv_copysignl_lib,
-+    echo '#include <features.h>' > conftest.c
-+    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
-+    libgcc_cv_copysignl_lib="-lc"
-+    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
-+    then
-+       libgcc_cv_copysignl_lib="-lm"
-+    fi
-+    rm -f conftest.*
-+  ])
-+
-+case /${libgcc_cv_copysignl_lib}/ in
-+  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
-+  *) LIBGCC_LIBM= ;;
-+esac
-+AC_SUBST(LIBGCC_LIBM)
-+
- # See if we have emulated thread-local storage.
- GCC_CHECK_EMUTLS
- set_use_emutls=
diff --git a/package/gcc/4.5.4/301-missing-execinfo_h.patch b/package/gcc/4.5.4/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/package/gcc/4.5.4/301-missing-execinfo_h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- gcc-4.0.0/boehm-gc/include/gc.h-orig	2005-04-28 22:28:57.000000000 -0500
-+++ gcc-4.0.0/boehm-gc/include/gc.h	2005-04-28 22:30:38.000000000 -0500
-@@ -500,7 +500,7 @@
- #ifdef __linux__
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/gcc/4.5.4/302-c99-snprintf.patch b/package/gcc/4.5.4/302-c99-snprintf.patch
deleted file mode 100644
index ba51a0e..0000000
--- a/package/gcc/4.5.4/302-c99-snprintf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.3.0/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(revision 129202)
-+++ gcc-4.3.0/libstdc++-v3/include/c_global/cstdio	(working copy)
-@@ -144,7 +144,7 @@
- 
- _GLIBCXX_END_NAMESPACE
- 
--#if _GLIBCXX_USE_C99
-+#if _GLIBCXX_USE_C99 || defined __UCLIBC__
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch b/package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: gcc-4.2/libmudflap/mf-hooks2.c
-===================================================================
---- gcc-4.2/libmudflap/mf-hooks2.c	(revision 119834)
-+++ gcc-4.2/libmudflap/mf-hooks2.c	(working copy)
-@@ -427,7 +427,7 @@
- {
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
--  bzero (s, n);
-+  memset (s, 0, n);
- }
- 
- 
-@@ -437,7 +437,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
-   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
--  bcopy (src, dest, n);
-+  memmove (dest, src, n);
- }
- 
- 
-@@ -447,7 +447,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
-   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
--  return bcmp (s1, s2, n);
-+  return n == 0 ? 0 : memcmp (s1, s2, n);
- }
- 
- 
-@@ -456,7 +456,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
--  return index (s, c);
-+  return strchr (s, c);
- }
- 
- 
-@@ -465,7 +465,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
--  return rindex (s, c);
-+  return strrchr (s, c);
- }
- 
- /* XXX:  stpcpy, memccpy */
diff --git a/package/gcc/4.5.4/810-arm-softfloat-libgcc.patch b/package/gcc/4.5.4/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index e6a30a3..0000000
--- a/package/gcc/4.5.4/810-arm-softfloat-libgcc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] add the correct symbols to libgcc for uclibc arm softfloat
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- gcc/config/arm/linux-elf.h |    2 +-
- gcc/config/arm/t-linux     |    6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-Index: gcc-4.4.0/gcc/config/arm/t-linux
-===================================================================
---- gcc-4.4.0.orig/gcc/config/arm/t-linux
-+++ gcc-4.4.0/gcc/config/arm/t-linux
-@@ -4,7 +4,11 @@
- 
- LIB1ASMSRC = arm/lib1funcs.asm
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_arm_addsubdf3 _arm_addsubsf3
-+	_arm_addsubdf3 _arm_addsubsf3 \
-+	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
-+	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
-+	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
-+	_arm_fixsfsi _arm_fixunssfsi
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
-Index: gcc-4.4.0/gcc/config/arm/linux-elf.h
-===================================================================
---- gcc-4.4.0.orig/gcc/config/arm/linux-elf.h
-+++ gcc-4.4.0/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
- 
diff --git a/package/gcc/4.5.4/820-arm-unbreak-armv4t.patch b/package/gcc/4.5.4/820-arm-unbreak-armv4t.patch
deleted file mode 100644
index 8651afc..0000000
--- a/package/gcc/4.5.4/820-arm-unbreak-armv4t.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
-
-diff -Nura gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h gcc-4.5.1/gcc/config/arm/linux-eabi.h
---- gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h	2009-10-30 17:03:09.000000000 -0300
-+++ gcc-4.5.1/gcc/config/arm/linux-eabi.h	2010-11-02 15:38:25.792208500 -0300
-@@ -44,7 +44,7 @@
-    The ARM10TDMI core is the default for armv5t, so set
-    SUBTARGET_CPU_DEFAULT to achieve this.  */
- #undef  SUBTARGET_CPU_DEFAULT
--#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
-+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
- 
- /* TARGET_BIG_ENDIAN_DEFAULT is set in
-    config.gcc for big endian configurations.  */
diff --git a/package/gcc/4.5.4/830-arm-pr43440.patch b/package/gcc/4.5.4/830-arm-pr43440.patch
deleted file mode 100644
index 811d1f2..0000000
--- a/package/gcc/4.5.4/830-arm-pr43440.patch
+++ /dev/null
@@ -1,345 +0,0 @@
-http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43440
-
---- gcc-4.4.4.orig/gcc/config/arm/aout.h
-+++ gcc-4.4.4/gcc/config/arm/aout.h
-@@ -163,34 +163,49 @@
-   {"mvdx12", 39},				\
-   {"mvdx13", 40},				\
-   {"mvdx14", 41},				\
--  {"mvdx15", 42},				\
--  {"d0", 63}, {"q0", 63},			\
--  {"d1", 65},					\
--  {"d2", 67}, {"q1", 67},			\
--  {"d3", 69},					\
--  {"d4", 71}, {"q2", 71},			\
--  {"d5", 73},					\
--  {"d6", 75}, {"q3", 75},			\
--  {"d7", 77},					\
--  {"d8", 79}, {"q4", 79},			\
--  {"d9", 81},					\
--  {"d10", 83}, {"q5", 83},			\
--  {"d11", 85},					\
--  {"d12", 87}, {"q6", 87},			\
--  {"d13", 89},					\
--  {"d14", 91}, {"q7", 91},			\
--  {"d15", 93},					\
--  {"q8", 95},					\
--  {"q9", 99},					\
--  {"q10", 103},					\
--  {"q11", 107},					\
--  {"q12", 111},					\
--  {"q13", 115},					\
--  {"q14", 119},					\
--  {"q15", 123}					\
-+  {"mvdx15", 42}				\
- }
- #endif
- 
-+#ifndef OVERLAPPING_REGISTER_NAMES
-+#define OVERLAPPING_REGISTER_NAMES       \
-+{					 \
-+  {"d0", 63, 2},			 \
-+  {"d1", 65, 2},			 \
-+  {"d2", 67, 2},			 \
-+  {"d3", 69, 2},			 \
-+  {"d4", 71, 2},			 \
-+  {"d5", 73, 2},			 \
-+  {"d6", 75, 2},			 \
-+  {"d7", 77, 2},			 \
-+  {"d8", 79, 2},			 \
-+  {"d9", 81, 2},			 \
-+  {"d10", 83, 2},			 \
-+  {"d11", 85, 2},			 \
-+  {"d12", 87, 2},			 \
-+  {"d13", 89, 2},			 \
-+  {"d14", 91, 2},			 \
-+  {"d15", 93, 2},			 \
-+  {"q0", 63, 4},			 \
-+  {"q1", 67, 4},			 \
-+  {"q2", 71, 4},			 \
-+  {"q3", 75, 4},			 \
-+  {"q4", 79, 4},			 \
-+  {"q5", 83, 4},			 \
-+  {"q6", 87, 4},			 \
-+  {"q7", 91, 4},			 \
-+  {"q8", 95, 4},			 \
-+  {"q9", 99, 4},			 \
-+  {"q10", 103, 4},			 \
-+  {"q11", 107, 4},			 \
-+  {"q12", 111, 4},			 \
-+  {"q13", 115, 4},			 \
-+  {"q14", 119, 4},			 \
-+  {"q15", 123, 4}			 \
-+}
-+#endif
-+
-+
- #ifndef NO_DOLLAR_IN_LABEL
- #define NO_DOLLAR_IN_LABEL 1
- #endif
---- gcc-4.4.4.orig/gcc/output.h
-+++ gcc-4.4.4/gcc/output.h
-@@ -169,6 +169,11 @@
-    Prefixes such as % are optional.  */
- extern int decode_reg_name (const char *);
- 
-+/* Similar to decode_reg_name, but takes an extra parameter that is a
-+   pointer to the number of (internal) registers described by the
-+   external name.  */
-+extern int decode_reg_name_and_count (const char *, int *);
-+
- extern void assemble_alias (tree, tree);
- 
- extern void default_assemble_visibility (tree, int);
---- gcc-4.4.4.orig/gcc/reginfo.c
-+++ gcc-4.4.4/gcc/reginfo.c
-@@ -800,39 +800,44 @@
- fix_register (const char *name, int fixed, int call_used)
- {
-   int i;
-+  int reg, nregs;
- 
-   /* Decode the name and update the primary form of
-      the register info.  */
--
--  if ((i = decode_reg_name (name)) >= 0)
-+  if ((reg = decode_reg_name_and_count (name, &nregs)) >= 0)
-     {
--      if ((i == STACK_POINTER_REGNUM
-+      gcc_assert (nregs >= 1);
-+      for (i = reg; i < reg + nregs; i++)
-+      {
-+        if ((i == STACK_POINTER_REGNUM
- #ifdef HARD_FRAME_POINTER_REGNUM
--	   || i == HARD_FRAME_POINTER_REGNUM
-+             || i == HARD_FRAME_POINTER_REGNUM
- #else
--	   || i == FRAME_POINTER_REGNUM
-+             || i == FRAME_POINTER_REGNUM
- #endif
--	   )
--	  && (fixed == 0 || call_used == 0))
--	{
--	  static const char * const what_option[2][2] = {
--	    { "call-saved", "call-used" },
--	    { "no-such-option", "fixed" }};
-+             )
-+            && (fixed == 0 || call_used == 0))
-+          {
-+            static const char * const what_option[2][2] = {
-+              { "call-saved", "call-used" },
-+              { "no-such-option", "fixed" }};
- 
--	  error ("can't use '%s' as a %s register", name,
--		 what_option[fixed][call_used]);
--	}
--      else
--	{
--	  fixed_regs[i] = fixed;
--	  call_used_regs[i] = call_used;
-+            error ("can't use '%s' as a %s register", name,
-+                   what_option[fixed][call_used]);
-+          }
-+        else
-+          {
-+            fixed_regs[i] = fixed;
-+            call_used_regs[i] = call_used;
- #ifdef CALL_REALLY_USED_REGISTERS
--	  if (fixed == 0)
--	    call_really_used_regs[i] = call_used;
-+             if (fixed == 0)
-+               call_really_used_regs[i] = call_used;
- #endif
--	}
--    }
--  else
-+           }
-+        }
-+      }
-+    else
-+
-     {
-       warning (0, "unknown register name: %s", name);
-     }
---- gcc-4.4.4.orig/gcc/stmt.c
-+++ gcc-4.4.4/gcc/stmt.c
-@@ -681,13 +681,14 @@
-   for (tail = clobbers; tail; tail = TREE_CHAIN (tail))
-     {
-       const char *regname;
-+      int nregs;
- 
-       if (TREE_VALUE (tail) == error_mark_node)
- 	return;
-       regname = TREE_STRING_POINTER (TREE_VALUE (tail));
- 
--      i = decode_reg_name (regname);
--      if (i >= 0 || i == -4)
-+      i = decode_reg_name_and_count (regname, &nregs);
-+      if (i == -4)
- 	++nclobbers;
-       else if (i == -2)
- 	error ("unknown register name %qs in %<asm%>", regname);
-@@ -695,14 +696,21 @@
-       /* Mark clobbered registers.  */
-       if (i >= 0)
-         {
--	  /* Clobbering the PIC register is an error.  */
--	  if (i == (int) PIC_OFFSET_TABLE_REGNUM)
--	    {
--	      error ("PIC register %qs clobbered in %<asm%>", regname);
--	      return;
--	    }
-+        int reg;
- 
--	  SET_HARD_REG_BIT (clobbered_regs, i);
-+        for (reg = i; reg < i + nregs; reg++)
-+          {
-+            ++nclobbers;
-+
-+            /* Clobbering the PIC register is an error.  */
-+            if (reg == (int) PIC_OFFSET_TABLE_REGNUM)
-+              {
-+                error ("PIC register clobbered by %qs in %<asm%>", regname);
-+                return;
-+              }
-+
-+            SET_HARD_REG_BIT (clobbered_regs, reg);
-+          }
- 	}
-     }
- 
-@@ -1012,8 +1020,9 @@
-       for (tail = clobbers; tail; tail = TREE_CHAIN (tail))
- 	{
- 	  const char *regname = TREE_STRING_POINTER (TREE_VALUE (tail));
--	  int j = decode_reg_name (regname);
--	  rtx clobbered_reg;
-+	  int reg, nregs;
-+          int j = decode_reg_name_and_count (regname, &nregs);
-+          rtx clobbered_reg;
- 
- 	  if (j < 0)
- 	    {
-@@ -1033,31 +1042,40 @@
- 	      /* Ignore unknown register, error already signaled.  */
- 	      continue;
- 	    }
--
--	  /* Use QImode since that's guaranteed to clobber just one reg.  */
--	  clobbered_reg = gen_rtx_REG (QImode, j);
--
--	  /* Do sanity check for overlap between clobbers and respectively
--	     input and outputs that hasn't been handled.  Such overlap
--	     should have been detected and reported above.  */
--	  if (!clobber_conflict_found)
--	    {
--	      int opno;
--
--	      /* We test the old body (obody) contents to avoid tripping
--		 over the under-construction body.  */
--	      for (opno = 0; opno < noutputs; opno++)
--		if (reg_overlap_mentioned_p (clobbered_reg, output_rtx[opno]))
--		  internal_error ("asm clobber conflict with output operand");
--
--	      for (opno = 0; opno < ninputs - ninout; opno++)
--		if (reg_overlap_mentioned_p (clobbered_reg,
--					     ASM_OPERANDS_INPUT (obody, opno)))
--		  internal_error ("asm clobber conflict with input operand");
-+        
-+          for (reg = j; reg < j + nregs; reg++)
-+            {
-+              /* Use QImode since that's guaranteed to clobber just
-+               * one reg.  */
-+              clobbered_reg = gen_rtx_REG (QImode, reg);
-+
-+              /* Do sanity check for overlap between clobbers and
-+                 respectively input and outputs that hasn't been
-+                 handled.  Such overlap should have been detected and
-+                 reported above.  */
-+              if (!clobber_conflict_found)
-+                {
-+                  int opno;
-+
-+                  /* We test the old body (obody) contents to avoid
-+                     tripping over the under-construction body.  */
-+                  for (opno = 0; opno < noutputs; opno++)
-+                    if (reg_overlap_mentioned_p (clobbered_reg,
-+                                                 output_rtx[opno]))
-+                      internal_error
-+                        ("asm clobber conflict with output operand");
-+
-+                  for (opno = 0; opno < ninputs - ninout; opno++)
-+                    if (reg_overlap_mentioned_p (clobbered_reg,
-+                                                 ASM_OPERANDS_INPUT (obody,
-+                                                                     opno)))
-+                      internal_error
-+                        ("asm clobber conflict with input operand");
-+                }
-+  
-+              XVECEXP (body, 0, i++)
-+                = gen_rtx_CLOBBER (VOIDmode, clobbered_reg);
- 	    }
--
--	  XVECEXP (body, 0, i++)
--	    = gen_rtx_CLOBBER (VOIDmode, clobbered_reg);
- 	}
- 
-       emit_insn (body);
---- gcc-4.4.4.orig/gcc/varasm.c
-+++ gcc-4.4.4/gcc/varasm.c
-@@ -1031,8 +1031,11 @@
-    Prefixes such as % are optional.  */
- 
- int
--decode_reg_name (const char *asmspec)
-+decode_reg_name_and_count (const char *asmspec, int *pnregs)
- {
-+  /* Presume just one register is clobbered.  */
-+   *pnregs = 1;
-+
-   if (asmspec != 0)
-     {
-       int i;
-@@ -1058,6 +1061,25 @@
- 	    && ! strcmp (asmspec, strip_reg_name (reg_names[i])))
- 	  return i;
- 
-+#ifdef OVERLAPPING_REGISTER_NAMES
-+      {
-+      static const struct
-+      {
-+        const char *const name;
-+        const int number;
-+        const int nregs;
-+      } table[] = OVERLAPPING_REGISTER_NAMES;
-+
-+      for (i = 0; i < (int) ARRAY_SIZE (table); i++)
-+        if (table[i].name[0]
-+            && ! strcmp (asmspec, table[i].name))
-+          {
-+            *pnregs = table[i].nregs;
-+            return table[i].number;
-+          }
-+      }
-+#endif /* OVERLAPPING_REGISTER_NAMES */
-+
- #ifdef ADDITIONAL_REGISTER_NAMES
-       {
- 	static const struct { const char *const name; const int number; } table[]
-@@ -1081,6 +1103,15 @@
- 
-   return -1;
- }
-+
-+int
-+decode_reg_name (const char *name)
-+{
-+   int count;
-+   return decode_reg_name_and_count (name, &count);
-+}
-+
-+
- 
- /* Return true if DECL's initializer is suitable for a BSS section.  */
- 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5cc0dd3..4845708 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -13,32 +13,6 @@ choice
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_5_X
-		bool "gcc 4.5.x"
-		depends on BR2_DEPRECATED_SINCE_2015_05
-		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2
-		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
-			!BR2_cortex_a15 && !BR2_cortex_a17 && \
-			!BR2_fa526 && !BR2_pj4
-		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
-			!BR2_powerpc_power8
-		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
-		depends on !BR2_sparc_leon3
-		# Broken or unsupported X86 cores
-		depends on !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_x86_steamroller
-		# ARM EABIhf support appeared in gcc 4.6
-		depends on !BR2_ARM_EABIHF
-		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
-		# musl patches only for gcc 4.7+
-		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-		select BR2_GCC_NEEDS_MPC
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-
 	config BR2_GCC_VERSION_4_7_X
 		bool "gcc 4.7.x"
 		depends on BR2_DEPRECATED_SINCE_2016_05
@@ -113,7 +87,6 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 
 config BR2_GCC_VERSION
 	string
-	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
