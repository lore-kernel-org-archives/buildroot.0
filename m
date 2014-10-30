From: Andreas Larsson <andreas@gaisler.com>
Date: Thu, 30 Oct 2014 09:29:36 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove version 4.4.x
In-Reply-To: <1414657776-32427-1-git-send-email-andreas@gaisler.com>
References: <1414657776-32427-1-git-send-email-andreas@gaisler.com>
Message-ID: <1414657776-32427-3-git-send-email-andreas@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That gcc series is old and is not used as the default version for
any of the architectures we support, so this commit gets rid of it.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
 Config.in.legacy                                   |    7 +
 package/gcc/4.4.7/100-uclibc-conf.patch            |   13 --
 package/gcc/4.4.7/301-missing-execinfo_h.patch     |   11 --
 package/gcc/4.4.7/302-c99-snprintf.patch           |   13 --
 .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |   49 -------
 package/gcc/4.4.7/810-arm-softfloat-libgcc.patch   |   38 ------
 package/gcc/4.4.7/gcc-44-pr39429.patch             |   24 ----
 .../powerpc-link-with-math-lib.patch.conditional   |  137 --------------------
 package/gcc/Config.in.host                         |   24 ----
 9 files changed, 7 insertions(+), 309 deletions(-)
 delete mode 100644 package/gcc/4.4.7/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.4.7/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.4.7/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/4.4.7/gcc-44-pr39429.patch
 delete mode 100644 package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional

diff --git a/Config.in.legacy b/Config.in.legacy
index b441e67..ffed7b9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -220,6 +220,13 @@ config BR2_GCC_VERSION_4_3_X
 	  The 4.3.x version of gcc has been removed. Use a newer
 	  version instead.
 
+config BR2_GCC_VERSION_4_4_X
+	bool "gcc 4.4.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 4.4.x version of gcc has been removed. Use a newer
+	  version instead.
+
 config BR2_GCC_VERSION_4_6_X
 	bool "gcc 4.6.x has been removed"
 	select BR2_LEGACY
diff --git a/package/gcc/4.4.7/100-uclibc-conf.patch b/package/gcc/4.4.7/100-uclibc-conf.patch
deleted file mode 100644
index 6bad179..0000000
--- a/package/gcc/4.4.7/100-uclibc-conf.patch
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
diff --git a/package/gcc/4.4.7/301-missing-execinfo_h.patch b/package/gcc/4.4.7/301-missing-execinfo_h.patch
deleted file mode 100644
index 0e2092f..0000000
--- a/package/gcc/4.4.7/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/4.4.7/302-c99-snprintf.patch b/package/gcc/4.4.7/302-c99-snprintf.patch
deleted file mode 100644
index ba51a0e..0000000
--- a/package/gcc/4.4.7/302-c99-snprintf.patch
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
diff --git a/package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch b/package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 374b1f8..0000000
--- a/package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
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
diff --git a/package/gcc/4.4.7/810-arm-softfloat-libgcc.patch b/package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
deleted file mode 100644
index e6a30a3..0000000
--- a/package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
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
diff --git a/package/gcc/4.4.7/gcc-44-pr39429.patch b/package/gcc/4.4.7/gcc-44-pr39429.patch
deleted file mode 100644
index 4e1dc9e..0000000
--- a/package/gcc/4.4.7/gcc-44-pr39429.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From: Michael Olbrich <m.olbrich@pengutronix.de>
-Subject: Fix: compiler create bad asm codes.
-
-See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39429 for details.
-
-Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
-
----
- gcc/config/arm/arm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/gcc/config/arm/arm.c
-===================================================================
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -6838,7 +6838,7 @@ adjacent_mem_locations (rtx a, rtx b)
-       /* Don't accept any offset that will require multiple
- 	 instructions to handle, since this would cause the
- 	 arith_adjacentmem pattern to output an overlong sequence.  */
--      if (!const_ok_for_op (PLUS, val0) || !const_ok_for_op (PLUS, val1))
-+      if (!const_ok_for_op (val0, PLUS) || !const_ok_for_op (val1, PLUS))
- 	return 0;
- 
-       /* Don't allow an eliminable register: register elimination can make
diff --git a/package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
deleted file mode 100644
index 3fe8757..0000000
--- a/package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
+++ /dev/null
@@ -1,137 +0,0 @@
-http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
-
-On glibc the libc.so carries a copy of the math function copysignl() but
-on uClibc math functions like copysignl() live in libm. Since libgcc_s
-contains unresolved symbols, any attempt to link against libgcc_s
-without explicitely specifying -lm fails, resulting in a broken
-bootstrap of the compiler.
-
-
-diff -rdup gcc-4.4.0.old/gcc/config/t-slibgcc-elf-ver gcc-4.4.0/gcc/config/t-slibgcc-elf-ver
-
-diff -durN gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver gcc-4.4.4/gcc/config/t-slibgcc-elf-ver
---- gcc-4.4.4.orig/gcc/config/t-slibgcc-elf-ver	2010-01-04 16:13:08.000000000 +0100
-+++ gcc-4.4.4/gcc/config/t-slibgcc-elf-ver	2010-05-16 19:38:36.000000000 +0200
-@@ -9,7 +9,7 @@
- SHLIB_OBJS = @shlib_objs@
- SHLIB_DIR = @multilib_dir@
- SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
--SHLIB_LC = -lc
-+SHLIB_LC = @libgcc_libm@ -lc
- SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
- SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
-diff -durN gcc-4.4.4.orig/libgcc/Makefile.in gcc-4.4.4/libgcc/Makefile.in
---- gcc-4.4.4.orig/libgcc/Makefile.in	2009-04-10 01:23:07.000000000 +0200
-+++ gcc-4.4.4/libgcc/Makefile.in	2010-05-16 19:38:36.000000000 +0200
-@@ -39,6 +39,7 @@
- decimal_float = @decimal_float@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- 
-@@ -787,9 +788,10 @@
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
-diff -durN gcc-4.4.4.orig/libgcc/configure gcc-4.4.4/libgcc/configure
---- gcc-4.4.4.orig/libgcc/configure	2008-11-20 18:13:01.000000000 +0100
-+++ gcc-4.4.4/libgcc/configure	2010-05-16 19:38:36.000000000 +0200
-@@ -272,7 +272,7 @@
- PACKAGE_BUGREPORT=''
- 
- ac_unique_file="static-object.mk"
--ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
-+ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS libgcc_topdir enable_shared slibdir INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA AWK build build_cpu build_vendor build_os host host_cpu host_vendor host_os host_noncanonical build_libsubdir build_subdir host_subdir target_subdir AR ac_ct_AR LIPO ac_ct_LIPO NM ac_ct_NM RANLIB ac_ct_RANLIB STRIP ac_ct_STRIP LN_S CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT CPP decimal_float enable_decimal_float fixed_point vis_hide set_have_cc_tls LIBGCC_LIBM tmake_file extra_parts asm_hidden_op LIBOBJS LTLIBOBJS'
- ac_subst_files=''
- ac_pwd=`pwd`
- 
-@@ -3547,6 +3547,39 @@
- fi
- 
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
-+	libgcc_cv_copysignl_lib="-lm"
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
-+
-+
- # Conditionalize the makefile for this target machine.
- tmake_file_=
- for f in ${tmake_file}
-@@ -4267,6 +4300,7 @@
- s, at fixed_point@,$fixed_point,;t t
- s, at vis_hide@,$vis_hide,;t t
- s, at set_have_cc_tls@,$set_have_cc_tls,;t t
-+s, at LIBGCC_LIBM@,$LIBGCC_LIBM,;t t
- s, at tmake_file@,$tmake_file,;t t
- s, at extra_parts@,$extra_parts,;t t
- s, at asm_hidden_op@,$asm_hidden_op,;t t
-diff -durN gcc-4.4.4.orig/libgcc/configure.ac gcc-4.4.4/libgcc/configure.ac
---- gcc-4.4.4.orig/libgcc/configure.ac	2008-11-20 18:13:01.000000000 +0100
-+++ gcc-4.4.4/libgcc/configure.ac	2010-05-16 19:38:36.000000000 +0200
-@@ -223,6 +223,27 @@
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
-+	libgcc_cv_copysignl_lib="-lm"
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
- # Conditionalize the makefile for this target machine.
- tmake_file_=
- for f in ${tmake_file}
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8bf1051..ba23c64 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -21,29 +21,6 @@ choice
 		# Only supported architecture
 		depends on BR2_avr32
 
-	config BR2_GCC_VERSION_4_4_X
-		bool "gcc 4.4.x"
-		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_avr32 && !BR2_powerpc64le
-		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a5 && !BR2_cortex_a7 && \
-			!BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_fa526 && \
-			!BR2_pj4
-		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
-		depends on !BR2_sparc_leon3
-		# ARM EABIhf support appeared in gcc 4.6
-		depends on !BR2_ARM_EABIHF
-		# ARM VFPv4 support appeared in gcc 4.5
-		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
-		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_476 && !BR2_powerpc_476fp \
-			&& !BR2_power8
-		# Broken or unsupported x86 cores
-		depends on !BR2_x86_atom && !BR2_x86_corei7 && !BR2_x86_jaguar
-		# musl patches only for gcc 4.7+
-		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-
 	config BR2_GCC_VERSION_4_5_X
 		bool "gcc 4.5.x"
 		# Broken or unsupported architectures
@@ -114,7 +91,6 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_GCC_VERSION
 	string
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
-- 
1.7.10.4
