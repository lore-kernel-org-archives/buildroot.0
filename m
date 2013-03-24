From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 12:46:08 +0100
Subject: [Buildroot] [git commit] gcc: add support for gcc 4.8
Message-ID: <20130324130049.836249B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8103112ea8d9d03647a60f45768494dc14eaa1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for the recently released gcc 4.8. We re-add
the same patch series as the one used for 4.7.x, after refreshing the
patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.8.0/100-uclibc-conf.patch          |   37 ++++++
 toolchain/gcc/4.8.0/301-missing-execinfo_h.patch   |   13 ++
 toolchain/gcc/4.8.0/302-c99-snprintf.patch         |   13 ++
 .../gcc/4.8.0/305-libmudflap-susv3-legacy.patch    |   49 ++++++++
 toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch |   30 +++++
 toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch   |   13 ++
 .../powerpc-link-with-math-lib.patch.conditional   |  122 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |    5 +
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   10 ++
 9 files changed, 292 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/4.8.0/100-uclibc-conf.patch b/toolchain/gcc/4.8.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..d855b30
--- /dev/null
+++ b/toolchain/gcc/4.8.0/100-uclibc-conf.patch
@@ -0,0 +1,37 @@
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
+Index: gcc-4.8.0/libjava/classpath/ltconfig
+===================================================================
+--- gcc-4.8.0.orig/libjava/classpath/ltconfig	2011-02-13 12:45:53.000000000 +0100
++++ gcc-4.8.0/libjava/classpath/ltconfig	2013-03-23 17:39:04.000000000 +0100
+@@ -603,7 +603,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1247,7 +1247,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/toolchain/gcc/4.8.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.8.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..00efda2
--- /dev/null
+++ b/toolchain/gcc/4.8.0/301-missing-execinfo_h.patch
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
diff --git a/toolchain/gcc/4.8.0/302-c99-snprintf.patch b/toolchain/gcc/4.8.0/302-c99-snprintf.patch
new file mode 100644
index 0000000..cd4d2cc
--- /dev/null
+++ b/toolchain/gcc/4.8.0/302-c99-snprintf.patch
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
diff --git a/toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..35d5f50
--- /dev/null
+++ b/toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch
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
diff --git a/toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..c8cb377
--- /dev/null
+++ b/toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch
@@ -0,0 +1,30 @@
+Index: gcc-4.8.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.8.0.orig/gcc/config/arm/linux-elf.h	2013-01-10 21:38:27.000000000 +0100
++++ gcc-4.8.0/gcc/config/arm/linux-elf.h	2013-03-23 17:40:00.000000000 +0100
+@@ -55,7 +55,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
+Index: gcc-4.8.0/libgcc/config/arm/t-linux
+===================================================================
+--- gcc-4.8.0.orig/libgcc/config/arm/t-linux	2012-03-22 16:14:46.000000000 +0100
++++ gcc-4.8.0/libgcc/config/arm/t-linux	2013-03-23 17:40:54.000000000 +0100
+@@ -1,6 +1,11 @@
+ LIB1ASMSRC = arm/lib1funcs.S
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3
++	_ctzsi2 _arm_addsubdf3 _arm_addsubsf3 \
++	_arm_addsubdf3 _arm_addsubsf3 \
++	_arm_negdf2 _arm_muldivdf3 _arm_cmpdf2 _arm_unorddf2 \
++	_arm_fixdfsi _arm_fixunsdfsi _arm_truncdfsf2 \
++	_arm_negsf2 _arm_muldivsf3 _arm_cmpsf2 _arm_unordsf2 \
++	_arm_fixsfsi _arm_fixunssfsi
+ 
+ # Just for these, we omit the frame pointer since it makes such a big
+ # difference.
diff --git a/toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..37f8f2a
--- /dev/null
+++ b/toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch
@@ -0,0 +1,13 @@
+http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
+
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -45,7 +45,7 @@
+    The ARM10TDMI core is the default for armv5t, so set
+    SUBTARGET_CPU_DEFAULT to achieve this.  */
+ #undef  SUBTARGET_CPU_DEFAULT
+-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
++#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
+ 
+ /* TARGET_BIG_ENDIAN_DEFAULT is set in
+    config.gcc for big endian configurations.  */
diff --git a/toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..b7094fe
--- /dev/null
+++ b/toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional
@@ -0,0 +1,122 @@
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
+---
+ libgcc/Makefile.in  |    4 +++-
+ libgcc/configure    |   32 ++++++++++++++++++++++++++++++++
+ libgcc/configure.ac |   21 +++++++++++++++++++++
+ 3 files changed, 56 insertions(+), 1 deletion(-)
+
+Index: gcc-4.8.0/libgcc/Makefile.in
+===================================================================
+--- gcc-4.8.0.orig/libgcc/Makefile.in	2013-02-04 20:06:20.000000000 +0100
++++ gcc-4.8.0/libgcc/Makefile.in	2013-03-24 09:12:43.000000000 +0100
+@@ -41,6 +41,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ target_noncanonical = @target_noncanonical@
+@@ -927,9 +928,10 @@
+ 		@multilib_dir@,$(MULTIDIR),$(subst \
+ 		@shlib_objs@,$(objects) libgcc.a,$(subst \
+ 		@shlib_base_name@,libgcc_s,$(subst \
++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
+ 		@shlib_map_file@,$(mapfile),$(subst \
+ 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
+-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
+ 
+ libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
+ 	# @multilib_flags@ is still needed because this may use
+Index: gcc-4.8.0/libgcc/configure
+===================================================================
+--- gcc-4.8.0.orig/libgcc/configure	2012-11-05 00:08:42.000000000 +0100
++++ gcc-4.8.0/libgcc/configure	2013-03-24 09:12:43.000000000 +0100
+@@ -564,6 +564,7 @@
+ tmake_file
+ sfp_machine_header
+ set_use_emutls
++LIBGCC_LIBM
+ set_have_cc_tls
+ vis_hide
+ fixed_point
+@@ -4481,6 +4482,37 @@
+ 	fi
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
+Index: gcc-4.8.0/libgcc/configure.ac
+===================================================================
+--- gcc-4.8.0.orig/libgcc/configure.ac	2012-10-15 15:10:30.000000000 +0200
++++ gcc-4.8.0/libgcc/configure.ac	2013-03-24 09:12:43.000000000 +0100
+@@ -326,6 +326,27 @@
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
index d16e7b0..1499c05 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -34,6 +34,10 @@ choice
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc 4.7.x"
 
+	config BR2_GCC_VERSION_4_8_X
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		bool "gcc 4.8.x"
+
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc snapshot"
@@ -65,6 +69,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.2"     if BR2_GCC_VERSION_4_7_X
+	default "4.8.0"     if BR2_GCC_VERSION_4_8_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 3bfa13b..4f1bb49 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -191,6 +191,16 @@ endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
+# GCC 4.8.x prerequisites
+ifeq ($(findstring x4.8.,x$(GCC_VERSION)),x4.8.)
+GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+GCC_TARGET_PREREQ += mpc
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_SOURCE += host-mpc-source
+endif
+GCC_HOST_PREREQ += host-mpc
+endif
+
 # GCC snapshot prerequisites
 # Since we don't know and it can be quite new just ask for everything known
 ifneq ($(GCC_SNAP_DATE),)
