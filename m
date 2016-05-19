From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu, 19 May 2016 17:59:39 +0200
Subject: [Buildroot] [RFC/PATCH next 1/2] spidermonkey185: New package.
Message-ID: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
It is rather unmaintained, but some software still depend on it.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

There are many ugly things in here, I would like your advice/opinion
on whether this package can be upstreamable.

This commit is based on the 'next' branch.


 package/Config.in                                  |    1 +
 .../0001-fix-arm-compiler-flags.patch              |  340 ++
 .../0002-regenerate-configure.patch                | 5397 ++++++++++++++++++++
 package/spidermonkey185/Config.in                  |   15 +
 package/spidermonkey185/spidermonkey185.hash       |    2 +
 package/spidermonkey185/spidermonkey185.mk         |   51 +
 6 files changed, 5806 insertions(+)
 create mode 100644 package/spidermonkey185/0001-fix-arm-compiler-flags.patch
 create mode 100644 package/spidermonkey185/0002-regenerate-configure.patch
 create mode 100644 package/spidermonkey185/Config.in
 create mode 100644 package/spidermonkey185/spidermonkey185.hash
 create mode 100644 package/spidermonkey185/spidermonkey185.mk

diff --git a/package/Config.in b/package/Config.in
index 8668612..89caf32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -762,6 +762,7 @@ menu "External python modules"
 endmenu
 endif
 	source "package/ruby/Config.in"
+	source "package/spidermonkey185/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
diff --git a/package/spidermonkey185/0001-fix-arm-compiler-flags.patch b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
new file mode 100644
index 0000000..b0e188d
--- /dev/null
+++ b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
@@ -0,0 +1,340 @@
+# HG changeset patch
+# User Mike Hommey <mh+mozilla@glandium.org>
+# Date 1304348823 -7200
+# Node ID e38cec9f833829a6137c03f4f1d282aca4063fcd
+# Parent  6322e8f7cb2dd4e393b7ad18acbc09f1bae69771
+Bug 626035 - Modify the way arm compiler flags are set in configure
+[nicolas.cavallari: refresh the patch]
+
+From: https://bug626035.bmoattachments.org/attachment.cgi?id=529479
+
+--- spidermonkey185-185-1.0.0/js/src/configure.in	2011-03-31 21:08:36.000000000 +0200
++++ spidermonkey185-185-1.0.0/js/src/configure.in	2016-04-26 12:18:31.107502479 +0200
+@@ -3535,33 +3535,6 @@
+     AC_CHECK_LIB(socket, socket)
+ esac
+ 
+-AC_MSG_CHECKING(for ARM SIMD support in compiler)
+-AC_TRY_COMPILE([],
+-               [asm("uqadd8 r1, r1, r2");],
+-               result="yes", result="no")
+-AC_MSG_RESULT("$result")
+-if test "$result" = "yes"; then
+-    AC_DEFINE(HAVE_ARM_SIMD)
+-    HAVE_ARM_SIMD=1
+-fi
+-AC_SUBST(HAVE_ARM_SIMD)
+-
+-AC_MSG_CHECKING(for ARM NEON support in compiler)
+-_SAVE_CFLAGS="$CFLAGS"
+-if test "$GNU_CC"; then
+-  # gcc needs -mfpu=neon to recognize NEON instructions
+-  CFLAGS="$CFLAGS -mfpu=neon -mfloat-abi=softfp"
+-fi
+-AC_TRY_COMPILE([],
+-               [asm("vadd.i8 d0, d0, d0");],
+-               result="yes", result="no")
+-AC_MSG_RESULT("$result")
+-if test "$result" = "yes"; then
+-    AC_DEFINE(HAVE_ARM_NEON)
+-    HAVE_ARM_NEON=1
+-fi
+-CFLAGS="$_SAVE_CFLAGS"
+-AC_SUBST(HAVE_ARM_NEON)
+ 
+ dnl ========================================================
+ dnl = pthread support
+@@ -4602,13 +4575,11 @@
+ BUILD_STATIC_LIBS=
+ ENABLE_TESTS=1
+ 
+-MOZ_THUMB2=
+ USE_ARM_KUSER=
+ 
+ case "${target}" in
+     arm-android-eabi)
+         USE_ARM_KUSER=1
+-        MOZ_THUMB2=1
+         ;;
+ esac
+ 
+@@ -4654,80 +4625,204 @@
+ dnl ========================================================
+ MOZ_ARG_HEADER(Individual module options)
+ 
+-dnl Setup default CPU arch for arm target
+-case "$target_cpu" in
+-  arm*)
+-    MOZ_ARM_ARCH=armv7
+-  ;;
+-esac
+ dnl ========================================================
+-dnl = Enable building the Thumb2 instruction set
++dnl = ARM toolchain tweaks
+ dnl ========================================================
+-MOZ_ARG_ENABLE_BOOL(thumb2,
+- [  --enable-thumb2         Enable Thumb2 instruction set (implies ARMv7)],
+-    MOZ_THUMB2=1,
+-    MOZ_THUMB2=)
+-if test -n "$MOZ_THUMB2"; then
+-  MOZ_ARM_ARCH=armv7
++
++dnl Defaults
++case "${target}" in
++arm-android-eabi)
++    MOZ_THUMB=yes
++    MOZ_ARCH=armv7-a
++    MOZ_FPU=vfp
++    MOZ_FLOAT_ABI=softfp
++    ;;
++arm*-*)
++    if test -n "$MOZ_PLATFORM_MAEMO"; then
++        MOZ_THUMB=no
++        MOZ_ARCH=armv7-a
++        MOZ_FLOAT_ABI=softfp
++    fi
++    if test "$MOZ_PLATFORM_MAEMO" = 6; then
++        MOZ_THUMB=yes
++    fi
++    ;;
++esac
++
++dnl Kept for compatibility with some buildbot mozconfig
++MOZ_ARG_DISABLE_BOOL(thumb2, [], MOZ_THUMB=no, MOZ_THUMB=yes)
++
++MOZ_ARG_WITH_STRING(thumb,
++[  --with-thumb[[=yes|no|toolchain-default]]]
++[                          Use Thumb instruction set (-mthumb)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-thumb is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_THUMB=$withval)
++
++MOZ_ARG_WITH_STRING(thumb-interwork,
++[  --with-thumb-interwork[[=yes|no|toolchain-default]]
++                           Use Thumb/ARM instuctions interwork (-mthumb-interwork)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-thumb-interwork is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_THUMB_INTERWORK=$withval)
++
++MOZ_ARG_WITH_STRING(arch,
++[  --with-arch=[[type|toolchain-default]]
++                           Use specific CPU features (-march=type)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-arch is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_ARCH=$withval)
++
++MOZ_ARG_WITH_STRING(fpu,
++[  --with-fpu=[[type|toolchain-default]]
++                           Use specific FPU type (-mfpu=type)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-fpu is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_FPU=$withval)
++
++MOZ_ARG_WITH_STRING(float-abi,
++[  --with-float-abi=[[type|toolchain-default]]
++                           Use specific arm float ABI (-mfloat-abi=type)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-float-abi is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_FLOAT_ABI=$withval)
++
++MOZ_ARG_WITH_STRING(soft-float,
++[  --with-soft-float[[=yes|no|toolchain-default]]
++                           Use soft float library (-msoft-float)],
++    if test -z "$GNU_CC"; then
++        AC_MSG_ERROR([--with-soft-float is not supported on non-GNU toolchain-defaults])
++    fi
++    MOZ_SOFT_FLOAT=$withval)
++
++case "$MOZ_ARCH" in
++toolchain-default|"")
++    arch_flag=""
++    ;;
++*)
++    arch_flag="-march=$MOZ_ARCH"
++    ;;
++esac
++
++case "$MOZ_THUMB" in
++yes)
++    MOZ_THUMB2=1
++    thumb_flag="-mthumb"
++    ;;
++no)
++    MOZ_THUMB2=
++    thumb_flag="-marm"
++    ;;
++*)
++    _SAVE_CFLAGS="$CFLAGS"
++    CFLAGS="$arch_flag"
++    AC_TRY_COMPILE([],[return sizeof(__thumb2__);],
++        MOZ_THUMB2=1,
++        MOZ_THUMB2=)
++    CFLAGS="$_SAVE_CFLAGS"
++    thumb_flag=""
++    ;;
++esac
++
++if test "$MOZ_THUMB2" = 1; then
++    AC_DEFINE(MOZ_THUMB2)
+ fi
+ 
+-dnl ========================================================
+-dnl = Enable building for ARM specific CPU features
+-dnl ========================================================
+-MOZ_ARG_WITH_STRING(cpu-arch,
+-[  --with-cpu-arch=arch      Use specific arm architecture CPU features, default armv7],
+-    MOZ_ARM_ARCH=$withval)
++case "$MOZ_THUMB_INTERWORK" in
++yes)
++    thumb_interwork_flag="-mthumb-interwork"
++    ;;
++no)
++    thumb_interwork_flag="-mno-thumb-interwork"
++    ;;
++*) # toolchain-default
++    thumb_interwork_flag=""
++    ;;
++esac
+ 
+-if test -n "$MOZ_THUMB2"; then
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$MOZ_ARM_ARCH" != "armv7"; then
+-        AC_MSG_ERROR([--enable-thumb2 is not compatible with cpu-arch=$MOZ_ARM_ARCH])
+-      fi
+-      if test "$GNU_CC"; then
+-        AC_DEFINE(MOZ_THUMB2)
+-        AC_DEFINE(MOZ_ARM_ARCH)
+-        CFLAGS="$CFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-      else
+-        AC_MSG_ERROR([--enable-thumb2 is not supported for non-GNU toolchains])
+-      fi
++case "$MOZ_FPU" in
++toolchain-default|"")
++    fpu_flag=""
+     ;;
+-    *)
+-      AC_MSG_ERROR([--enable-thumb2 is not supported for non-ARM CPU architectures])
++*)
++    fpu_flag="-mfpu=$MOZ_FPU"
+     ;;
+-  esac
+-elif test "$MOZ_ARM_ARCH" = "armv7"; then
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$GNU_CC"; then
+-        AC_DEFINE(MOZ_ARM_ARCH)
+-        CFLAGS="$CFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-      else
+-        AC_MSG_ERROR([--with-cpu-arch=armv7 is not supported for non-GNU toolchains])
+-      fi
++esac
++
++case "$MOZ_FLOAT_ABI" in
++toolchain-default|"")
++    float_abi_flag=""
+     ;;
+-    *)
+-      AC_MSG_ERROR([--with-cpu-arch=armv7 is not supported for non-ARM CPU architectures])
++*)
++    float_abi_flag="-mfloat-abi=$MOZ_FLOAT_ABI"
+     ;;
+-  esac
+-else
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$GNU_CC"; then
+-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-      fi
+-      ;;
+-  esac
++esac
++
++case "$MOZ_SOFT_FLOAT" in
++yes)
++    soft_float_flag="-msoft-float"
++    ;;
++no)
++    soft_float_flag="-mno-soft-float"
++    ;;
++*) # toolchain-default
++    soft_float_flag=""
++    ;;
++esac
++
++dnl Use echo to avoid accumulating space characters
++all_flags=`echo $arch_flag $thumb_flag $thumb_interwork_flag $fpu_flag $float_abi_flag $soft_float_flag`
++if test -n "$all_flags"; then
++    _SAVE_CFLAGS="$CFLAGS"
++    CFLAGS="$all_flags"
++    AC_MSG_CHECKING(whether the chosen combination of compiler flags ($all_flags) works)
++    AC_TRY_COMPILE([],[return 0;],
++        AC_MSG_RESULT([yes]),
++        AC_MSG_ERROR([no]))
++
++    CFLAGS="$_SAVE_CFLAGS $all_flags"
++    CXXFLAGS="$CXXFLAGS $all_flags"
++    ASFLAGS="$ASFLAGS $all_flags"
++    if test -n "$thumb_flag"; then
++        LDFLAGS="$LDFLAGS $thumb_flag"
++    fi
+ fi
+ 
+ AC_SUBST(MOZ_THUMB2)
+-AC_SUBST(MOZ_ARM_ARCH)
++
++if test "$CPU_ARCH" = "arm"; then
++  AC_MSG_CHECKING(for ARM SIMD support in compiler)
++  # We try to link so that this also fails when
++  # building with LTO.
++  AC_TRY_LINK([],
++                 [asm("uqadd8 r1, r1, r2");],
++                 result="yes", result="no")
++  AC_MSG_RESULT("$result")
++  if test "$result" = "yes"; then
++      AC_DEFINE(HAVE_ARM_SIMD)
++      HAVE_ARM_SIMD=1
++  fi
++
++  AC_MSG_CHECKING(for ARM NEON support in compiler)
++  # We try to link so that this also fails when
++  # building with LTO.
++  AC_TRY_LINK([],
++                 [asm(".fpu neon\n vadd.i8 d0, d0, d0");],
++                 result="yes", result="no")
++  AC_MSG_RESULT("$result")
++  if test "$result" = "yes"; then
++      AC_DEFINE(HAVE_ARM_NEON)
++      HAVE_ARM_NEON=1
++  fi
++fi # CPU_ARCH = arm
++
++AC_SUBST(HAVE_ARM_SIMD)
++AC_SUBST(HAVE_ARM_NEON)
+ 
+ dnl ========================================================
+ dnl =
+@@ -6135,12 +6230,6 @@
+   if test "$OS_ARCH" = "OS2"; then
+     ac_configure_args="$ac_configure_args CFLAGS=-Zomf AR=emxomfar"
+   fi
+-  if test -n "$MOZ_THUMB2"; then
+-    ac_configure_args="$ac_configure_args --enable-thumb2"
+-  fi
+-  if test -n "$MOZ_ARM_ARCH"; then
+-    ac_configure_args="$ac_configure_args --with-cpu-arch=$MOZ_ARM_ARCH"
+-  fi
+ 
+   # Use a separate cache file for libffi, since it does things differently
+   # from our configure.
diff --git a/package/spidermonkey185/0002-regenerate-configure.patch b/package/spidermonkey185/0002-regenerate-configure.patch
new file mode 100644
index 0000000..97b2247
--- /dev/null
+++ b/package/spidermonkey185/0002-regenerate-configure.patch
@@ -0,0 +1,5397 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+Regenerate the configure script using the antique autoconf 2.13.
+
+Signed-Off-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+
+--- spidermonkey185-1.0.0/js/src/configure	2016-04-26 13:19:37.878792673 +0200
++++ spidermonkey185-1.0.0/js/src/configure	2016-04-26 13:21:13.998997120 +0200
+@@ -106,9 +106,25 @@
+ ac_help="$ac_help
+   --disable-tests         Do not build test libraries & programs"
+ ac_help="$ac_help
+-  --enable-thumb2         Enable Thumb2 instruction set (implies ARMv7)"
++"
++ac_help="$ac_help
++  --with-thumb[[=yes|no|toolchain-default]]
++                          Use Thumb instruction set (-mthumb)"
++ac_help="$ac_help
++  --with-thumb-interwork[[=yes|no|toolchain-default]]
++                           Use Thumb/ARM instuctions interwork (-mthumb-interwork)"
++ac_help="$ac_help
++  --with-arch=[[type|toolchain-default]]
++                           Use specific CPU features (-march=type)"
+ ac_help="$ac_help
+-  --with-cpu-arch=arch      Use specific arm architecture CPU features, default armv7"
++  --with-fpu=[[type|toolchain-default]]
++                           Use specific FPU type (-mfpu=type)"
++ac_help="$ac_help
++  --with-float-abi=[[type|toolchain-default]]
++                           Use specific arm float ABI (-mfloat-abi=type)"
++ac_help="$ac_help
++  --with-soft-float[[=yes|no|toolchain-default]]
++                           Use soft float library (-msoft-float)"
+ ac_help="$ac_help
+   --enable-debug[=DBG]    Enable building with developer debug info
+                            (using compiler flags DBG)"
+@@ -755,7 +771,7 @@
+ fi
+ 
+ echo $ac_n "checking host system type""... $ac_c" 1>&6
+-echo "configure:759: checking host system type" >&5
++echo "configure:775: checking host system type" >&5
+ 
+ host_alias=$host
+ case "$host_alias" in
+@@ -776,7 +792,7 @@
+ echo "$ac_t""$host" 1>&6
+ 
+ echo $ac_n "checking target system type""... $ac_c" 1>&6
+-echo "configure:780: checking target system type" >&5
++echo "configure:796: checking target system type" >&5
+ 
+ target_alias=$target
+ case "$target_alias" in
+@@ -794,7 +810,7 @@
+ echo "$ac_t""$target" 1>&6
+ 
+ echo $ac_n "checking build system type""... $ac_c" 1>&6
+-echo "configure:798: checking build system type" >&5
++echo "configure:814: checking build system type" >&5
+ 
+ build_alias=$build
+ case "$build_alias" in
+@@ -855,7 +871,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:859: checking for $ac_word" >&5
++echo "configure:875: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AWK'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -979,7 +995,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:983: checking for $ac_word" >&5
++echo "configure:999: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PERL'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1190,13 +1206,13 @@
+     _SAVE_LDFLAGS="$LDFLAGS"
+ 
+     echo $ac_n "checking for host c compiler""... $ac_c" 1>&6
+-echo "configure:1194: checking for host c compiler" >&5
++echo "configure:1210: checking for host c compiler" >&5
+     for ac_prog in $HOST_CC gcc cc /usr/ucb/cc cl icc
+ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1200: checking for $ac_word" >&5
++echo "configure:1216: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1231,13 +1247,13 @@
+     fi
+     echo "$ac_t""$HOST_CC" 1>&6
+     echo $ac_n "checking for host c++ compiler""... $ac_c" 1>&6
+-echo "configure:1235: checking for host c++ compiler" >&5
++echo "configure:1251: checking for host c++ compiler" >&5
+     for ac_prog in $HOST_CXX $CCC c++ g++ gcc CC cxx cc++ cl icc
+ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1241: checking for $ac_word" >&5
++echo "configure:1257: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1289,7 +1305,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1293: checking for $ac_word" >&5
++echo "configure:1309: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1324,7 +1340,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1328: checking for $ac_word" >&5
++echo "configure:1344: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1359,16 +1375,16 @@
+     LDFLAGS="$HOST_LDFLAGS"
+ 
+     echo $ac_n "checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1363: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
++echo "configure:1379: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 1365 "configure"
++#line 1381 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:1372: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:1388: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_prog_hostcc_works=1 echo "$ac_t""yes" 1>&6
+ else
+@@ -1383,16 +1399,16 @@
+     CFLAGS="$HOST_CXXFLAGS"
+ 
+     echo $ac_n "checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1387: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
++echo "configure:1403: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 1389 "configure"
++#line 1405 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:1396: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:1412: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_prog_hostcxx_works=1 echo "$ac_t""yes" 1>&6
+ else
+@@ -1456,7 +1472,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1460: checking for $ac_word" >&5
++echo "configure:1476: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1490,7 +1506,7 @@
+     # Extract the first word of "gcc", so it can be a program name with args.
+ set dummy gcc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1494: checking for $ac_word" >&5
++echo "configure:1510: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1520,7 +1536,7 @@
+   # Extract the first word of "cc", so it can be a program name with args.
+ set dummy cc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1524: checking for $ac_word" >&5
++echo "configure:1540: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1571,7 +1587,7 @@
+       # Extract the first word of "cl", so it can be a program name with args.
+ set dummy cl; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1575: checking for $ac_word" >&5
++echo "configure:1591: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1603,7 +1619,7 @@
+ fi
+ 
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1607: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
++echo "configure:1623: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=c
+ # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -1614,12 +1630,12 @@
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 1618 "configure"
++#line 1634 "configure"
+ #include "confdefs.h"
+ 
+ main(){return(0);}
+ EOF
+-if { (eval echo configure:1623: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:1639: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -1645,12 +1661,12 @@
+   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:1649: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:1665: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
+-echo "configure:1654: checking whether we are using GNU C" >&5
++echo "configure:1670: checking whether we are using GNU C" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1659,7 +1675,7 @@
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1663: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1679: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gcc=yes
+ else
+   ac_cv_prog_gcc=no
+@@ -1678,7 +1694,7 @@
+ ac_save_CFLAGS="$CFLAGS"
+ CFLAGS=
+ echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
+-echo "configure:1682: checking whether ${CC-cc} accepts -g" >&5
++echo "configure:1698: checking whether ${CC-cc} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1714,7 +1730,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1718: checking for $ac_word" >&5
++echo "configure:1734: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1750,7 +1766,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1754: checking for $ac_word" >&5
++echo "configure:1770: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1782,7 +1798,7 @@
+ 
+ 
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1786: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
++echo "configure:1802: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -1793,12 +1809,12 @@
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 1797 "configure"
++#line 1813 "configure"
+ #include "confdefs.h"
+ 
+ int main(){return(0);}
+ EOF
+-if { (eval echo configure:1802: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:1818: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cxx_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -1824,12 +1840,12 @@
+   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:1828: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:1844: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
+-echo "configure:1833: checking whether we are using GNU C++" >&5
++echo "configure:1849: checking whether we are using GNU C++" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1838,7 +1854,7 @@
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:1842: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:1858: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gxx=yes
+ else
+   ac_cv_prog_gxx=no
+@@ -1857,7 +1873,7 @@
+ ac_save_CXXFLAGS="$CXXFLAGS"
+ CXXFLAGS=
+ echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
+-echo "configure:1861: checking whether ${CXX-g++} accepts -g" >&5
++echo "configure:1877: checking whether ${CXX-g++} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1901,7 +1917,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1905: checking for $ac_word" >&5
++echo "configure:1921: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1936,7 +1952,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1940: checking for $ac_word" >&5
++echo "configure:1956: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1971,7 +1987,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1975: checking for $ac_word" >&5
++echo "configure:1991: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2025,7 +2041,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2029: checking for $ac_word" >&5
++echo "configure:2045: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2060,7 +2076,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2064: checking for $ac_word" >&5
++echo "configure:2080: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2095,7 +2111,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2099: checking for $ac_word" >&5
++echo "configure:2115: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2135,7 +2151,7 @@
+     # Extract the first word of "gcc", so it can be a program name with args.
+ set dummy gcc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2139: checking for $ac_word" >&5
++echo "configure:2155: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2165,7 +2181,7 @@
+   # Extract the first word of "cc", so it can be a program name with args.
+ set dummy cc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2169: checking for $ac_word" >&5
++echo "configure:2185: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2216,7 +2232,7 @@
+       # Extract the first word of "cl", so it can be a program name with args.
+ set dummy cl; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2220: checking for $ac_word" >&5
++echo "configure:2236: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2248,7 +2264,7 @@
+ fi
+ 
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:2252: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
++echo "configure:2268: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=c
+ # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -2259,12 +2275,12 @@
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 2263 "configure"
++#line 2279 "configure"
+ #include "confdefs.h"
+ 
+ main(){return(0);}
+ EOF
+-if { (eval echo configure:2268: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:2284: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -2290,12 +2306,12 @@
+   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:2294: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:2310: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
+-echo "configure:2299: checking whether we are using GNU C" >&5
++echo "configure:2315: checking whether we are using GNU C" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2304,7 +2320,7 @@
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2308: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2324: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gcc=yes
+ else
+   ac_cv_prog_gcc=no
+@@ -2323,7 +2339,7 @@
+ ac_save_CFLAGS="$CFLAGS"
+ CFLAGS=
+ echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
+-echo "configure:2327: checking whether ${CC-cc} accepts -g" >&5
++echo "configure:2343: checking whether ${CC-cc} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2359,7 +2375,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2363: checking for $ac_word" >&5
++echo "configure:2379: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2391,7 +2407,7 @@
+ 
+ 
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:2395: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
++echo "configure:2411: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -2402,12 +2418,12 @@
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 2406 "configure"
++#line 2422 "configure"
+ #include "confdefs.h"
+ 
+ int main(){return(0);}
+ EOF
+-if { (eval echo configure:2411: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:2427: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cxx_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -2433,12 +2449,12 @@
+   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:2437: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:2453: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
+-echo "configure:2442: checking whether we are using GNU C++" >&5
++echo "configure:2458: checking whether we are using GNU C++" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2447,7 +2463,7 @@
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2451: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2467: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gxx=yes
+ else
+   ac_cv_prog_gxx=no
+@@ -2466,7 +2482,7 @@
+ ac_save_CXXFLAGS="$CXXFLAGS"
+ CXXFLAGS=
+ echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
+-echo "configure:2470: checking whether ${CXX-g++} accepts -g" >&5
++echo "configure:2486: checking whether ${CXX-g++} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2500,7 +2516,7 @@
+     # Extract the first word of "ranlib", so it can be a program name with args.
+ set dummy ranlib; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2504: checking for $ac_word" >&5
++echo "configure:2520: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2532,7 +2548,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2536: checking for $ac_word" >&5
++echo "configure:2552: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2586,7 +2602,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2590: checking for $ac_word" >&5
++echo "configure:2606: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2621,7 +2637,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2625: checking for $ac_word" >&5
++echo "configure:2641: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2656,7 +2672,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2660: checking for $ac_word" >&5
++echo "configure:2676: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2691,7 +2707,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2695: checking for $ac_word" >&5
++echo "configure:2711: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2838,14 +2854,14 @@
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+         cat > conftest.$ac_ext <<EOF
+-#line 2842 "configure"
++#line 2858 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+  printf("Hello World\n"); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2849: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2865: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -2863,14 +2879,14 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+         cat > conftest.$ac_ext <<EOF
+-#line 2867 "configure"
++#line 2883 "configure"
+ #include "confdefs.h"
+ #include <new.h>
+ int main() {
+  unsigned *test = new unsigned(42); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2874: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2890: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -2986,7 +3002,7 @@
+         # Windows Server 2008 and newer SDKs have WinSDKVer.h, get the version
+         # from there
+         echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
+-echo "configure:2990: checking how to run the C preprocessor" >&5
++echo "configure:3006: checking how to run the C preprocessor" >&5
+ # On Suns, sometimes $CPP names a directory.
+ if test -n "$CPP" && test -d "$CPP"; then
+   CPP=
+@@ -3001,13 +3017,13 @@
+   # On the NeXT, cc -E runs the code through the compiler's parser,
+   # not just through cpp.
+   cat > conftest.$ac_ext <<EOF
+-#line 3005 "configure"
++#line 3021 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3011: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3027: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3018,13 +3034,13 @@
+   rm -rf conftest*
+   CPP="${CC-cc} -E -traditional-cpp"
+   cat > conftest.$ac_ext <<EOF
+-#line 3022 "configure"
++#line 3038 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3028: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3044: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3035,13 +3051,13 @@
+   rm -rf conftest*
+   CPP="${CC-cc} -nologo -E"
+   cat > conftest.$ac_ext <<EOF
+-#line 3039 "configure"
++#line 3055 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3045: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3061: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3069,17 +3085,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:3073: checking for $ac_hdr" >&5
++echo "configure:3089: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 3078 "configure"
++#line 3094 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3083: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3099: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -3111,7 +3127,7 @@
+             # This is done because the Windows 7 beta SDK reports its
+             # NTDDI_MAXVER to be 0x06000100 instead of 0x06010000, as it should
+             echo $ac_n "checking for highest Windows version supported by this SDK""... $ac_c" 1>&6
+-echo "configure:3115: checking for highest Windows version supported by this SDK" >&5
++echo "configure:3131: checking for highest Windows version supported by this SDK" >&5
+ if eval "test \"`echo '$''{'ac_cv_winsdk_maxver'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3141,17 +3157,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:3145: checking for $ac_hdr" >&5
++echo "configure:3161: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 3150 "configure"
++#line 3166 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3155: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3171: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -3188,7 +3204,7 @@
+         unset _MSVC_VER_FILTER
+ 
+         echo $ac_n "checking for std::_Throw""... $ac_c" 1>&6
+-echo "configure:3192: checking for std::_Throw" >&5
++echo "configure:3208: checking for std::_Throw" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_std__Throw'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3204,14 +3220,14 @@
+                 _SAVE_CXXFLAGS="$CXXFLAGS"
+                 CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                 cat > conftest.$ac_ext <<EOF
+-#line 3208 "configure"
++#line 3224 "configure"
+ #include "confdefs.h"
+ #include <exception>
+ int main() {
+ std::_Throw(std::exception()); return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3215: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3231: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_std__Throw="yes"
+ else
+@@ -3236,7 +3252,7 @@
+ 
+         if test "$ac_cv_have_std__Throw" == "yes"; then
+             echo $ac_n "checking for |class __declspec(dllimport) exception| bug""... $ac_c" 1>&6
+-echo "configure:3240: checking for |class __declspec(dllimport) exception| bug" >&5
++echo "configure:3256: checking for |class __declspec(dllimport) exception| bug" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_dllimport_exception_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3252,14 +3268,14 @@
+                     _SAVE_CXXFLAGS="$CXXFLAGS"
+                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                     cat > conftest.$ac_ext <<EOF
+-#line 3256 "configure"
++#line 3272 "configure"
+ #include "confdefs.h"
+ #include <vector>
+ int main() {
+ std::vector<int> v; return v.at(1);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3263: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:3279: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_dllimport_exception_bug="no"
+ else
+@@ -3291,7 +3307,7 @@
+             fi
+         else
+             echo $ac_n "checking for overridable _RAISE""... $ac_c" 1>&6
+-echo "configure:3295: checking for overridable _RAISE" >&5
++echo "configure:3311: checking for overridable _RAISE" >&5
+ if eval "test \"`echo '$''{'ac_cv_have__RAISE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3307,7 +3323,7 @@
+                     _SAVE_CXXFLAGS="$CXXFLAGS"
+                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                     cat > conftest.$ac_ext <<EOF
+-#line 3311 "configure"
++#line 3327 "configure"
+ #include "confdefs.h"
+ #include <xstddef>
+                                     #undef _RAISE
+@@ -3318,7 +3334,7 @@
+ std::vector<int> v; return v.at(1);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3322: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3338: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have__RAISE="no"
+ else
+@@ -3360,9 +3376,9 @@
+         _W32API_MAJOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $1 }'`
+         _W32API_MINOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $2 }'`
+         echo $ac_n "checking for w32api version >= $W32API_VERSION""... $ac_c" 1>&6
+-echo "configure:3364: checking for w32api version >= $W32API_VERSION" >&5
++echo "configure:3380: checking for w32api version >= $W32API_VERSION" >&5
+         cat > conftest.$ac_ext <<EOF
+-#line 3366 "configure"
++#line 3382 "configure"
+ #include "confdefs.h"
+ #include <w32api.h>
+ int main() {
+@@ -3374,7 +3390,7 @@
+             
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3378: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3394: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+    res=yes 
+ else
+@@ -3390,7 +3406,7 @@
+         fi
+         # Check windres version
+         echo $ac_n "checking for windres version >= $WINDRES_VERSION""... $ac_c" 1>&6
+-echo "configure:3394: checking for windres version >= $WINDRES_VERSION" >&5
++echo "configure:3410: checking for windres version >= $WINDRES_VERSION" >&5
+         _WINDRES_VERSION=`${WINDRES} --version 2>&1 | grep -i windres 2>/dev/null | $AWK '{ print $3 }'`
+         echo "$ac_t""$_WINDRES_VERSION" 1>&6
+         _WINDRES_MAJOR_VERSION=`echo $_WINDRES_VERSION | $AWK -F\. '{ print $1 }'`
+@@ -3430,7 +3446,7 @@
+     # If the maximum version supported by this SDK is lower than the target
+     # version, error out
+     echo $ac_n "checking for Windows SDK being recent enough""... $ac_c" 1>&6
+-echo "configure:3434: checking for Windows SDK being recent enough" >&5
++echo "configure:3450: checking for Windows SDK being recent enough" >&5
+     if $PERL -e "exit(0x$MOZ_WINSDK_TARGETVER > $MOZ_WINSDK_MAXVER)"; then
+         echo "$ac_t"""yes"" 1>&6
+     else
+@@ -3461,10 +3477,10 @@
+ if test "$CC" != "icc" -a -z "$_WIN32_MSVC"; then
+     if test "x$CC" != xcc; then
+   echo $ac_n "checking whether $CC and cc understand -c and -o together""... $ac_c" 1>&6
+-echo "configure:3465: checking whether $CC and cc understand -c and -o together" >&5
++echo "configure:3481: checking whether $CC and cc understand -c and -o together" >&5
+ else
+   echo $ac_n "checking whether cc understands -c and -o together""... $ac_c" 1>&6
+-echo "configure:3468: checking whether cc understands -c and -o together" >&5
++echo "configure:3484: checking whether cc understands -c and -o together" >&5
+ fi
+ set dummy $CC; ac_cc="`echo $2 |
+ 		       sed -e 's/[^a-zA-Z0-9_]/_/g' -e 's/^[0-9]/_/'`"
+@@ -3476,16 +3492,16 @@
+ # We do the test twice because some compilers refuse to overwrite an
+ # existing .o file with -o, though they will create one.
+ ac_try='${CC-cc} -c conftest.c -o conftest.o 1>&5'
+-if { (eval echo configure:3480: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; } &&
+-   test -f conftest.o && { (eval echo configure:3481: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; };
++if { (eval echo configure:3496: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; } &&
++   test -f conftest.o && { (eval echo configure:3497: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; };
+ then
+   eval ac_cv_prog_cc_${ac_cc}_c_o=yes
+   if test "x$CC" != xcc; then
+     # Test first that cc exists at all.
+-    if { ac_try='cc -c conftest.c 1>&5'; { (eval echo configure:3486: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; }; then
++    if { ac_try='cc -c conftest.c 1>&5'; { (eval echo configure:3502: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; }; then
+       ac_try='cc -c conftest.c -o conftest.o 1>&5'
+-      if { (eval echo configure:3488: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; } &&
+-	 test -f conftest.o && { (eval echo configure:3489: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; };
++      if { (eval echo configure:3504: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; } &&
++	 test -f conftest.o && { (eval echo configure:3505: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; };
+       then
+         # cc works too.
+         :
+@@ -3521,7 +3537,7 @@
+ fi
+ 
+ echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
+-echo "configure:3525: checking how to run the C preprocessor" >&5
++echo "configure:3541: checking how to run the C preprocessor" >&5
+ # On Suns, sometimes $CPP names a directory.
+ if test -n "$CPP" && test -d "$CPP"; then
+   CPP=
+@@ -3536,13 +3552,13 @@
+   # On the NeXT, cc -E runs the code through the compiler's parser,
+   # not just through cpp.
+   cat > conftest.$ac_ext <<EOF
+-#line 3540 "configure"
++#line 3556 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3546: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3562: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3553,13 +3569,13 @@
+   rm -rf conftest*
+   CPP="${CC-cc} -E -traditional-cpp"
+   cat > conftest.$ac_ext <<EOF
+-#line 3557 "configure"
++#line 3573 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3563: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3579: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3570,13 +3586,13 @@
+   rm -rf conftest*
+   CPP="${CC-cc} -nologo -E"
+   cat > conftest.$ac_ext <<EOF
+-#line 3574 "configure"
++#line 3590 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3580: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3596: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3601,7 +3617,7 @@
+ echo "$ac_t""$CPP" 1>&6
+ 
+ echo $ac_n "checking how to run the C++ preprocessor""... $ac_c" 1>&6
+-echo "configure:3605: checking how to run the C++ preprocessor" >&5
++echo "configure:3621: checking how to run the C++ preprocessor" >&5
+ if test -z "$CXXCPP"; then
+ if eval "test \"`echo '$''{'ac_cv_prog_CXXCPP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -3614,12 +3630,12 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+   CXXCPP="${CXX-g++} -E"
+   cat > conftest.$ac_ext <<EOF
+-#line 3618 "configure"
++#line 3634 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3623: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3639: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3709,7 +3725,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3713: checking for $ac_word" >&5
++echo "configure:3729: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_SBCONF'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3776,7 +3792,7 @@
+ # SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
+ # ./install, which can be erroneously created by make from ./install.sh.
+ echo $ac_n "checking for a BSD compatible install""... $ac_c" 1>&6
+-echo "configure:3780: checking for a BSD compatible install" >&5
++echo "configure:3796: checking for a BSD compatible install" >&5
+ if test -z "$INSTALL"; then
+ if eval "test \"`echo '$''{'ac_cv_path_install'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -3829,7 +3845,7 @@
+ test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
+ 
+ echo $ac_n "checking whether ln -s works""... $ac_c" 1>&6
+-echo "configure:3833: checking whether ln -s works" >&5
++echo "configure:3849: checking whether ln -s works" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LN_S'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3852,7 +3868,7 @@
+ 
+ if test -z "$TINDERBOX_SKIP_PERL_VERSION_CHECK"; then
+ echo $ac_n "checking for minimum required perl version >= $PERL_VERSION""... $ac_c" 1>&6
+-echo "configure:3856: checking for minimum required perl version >= $PERL_VERSION" >&5
++echo "configure:3872: checking for minimum required perl version >= $PERL_VERSION" >&5
+ _perl_version=`PERL_VERSION=$PERL_VERSION $PERL -e 'print "$]"; if ($] >= $ENV{PERL_VERSION}) { exit(0); } else { exit(1); }' 2>&5`
+ _perl_res=$?
+ echo "$ac_t""$_perl_version" 1>&6
+@@ -3863,7 +3879,7 @@
+ fi
+ 
+ echo $ac_n "checking for full perl installation""... $ac_c" 1>&6
+-echo "configure:3867: checking for full perl installation" >&5
++echo "configure:3883: checking for full perl installation" >&5
+ _perl_archlib=`$PERL -e 'use Config; if ( -d $Config{archlib} ) { exit(0); } else { exit(1); }' 2>&5`
+ _perl_res=$?
+ if test "$_perl_res" != 0; then
+@@ -3878,7 +3894,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3882: checking for $ac_word" >&5
++echo "configure:3898: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PYTHON'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3938,7 +3954,7 @@
+  # Extract the first word of "doxygen", so it can be a program name with args.
+ set dummy doxygen; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3942: checking for $ac_word" >&5
++echo "configure:3958: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_DOXYGEN'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3987,7 +4003,7 @@
+  # Extract the first word of "autoconf", so it can be a program name with args.
+ set dummy autoconf; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3991: checking for $ac_word" >&5
++echo "configure:4007: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AUTOCONF'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4036,7 +4052,7 @@
+  # Extract the first word of "unzip", so it can be a program name with args.
+ set dummy unzip; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4040: checking for $ac_word" >&5
++echo "configure:4056: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_UNZIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4087,7 +4103,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4091: checking for $ac_word" >&5
++echo "configure:4107: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_ZIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4141,7 +4157,7 @@
+  # Extract the first word of "makedepend", so it can be a program name with args.
+ set dummy makedepend; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4145: checking for $ac_word" >&5
++echo "configure:4161: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_SYSTEM_MAKEDEPEND'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4189,7 +4205,7 @@
+  # Extract the first word of "xargs", so it can be a program name with args.
+ set dummy xargs; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4193: checking for $ac_word" >&5
++echo "configure:4209: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_XARGS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4263,7 +4279,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4267: checking for $ac_word" >&5
++echo "configure:4283: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PBBUILD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4326,7 +4342,7 @@
+              # Extract the first word of "sdp", so it can be a program name with args.
+ set dummy sdp; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4330: checking for $ac_word" >&5
++echo "configure:4346: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_SDP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4452,7 +4468,7 @@
+ 
+   
+   echo $ac_n "checking for valid compiler/Mac OS X SDK combination""... $ac_c" 1>&6
+-echo "configure:4456: checking for valid compiler/Mac OS X SDK combination" >&5
++echo "configure:4472: checking for valid compiler/Mac OS X SDK combination" >&5
+   ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+ ac_cpp='$CXXCPP $CPPFLAGS'
+@@ -4461,7 +4477,7 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+   cat > conftest.$ac_ext <<EOF
+-#line 4465 "configure"
++#line 4481 "configure"
+ #include "confdefs.h"
+ #include <new>
+                  int main() { return 0; }
+@@ -4469,7 +4485,7 @@
+ result=yes
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4473: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:4489: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result=no
+ else
+@@ -4506,7 +4522,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4510: checking for $ac_word" >&5
++echo "configure:4526: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4562,7 +4578,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4566: checking for $ac_word" >&5
++echo "configure:4582: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4625,7 +4641,7 @@
+ # Uses ac_ vars as temps to allow command line to override cache and checks.
+ # --without-x overrides everything else, but does not touch the cache.
+ echo $ac_n "checking for X""... $ac_c" 1>&6
+-echo "configure:4629: checking for X" >&5
++echo "configure:4645: checking for X" >&5
+ 
+ # Check whether --with-x or --without-x was given.
+ if test "${with_x+set}" = set; then
+@@ -4687,12 +4703,12 @@
+ 
+   # First, try using that file with no special directory specified.
+ cat > conftest.$ac_ext <<EOF
+-#line 4691 "configure"
++#line 4707 "configure"
+ #include "confdefs.h"
+ #include <$x_direct_test_include>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:4696: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:4712: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -4761,14 +4777,14 @@
+   ac_save_LIBS="$LIBS"
+   LIBS="-l$x_direct_test_library $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 4765 "configure"
++#line 4781 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ ${x_direct_test_function}()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4772: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:4788: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   LIBS="$ac_save_LIBS"
+ # We can link X programs with no special library path.
+@@ -4874,17 +4890,17 @@
+     case "`(uname -sr) 2>/dev/null`" in
+     "SunOS 5"*)
+       echo $ac_n "checking whether -R must be followed by a space""... $ac_c" 1>&6
+-echo "configure:4878: checking whether -R must be followed by a space" >&5
++echo "configure:4894: checking whether -R must be followed by a space" >&5
+       ac_xsave_LIBS="$LIBS"; LIBS="$LIBS -R$x_libraries"
+       cat > conftest.$ac_ext <<EOF
+-#line 4881 "configure"
++#line 4897 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4888: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:4904: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_R_nospace=yes
+ else
+@@ -4900,14 +4916,14 @@
+       else
+ 	LIBS="$ac_xsave_LIBS -R $x_libraries"
+ 	cat > conftest.$ac_ext <<EOF
+-#line 4904 "configure"
++#line 4920 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4911: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:4927: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_R_space=yes
+ else
+@@ -4939,7 +4955,7 @@
+     # libraries were built with DECnet support.  And karl at cs.umb.edu says
+     # the Alpha needs dnet_stub (dnet does not exist).
+     echo $ac_n "checking for dnet_ntoa in -ldnet""... $ac_c" 1>&6
+-echo "configure:4943: checking for dnet_ntoa in -ldnet" >&5
++echo "configure:4959: checking for dnet_ntoa in -ldnet" >&5
+ ac_lib_var=`echo dnet'_'dnet_ntoa | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -4947,7 +4963,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldnet  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 4951 "configure"
++#line 4967 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -4958,7 +4974,7 @@
+ dnet_ntoa()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4962: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:4978: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -4980,7 +4996,7 @@
+ 
+     if test $ac_cv_lib_dnet_dnet_ntoa = no; then
+       echo $ac_n "checking for dnet_ntoa in -ldnet_stub""... $ac_c" 1>&6
+-echo "configure:4984: checking for dnet_ntoa in -ldnet_stub" >&5
++echo "configure:5000: checking for dnet_ntoa in -ldnet_stub" >&5
+ ac_lib_var=`echo dnet_stub'_'dnet_ntoa | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -4988,7 +5004,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldnet_stub  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 4992 "configure"
++#line 5008 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -4999,7 +5015,7 @@
+ dnet_ntoa()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5003: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5019: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5028,12 +5044,12 @@
+     # The nsl library prevents programs from opening the X display
+     # on Irix 5.2, according to dickey at clark.net.
+     echo $ac_n "checking for gethostbyname""... $ac_c" 1>&6
+-echo "configure:5032: checking for gethostbyname" >&5
++echo "configure:5048: checking for gethostbyname" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_gethostbyname'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5037 "configure"
++#line 5053 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char gethostbyname(); below.  */
+@@ -5056,7 +5072,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5060: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5076: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_gethostbyname=yes"
+ else
+@@ -5077,7 +5093,7 @@
+ 
+     if test $ac_cv_func_gethostbyname = no; then
+       echo $ac_n "checking for gethostbyname in -lnsl""... $ac_c" 1>&6
+-echo "configure:5081: checking for gethostbyname in -lnsl" >&5
++echo "configure:5097: checking for gethostbyname in -lnsl" >&5
+ ac_lib_var=`echo nsl'_'gethostbyname | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5085,7 +5101,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lnsl  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5089 "configure"
++#line 5105 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5096,7 +5112,7 @@
+ gethostbyname()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5100: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5116: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5126,12 +5142,12 @@
+     # -lsocket must be given before -lnsl if both are needed.
+     # We assume that if connect needs -lnsl, so does gethostbyname.
+     echo $ac_n "checking for connect""... $ac_c" 1>&6
+-echo "configure:5130: checking for connect" >&5
++echo "configure:5146: checking for connect" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_connect'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5135 "configure"
++#line 5151 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char connect(); below.  */
+@@ -5154,7 +5170,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5158: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5174: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_connect=yes"
+ else
+@@ -5175,7 +5191,7 @@
+ 
+     if test $ac_cv_func_connect = no; then
+       echo $ac_n "checking for connect in -lsocket""... $ac_c" 1>&6
+-echo "configure:5179: checking for connect in -lsocket" >&5
++echo "configure:5195: checking for connect in -lsocket" >&5
+ ac_lib_var=`echo socket'_'connect | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5183,7 +5199,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lsocket $X_EXTRA_LIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5187 "configure"
++#line 5203 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5194,7 +5210,7 @@
+ connect()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5198: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5214: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5218,12 +5234,12 @@
+ 
+     # gomez at mi.uni-erlangen.de says -lposix is necessary on A/UX.
+     echo $ac_n "checking for remove""... $ac_c" 1>&6
+-echo "configure:5222: checking for remove" >&5
++echo "configure:5238: checking for remove" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_remove'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5227 "configure"
++#line 5243 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char remove(); below.  */
+@@ -5246,7 +5262,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5250: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5266: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_remove=yes"
+ else
+@@ -5267,7 +5283,7 @@
+ 
+     if test $ac_cv_func_remove = no; then
+       echo $ac_n "checking for remove in -lposix""... $ac_c" 1>&6
+-echo "configure:5271: checking for remove in -lposix" >&5
++echo "configure:5287: checking for remove in -lposix" >&5
+ ac_lib_var=`echo posix'_'remove | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5275,7 +5291,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lposix  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5279 "configure"
++#line 5295 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5286,7 +5302,7 @@
+ remove()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5290: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5306: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5310,12 +5326,12 @@
+ 
+     # BSDI BSD/OS 2.1 needs -lipc for XOpenDisplay.
+     echo $ac_n "checking for shmat""... $ac_c" 1>&6
+-echo "configure:5314: checking for shmat" >&5
++echo "configure:5330: checking for shmat" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_shmat'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5319 "configure"
++#line 5335 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char shmat(); below.  */
+@@ -5338,7 +5354,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5342: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5358: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_shmat=yes"
+ else
+@@ -5359,7 +5375,7 @@
+ 
+     if test $ac_cv_func_shmat = no; then
+       echo $ac_n "checking for shmat in -lipc""... $ac_c" 1>&6
+-echo "configure:5363: checking for shmat in -lipc" >&5
++echo "configure:5379: checking for shmat in -lipc" >&5
+ ac_lib_var=`echo ipc'_'shmat | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5367,7 +5383,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lipc  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5371 "configure"
++#line 5387 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5378,7 +5394,7 @@
+ shmat()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5382: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5398: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5411,7 +5427,7 @@
+   # libraries we check for below, so use a different variable.
+   #  --interran at uluru.Stanford.EDU, kb at cs.umb.edu.
+   echo $ac_n "checking for IceConnectionNumber in -lICE""... $ac_c" 1>&6
+-echo "configure:5415: checking for IceConnectionNumber in -lICE" >&5
++echo "configure:5431: checking for IceConnectionNumber in -lICE" >&5
+ ac_lib_var=`echo ICE'_'IceConnectionNumber | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5419,7 +5435,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lICE $X_EXTRA_LIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5423 "configure"
++#line 5439 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5430,7 +5446,7 @@
+ IceConnectionNumber()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5434: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5450: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5913,7 +5929,7 @@
+     _USE_CPP_INCLUDE_FLAG=1
+ 
+     echo $ac_n "checking whether the compiler supports -Wno-invalid-offsetof""... $ac_c" 1>&6
+-echo "configure:5917: checking whether the compiler supports -Wno-invalid-offsetof" >&5
++echo "configure:5933: checking whether the compiler supports -Wno-invalid-offsetof" >&5
+ if eval "test \"`echo '$''{'ac_has_wno_invalid_offsetof'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -5929,14 +5945,14 @@
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-invalid-offsetof"
+             cat > conftest.$ac_ext <<EOF
+-#line 5933 "configure"
++#line 5949 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:5956: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_wno_invalid_offsetof="yes"
+ else
+@@ -5963,7 +5979,7 @@
+     fi
+ 
+     echo $ac_n "checking whether the compiler supports -Wno-variadic-macros""... $ac_c" 1>&6
+-echo "configure:5967: checking whether the compiler supports -Wno-variadic-macros" >&5
++echo "configure:5983: checking whether the compiler supports -Wno-variadic-macros" >&5
+ if eval "test \"`echo '$''{'ac_has_wno_variadic_macros'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -5979,14 +5995,14 @@
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-variadic-macros"
+             cat > conftest.$ac_ext <<EOF
+-#line 5983 "configure"
++#line 5999 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5990: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6006: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_wno_variadic_macros="yes"
+ else
+@@ -6013,7 +6029,7 @@
+     fi
+ 
+     echo $ac_n "checking whether the compiler supports -Werror=return-type""... $ac_c" 1>&6
+-echo "configure:6017: checking whether the compiler supports -Werror=return-type" >&5
++echo "configure:6033: checking whether the compiler supports -Werror=return-type" >&5
+ if eval "test \"`echo '$''{'ac_has_werror_return_type'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6029,14 +6045,14 @@
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS -Werror=return-type"
+             cat > conftest.$ac_ext <<EOF
+-#line 6033 "configure"
++#line 6049 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6040: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6056: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_werror_return_type="yes"
+ else
+@@ -6072,7 +6088,7 @@
+ if test "$COMPILE_ENVIRONMENT"; then
+ if test "$GNU_CC"; then
+   echo $ac_n "checking whether ld has archive extraction flags""... $ac_c" 1>&6
+-echo "configure:6076: checking whether ld has archive extraction flags" >&5
++echo "configure:6092: checking whether ld has archive extraction flags" >&5
+   if eval "test \"`echo '$''{'ac_cv_mkshlib_force_and_unforce'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6089,14 +6105,14 @@
+       LDFLAGS=$force
+       LIBS=$unforce
+       cat > conftest.$ac_ext <<EOF
+-#line 6093 "configure"
++#line 6109 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6100: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6116: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_mkshlib_force_and_unforce=$line; break
+ else
+@@ -6129,7 +6145,7 @@
+ '
+ 
+ echo $ac_n "checking that static assertion macros used in autoconf tests work""... $ac_c" 1>&6
+-echo "configure:6133: checking that static assertion macros used in autoconf tests work" >&5
++echo "configure:6149: checking that static assertion macros used in autoconf tests work" >&5
+ if eval "test \"`echo '$''{'ac_cv_static_assertion_macros_work'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6143,14 +6159,14 @@
+ 
+   ac_cv_static_assertion_macros_work="yes"
+   cat > conftest.$ac_ext <<EOF
+-#line 6147 "configure"
++#line 6163 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(1)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6154: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6170: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -6160,14 +6176,14 @@
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 6164 "configure"
++#line 6180 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6171: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6187: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_static_assertion_macros_work="no"
+ else
+@@ -6183,14 +6199,14 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+   cat > conftest.$ac_ext <<EOF
+-#line 6187 "configure"
++#line 6203 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(1)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6194: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6210: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -6200,14 +6216,14 @@
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 6204 "configure"
++#line 6220 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6211: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6227: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_static_assertion_macros_work="no"
+ else
+@@ -6241,16 +6257,16 @@
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking for 64-bit OS""... $ac_c" 1>&6
+-echo "configure:6245: checking for 64-bit OS" >&5
++echo "configure:6261: checking for 64-bit OS" >&5
+ cat > conftest.$ac_ext <<EOF
+-#line 6247 "configure"
++#line 6263 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(sizeof(void*) == 8)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6254: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6270: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result="yes"
+ else
+@@ -6389,7 +6405,7 @@
+ esac
+ 
+ echo $ac_n "checking for Python version >= $PYTHON_VERSION but not 3.x""... $ac_c" 1>&6
+-echo "configure:6393: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
++echo "configure:6409: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
+ 
+ $PYTHON -c "import sys; sys.exit(sys.version[:3] < sys.argv[1] or sys.version[:2] != '2.')" $PYTHON_VERSION
+ _python_res=$?
+@@ -6437,9 +6453,9 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+             echo $ac_n "checking for IBM XLC/C++ compiler version >= 9.0.0.7""... $ac_c" 1>&6
+-echo "configure:6441: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
++echo "configure:6457: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
+             cat > conftest.$ac_ext <<EOF
+-#line 6443 "configure"
++#line 6459 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -6448,7 +6464,7 @@
+                  #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6452: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6468: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _BAD_COMPILER=
+ else
+@@ -6486,17 +6502,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:6490: checking for $ac_hdr" >&5
++echo "configure:6506: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 6495 "configure"
++#line 6511 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:6500: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:6516: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -6542,7 +6558,7 @@
+     LIBS="$LIBS -lbe"
+     if test "$COMPILE_ENVIRONMENT"; then
+         echo $ac_n "checking for main in -lbind""... $ac_c" 1>&6
+-echo "configure:6546: checking for main in -lbind" >&5
++echo "configure:6562: checking for main in -lbind" >&5
+ ac_lib_var=`echo bind'_'main | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -6550,14 +6566,14 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lbind  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 6554 "configure"
++#line 6570 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ main()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6561: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6577: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -6578,7 +6594,7 @@
+ fi
+ 
+         echo $ac_n "checking for main in -lzeta""... $ac_c" 1>&6
+-echo "configure:6582: checking for main in -lzeta" >&5
++echo "configure:6598: checking for main in -lzeta" >&5
+ ac_lib_var=`echo zeta'_'main | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -6586,14 +6602,14 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lzeta  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 6590 "configure"
++#line 6606 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ main()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6597: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6613: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -6667,18 +6683,18 @@
+         echo "Skipping -dead_strip because DTrace is enabled. See bug 403132."
+     else
+                 echo $ac_n "checking for -dead_strip option to ld""... $ac_c" 1>&6
+-echo "configure:6671: checking for -dead_strip option to ld" >&5
++echo "configure:6687: checking for -dead_strip option to ld" >&5
+         _SAVE_LDFLAGS=$LDFLAGS
+         LDFLAGS="$LDFLAGS -Wl,-dead_strip"
+         cat > conftest.$ac_ext <<EOF
+-#line 6675 "configure"
++#line 6691 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6682: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6698: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   _HAVE_DEAD_STRIP=1
+ else
+@@ -7250,17 +7266,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:7254: checking for $ac_hdr" >&5
++echo "configure:7270: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 7259 "configure"
++#line 7275 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:7264: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:7280: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -7492,19 +7508,19 @@
+     _DEFINES_CXXFLAGS="$_DEFINES_CXXFLAGS -Uunix -U__unix -U__unix__"
+ 
+     echo $ac_n "checking for __declspec(dllexport)""... $ac_c" 1>&6
+-echo "configure:7496: checking for __declspec(dllexport)" >&5
++echo "configure:7512: checking for __declspec(dllexport)" >&5
+ if eval "test \"`echo '$''{'ac_os2_declspec'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 7501 "configure"
++#line 7517 "configure"
+ #include "confdefs.h"
+ __declspec(dllexport) void ac_os2_declspec(void) {}
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7508: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7524: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_os2_declspec="yes"
+ else
+@@ -7625,14 +7641,14 @@
+            _SAVE_LDFLAGS=$LDFLAGS
+            LDFLAGS="-M /usr/lib/ld/map.noexstk $LDFLAGS" 
+            cat > conftest.$ac_ext <<EOF
+-#line 7629 "configure"
++#line 7645 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+ printf("Hello World\n");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7636: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:7652: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -7661,7 +7677,7 @@
+        CC_VERSION=`$CC -V 2>&1 | grep '^cc:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
+        CXX_VERSION=`$CXX -V 2>&1 | grep '^CC:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
+        echo $ac_n "checking for Sun C++ compiler version >= 5.9""... $ac_c" 1>&6
+-echo "configure:7665: checking for Sun C++ compiler version >= 5.9" >&5
++echo "configure:7681: checking for Sun C++ compiler version >= 5.9" >&5
+        
+        ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -7671,7 +7687,7 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+        cat > conftest.$ac_ext <<EOF
+-#line 7675 "configure"
++#line 7691 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -7680,7 +7696,7 @@
+            #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7684: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7700: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _BAD_COMPILER=
+ else
+@@ -7697,7 +7713,7 @@
+            _res="yes"
+        fi
+        cat > conftest.$ac_ext <<EOF
+-#line 7701 "configure"
++#line 7717 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -7706,7 +7722,7 @@
+            #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7710: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7726: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _ABOVE_SS12U1=
+ else
+@@ -8122,12 +8138,12 @@
+ 
+ if test -z "$SKIP_COMPILER_CHECKS"; then
+ echo $ac_n "checking for ANSI C header files""... $ac_c" 1>&6
+-echo "configure:8126: checking for ANSI C header files" >&5
++echo "configure:8142: checking for ANSI C header files" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_stdc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8131 "configure"
++#line 8147 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ #include <stdarg.h>
+@@ -8135,7 +8151,7 @@
+ #include <float.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:8139: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:8155: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -8152,7 +8168,7 @@
+ if test $ac_cv_header_stdc = yes; then
+   # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+ cat > conftest.$ac_ext <<EOF
+-#line 8156 "configure"
++#line 8172 "configure"
+ #include "confdefs.h"
+ #include <string.h>
+ EOF
+@@ -8170,7 +8186,7 @@
+ if test $ac_cv_header_stdc = yes; then
+   # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+ cat > conftest.$ac_ext <<EOF
+-#line 8174 "configure"
++#line 8190 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ EOF
+@@ -8191,7 +8207,7 @@
+   :
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8195 "configure"
++#line 8211 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+@@ -8202,7 +8218,7 @@
+ exit (0); }
+ 
+ EOF
+-if { (eval echo configure:8206: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:8222: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   :
+ else
+@@ -8226,12 +8242,12 @@
+ fi
+ 
+ echo $ac_n "checking for working const""... $ac_c" 1>&6
+-echo "configure:8230: checking for working const" >&5
++echo "configure:8246: checking for working const" >&5
+ if eval "test \"`echo '$''{'ac_cv_c_const'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8235 "configure"
++#line 8251 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8280,7 +8296,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8284: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8300: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_c_const=yes
+ else
+@@ -8301,12 +8317,12 @@
+ fi
+ 
+ echo $ac_n "checking for mode_t""... $ac_c" 1>&6
+-echo "configure:8305: checking for mode_t" >&5
++echo "configure:8321: checking for mode_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_mode_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8310 "configure"
++#line 8326 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8334,12 +8350,12 @@
+ fi
+ 
+ echo $ac_n "checking for off_t""... $ac_c" 1>&6
+-echo "configure:8338: checking for off_t" >&5
++echo "configure:8354: checking for off_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_off_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8343 "configure"
++#line 8359 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8367,12 +8383,12 @@
+ fi
+ 
+ echo $ac_n "checking for pid_t""... $ac_c" 1>&6
+-echo "configure:8371: checking for pid_t" >&5
++echo "configure:8387: checking for pid_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_pid_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8376 "configure"
++#line 8392 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8400,12 +8416,12 @@
+ fi
+ 
+ echo $ac_n "checking for size_t""... $ac_c" 1>&6
+-echo "configure:8404: checking for size_t" >&5
++echo "configure:8420: checking for size_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_size_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8409 "configure"
++#line 8425 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8440,12 +8456,12 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for __stdcall""... $ac_c" 1>&6
+-echo "configure:8444: checking for __stdcall" >&5
++echo "configure:8460: checking for __stdcall" >&5
+ if eval "test \"`echo '$''{'ac_cv___stdcall'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8449 "configure"
++#line 8465 "configure"
+ #include "confdefs.h"
+ template <typename Method> struct foo;
+                   template <> struct foo<void (*)()> {};
+@@ -8454,7 +8470,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8458: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8474: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv___stdcall=true
+ else
+@@ -8483,12 +8499,12 @@
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking for ssize_t""... $ac_c" 1>&6
+-echo "configure:8487: checking for ssize_t" >&5
++echo "configure:8503: checking for ssize_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_ssize_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8492 "configure"
++#line 8508 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8496,7 +8512,7 @@
+ ssize_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8500: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8516: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_type_ssize_t=true
+ else
+@@ -8518,12 +8534,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for st_blksize in struct stat""... $ac_c" 1>&6
+-echo "configure:8522: checking for st_blksize in struct stat" >&5
++echo "configure:8538: checking for st_blksize in struct stat" >&5
+ if eval "test \"`echo '$''{'ac_cv_struct_st_blksize'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8527 "configure"
++#line 8543 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -8531,7 +8547,7 @@
+ struct stat s; s.st_blksize;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8535: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8551: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_struct_st_blksize=yes
+ else
+@@ -8552,12 +8568,12 @@
+ fi
+ 
+ echo $ac_n "checking for siginfo_t""... $ac_c" 1>&6
+-echo "configure:8556: checking for siginfo_t" >&5
++echo "configure:8572: checking for siginfo_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_siginfo_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8561 "configure"
++#line 8577 "configure"
+ #include "confdefs.h"
+ #define _POSIX_C_SOURCE 199506L
+                   #include <signal.h>
+@@ -8565,7 +8581,7 @@
+ siginfo_t* info;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8569: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8585: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_siginfo_t=true
+ else
+@@ -8590,17 +8606,17 @@
+ 
+ ac_safe=`echo "stdint.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for stdint.h""... $ac_c" 1>&6
+-echo "configure:8594: checking for stdint.h" >&5
++echo "configure:8610: checking for stdint.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8599 "configure"
++#line 8615 "configure"
+ #include "confdefs.h"
+ #include <stdint.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:8604: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:8620: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -8629,7 +8645,7 @@
+ else
+                     
+ echo $ac_n "checking for a 1-byte type""... $ac_c" 1>&6
+-echo "configure:8633: checking for a 1-byte type" >&5
++echo "configure:8649: checking for a 1-byte type" >&5
+ if eval "test \"`echo '$''{'moz_cv_n_byte_type_JS_INT8_TYPE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8637,7 +8653,7 @@
+   moz_cv_n_byte_type_JS_INT8_TYPE=
+   for type in char; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8641 "configure"
++#line 8657 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8647,7 +8663,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8651: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8667: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_n_byte_type_JS_INT8_TYPE=$type; break
+ else
+@@ -8670,7 +8686,7 @@
+ 
+     
+ echo $ac_n "checking for a 2-byte type""... $ac_c" 1>&6
+-echo "configure:8674: checking for a 2-byte type" >&5
++echo "configure:8690: checking for a 2-byte type" >&5
+ if eval "test \"`echo '$''{'moz_cv_n_byte_type_JS_INT16_TYPE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8678,7 +8694,7 @@
+   moz_cv_n_byte_type_JS_INT16_TYPE=
+   for type in short int long; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8682 "configure"
++#line 8698 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8688,7 +8704,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8692: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8708: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_n_byte_type_JS_INT16_TYPE=$type; break
+ else
+@@ -8711,7 +8727,7 @@
+ 
+     
+ echo $ac_n "checking for a 4-byte type""... $ac_c" 1>&6
+-echo "configure:8715: checking for a 4-byte type" >&5
++echo "configure:8731: checking for a 4-byte type" >&5
+ if eval "test \"`echo '$''{'moz_cv_n_byte_type_JS_INT32_TYPE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8719,7 +8735,7 @@
+   moz_cv_n_byte_type_JS_INT32_TYPE=
+   for type in int long 'long long' short; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8723 "configure"
++#line 8739 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8729,7 +8745,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8733: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8749: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_n_byte_type_JS_INT32_TYPE=$type; break
+ else
+@@ -8752,7 +8768,7 @@
+ 
+     
+ echo $ac_n "checking for a 8-byte type""... $ac_c" 1>&6
+-echo "configure:8756: checking for a 8-byte type" >&5
++echo "configure:8772: checking for a 8-byte type" >&5
+ if eval "test \"`echo '$''{'moz_cv_n_byte_type_JS_INT64_TYPE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8760,7 +8776,7 @@
+   moz_cv_n_byte_type_JS_INT64_TYPE=
+   for type in int long 'long long'; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8764 "configure"
++#line 8780 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8770,7 +8786,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8774: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8790: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_n_byte_type_JS_INT64_TYPE=$type; break
+ else
+@@ -8793,7 +8809,7 @@
+ 
+     
+ echo $ac_n "checking for a sizeof (void *)-byte type""... $ac_c" 1>&6
+-echo "configure:8797: checking for a sizeof (void *)-byte type" >&5
++echo "configure:8813: checking for a sizeof (void *)-byte type" >&5
+ if eval "test \"`echo '$''{'moz_cv_n_byte_type_JS_INTPTR_TYPE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8801,7 +8817,7 @@
+   moz_cv_n_byte_type_JS_INTPTR_TYPE=
+   for type in int long 'long long' short; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8805 "configure"
++#line 8821 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8811,7 +8827,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8815: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8831: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_n_byte_type_JS_INTPTR_TYPE=$type; break
+ else
+@@ -8836,7 +8852,7 @@
+ 
+ 
+ echo $ac_n "checking for the size of void*""... $ac_c" 1>&6
+-echo "configure:8840: checking for the size of void*" >&5
++echo "configure:8856: checking for the size of void*" >&5
+ if eval "test \"`echo '$''{'moz_cv_size_of_JS_BYTES_PER_WORD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8844,7 +8860,7 @@
+   moz_cv_size_of_JS_BYTES_PER_WORD=
+   for size in 4 8; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8848 "configure"
++#line 8864 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8854,7 +8870,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8858: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8874: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_size_of_JS_BYTES_PER_WORD=$size; break
+ else
+@@ -8891,7 +8907,7 @@
+ 
+ 
+ echo $ac_n "checking for the alignment of void*""... $ac_c" 1>&6
+-echo "configure:8895: checking for the alignment of void*" >&5
++echo "configure:8911: checking for the alignment of void*" >&5
+ if eval "test \"`echo '$''{'moz_cv_align_of_JS_ALIGN_OF_POINTER'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8899,7 +8915,7 @@
+   moz_cv_align_of_JS_ALIGN_OF_POINTER=
+   for align in 2 4 8 16; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8903 "configure"
++#line 8919 "configure"
+ #include "confdefs.h"
+ 
+                      #include <stddef.h>
+@@ -8912,7 +8928,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8916: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8932: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_align_of_JS_ALIGN_OF_POINTER=$align; break
+ else
+@@ -8935,7 +8951,7 @@
+ 
+ 
+ echo $ac_n "checking for the size of double""... $ac_c" 1>&6
+-echo "configure:8939: checking for the size of double" >&5
++echo "configure:8955: checking for the size of double" >&5
+ if eval "test \"`echo '$''{'moz_cv_size_of_JS_BYTES_PER_DOUBLE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -8943,7 +8959,7 @@
+   moz_cv_size_of_JS_BYTES_PER_DOUBLE=
+   for size in 6 8 10 12 14; do
+     cat > conftest.$ac_ext <<EOF
+-#line 8947 "configure"
++#line 8963 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8953,7 +8969,7 @@
+                    
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8957: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8973: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   moz_cv_size_of_JS_BYTES_PER_DOUBLE=$size; break
+ else
+@@ -8976,12 +8992,12 @@
+ 
+ 
+ echo $ac_n "checking for int16_t""... $ac_c" 1>&6
+-echo "configure:8980: checking for int16_t" >&5
++echo "configure:8996: checking for int16_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int16_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8985 "configure"
++#line 9001 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8989,7 +9005,7 @@
+ int16_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8993: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9009: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int16_t=true
+ else
+@@ -9011,12 +9027,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int32_t""... $ac_c" 1>&6
+-echo "configure:9015: checking for int32_t" >&5
++echo "configure:9031: checking for int32_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int32_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9020 "configure"
++#line 9036 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9024,7 +9040,7 @@
+ int32_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9028: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9044: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int32_t=true
+ else
+@@ -9046,12 +9062,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int64_t""... $ac_c" 1>&6
+-echo "configure:9050: checking for int64_t" >&5
++echo "configure:9066: checking for int64_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int64_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9055 "configure"
++#line 9071 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9059,7 +9075,7 @@
+ int64_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9063: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9079: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int64_t=true
+ else
+@@ -9081,12 +9097,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int64""... $ac_c" 1>&6
+-echo "configure:9085: checking for int64" >&5
++echo "configure:9101: checking for int64" >&5
+ if eval "test \"`echo '$''{'ac_cv_int64'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9090 "configure"
++#line 9106 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9094,7 +9110,7 @@
+ int64 foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9098: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9114: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int64=true
+ else
+@@ -9116,12 +9132,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint""... $ac_c" 1>&6
+-echo "configure:9120: checking for uint" >&5
++echo "configure:9136: checking for uint" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9125 "configure"
++#line 9141 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9129,7 +9145,7 @@
+ uint foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9133: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9149: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint=true
+ else
+@@ -9151,12 +9167,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint_t""... $ac_c" 1>&6
+-echo "configure:9155: checking for uint_t" >&5
++echo "configure:9171: checking for uint_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9160 "configure"
++#line 9176 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9164,7 +9180,7 @@
+ uint_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9168: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9184: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint_t=true
+ else
+@@ -9186,12 +9202,12 @@
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint16_t""... $ac_c" 1>&6
+-echo "configure:9190: checking for uint16_t" >&5
++echo "configure:9206: checking for uint16_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint16_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9195 "configure"
++#line 9211 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -9199,7 +9215,7 @@
+ uint16_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9203: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9219: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint16_t=true
+ else
+@@ -9230,12 +9246,12 @@
+ 
+ 
+ echo $ac_n "checking for uname.domainname""... $ac_c" 1>&6
+-echo "configure:9234: checking for uname.domainname" >&5
++echo "configure:9250: checking for uname.domainname" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_uname_domainname_field'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9239 "configure"
++#line 9255 "configure"
+ #include "confdefs.h"
+ #include <sys/utsname.h>
+ int main() {
+@@ -9243,7 +9259,7 @@
+             (void)uname(res);  if (res != 0) { domain = res->domainname; } 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9247: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9263: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_uname_domainname_field=true
+ else
+@@ -9267,12 +9283,12 @@
+ fi
+ 
+ echo $ac_n "checking for uname.__domainname""... $ac_c" 1>&6
+-echo "configure:9271: checking for uname.__domainname" >&5
++echo "configure:9287: checking for uname.__domainname" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_uname_us_domainname_field'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9276 "configure"
++#line 9292 "configure"
+ #include "confdefs.h"
+ #include <sys/utsname.h>
+ int main() {
+@@ -9280,7 +9296,7 @@
+             (void)uname(res);  if (res != 0) { domain = res->__domainname; } 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9284: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9300: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_uname_us_domainname_field=true
+ else
+@@ -9313,7 +9329,7 @@
+ 
+ if test "$GNU_CC"; then
+   echo $ac_n "checking for visibility(hidden) attribute""... $ac_c" 1>&6
+-echo "configure:9317: checking for visibility(hidden) attribute" >&5
++echo "configure:9333: checking for visibility(hidden) attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_hidden'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9338,7 +9354,7 @@
+ 
+ 
+     echo $ac_n "checking for visibility(default) attribute""... $ac_c" 1>&6
+-echo "configure:9342: checking for visibility(default) attribute" >&5
++echo "configure:9358: checking for visibility(default) attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_default'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9363,7 +9379,7 @@
+ 
+ 
+       echo $ac_n "checking for visibility pragma support""... $ac_c" 1>&6
+-echo "configure:9367: checking for visibility pragma support" >&5
++echo "configure:9383: checking for visibility pragma support" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_pragma'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9388,7 +9404,7 @@
+ echo "$ac_t""$ac_cv_visibility_pragma" 1>&6
+       if test "$ac_cv_visibility_pragma" = "yes"; then
+         echo $ac_n "checking For gcc visibility bug with class-level attributes (GCC bug 26905)""... $ac_c" 1>&6
+-echo "configure:9392: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
++echo "configure:9408: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_visibility_class_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9416,7 +9432,7 @@
+ echo "$ac_t""$ac_cv_have_visibility_class_bug" 1>&6
+ 
+         echo $ac_n "checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)""... $ac_c" 1>&6
+-echo "configure:9420: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
++echo "configure:9436: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_visibility_builtin_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9470,19 +9486,19 @@
+   CFLAGS_save="${CFLAGS}"
+   CFLAGS="${CFLAGS} -Werror"
+   echo $ac_n "checking for __force_align_arg_pointer__ attribute""... $ac_c" 1>&6
+-echo "configure:9474: checking for __force_align_arg_pointer__ attribute" >&5
++echo "configure:9490: checking for __force_align_arg_pointer__ attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_force_align_arg_pointer'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9479 "configure"
++#line 9495 "configure"
+ #include "confdefs.h"
+ __attribute__ ((__force_align_arg_pointer__)) void test() {}
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9486: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9502: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_force_align_arg_pointer="yes"
+ else
+@@ -9509,12 +9525,12 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr that defines DIR""... $ac_c" 1>&6
+-echo "configure:9513: checking for $ac_hdr that defines DIR" >&5
++echo "configure:9529: checking for $ac_hdr that defines DIR" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_dirent_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9518 "configure"
++#line 9534 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #include <$ac_hdr>
+@@ -9522,7 +9538,7 @@
+ DIR *dirp = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9526: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9542: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_dirent_$ac_safe=yes"
+ else
+@@ -9547,7 +9563,7 @@
+ # Two versions of opendir et al. are in -ldir and -lx on SCO Xenix.
+ if test $ac_header_dirent = dirent.h; then
+ echo $ac_n "checking for opendir in -ldir""... $ac_c" 1>&6
+-echo "configure:9551: checking for opendir in -ldir" >&5
++echo "configure:9567: checking for opendir in -ldir" >&5
+ ac_lib_var=`echo dir'_'opendir | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -9555,7 +9571,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldir  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 9559 "configure"
++#line 9575 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -9566,7 +9582,7 @@
+ opendir()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9570: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:9586: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -9588,7 +9604,7 @@
+ 
+ else
+ echo $ac_n "checking for opendir in -lx""... $ac_c" 1>&6
+-echo "configure:9592: checking for opendir in -lx" >&5
++echo "configure:9608: checking for opendir in -lx" >&5
+ ac_lib_var=`echo x'_'opendir | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -9596,7 +9612,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lx  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 9600 "configure"
++#line 9616 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -9607,7 +9623,7 @@
+ opendir()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:9627: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -9639,17 +9655,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9643: checking for $ac_hdr" >&5
++echo "configure:9659: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9648 "configure"
++#line 9664 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9653: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9669: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9679,17 +9695,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9683: checking for $ac_hdr" >&5
++echo "configure:9699: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9688 "configure"
++#line 9704 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9693: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9709: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9719,17 +9735,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9723: checking for $ac_hdr" >&5
++echo "configure:9739: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9728 "configure"
++#line 9744 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9733: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9749: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9759,17 +9775,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9763: checking for $ac_hdr" >&5
++echo "configure:9779: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9768 "configure"
++#line 9784 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9773: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9789: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9799,17 +9815,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9803: checking for $ac_hdr" >&5
++echo "configure:9819: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9808 "configure"
++#line 9824 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9813: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9829: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9839,17 +9855,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9843: checking for $ac_hdr" >&5
++echo "configure:9859: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9848 "configure"
++#line 9864 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9853: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9869: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9880,17 +9896,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9884: checking for $ac_hdr" >&5
++echo "configure:9900: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9889 "configure"
++#line 9905 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9894: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9910: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9921,17 +9937,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9925: checking for $ac_hdr" >&5
++echo "configure:9941: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9930 "configure"
++#line 9946 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9935: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9951: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -9961,17 +9977,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9965: checking for $ac_hdr" >&5
++echo "configure:9981: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9970 "configure"
++#line 9986 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:9975: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:9991: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10002,17 +10018,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:10006: checking for $ac_hdr" >&5
++echo "configure:10022: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10011 "configure"
++#line 10027 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10016: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10032: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10049,17 +10065,17 @@
+ NEW_H=new.h
+ ac_safe=`echo "new" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for new""... $ac_c" 1>&6
+-echo "configure:10053: checking for new" >&5
++echo "configure:10069: checking for new" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10058 "configure"
++#line 10074 "configure"
+ #include "confdefs.h"
+ #include <new>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10063: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10079: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10101,17 +10117,17 @@
+ if test "x$enable_dtrace" = "xyes"; then
+   ac_safe=`echo "sys/sdt.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for sys/sdt.h""... $ac_c" 1>&6
+-echo "configure:10105: checking for sys/sdt.h" >&5
++echo "configure:10121: checking for sys/sdt.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10110 "configure"
++#line 10126 "configure"
+ #include "confdefs.h"
+ #include <sys/sdt.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10115: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10131: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10151,17 +10167,17 @@
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:10155: checking for $ac_hdr" >&5
++echo "configure:10171: checking for $ac_hdr" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10160 "configure"
++#line 10176 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10165: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10181: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10192,17 +10208,17 @@
+ 
+ ac_safe=`echo "linux/perf_event.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for linux/perf_event.h""... $ac_c" 1>&6
+-echo "configure:10196: checking for linux/perf_event.h" >&5
++echo "configure:10212: checking for linux/perf_event.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10201 "configure"
++#line 10217 "configure"
+ #include "confdefs.h"
+ #include <linux/perf_event.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10206: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10222: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10230,7 +10246,7 @@
+ 	;;
+ *)
+ 	echo $ac_n "checking for gethostbyname_r in -lc_r""... $ac_c" 1>&6
+-echo "configure:10234: checking for gethostbyname_r in -lc_r" >&5
++echo "configure:10250: checking for gethostbyname_r in -lc_r" >&5
+ ac_lib_var=`echo c_r'_'gethostbyname_r | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10238,7 +10254,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lc_r  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10242 "configure"
++#line 10258 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10249,7 +10265,7 @@
+ gethostbyname_r()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10253: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10269: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10289,14 +10305,14 @@
+ *)
+     
+ echo $ac_n "checking for library containing dlopen""... $ac_c" 1>&6
+-echo "configure:10293: checking for library containing dlopen" >&5
++echo "configure:10309: checking for library containing dlopen" >&5
+ if eval "test \"`echo '$''{'ac_cv_search_dlopen'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   ac_func_search_save_LIBS="$LIBS"
+ ac_cv_search_dlopen="no"
+ cat > conftest.$ac_ext <<EOF
+-#line 10300 "configure"
++#line 10316 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10307,7 +10323,7 @@
+ dlopen()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10311: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10327: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_search_dlopen="none required"
+ else
+@@ -10318,7 +10334,7 @@
+ test "$ac_cv_search_dlopen" = "no" && for i in dl; do
+ LIBS="-l$i  $ac_func_search_save_LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10322 "configure"
++#line 10338 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10329,7 +10345,7 @@
+ dlopen()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10333: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10349: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_search_dlopen="-l$i"
+ break
+@@ -10347,17 +10363,17 @@
+   test "$ac_cv_search_dlopen" = "none required" || LIBS="$ac_cv_search_dlopen $LIBS"
+   ac_safe=`echo "dlfcn.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for dlfcn.h""... $ac_c" 1>&6
+-echo "configure:10351: checking for dlfcn.h" >&5
++echo "configure:10367: checking for dlfcn.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10356 "configure"
++#line 10372 "configure"
+ #include "confdefs.h"
+ #include <dlfcn.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:10361: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:10377: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -10392,12 +10408,12 @@
+ for ac_func in dladdr
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:10396: checking for $ac_func" >&5
++echo "configure:10412: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10401 "configure"
++#line 10417 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -10420,7 +10436,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10424: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10440: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -10451,7 +10467,7 @@
+     case $target in
+     *-aix*)
+ 	echo $ac_n "checking for demangle in -lC_r""... $ac_c" 1>&6
+-echo "configure:10455: checking for demangle in -lC_r" >&5
++echo "configure:10471: checking for demangle in -lC_r" >&5
+ ac_lib_var=`echo C_r'_'demangle | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10459,7 +10475,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lC_r  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10463 "configure"
++#line 10479 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10470,7 +10486,7 @@
+ demangle()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10474: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10490: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10500,7 +10516,7 @@
+ 	;;
+      *)
+ 	echo $ac_n "checking for demangle in -lC""... $ac_c" 1>&6
+-echo "configure:10504: checking for demangle in -lC" >&5
++echo "configure:10520: checking for demangle in -lC" >&5
+ ac_lib_var=`echo C'_'demangle | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10508,7 +10524,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lC  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10512 "configure"
++#line 10528 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10519,7 +10535,7 @@
+ demangle()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10523: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10539: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10555,7 +10571,7 @@
+     ;;
+ *)
+     echo $ac_n "checking for socket in -lsocket""... $ac_c" 1>&6
+-echo "configure:10559: checking for socket in -lsocket" >&5
++echo "configure:10575: checking for socket in -lsocket" >&5
+ ac_lib_var=`echo socket'_'socket | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10563,7 +10579,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lsocket  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10567 "configure"
++#line 10583 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10574,7 +10590,7 @@
+ socket()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10578: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10594: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10603,71 +10619,6 @@
+ 
+ esac
+ 
+-echo $ac_n "checking for ARM SIMD support in compiler""... $ac_c" 1>&6
+-echo "configure:10608: checking for ARM SIMD support in compiler" >&5
+-cat > conftest.$ac_ext <<EOF
+-#line 10610 "configure"
+-#include "confdefs.h"
+-
+-int main() {
+-asm("uqadd8 r1, r1, r2");
+-; return 0; }
+-EOF
+-if { (eval echo configure:10617: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+-  rm -rf conftest*
+-  result="yes"
+-else
+-  echo "configure: failed program was:" >&5
+-  cat conftest.$ac_ext >&5
+-  rm -rf conftest*
+-  result="no"
+-fi
+-rm -f conftest*
+-echo "$ac_t"""$result"" 1>&6
+-if test "$result" = "yes"; then
+-    cat >> confdefs.h <<\EOF
+-#define HAVE_ARM_SIMD 1
+-EOF
+-
+-    HAVE_ARM_SIMD=1
+-fi
+-
+-
+-echo $ac_n "checking for ARM NEON support in compiler""... $ac_c" 1>&6
+-echo "configure:10638: checking for ARM NEON support in compiler" >&5
+-_SAVE_CFLAGS="$CFLAGS"
+-if test "$GNU_CC"; then
+-  # gcc needs -mfpu=neon to recognize NEON instructions
+-  CFLAGS="$CFLAGS -mfpu=neon -mfloat-abi=softfp"
+-fi
+-cat > conftest.$ac_ext <<EOF
+-#line 10645 "configure"
+-#include "confdefs.h"
+-
+-int main() {
+-asm("vadd.i8 d0, d0, d0");
+-; return 0; }
+-EOF
+-if { (eval echo configure:10652: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+-  rm -rf conftest*
+-  result="yes"
+-else
+-  echo "configure: failed program was:" >&5
+-  cat conftest.$ac_ext >&5
+-  rm -rf conftest*
+-  result="no"
+-fi
+-rm -f conftest*
+-echo "$ac_t"""$result"" 1>&6
+-if test "$result" = "yes"; then
+-    cat >> confdefs.h <<\EOF
+-#define HAVE_ARM_NEON 1
+-EOF
+-
+-    HAVE_ARM_NEON=1
+-fi
+-CFLAGS="$_SAVE_CFLAGS"
+-
+ 
+ case "$target_os" in
+ darwin*)
+@@ -10676,7 +10627,7 @@
+ *)
+     
+ echo $ac_n "checking for pthread_create in -lpthreads""... $ac_c" 1>&6
+-echo "configure:10680: checking for pthread_create in -lpthreads" >&5
++echo "configure:10631: checking for pthread_create in -lpthreads" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -10699,7 +10650,7 @@
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lpthread""... $ac_c" 1>&6
+-echo "configure:10703: checking for pthread_create in -lpthread" >&5
++echo "configure:10654: checking for pthread_create in -lpthread" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -10722,7 +10673,7 @@
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lc_r""... $ac_c" 1>&6
+-echo "configure:10726: checking for pthread_create in -lc_r" >&5
++echo "configure:10677: checking for pthread_create in -lc_r" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -10745,7 +10696,7 @@
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lc""... $ac_c" 1>&6
+-echo "configure:10749: checking for pthread_create in -lc" >&5
++echo "configure:10700: checking for pthread_create in -lc" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -10804,7 +10755,7 @@
+ 				rm -f conftest*
+ 	ac_cv_have_dash_pthread=no
+ 	echo $ac_n "checking whether ${CC-cc} accepts -pthread""... $ac_c" 1>&6
+-echo "configure:10808: checking whether ${CC-cc} accepts -pthread" >&5
++echo "configure:10759: checking whether ${CC-cc} accepts -pthread" >&5
+ 	echo 'int main() { return 0; }' | cat > conftest.c
+ 	${CC-cc} -pthread -o conftest conftest.c > conftest.out 2>&1
+ 	if test $? -eq 0; then
+@@ -10827,7 +10778,7 @@
+ 			    ac_cv_have_dash_pthreads=no
+     if test "$ac_cv_have_dash_pthread" = "no"; then
+ 	    echo $ac_n "checking whether ${CC-cc} accepts -pthreads""... $ac_c" 1>&6
+-echo "configure:10831: checking whether ${CC-cc} accepts -pthreads" >&5
++echo "configure:10782: checking whether ${CC-cc} accepts -pthreads" >&5
+     	echo 'int main() { return 0; }' | cat > conftest.c
+ 	    ${CC-cc} -pthreads -o conftest conftest.c > conftest.out 2>&1
+     	if test $? -eq 0; then
+@@ -10922,7 +10873,7 @@
+ fi
+ 
+ echo $ac_n "checking whether mmap() sees write()s""... $ac_c" 1>&6
+-echo "configure:10926: checking whether mmap() sees write()s" >&5
++echo "configure:10877: checking whether mmap() sees write()s" >&5
+ 
+ 
+ mmap_test_prog='
+@@ -10961,11 +10912,11 @@
+   result="yes"
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10965 "configure"
++#line 10916 "configure"
+ #include "confdefs.h"
+ $mmap_test_prog 
+ EOF
+-if { (eval echo configure:10969: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:10920: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   result="yes"
+ else
+@@ -10990,13 +10941,13 @@
+ 
+ if test $ac_cv_prog_gcc = yes; then
+     echo $ac_n "checking whether ${CC-cc} needs -traditional""... $ac_c" 1>&6
+-echo "configure:10994: checking whether ${CC-cc} needs -traditional" >&5
++echo "configure:10945: checking whether ${CC-cc} needs -traditional" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc_traditional'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+     ac_pattern="Autoconf.*'x'"
+   cat > conftest.$ac_ext <<EOF
+-#line 11000 "configure"
++#line 10951 "configure"
+ #include "confdefs.h"
+ #include <sgtty.h>
+ Autoconf TIOCGETP
+@@ -11014,7 +10965,7 @@
+ 
+   if test $ac_cv_prog_gcc_traditional = no; then
+     cat > conftest.$ac_ext <<EOF
+-#line 11018 "configure"
++#line 10969 "configure"
+ #include "confdefs.h"
+ #include <termio.h>
+ Autoconf TCGETA
+@@ -11036,7 +10987,7 @@
+ fi
+ 
+ echo $ac_n "checking for 8-bit clean memcmp""... $ac_c" 1>&6
+-echo "configure:11040: checking for 8-bit clean memcmp" >&5
++echo "configure:10991: checking for 8-bit clean memcmp" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_memcmp_clean'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11044,7 +10995,7 @@
+   ac_cv_func_memcmp_clean=no
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11048 "configure"
++#line 10999 "configure"
+ #include "confdefs.h"
+ 
+ main()
+@@ -11054,7 +11005,7 @@
+ }
+ 
+ EOF
+-if { (eval echo configure:11058: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11009: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_func_memcmp_clean=yes
+ else
+@@ -11076,12 +11027,12 @@
+                 stat64 statvfs statvfs64 strerror strtok_r truncate64
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:11080: checking for $ac_func" >&5
++echo "configure:11031: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11085 "configure"
++#line 11036 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -11104,7 +11055,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11108: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11059: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -11132,12 +11083,12 @@
+ _SAVE_LDFLAGS=$LDFLAGS
+ LDFLAGS="$LDFLAGS -lrt"
+ echo $ac_n "checking for clock_gettime(CLOCK_MONOTONIC) and -lrt""... $ac_c" 1>&6
+-echo "configure:11136: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
++echo "configure:11087: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_clock_monotonic'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11141 "configure"
++#line 11092 "configure"
+ #include "confdefs.h"
+ #include <time.h>
+ int main() {
+@@ -11145,7 +11096,7 @@
+                               clock_gettime(CLOCK_MONOTONIC, &ts); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11149: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11100: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_clock_monotonic=yes
+ else
+@@ -11171,14 +11122,14 @@
+ fi
+ 
+ cat > conftest.$ac_ext <<EOF
+-#line 11175 "configure"
++#line 11126 "configure"
+ #include "confdefs.h"
+ #include <windows.h>
+ int main() {
+ SYSTEMTIME st;FILETIME ft;SystemTimeToFileTime(&st,&ft);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11182: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11133: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_systemtimetofiletime="yes"
+ else
+@@ -11195,14 +11146,14 @@
+ 
+ fi
+ cat > conftest.$ac_ext <<EOF
+-#line 11199 "configure"
++#line 11150 "configure"
+ #include "confdefs.h"
+ #include <windows.h>
+ int main() {
+ FILETIME ft;GetSystemTimeAsFileTime(&ft);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11206: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11157: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_getsystemtimeasfiletime="yes"
+ else
+@@ -11229,19 +11180,19 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for wcrtomb""... $ac_c" 1>&6
+-echo "configure:11233: checking for wcrtomb" >&5
++echo "configure:11184: checking for wcrtomb" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_wcrtomb'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11238 "configure"
++#line 11189 "configure"
+ #include "confdefs.h"
+ #include <wchar.h>
+ int main() {
+ mbstate_t ps={0};wcrtomb(0,'f',&ps);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11245: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11196: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_wcrtomb="yes"
+ else
+@@ -11261,19 +11212,19 @@
+ 
+ fi
+ echo $ac_n "checking for mbrtowc""... $ac_c" 1>&6
+-echo "configure:11265: checking for mbrtowc" >&5
++echo "configure:11216: checking for mbrtowc" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_mbrtowc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11270 "configure"
++#line 11221 "configure"
+ #include "confdefs.h"
+ #include <wchar.h>
+ int main() {
+ mbstate_t ps={0};mbrtowc(0,0,0,&ps);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11277: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11228: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_mbrtowc="yes"
+ else
+@@ -11302,12 +11253,12 @@
+ fi
+ 
+ echo $ac_n "checking for res_ninit()""... $ac_c" 1>&6
+-echo "configure:11306: checking for res_ninit()" >&5
++echo "configure:11257: checking for res_ninit()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_res_ninit'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11311 "configure"
++#line 11262 "configure"
+ #include "confdefs.h"
+ 
+         #ifdef linux
+@@ -11319,7 +11270,7 @@
+ int foo = res_ninit(&_res);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11323: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11274: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_res_ninit=yes
+ else
+@@ -11349,12 +11300,12 @@
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for gnu_get_libc_version()""... $ac_c" 1>&6
+-echo "configure:11353: checking for gnu_get_libc_version()" >&5
++echo "configure:11304: checking for gnu_get_libc_version()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_gnu_get_libc_version'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11358 "configure"
++#line 11309 "configure"
+ #include "confdefs.h"
+ 
+         #ifdef HAVE_GNU_LIBC_VERSION_H
+@@ -11365,7 +11316,7 @@
+ const char *glibc_version = gnu_get_libc_version();
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11369: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11320: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_gnu_get_libc_version=yes
+ else
+@@ -11394,7 +11345,7 @@
+     *)
+     
+ echo $ac_n "checking for iconv in -lc""... $ac_c" 1>&6
+-echo "configure:11398: checking for iconv in -lc" >&5
++echo "configure:11349: checking for iconv in -lc" >&5
+ ac_lib_var=`echo c'_'iconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -11402,7 +11353,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lc  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 11406 "configure"
++#line 11357 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -11416,7 +11367,7 @@
+ iconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11420: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11371: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -11435,7 +11386,7 @@
+ else
+   echo "$ac_t""no" 1>&6
+ echo $ac_n "checking for iconv in -liconv""... $ac_c" 1>&6
+-echo "configure:11439: checking for iconv in -liconv" >&5
++echo "configure:11390: checking for iconv in -liconv" >&5
+ ac_lib_var=`echo iconv'_'iconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -11443,7 +11394,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-liconv  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 11447 "configure"
++#line 11398 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -11457,7 +11408,7 @@
+ iconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11461: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11412: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -11476,7 +11427,7 @@
+ else
+   echo "$ac_t""no" 1>&6
+ echo $ac_n "checking for libiconv in -liconv""... $ac_c" 1>&6
+-echo "configure:11480: checking for libiconv in -liconv" >&5
++echo "configure:11431: checking for libiconv in -liconv" >&5
+ ac_lib_var=`echo iconv'_'libiconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -11484,7 +11435,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-liconv  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 11488 "configure"
++#line 11439 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -11498,7 +11449,7 @@
+ libiconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11502: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11453: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -11525,12 +11476,12 @@
+ _SAVE_LIBS=$LIBS
+ LIBS="$LIBS $_ICONV_LIBS"
+ echo $ac_n "checking for iconv()""... $ac_c" 1>&6
+-echo "configure:11529: checking for iconv()" >&5
++echo "configure:11480: checking for iconv()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_iconv'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11534 "configure"
++#line 11485 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdlib.h>
+@@ -11544,7 +11495,7 @@
+         
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11548: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11499: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_iconv=yes
+ else
+@@ -11568,12 +11519,12 @@
+     LIBXUL_LIBS="$LIBXUL_LIBS $_ICONV_LIBS"
+     LIBICONV="$_ICONV_LIBS"
+     echo $ac_n "checking for iconv() with const input""... $ac_c" 1>&6
+-echo "configure:11572: checking for iconv() with const input" >&5
++echo "configure:11523: checking for iconv() with const input" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_const_iconv'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11577 "configure"
++#line 11528 "configure"
+ #include "confdefs.h"
+ 
+             #include <stdlib.h>
+@@ -11588,7 +11539,7 @@
+             
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11592: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11543: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_func_const_iconv=yes
+ else
+@@ -11624,7 +11575,7 @@
+ 
+ 
+ echo $ac_n "checking for an implementation of va_copy()""... $ac_c" 1>&6
+-echo "configure:11628: checking for an implementation of va_copy()" >&5
++echo "configure:11579: checking for an implementation of va_copy()" >&5
+ if eval "test \"`echo '$''{'ac_cv_va_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11634,7 +11585,7 @@
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11638 "configure"
++#line 11589 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -11648,7 +11599,7 @@
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:11652: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11603: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_va_copy=yes
+ else
+@@ -11665,7 +11616,7 @@
+ 
+ echo "$ac_t""$ac_cv_va_copy" 1>&6
+ echo $ac_n "checking for an implementation of __va_copy()""... $ac_c" 1>&6
+-echo "configure:11669: checking for an implementation of __va_copy()" >&5
++echo "configure:11620: checking for an implementation of __va_copy()" >&5
+ if eval "test \"`echo '$''{'ac_cv___va_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11675,7 +11626,7 @@
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11679 "configure"
++#line 11630 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -11689,7 +11640,7 @@
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:11693: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11644: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv___va_copy=yes
+ else
+@@ -11706,7 +11657,7 @@
+ 
+ echo "$ac_t""$ac_cv___va_copy" 1>&6
+ echo $ac_n "checking whether va_lists can be copied by value""... $ac_c" 1>&6
+-echo "configure:11710: checking whether va_lists can be copied by value" >&5
++echo "configure:11661: checking whether va_lists can be copied by value" >&5
+ if eval "test \"`echo '$''{'ac_cv_va_val_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11716,7 +11667,7 @@
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11720 "configure"
++#line 11671 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -11730,7 +11681,7 @@
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:11734: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11685: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_va_val_copy=yes
+ else
+@@ -11839,12 +11790,12 @@
+ if test "$GNU_CC"; then
+   if test "$CPU_ARCH" = "arm" ; then
+     echo $ac_n "checking for ARM EABI""... $ac_c" 1>&6
+-echo "configure:11843: checking for ARM EABI" >&5
++echo "configure:11794: checking for ARM EABI" >&5
+ if eval "test \"`echo '$''{'ac_cv_gcc_arm_eabi'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11848 "configure"
++#line 11799 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -11857,7 +11808,7 @@
+                         
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11861: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11812: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_gcc_arm_eabi="yes"
+ else
+@@ -11879,12 +11830,12 @@
+   fi
+ 
+   echo $ac_n "checking for gcc 3.0 ABI""... $ac_c" 1>&6
+-echo "configure:11883: checking for gcc 3.0 ABI" >&5
++echo "configure:11834: checking for gcc 3.0 ABI" >&5
+ if eval "test \"`echo '$''{'ac_cv_gcc_three_abi'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11888 "configure"
++#line 11839 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -11897,7 +11848,7 @@
+                       
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11901: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11852: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_gcc_three_abi="yes"
+ else
+@@ -11921,12 +11872,12 @@
+ 
+ 
+ echo $ac_n "checking for C++ \"explicit\" keyword""... $ac_c" 1>&6
+-echo "configure:11925: checking for C++ \"explicit\" keyword" >&5
++echo "configure:11876: checking for C++ \"explicit\" keyword" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_explicit'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11930 "configure"
++#line 11881 "configure"
+ #include "confdefs.h"
+ class X {
+                                public: explicit X(int i) : i_(i) {}
+@@ -11936,7 +11887,7 @@
+ X x(3);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11891: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_explicit=yes
+ else
+@@ -11957,12 +11908,12 @@
+ fi
+ 
+ echo $ac_n "checking for C++ \"typename\" keyword""... $ac_c" 1>&6
+-echo "configure:11961: checking for C++ \"typename\" keyword" >&5
++echo "configure:11912: checking for C++ \"typename\" keyword" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_typename'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11966 "configure"
++#line 11917 "configure"
+ #include "confdefs.h"
+ class param {
+                                public:
+@@ -11981,7 +11932,7 @@
+                                A.foo(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11985: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11936: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_typename=yes
+ else
+@@ -12002,12 +11953,12 @@
+ fi
+ 
+ echo $ac_n "checking for modern C++ template specialization syntax support""... $ac_c" 1>&6
+-echo "configure:12006: checking for modern C++ template specialization syntax support" >&5
++echo "configure:11957: checking for modern C++ template specialization syntax support" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_modern_specialize_template_syntax'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12011 "configure"
++#line 11962 "configure"
+ #include "confdefs.h"
+ template <class T> struct X { int a; };
+                                class Y {};
+@@ -12017,7 +11968,7 @@
+                                X<Y> y_x;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12021: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11972: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_modern_specialize_template_syntax=yes
+ else
+@@ -12039,12 +11990,12 @@
+ 
+ 
+ echo $ac_n "checking whether partial template specialization works""... $ac_c" 1>&6
+-echo "configure:12043: checking whether partial template specialization works" >&5
++echo "configure:11994: checking whether partial template specialization works" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_partial_specialization'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12048 "configure"
++#line 11999 "configure"
+ #include "confdefs.h"
+ template <class T> class Foo {};
+                                template <class T> class Foo<T*> {};
+@@ -12052,7 +12003,7 @@
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12056: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12007: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_partial_specialization=yes
+ else
+@@ -12073,12 +12024,12 @@
+ fi
+ 
+ echo $ac_n "checking whether operators must be re-defined for templates derived from templates""... $ac_c" 1>&6
+-echo "configure:12077: checking whether operators must be re-defined for templates derived from templates" >&5
++echo "configure:12028: checking whether operators must be re-defined for templates derived from templates" >&5
+ if eval "test \"`echo '$''{'ac_cv_need_derived_template_operators'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12082 "configure"
++#line 12033 "configure"
+ #include "confdefs.h"
+ template <class T> class Base { };
+                                 template <class T>
+@@ -12090,7 +12041,7 @@
+                                 return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12094: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12045: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_need_derived_template_operators=no
+ else
+@@ -12112,12 +12063,12 @@
+ 
+ 
+ echo $ac_n "checking whether we need to cast a derived template to pass as its base class""... $ac_c" 1>&6
+-echo "configure:12116: checking whether we need to cast a derived template to pass as its base class" >&5
++echo "configure:12067: checking whether we need to cast a derived template to pass as its base class" >&5
+ if eval "test \"`echo '$''{'ac_cv_need_cpp_template_cast_to_base'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12121 "configure"
++#line 12072 "configure"
+ #include "confdefs.h"
+ template <class T> class Base { };
+                                 template <class T> class Derived : public Base<T> { };
+@@ -12126,7 +12077,7 @@
+ Derived<char> bar; return foo(bar);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12130: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12081: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_need_cpp_template_cast_to_base=no
+ else
+@@ -12147,12 +12098,12 @@
+ fi
+ 
+ echo $ac_n "checking whether the compiler can resolve const ambiguities for templates""... $ac_c" 1>&6
+-echo "configure:12151: checking whether the compiler can resolve const ambiguities for templates" >&5
++echo "configure:12102: checking whether the compiler can resolve const ambiguities for templates" >&5
+ if eval "test \"`echo '$''{'ac_cv_can_resolve_const_ambiguity'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12156 "configure"
++#line 12107 "configure"
+ #include "confdefs.h"
+ 
+                                 template <class T> class ptrClass {
+@@ -12173,7 +12124,7 @@
+                                  a(&i); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12177: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12128: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_can_resolve_const_ambiguity=yes
+ else
+@@ -12195,12 +12146,12 @@
+ 
+ 
+ echo $ac_n "checking whether the C++ \"using\" keyword can change access""... $ac_c" 1>&6
+-echo "configure:12199: checking whether the C++ \"using\" keyword can change access" >&5
++echo "configure:12150: checking whether the C++ \"using\" keyword can change access" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_access_changing_using2'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12204 "configure"
++#line 12155 "configure"
+ #include "confdefs.h"
+ class A { protected: int foo() { return 0; } };
+                    class B : public A { public: using A::foo; };
+@@ -12208,10 +12159,10 @@
+ B b; return b.foo();
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12212: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12163: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 12215 "configure"
++#line 12166 "configure"
+ #include "confdefs.h"
+ class A { public: int foo() { return 1; } };
+                        class B : public A { private: using A::foo; };
+@@ -12219,7 +12170,7 @@
+ B b; return b.foo();
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12223: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12174: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_access_changing_using2=no
+ else
+@@ -12247,12 +12198,12 @@
+ fi
+ 
+ echo $ac_n "checking whether the C++ \"using\" keyword resolves ambiguity""... $ac_c" 1>&6
+-echo "configure:12251: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
++echo "configure:12202: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_ambiguity_resolving_using'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12256 "configure"
++#line 12207 "configure"
+ #include "confdefs.h"
+ class X { 
+                                  public: int go(const X&) {return 3;}
+@@ -12268,7 +12219,7 @@
+ X x; Y y; y.jo(x);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12272: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12223: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_ambiguity_resolving_using=yes
+ else
+@@ -12289,19 +12240,19 @@
+ fi
+ 
+ echo $ac_n "checking for \"std::\" namespace""... $ac_c" 1>&6
+-echo "configure:12293: checking for \"std::\" namespace" >&5
++echo "configure:12244: checking for \"std::\" namespace" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_namespace_std'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12298 "configure"
++#line 12249 "configure"
+ #include "confdefs.h"
+ #include <algorithm>
+ int main() {
+ return std::min(0, 1);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12305: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12256: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_namespace_std=yes
+ else
+@@ -12322,12 +12273,12 @@
+ fi
+ 
+ echo $ac_n "checking whether standard template operator!=() is ambiguous""... $ac_c" 1>&6
+-echo "configure:12326: checking whether standard template operator!=() is ambiguous" >&5
++echo "configure:12277: checking whether standard template operator!=() is ambiguous" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_unambiguous_std_notequal'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12331 "configure"
++#line 12282 "configure"
+ #include "confdefs.h"
+ #include <algorithm>
+                                 struct T1 {};
+@@ -12337,7 +12288,7 @@
+ T1 a,b; return a != b;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12341: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12292: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_unambiguous_std_notequal=unambiguous
+ else
+@@ -12359,12 +12310,12 @@
+ 
+ 
+ echo $ac_n "checking for C++ reinterpret_cast""... $ac_c" 1>&6
+-echo "configure:12363: checking for C++ reinterpret_cast" >&5
++echo "configure:12314: checking for C++ reinterpret_cast" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_reinterpret_cast'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12368 "configure"
++#line 12319 "configure"
+ #include "confdefs.h"
+ struct X { int i; };
+                                struct Y { int i; };
+@@ -12372,7 +12323,7 @@
+ X x; X*const z = &x;Y*y = reinterpret_cast<Y*>(z);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12376: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12327: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_reinterpret_cast=yes
+ else
+@@ -12393,7 +12344,7 @@
+ fi
+ 
+ echo $ac_n "checking for C++ dynamic_cast to void*""... $ac_c" 1>&6
+-echo "configure:12397: checking for C++ dynamic_cast to void*" >&5
++echo "configure:12348: checking for C++ dynamic_cast to void*" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_dynamic_cast_void_ptr'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -12401,7 +12352,7 @@
+   ac_cv_cpp_dynamic_cast_void_ptr=no
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12405 "configure"
++#line 12356 "configure"
+ #include "confdefs.h"
+ #ifdef __cplusplus
+ extern "C" void exit(int);
+@@ -12420,7 +12371,7 @@
+                                            ((void*)&mdo == dynamic_cast<void*>(suby))));
+                             }
+ EOF
+-if { (eval echo configure:12424: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:12375: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_cpp_dynamic_cast_void_ptr=yes
+ else
+@@ -12444,19 +12395,19 @@
+ 
+ 
+ echo $ac_n "checking whether C++ requires implementation of unused virtual methods""... $ac_c" 1>&6
+-echo "configure:12448: checking whether C++ requires implementation of unused virtual methods" >&5
++echo "configure:12399: checking whether C++ requires implementation of unused virtual methods" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_unused_required'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12453 "configure"
++#line 12404 "configure"
+ #include "confdefs.h"
+ class X {private: virtual void never_called();};
+ int main() {
+ X x;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12460: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12411: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_cpp_unused_required=no
+ else
+@@ -12479,12 +12430,12 @@
+ 
+ 
+ echo $ac_n "checking for trouble comparing to zero near std::operator!=()""... $ac_c" 1>&6
+-echo "configure:12483: checking for trouble comparing to zero near std::operator!=()" >&5
++echo "configure:12434: checking for trouble comparing to zero near std::operator!=()" >&5
+ if eval "test \"`echo '$''{'ac_cv_trouble_comparing_to_zero'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12488 "configure"
++#line 12439 "configure"
+ #include "confdefs.h"
+ #include <algorithm>
+                                 template <class T> class Foo {};
+@@ -12495,7 +12446,7 @@
+ Foo<int> f; return (0 != f);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12499: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12450: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_trouble_comparing_to_zero=no
+ else
+@@ -12519,19 +12470,19 @@
+ _SAVE_LDFLAGS=$LDFLAGS
+ LDFLAGS="$LDFLAGS $DSO_PIC_CFLAGS $DSO_LDOPTS"
+ echo $ac_n "checking for __thread keyword for TLS variables""... $ac_c" 1>&6
+-echo "configure:12523: checking for __thread keyword for TLS variables" >&5
++echo "configure:12474: checking for __thread keyword for TLS variables" >&5
+ if eval "test \"`echo '$''{'ac_cv_thread_keyword'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12528 "configure"
++#line 12479 "configure"
+ #include "confdefs.h"
+ __thread bool tlsIsMainThread = false;
+ int main() {
+ return tlsIsMainThread;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12535: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12486: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_thread_keyword=yes
+ else
+@@ -12568,17 +12519,17 @@
+ MALLOC_H=
+ ac_safe=`echo "malloc.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for malloc.h""... $ac_c" 1>&6
+-echo "configure:12572: checking for malloc.h" >&5
++echo "configure:12523: checking for malloc.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12577 "configure"
++#line 12528 "configure"
+ #include "confdefs.h"
+ #include <malloc.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:12582: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:12533: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -12602,17 +12553,17 @@
+ if test "$MALLOC_H" = ""; then
+   ac_safe=`echo "malloc/malloc.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for malloc/malloc.h""... $ac_c" 1>&6
+-echo "configure:12606: checking for malloc/malloc.h" >&5
++echo "configure:12557: checking for malloc/malloc.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12611 "configure"
++#line 12562 "configure"
+ #include "confdefs.h"
+ #include <malloc/malloc.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:12616: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:12567: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -12636,17 +12587,17 @@
+   if test "$MALLOC_H" = ""; then
+     ac_safe=`echo "sys/malloc.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for sys/malloc.h""... $ac_c" 1>&6
+-echo "configure:12640: checking for sys/malloc.h" >&5
++echo "configure:12591: checking for sys/malloc.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12645 "configure"
++#line 12596 "configure"
+ #include "confdefs.h"
+ #include <sys/malloc.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:12650: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:12601: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -12680,12 +12631,12 @@
+ for ac_func in strndup posix_memalign memalign valloc
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:12684: checking for $ac_func" >&5
++echo "configure:12635: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12689 "configure"
++#line 12640 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -12711,7 +12662,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12715: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12666: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -12738,19 +12689,19 @@
+ 
+ 
+ echo $ac_n "checking for __attribute__((always_inline))""... $ac_c" 1>&6
+-echo "configure:12742: checking for __attribute__((always_inline))" >&5
++echo "configure:12693: checking for __attribute__((always_inline))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_always_inline'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12747 "configure"
++#line 12698 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ inline void f(void) __attribute__((always_inline));
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12754: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12705: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_always_inline=yes
+ else
+@@ -12765,19 +12716,19 @@
+ echo "$ac_t""$ac_cv_attribute_always_inline" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((malloc))""... $ac_c" 1>&6
+-echo "configure:12769: checking for __attribute__((malloc))" >&5
++echo "configure:12720: checking for __attribute__((malloc))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_malloc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12774 "configure"
++#line 12725 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ void* f(int) __attribute__((malloc));
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12781: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12732: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_malloc=yes
+ else
+@@ -12792,19 +12743,19 @@
+ echo "$ac_t""$ac_cv_attribute_malloc" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((warn_unused_result))""... $ac_c" 1>&6
+-echo "configure:12796: checking for __attribute__((warn_unused_result))" >&5
++echo "configure:12747: checking for __attribute__((warn_unused_result))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_warn_unused'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12801 "configure"
++#line 12752 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ int f(void) __attribute__((warn_unused_result));
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12808: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12759: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_warn_unused=yes
+ else
+@@ -12819,19 +12770,19 @@
+ echo "$ac_t""$ac_cv_attribute_warn_unused" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((noreturn))""... $ac_c" 1>&6
+-echo "configure:12823: checking for __attribute__((noreturn))" >&5
++echo "configure:12774: checking for __attribute__((noreturn))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_noreturn'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12828 "configure"
++#line 12779 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ void f(void) __attribute__((noreturn));
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12835: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12786: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_noreturn=yes
+ else
+@@ -12855,19 +12806,19 @@
+ 
+ 
+ echo $ac_n "checking for LC_MESSAGES""... $ac_c" 1>&6
+-echo "configure:12859: checking for LC_MESSAGES" >&5
++echo "configure:12810: checking for LC_MESSAGES" >&5
+ if eval "test \"`echo '$''{'ac_cv_i18n_lc_messages'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12864 "configure"
++#line 12815 "configure"
+ #include "confdefs.h"
+ #include <locale.h>
+ int main() {
+ int category = LC_MESSAGES;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12871: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12822: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_i18n_lc_messages=yes
+ else
+@@ -12890,12 +12841,12 @@
+ for ac_func in localeconv
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:12894: checking for $ac_func" >&5
++echo "configure:12845: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12899 "configure"
++#line 12850 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -12918,7 +12869,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12922: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12873: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -13088,7 +13039,7 @@
+ 	# Extract the first word of "nspr-config", so it can be a program name with args.
+ set dummy nspr-config; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:13092: checking for $ac_word" >&5
++echo "configure:13043: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_NSPR_CONFIG'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -13123,7 +13074,7 @@
+ 
+ 	min_nspr_version=4.7.0
+ 	echo $ac_n "checking for NSPR - version >= $min_nspr_version""... $ac_c" 1>&6
+-echo "configure:13127: checking for NSPR - version >= $min_nspr_version" >&5
++echo "configure:13078: checking for NSPR - version >= $min_nspr_version" >&5
+ 
+ 	no_nspr=""
+ 	if test "$NSPR_CONFIG" != "no"; then
+@@ -13182,7 +13133,7 @@
+     _SAVE_CFLAGS=$CFLAGS
+     CFLAGS="$CFLAGS $NSPR_CFLAGS"
+     cat > conftest.$ac_ext <<EOF
+-#line 13186 "configure"
++#line 13137 "configure"
+ #include "confdefs.h"
+ #include "prlog.h"
+ int main() {
+@@ -13191,7 +13142,7 @@
+                  #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:13195: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13146: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   MOZ_NATIVE_NSPR=1
+ else
+@@ -13210,13 +13161,11 @@
+ BUILD_STATIC_LIBS=
+ ENABLE_TESTS=1
+ 
+-MOZ_THUMB2=
+ USE_ARM_KUSER=
+ 
+ case "${target}" in
+     arm-android-eabi)
+         USE_ARM_KUSER=1
+-        MOZ_THUMB2=1
+         ;;
+ esac
+ 
+@@ -13264,93 +13213,293 @@
+ 
+ # Individual module options
+ 
+-case "$target_cpu" in
+-  arm*)
+-    MOZ_ARM_ARCH=armv7
+-  ;;
++
++case "${target}" in
++arm-android-eabi)
++    MOZ_THUMB=yes
++    MOZ_ARCH=armv7-a
++    MOZ_FPU=vfp
++    MOZ_FLOAT_ABI=softfp
++    ;;
++arm*-*)
++    if test -n "$MOZ_PLATFORM_MAEMO"; then
++        MOZ_THUMB=no
++        MOZ_ARCH=armv7-a
++        MOZ_FLOAT_ABI=softfp
++    fi
++    if test "$MOZ_PLATFORM_MAEMO" = 6; then
++        MOZ_THUMB=yes
++    fi
++    ;;
+ esac
++
+ # Check whether --enable-thumb2 or --disable-thumb2 was given.
+ if test "${enable_thumb2+set}" = set; then
+   enableval="$enable_thumb2"
+-  if test "$enableval" = "yes"; then
+-    MOZ_THUMB2=1
+-  elif test "$enableval" = "no"; then
+-    MOZ_THUMB2=
++  if test "$enableval" = "no"; then
++    MOZ_THUMB=no
++  elif test "$enableval" = "yes"; then
++    MOZ_THUMB=yes
+   else
+     { echo "configure: error: Option, thumb2, does not take an argument ($enableval)." 1>&2; exit 1; }
+   fi
+ fi
+ 
+-if test -n "$MOZ_THUMB2"; then
+-  MOZ_ARM_ARCH=armv7
++
++# Check whether --with-thumb or --without-thumb was given.
++if test "${with_thumb+set}" = set; then
++  withval="$with_thumb"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-thumb is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_THUMB=$withval
+ fi
+ 
+-# Check whether --with-cpu-arch or --without-cpu-arch was given.
+-if test "${with_cpu_arch+set}" = set; then
+-  withval="$with_cpu_arch"
+-  MOZ_ARM_ARCH=$withval
++
++# Check whether --with-thumb-interwork or --without-thumb-interwork was given.
++if test "${with_thumb_interwork+set}" = set; then
++  withval="$with_thumb_interwork"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-thumb-interwork is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_THUMB_INTERWORK=$withval
+ fi
+ 
+ 
+-if test -n "$MOZ_THUMB2"; then
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$MOZ_ARM_ARCH" != "armv7"; then
+-        { echo "configure: error: --enable-thumb2 is not compatible with cpu-arch=$MOZ_ARM_ARCH" 1>&2; exit 1; }
+-      fi
+-      if test "$GNU_CC"; then
+-        cat >> confdefs.h <<\EOF
+-#define MOZ_THUMB2 1
++# Check whether --with-arch or --without-arch was given.
++if test "${with_arch+set}" = set; then
++  withval="$with_arch"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-arch is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_ARCH=$withval
++fi
++
++
++# Check whether --with-fpu or --without-fpu was given.
++if test "${with_fpu+set}" = set; then
++  withval="$with_fpu"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-fpu is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_FPU=$withval
++fi
++
++
++# Check whether --with-float-abi or --without-float-abi was given.
++if test "${with_float_abi+set}" = set; then
++  withval="$with_float_abi"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-float-abi is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_FLOAT_ABI=$withval
++fi
++
++
++# Check whether --with-soft-float or --without-soft-float was given.
++if test "${with_soft_float+set}" = set; then
++  withval="$with_soft_float"
++  if test -z "$GNU_CC"; then
++        { echo "configure: error: --with-soft-float is not supported on non-GNU toolchain-defaults" 1>&2; exit 1; }
++    fi
++    MOZ_SOFT_FLOAT=$withval
++fi
++
++
++case "$MOZ_ARCH" in
++toolchain-default|"")
++    arch_flag=""
++    ;;
++*)
++    arch_flag="-march=$MOZ_ARCH"
++    ;;
++esac
++
++case "$MOZ_THUMB" in
++yes)
++    MOZ_THUMB2=1
++    thumb_flag="-mthumb"
++    ;;
++no)
++    MOZ_THUMB2=
++    thumb_flag="-marm"
++    ;;
++*)
++    _SAVE_CFLAGS="$CFLAGS"
++    CFLAGS="$arch_flag"
++    cat > conftest.$ac_ext <<EOF
++#line 13332 "configure"
++#include "confdefs.h"
++
++int main() {
++return sizeof(__thumb2__);
++; return 0; }
+ EOF
++if { (eval echo configure:13339: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++  rm -rf conftest*
++  MOZ_THUMB2=1
++else
++  echo "configure: failed program was:" >&5
++  cat conftest.$ac_ext >&5
++  rm -rf conftest*
++  MOZ_THUMB2=
++fi
++rm -f conftest*
++    CFLAGS="$_SAVE_CFLAGS"
++    thumb_flag=""
++    ;;
++esac
+ 
+-        cat >> confdefs.h <<\EOF
+-#define MOZ_ARM_ARCH 1
++if test "$MOZ_THUMB2" = 1; then
++    cat >> confdefs.h <<\EOF
++#define MOZ_THUMB2 1
+ EOF
+ 
+-        CFLAGS="$CFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-      else
+-        { echo "configure: error: --enable-thumb2 is not supported for non-GNU toolchains" 1>&2; exit 1; }
+-      fi
++fi
++
++case "$MOZ_THUMB_INTERWORK" in
++yes)
++    thumb_interwork_flag="-mthumb-interwork"
+     ;;
+-    *)
+-      { echo "configure: error: --enable-thumb2 is not supported for non-ARM CPU architectures" 1>&2; exit 1; }
++no)
++    thumb_interwork_flag="-mno-thumb-interwork"
+     ;;
+-  esac
+-elif test "$MOZ_ARM_ARCH" = "armv7"; then
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$GNU_CC"; then
+-        cat >> confdefs.h <<\EOF
+-#define MOZ_ARM_ARCH 1
+-EOF
++*) # toolchain-default
++    thumb_interwork_flag=""
++    ;;
++esac
+ 
+-        CFLAGS="$CFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-      else
+-        { echo "configure: error: --with-cpu-arch=armv7 is not supported for non-GNU toolchains" 1>&2; exit 1; }
+-      fi
++case "$MOZ_FPU" in
++toolchain-default|"")
++    fpu_flag=""
+     ;;
+-    *)
+-      { echo "configure: error: --with-cpu-arch=armv7 is not supported for non-ARM CPU architectures" 1>&2; exit 1; }
++*)
++    fpu_flag="-mfpu=$MOZ_FPU"
+     ;;
+-  esac
++esac
++
++case "$MOZ_FLOAT_ABI" in
++toolchain-default|"")
++    float_abi_flag=""
++    ;;
++*)
++    float_abi_flag="-mfloat-abi=$MOZ_FLOAT_ABI"
++    ;;
++esac
++
++case "$MOZ_SOFT_FLOAT" in
++yes)
++    soft_float_flag="-msoft-float"
++    ;;
++no)
++    soft_float_flag="-mno-soft-float"
++    ;;
++*) # toolchain-default
++    soft_float_flag=""
++    ;;
++esac
++
++all_flags=`echo $arch_flag $thumb_flag $thumb_interwork_flag $fpu_flag $float_abi_flag $soft_float_flag`
++if test -n "$all_flags"; then
++    _SAVE_CFLAGS="$CFLAGS"
++    CFLAGS="$all_flags"
++    echo $ac_n "checking whether the chosen combination of compiler flags ($all_flags) works""... $ac_c" 1>&6
++echo "configure:13408: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
++    cat > conftest.$ac_ext <<EOF
++#line 13410 "configure"
++#include "confdefs.h"
++
++int main() {
++return 0;
++; return 0; }
++EOF
++if { (eval echo configure:13417: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++  rm -rf conftest*
++  echo "$ac_t""yes" 1>&6
+ else
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$GNU_CC"; then
+-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-      fi
+-      ;;
+-  esac
++  echo "configure: failed program was:" >&5
++  cat conftest.$ac_ext >&5
++  rm -rf conftest*
++  { echo "configure: error: no" 1>&2; exit 1; }
++fi
++rm -f conftest*
++
++    CFLAGS="$_SAVE_CFLAGS $all_flags"
++    CXXFLAGS="$CXXFLAGS $all_flags"
++    ASFLAGS="$ASFLAGS $all_flags"
++    if test -n "$thumb_flag"; then
++        LDFLAGS="$LDFLAGS $thumb_flag"
++    fi
+ fi
+ 
+ 
+ 
++if test "$CPU_ARCH" = "arm"; then
++  echo $ac_n "checking for ARM SIMD support in compiler""... $ac_c" 1>&6
++echo "configure:13440: checking for ARM SIMD support in compiler" >&5
++  # We try to link so that this also fails when
++  # building with LTO.
++  cat > conftest.$ac_ext <<EOF
++#line 13444 "configure"
++#include "confdefs.h"
++
++int main() {
++asm("uqadd8 r1, r1, r2");
++; return 0; }
++EOF
++if { (eval echo configure:13451: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++  rm -rf conftest*
++  result="yes"
++else
++  echo "configure: failed program was:" >&5
++  cat conftest.$ac_ext >&5
++  rm -rf conftest*
++  result="no"
++fi
++rm -f conftest*
++  echo "$ac_t"""$result"" 1>&6
++  if test "$result" = "yes"; then
++      cat >> confdefs.h <<\EOF
++#define HAVE_ARM_SIMD 1
++EOF
++
++      HAVE_ARM_SIMD=1
++  fi
++
++  echo $ac_n "checking for ARM NEON support in compiler""... $ac_c" 1>&6
++echo "configure:13471: checking for ARM NEON support in compiler" >&5
++  # We try to link so that this also fails when
++  # building with LTO.
++  cat > conftest.$ac_ext <<EOF
++#line 13475 "configure"
++#include "confdefs.h"
++
++int main() {
++asm(".fpu neon\n vadd.i8 d0, d0, d0");
++; return 0; }
++EOF
++if { (eval echo configure:13482: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++  rm -rf conftest*
++  result="yes"
++else
++  echo "configure: failed program was:" >&5
++  cat conftest.$ac_ext >&5
++  rm -rf conftest*
++  result="no"
++fi
++rm -f conftest*
++  echo "$ac_t"""$result"" 1>&6
++  if test "$result" = "yes"; then
++      cat >> confdefs.h <<\EOF
++#define HAVE_ARM_NEON 1
++EOF
++
++      HAVE_ARM_NEON=1
++  fi
++fi # CPU_ARCH = arm
++
++
++
+ 
+ # Debugging and Optimizations
+ 
+@@ -13389,18 +13538,18 @@
+ 
+ if test -n "$MOZ_DEBUG"; then
+     echo $ac_n "checking for valid debug flags""... $ac_c" 1>&6
+-echo "configure:13393: checking for valid debug flags" >&5
++echo "configure:13542: checking for valid debug flags" >&5
+     _SAVE_CFLAGS=$CFLAGS
+     CFLAGS="$CFLAGS $MOZ_DEBUG_FLAGS"
+     cat > conftest.$ac_ext <<EOF
+-#line 13397 "configure"
++#line 13546 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+ printf("Hello World\n");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:13404: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13553: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _results=yes
+ else
+@@ -13441,18 +13590,18 @@
+ if test "$COMPILE_ENVIRONMENT"; then
+ if test -n "$MOZ_OPTIMIZE"; then
+     echo $ac_n "checking for valid optimization flags""... $ac_c" 1>&6
+-echo "configure:13445: checking for valid optimization flags" >&5
++echo "configure:13594: checking for valid optimization flags" >&5
+     _SAVE_CFLAGS=$CFLAGS
+     CFLAGS="$CFLAGS $MOZ_OPTIMIZE_FLAGS"
+     cat > conftest.$ac_ext <<EOF
+-#line 13449 "configure"
++#line 13598 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+ printf("Hello World\n");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:13456: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13605: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _results=yes
+ else
+@@ -13581,7 +13730,7 @@
+     fi
+   else
+     echo $ac_n "checking size of int *""... $ac_c" 1>&6
+-echo "configure:13585: checking size of int *" >&5
++echo "configure:13734: checking size of int *" >&5
+ if eval "test \"`echo '$''{'ac_cv_sizeof_int_p'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -13589,9 +13738,10 @@
+   ac_cv_sizeof_int_p=4
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 13593 "configure"
++#line 13742 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
++#include <sys/types.h>
+ main()
+ {
+   FILE *f=fopen("conftestval", "w");
+@@ -13600,7 +13750,7 @@
+   exit(0);
+ }
+ EOF
+-if { (eval echo configure:13604: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:13754: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_sizeof_int_p=`cat conftestval`
+ else
+@@ -13847,17 +13997,17 @@
+ if test -n "$MOZ_VALGRIND"; then
+     ac_safe=`echo "valgrind/valgrind.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for valgrind/valgrind.h""... $ac_c" 1>&6
+-echo "configure:13851: checking for valgrind/valgrind.h" >&5
++echo "configure:14001: checking for valgrind/valgrind.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 13856 "configure"
++#line 14006 "configure"
+ #include "confdefs.h"
+ #include <valgrind/valgrind.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:13861: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:14011: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -14012,7 +14162,7 @@
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:14016: checking for $ac_word" >&5
++echo "configure:14166: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_CCACHE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -14163,12 +14313,12 @@
+     for ac_func in __cxa_demangle
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:14167: checking for $ac_func" >&5
++echo "configure:14317: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14172 "configure"
++#line 14322 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -14194,7 +14344,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14198: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:14348: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -14242,17 +14392,17 @@
+ if test "$HAVE_GCC3_ABI" -a -z "$SKIP_LIBRARY_CHECKS"; then
+     ac_safe=`echo "unwind.h" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for unwind.h""... $ac_c" 1>&6
+-echo "configure:14246: checking for unwind.h" >&5
++echo "configure:14396: checking for unwind.h" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14251 "configure"
++#line 14401 "configure"
+ #include "confdefs.h"
+ #include <unwind.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:14256: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:14406: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -14271,12 +14421,12 @@
+   for ac_func in _Unwind_Backtrace
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:14275: checking for $ac_func" >&5
++echo "configure:14425: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14280 "configure"
++#line 14430 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -14299,7 +14449,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14303: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:14453: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -14348,7 +14498,7 @@
+ # Compiler Options
+ 
+ echo $ac_n "checking for gcc -pipe support""... $ac_c" 1>&6
+-echo "configure:14352: checking for gcc -pipe support" >&5
++echo "configure:14502: checking for gcc -pipe support" >&5
+ if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
+     echo '#include <stdio.h>' > dummy-hello.c
+     echo 'int main() { printf("Hello World\n"); exit(0); }' >> dummy-hello.c
+@@ -14363,14 +14513,14 @@
+         _SAVE_CFLAGS=$CFLAGS
+         CFLAGS="$CFLAGS -pipe"
+         cat > conftest.$ac_ext <<EOF
+-#line 14367 "configure"
++#line 14517 "configure"
+ #include "confdefs.h"
+  #include <stdio.h> 
+ int main() {
+ printf("Hello World\n");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14374: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14524: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _res_gcc_pipe="yes"
+ else
+@@ -14415,16 +14565,16 @@
+ CFLAGS="$CFLAGS -fprofile-generate -fprofile-correction"
+ 
+ echo $ac_n "checking whether C compiler supports -fprofile-generate""... $ac_c" 1>&6
+-echo "configure:14419: checking whether C compiler supports -fprofile-generate" >&5
++echo "configure:14569: checking whether C compiler supports -fprofile-generate" >&5
+ cat > conftest.$ac_ext <<EOF
+-#line 14421 "configure"
++#line 14571 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14428: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14578: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+    PROFILE_GEN_CFLAGS="-fprofile-generate"
+                  result="yes" 
+@@ -14488,16 +14638,16 @@
+     _SAVE_CXXFLAGS=$CXXFLAGS
+     CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS} ${_COMPILER_PREFIX}-pedantic ${_COMPILER_PREFIX}-Wno-long-long"
+     echo $ac_n "checking whether C++ compiler has -pedantic long long bug""... $ac_c" 1>&6
+-echo "configure:14492: checking whether C++ compiler has -pedantic long long bug" >&5
++echo "configure:14642: checking whether C++ compiler has -pedantic long long bug" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 14494 "configure"
++#line 14644 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(sizeof(long long) == 8)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14501: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14651: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result="no"
+ else
+@@ -14522,12 +14672,12 @@
+ fi
+ 
+ echo $ac_n "checking for correct temporary object destruction order""... $ac_c" 1>&6
+-echo "configure:14526: checking for correct temporary object destruction order" >&5
++echo "configure:14676: checking for correct temporary object destruction order" >&5
+ if test "$cross_compiling" = yes; then
+   result="maybe"
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14531 "configure"
++#line 14681 "configure"
+ #include "confdefs.h"
+ #ifdef __cplusplus
+ extern "C" void exit(int);
+@@ -14550,7 +14700,7 @@
+              }
+              
+ EOF
+-if { (eval echo configure:14554: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:14704: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   result="yes"
+ else
+@@ -14571,12 +14721,12 @@
+ _SAVE_CXXFLAGS=$CXXFLAGS
+ CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS}"
+ echo $ac_n "checking for correct overload resolution with const and templates""... $ac_c" 1>&6
+-echo "configure:14575: checking for correct overload resolution with const and templates" >&5
++echo "configure:14725: checking for correct overload resolution with const and templates" >&5
+ if eval "test \"`echo '$''{'ac_nscap_nonconst_opeq_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14580 "configure"
++#line 14730 "configure"
+ #include "confdefs.h"
+ 
+                       template <class T>
+@@ -14606,7 +14756,7 @@
+                     
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14610: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14760: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_nscap_nonconst_opeq_bug="no"
+ else
+@@ -14629,19 +14779,19 @@
+ fi
+ 
+ echo $ac_n "checking for tm_zone tm_gmtoff in struct tm""... $ac_c" 1>&6
+-echo "configure:14633: checking for tm_zone tm_gmtoff in struct tm" >&5
++echo "configure:14783: checking for tm_zone tm_gmtoff in struct tm" >&5
+ if eval "test \"`echo '$''{'ac_cv_struct_tm_zone_tm_gmtoff'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 14638 "configure"
++#line 14788 "configure"
+ #include "confdefs.h"
+ #include <time.h>
+ int main() {
+ struct tm tm; tm.tm_zone = 0; tm.tm_gmtoff = 1;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14645: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14795: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_struct_tm_zone_tm_gmtoff="yes"
+ else
+@@ -14855,7 +15005,7 @@
+ if test -z "$SKIP_LIBRARY_CHECKS" -a -z "$NO_EDITLINE"; then
+   if test -n "$JS_WANT_READLINE"; then
+     echo $ac_n "checking for readline in -lreadline""... $ac_c" 1>&6
+-echo "configure:14859: checking for readline in -lreadline" >&5
++echo "configure:15009: checking for readline in -lreadline" >&5
+ ac_lib_var=`echo readline'_'readline | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -14863,7 +15013,7 @@
+   ac_save_LIBS="$LIBS"
+ LIBS="-lreadline  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 14867 "configure"
++#line 15017 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -14874,7 +15024,7 @@
+ readline()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:14878: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:15028: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -15123,9 +15273,9 @@
+ fi
+ 
+ echo $ac_n "checking for posix_fallocate""... $ac_c" 1>&6
+-echo "configure:15127: checking for posix_fallocate" >&5
++echo "configure:15277: checking for posix_fallocate" >&5
+ cat > conftest.$ac_ext <<EOF
+-#line 15129 "configure"
++#line 15279 "configure"
+ #include "confdefs.h"
+ #define _XOPEN_SOURCE 600
+   #include <fcntl.h>
+@@ -15133,7 +15283,7 @@
+ posix_fallocate(0, 0, 0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:15137: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:15287: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv___posix_fallocate=true
+ else
+@@ -15159,7 +15309,7 @@
+                 _SAVE_CFLAGS=$CFLAGS
+     CFLAGS="$CFLAGS $XCFLAGS"
+     cat > conftest.$ac_ext <<EOF
+-#line 15163 "configure"
++#line 15313 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdio.h>
+@@ -15177,7 +15327,7 @@
+     
+ ; return 0; }
+ EOF
+-if { (eval echo configure:15181: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:15331: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -15278,12 +15428,12 @@
+ for ac_func in setlocale
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:15282: checking for $ac_func" >&5
++echo "configure:15432: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 15287 "configure"
++#line 15437 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -15306,7 +15456,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:15310: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:15460: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -15333,12 +15483,12 @@
+ for ac_func in localeconv
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:15337: checking for $ac_func" >&5
++echo "configure:15487: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 15342 "configure"
++#line 15492 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -15361,7 +15511,7 @@
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:15365: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:15515: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -15732,8 +15882,6 @@
+ s%@HAVE_GCC_ALIGN_ARG_POINTER@%$HAVE_GCC_ALIGN_ARG_POINTER%g
+ s%@HAVE_DTRACE@%$HAVE_DTRACE%g
+ s%@HAVE_LINUX_PERF_EVENT_H@%$HAVE_LINUX_PERF_EVENT_H%g
+-s%@HAVE_ARM_SIMD@%$HAVE_ARM_SIMD%g
+-s%@HAVE_ARM_NEON@%$HAVE_ARM_NEON%g
+ s%@LIBOBJS@%$LIBOBJS%g
+ s%@HAVE_CLOCK_MONOTONIC@%$HAVE_CLOCK_MONOTONIC%g
+ s%@REALTIME_LIBS@%$REALTIME_LIBS%g
+@@ -15743,7 +15891,8 @@
+ s%@NSPR_CONFIG@%$NSPR_CONFIG%g
+ s%@MOZ_UI_LOCALE@%$MOZ_UI_LOCALE%g
+ s%@MOZ_THUMB2@%$MOZ_THUMB2%g
+-s%@MOZ_ARM_ARCH@%$MOZ_ARM_ARCH%g
++s%@HAVE_ARM_SIMD@%$HAVE_ARM_SIMD%g
++s%@HAVE_ARM_NEON@%$HAVE_ARM_NEON%g
+ s%@MOZ_OPTIMIZE@%$MOZ_OPTIMIZE%g
+ s%@MOZ_OPTIMIZE_FLAGS@%$MOZ_OPTIMIZE_FLAGS%g
+ s%@MOZ_OPTIMIZE_LDFLAGS@%$MOZ_OPTIMIZE_LDFLAGS%g
+@@ -16182,12 +16331,6 @@
+   if test "$OS_ARCH" = "OS2"; then
+     ac_configure_args="$ac_configure_args CFLAGS=-Zomf AR=emxomfar"
+   fi
+-  if test -n "$MOZ_THUMB2"; then
+-    ac_configure_args="$ac_configure_args --enable-thumb2"
+-  fi
+-  if test -n "$MOZ_ARM_ARCH"; then
+-    ac_configure_args="$ac_configure_args --with-cpu-arch=$MOZ_ARM_ARCH"
+-  fi
+ 
+   # Use a separate cache file for libffi, since it does things differently
+   # from our configure.
+@@ -16291,7 +16434,7 @@
+       fi
+     fi
+ 
+-    cd $ac_popdir
++    cd "$ac_popdir"
+   done
+ fi
+ 
diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
new file mode 100644
index 0000000..a5ec455
--- /dev/null
+++ b/package/spidermonkey185/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_SPIDERMONKEY185
+	bool "spidermonkey (1.8.5)"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork in executable tools.
+	help
+	  SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
+	  used in various Mozilla products, including Firefox.
+
+	  This is the old 1.8.5 branch, used in Firefox 4.
+
+
+comment "Spider monkey (1.8.5) need a toolchain with C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/spidermonkey185/spidermonkey185.hash b/package/spidermonkey185/spidermonkey185.hash
new file mode 100644
index 0000000..bd651d7
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.hash
@@ -0,0 +1,2 @@
+# Locally generated.
+sha256	5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687	js185-1.0.0.tar.gz
diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
new file mode 100644
index 0000000..2ac541d
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# Spidermonkey (1.8.5)
+#
+################################################################################
+
+SPIDERMONKEY185_VERSION = 1.0.0
+SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
+SPIDERMONKEY185_SOURCE = js185-${SPIDERMONKEY185_VERSION}.tar.gz
+
+SPIDERMONKEY185_INSTALL_STAGING = YES
+SPIDERMONKEY185_INSTALL_TARGET = YES
+
+SPIDERMONKEY185_LICENSE = \
+	MPL-1.1/GPL-2.0/LGPL-2.1 (Mostly), \
+	MIT variants (libffi+, v8, mkdepend), \
+	BSD-2c/BSD-3c (various parts), public domain (some tests)
+
+SPIDERMONKEY185_CONF_ENV = \
+	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"
+SPIDERMONKEY185_CONF_OPTS = \
+		--target=$(GNU_TARGET_NAME) \
+		--build=$(GNU_TARGET_NAME) \
+		--host=$(GNU_HOST_NAME)
+
+# This dependency does not make sense outside of the mozilla code base.
+define SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
+	sed -i -re 's/nspr >= 4.7//' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/mozjs185.pc
+endef
+
+SPIDERMONKEY185_POST_INSTALL_STAGING_HOOKS += \
+	SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
+
+
+# These symlinks are created absolute with DESTDIR embedded into it.
+# Make them relative so they work on the target.
+define SPIDERMONKEY185_FIX_SHLIB_SYMLINK
+	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so
+	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so.1.0
+endef
+
+SPIDERMONKEY185_POST_INSTALL_TARGET_HOOKS += \
+	SPIDERMONKEY185_FIX_SHLIB_SYMLINK
+
+$(eval $(autotools-package))
+
+# Hack so configure/make is run inside the js/src subdirectory.
+SPIDERMONKEY185_SRCDIR = $(SPIDERMONKEY185_DIR)/js/src/
+
+
-- 
2.8.1
