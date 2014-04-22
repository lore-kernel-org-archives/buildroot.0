From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Apr 2014 11:04:15 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain: add gcc 4.9 series
Message-ID: <1398175456-11622-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the recently released gcc 4.9.0.
Use 4.8.2 patches and remove those that no longer apply/are needed
(mostly PR fixes and xtensa).
libmudflap was removed upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/4.9.0/100-uclibc-conf.patch            |  15 +++
 package/gcc/4.9.0/301-missing-execinfo_h.patch     |  13 +++
 package/gcc/4.9.0/302-c99-snprintf.patch           |  13 +++
 package/gcc/4.9.0/810-arm-softfloat-libgcc.patch   |  30 +++++
 package/gcc/4.9.0/830-arm_unbreak_armv4t.patch     |  13 +++
 .../powerpc-link-with-math-lib.patch.conditional   | 122 +++++++++++++++++++++
 package/gcc/Config.in.host                         |   7 ++
 7 files changed, 213 insertions(+)
 create mode 100644 package/gcc/4.9.0/100-uclibc-conf.patch
 create mode 100644 package/gcc/4.9.0/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/4.9.0/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.9.0/810-arm-softfloat-libgcc.patch
 create mode 100644 package/gcc/4.9.0/830-arm_unbreak_armv4t.patch
 create mode 100644 package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional

diff --git a/package/gcc/4.9.0/100-uclibc-conf.patch b/package/gcc/4.9.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..d56bf0a
--- /dev/null
+++ b/package/gcc/4.9.0/100-uclibc-conf.patch
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
diff --git a/package/gcc/4.9.0/301-missing-execinfo_h.patch b/package/gcc/4.9.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..00efda2
--- /dev/null
+++ b/package/gcc/4.9.0/301-missing-execinfo_h.patch
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
diff --git a/package/gcc/4.9.0/302-c99-snprintf.patch b/package/gcc/4.9.0/302-c99-snprintf.patch
new file mode 100644
index 0000000..cd4d2cc
--- /dev/null
+++ b/package/gcc/4.9.0/302-c99-snprintf.patch
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
diff --git a/package/gcc/4.9.0/810-arm-softfloat-libgcc.patch b/package/gcc/4.9.0/810-arm-softfloat-libgcc.patch
new file mode 100644
index 0000000..c8cb377
--- /dev/null
+++ b/package/gcc/4.9.0/810-arm-softfloat-libgcc.patch
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
diff --git a/package/gcc/4.9.0/830-arm_unbreak_armv4t.patch b/package/gcc/4.9.0/830-arm_unbreak_armv4t.patch
new file mode 100644
index 0000000..37f8f2a
--- /dev/null
+++ b/package/gcc/4.9.0/830-arm_unbreak_armv4t.patch
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
diff --git a/package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional
new file mode 100644
index 0000000..b7094fe
--- /dev/null
+++ b/package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional
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
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4fd8ec9..6b44e94 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -58,6 +58,11 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8-arc"
 
+	config BR2_GCC_VERSION_4_9_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.9.x"
+
 	config BR2_GCC_VERSION_4_9_MICROBLAZE
 		depends on BR2_microblaze
 		select BR2_GCC_NEEDS_MPC
@@ -96,6 +101,7 @@ config BR2_GCC_VERSION
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
+	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
 	default "c6227bc154124e270f15793deddfa3fe18f7db54" if BR2_GCC_VERSION_4_8_ARC
 	default "b93bb009e021aba64dd4b8cdb0bbc5a176c55543" if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
@@ -159,6 +165,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	# There are architectures, or specific configurations for
 	# which mudflap is not supported.
 	depends on !BR2_avr32 && !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
+	depends on !BR2_GCC_VERSION_4_9_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
 	  debugging functionality. It is only needed if you intend to
-- 
1.8.3.2
