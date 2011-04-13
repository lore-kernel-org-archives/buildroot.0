From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Apr 2011 13:29:29 -0300
Subject: [Buildroot] [PATCH 8/8] toolchain: add gcc 4.6.0
In-Reply-To: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1302712169-28385-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add gcc 4.6.0 to the toolchain repertoire:

Target gcc is known to be broken in some scenarios.

This version is considered experimental so things may break.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/4.6.0/100-uclibc-conf.patch          |   33 +++++
 toolchain/gcc/4.6.0/301-missing-execinfo_h.patch   |   11 ++
 toolchain/gcc/4.6.0/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.6.0/305-libmudflap-susv3-legacy.patch    |   49 ++++++++
 toolchain/gcc/4.6.0/810-arm-softfloat-libgcc.patch |   38 ++++++
 toolchain/gcc/4.6.0/820-arm-unbreak-armv4t.patch   |   14 ++
 .../powerpc-link-with-math-lib.patch.conditional   |  125 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |    5 +
 toolchain/gcc/Config.in.2                          |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   23 ++++-
 10 files changed, 310 insertions(+), 3 deletions(-)
 create mode 100644 toolchain/gcc/4.6.0/100-uclibc-conf.patch
 create mode 100644 toolchain/gcc/4.6.0/301-missing-execinfo_h.patch
 create mode 100644 toolchain/gcc/4.6.0/302-c99-snprintf.patch
 create mode 100644 toolchain/gcc/4.6.0/305-libmudflap-susv3-legacy.patch
 create mode 100644 toolchain/gcc/4.6.0/810-arm-softfloat-libgcc.patch
 create mode 100644 toolchain/gcc/4.6.0/820-arm-unbreak-armv4t.patch
 create mode 100644 toolchain/gcc/4.6.0/powerpc-link-with-math-lib.patch.conditional

diff --git a/toolchain/gcc/4.6.0/100-uclibc-conf.patch b/toolchain/gcc/4.6.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..cca8c82
--- /dev/null
+++ b/toolchain/gcc/4.6.0/100-uclibc-conf.patch
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
diff --git a/toolchain/gcc/4.6.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.6.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..0e2092f
--- /dev/null
+++ b/toolchain/gcc/4.6.0/301-missing-execinfo_h.patch
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
diff --git a/toolchain/gcc/4.6.0/302-c99-snprintf.patch b/toolchain/gcc/4.6.0/302-c99-snprintf.patch
new file mode 100644
index 0000000..ba51a0e
--- /dev/null
+++ b/toolchain/gcc/4.6.0/302-c99-snprintf.patch
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
diff --git a/toolchain/gcc/4.6.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.6.0/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..374b1f8
--- /dev/null
+++ b/toolchain/gcc/4.6.0/305-libmudflap-susv3-legacy.patch
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
diff --git a/toolchain/gcc/4.6.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.6.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..e6a30a3
--- /dev/null
+++ b/toolchain/gcc/4.6.0/810-arm-softfloat-libgcc.patch
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
diff --git a/toolchain/gcc/4.6.0/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.6.0/820-arm-unbreak-armv4t.patch
new file mode 100644
index 0000000..8651afc
--- /dev/null
+++ b/toolchain/gcc/4.6.0/820-arm-unbreak-armv4t.patch
@@ -0,0 +1,14 @@
+http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
+
+diff -Nura gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h gcc-4.5.1/gcc/config/arm/linux-eabi.h
+--- gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h	2009-10-30 17:03:09.000000000 -0300
++++ gcc-4.5.1/gcc/config/arm/linux-eabi.h	2010-11-02 15:38:25.792208500 -0300
+@@ -44,7 +44,7 @@
+    The ARM10TDMI core is the default for armv5t, so set
+    SUBTARGET_CPU_DEFAULT to achieve this.  */
+ #undef  SUBTARGET_CPU_DEFAULT
+-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
++#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
+ 
+ /* TARGET_BIG_ENDIAN_DEFAULT is set in
+    config.gcc for big endian configurations.  */
diff --git a/toolchain/gcc/4.6.0/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.6.0/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..7e75e87
--- /dev/null
+++ b/toolchain/gcc/4.6.0/powerpc-link-with-math-lib.patch.conditional
@@ -0,0 +1,125 @@
+http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00269.html
+
+On glibc the libc.so carries a copy of the math function copysignl() but
+on uClibc math functions like copysignl() live in libm. Since libgcc_s
+contains unresolved symbols, any attempt to link against libgcc_s
+without explicitely specifying -lm fails, resulting in a broken
+bootstrap of the compiler.
+
+Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
+--- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
++++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
+@@ -27,7 +27,7 @@
+ SHLIB_OBJS = @shlib_objs@
+ SHLIB_DIR = @multilib_dir@
+ SHLIB_SLIBDIR_QUAL = @shlib_slibdir_qual@
+-SHLIB_LC = -lc
++SHLIB_LC = @libgcc_libm@ -lc
+ SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
+ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
+ 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
+--- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
++++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
+@@ -39,6 +39,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ 
+@@ -798,9 +799,10 @@
+ 		@multilib_dir@,$(MULTIDIR),$(subst \
+ 		@shlib_objs@,$(objects),$(subst \
+ 		@shlib_base_name@,libgcc_s,$(subst \
++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
+ 		@shlib_map_file@,$(mapfile),$(subst \
+ 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
+-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
+ 
+ libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
+ 	# @multilib_flags@ is still needed because this may use
+diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
+--- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
++++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
+@@ -557,6 +557,7 @@
+ extra_parts
+ tmake_file
+ set_use_emutls
++LIBGCC_LIBM
+ set_have_cc_tls
+ vis_hide
+ fixed_point
+@@ -3847,6 +3848,37 @@
+   set_use_emutls="-DUSE_EMUTLS"
+ fi
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++echo "$as_me:$LINENO: checking for library containing copysignl" >&5
++echo $ECHO_N "checking for library containing copysignl... $ECHO_C" >&6
++if test "${libgcc_cv_copysignl_lib+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if { ac_try='${CC-cc} -S conftest.c -o conftest.s 1>&5'
++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); }; }
++    then
++       libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++
++fi
++echo "$as_me:$LINENO: result: $libgcc_cv_copysignl_lib" >&5
++echo "${ECHO_T}$libgcc_cv_copysignl_lib" >&6
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
+ 
+ # Conditionalize the makefile for this target machine.
+ tmake_file_=
+diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
+--- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
++++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
+@@ -238,6 +238,27 @@
+ fi
+ AC_SUBST(set_have_cc_tls)
+ 
++# On powerpc libgcc_s references copysignl which is a libm function but
++# glibc apparently also provides it via libc as opposed to uClibc where
++# it lives in libm.
++AC_CACHE_CHECK
++  libgcc_cv_copysignl_lib,
++    echo '#include <features.h>' > conftest.c
++    echo 'int the_libc = __UCLIBC__ + __powerpc__;' >> conftest.c
++    libgcc_cv_copysignl_lib="-lc"
++    if AC_TRY_COMMAND(${CC-cc} -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD)
++    then
++       libgcc_cv_copysignl_lib="-lm"
++    fi
++    rm -f conftest.*
++  ])
++
++case /${libgcc_cv_copysignl_lib}/ in
++  /-lm/) LIBGCC_LIBM="$LIBGCC_LIBM -lm" ;;
++  *) LIBGCC_LIBM= ;;
++esac
++AC_SUBST(LIBGCC_LIBM)
++
+ # See if we have emulated thread-local storage.
+ GCC_CHECK_EMUTLS
+ set_use_emutls=
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index c975bb5..d2c0e50 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -30,6 +30,10 @@ choice
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc 4.5.x"
 
+	config BR2_GCC_VERSION_4_6_X
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		bool "gcc 4.6.x"
+
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc snapshot"
@@ -54,6 +58,7 @@ config BR2_GCC_VERSION
 	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.5"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.2"     if BR2_GCC_VERSION_4_5_X
+	default "4.6.0"     if BR2_GCC_VERSION_4_6_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 886e99b..7a49068 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GCC_TARGET
 	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
-	select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
+	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X)
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
 	help
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 04b21e9..ebcca53 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -53,6 +53,11 @@ else
 GCC_OPTSPACE=--enable-target-optspace
 endif
 
+# gcc 4.6.x quadmath requires wchar
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+GCC_QUADMATH=--disable-libquadmath
+endif
+
 #############################################################
 #
 # Setup some initial stuff
@@ -107,24 +112,33 @@ ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 endif
 
+# GCC 4.x prerequisites
 GCC_WITH_HOST_GMP = --with-gmp=$(HOST_DIR)/usr
 GCC_WITH_HOST_MPFR = --with-mpfr=$(HOST_DIR)/usr
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 HOST_SOURCE += host-gmp-source host-mpfr-source
 endif
 GCC_HOST_PREREQ = host-gmp host-mpfr
+GCC_TARGET_PREREQ += mpfr gmp
 
+# GCC 4.5.x prerequisites
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+GCC_TARGET_PREREQ += mpc
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 HOST_SOURCE += host-mpc-source
 endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
-GCC_TARGET_PREREQ += mpfr gmp
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+# GCC 4.6.x prerequisites
+ifeq ($(findstring x4.6.,x$(GCC_VERSION)),x4.6.)
+GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
 GCC_TARGET_PREREQ += mpc
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_SOURCE += host-mpc-source
+endif
+GCC_HOST_PREREQ += host-mpc
 endif
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
@@ -219,6 +233,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
+		$(GCC_QUADMATH) \
 		--with-gnu-ld \
 		--disable-shared \
 		--disable-libssp \
@@ -285,6 +300,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
+		$(GCC_QUADMATH) \
 		--with-gnu-ld \
 		--enable-shared \
 		--disable-libssp \
@@ -362,6 +378,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(BR2_CONFIGURE_BUILD_TOOLS) \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
+		$(GCC_QUADMATH) \
 		--with-gnu-ld \
 		--disable-libssp \
 		--disable-multilib \
@@ -504,6 +521,8 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		--enable-languages=$(GCC_TARGET_LANGUAGES) \
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
+		$(GCC_OPTSPACE) \
+		$(GCC_QUADMATH) \
 		--with-gnu-ld \
 		--disable-libssp \
 		--disable-multilib \
-- 
1.7.3.4
