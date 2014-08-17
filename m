From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:19:52 +0200
Subject: [Buildroot] [git commit] gcc/4.8: fix C++ exceptions and
	pthread_exit()
Message-ID: <20140817072258.71A4D9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=543bc7c92167680e724af4d84404011476fb507a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the introduction of the support for the musl C library, the
support of C++ exceptions or features like pthread_exit() got broken
even with other libraries such as glibc. This was reported as bug #7028.

The problem was caused by the gcc patch needed to add support for
musl, which modified the libgcc/unwind-dw2-fde-dip.c logic to decide
whether USE_PT_GNU_EH_FRAME should be enabled or not. It completely
removed the existing logic, replacing it by a single logic based on
the definition of TARGET_DL_ITERATE_PHDR. However, this constant gets
defined by the configure script only for Solaris, or Linux Musl
platforms. For glibc/uClibc, the configure script does not define it,
and therefore USE_PT_GNU_EH_FRAME is not defined, causing issues with
exception handling.

This patch fixes that by restoring all the logic of
libgcc/unwind-dw2-fde-dip.c, and just adding the musl logic as one
more case.

It has been successfully runtime tested using the two code examples
provided in bug #7208, with uClibc, musl and glibc.

Cc: Krzysztof Wrzalik <kwrzalik@gmail.com>
Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.8.3/900-musl-support.patch |  213 +++++++++++++++---------------
 1 files changed, 108 insertions(+), 105 deletions(-)

diff --git a/package/gcc/4.8.3/900-musl-support.patch b/package/gcc/4.8.3/900-musl-support.patch
index 55b0144..761f018 100644
--- a/package/gcc/4.8.3/900-musl-support.patch
+++ b/package/gcc/4.8.3/900-musl-support.patch
@@ -13,12 +13,19 @@ https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
    causing build failure. Bug reported upstream at
    https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
 
+ * change the USE_PT_GNU_EH_FRAME logic to keep the existing gcc logic
+   and only add the musl one as an addition, not as a replacement. Not
+   doing this breaks C++ exception handling with glibc, because
+   USE_PT_GNU_EH_FRAME doesn't get defined due to the configure script
+   not testing dl_iterate_phdr() on any system except Solaris.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: Update for gcc 4.8.3]
 
-diff -Nura gcc-4.8.3/fixincludes/mkfixinc.sh gcc-4.8.3-musl/fixincludes/mkfixinc.sh
---- gcc-4.8.3/fixincludes/mkfixinc.sh	2012-10-28 18:42:48.000000000 -0300
-+++ gcc-4.8.3-musl/fixincludes/mkfixinc.sh	2014-05-22 15:07:17.966799753 -0300
+Index: b/fixincludes/mkfixinc.sh
+===================================================================
+--- a/fixincludes/mkfixinc.sh
++++ b/fixincludes/mkfixinc.sh
 @@ -19,7 +19,8 @@
      powerpc-*-eabi*    | \
      powerpc-*-rtems*   | \
@@ -29,9 +36,10 @@ diff -Nura gcc-4.8.3/fixincludes/mkfixinc.sh gcc-4.8.3-musl/fixincludes/mkfixinc
  	#  IF there is no include fixing,
  	#  THEN create a no-op fixer and exit
  	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
-diff -Nura gcc-4.8.3/gcc/config/aarch64/aarch64-linux.h gcc-4.8.3-musl/gcc/config/aarch64/aarch64-linux.h
---- gcc-4.8.3/gcc/config/aarch64/aarch64-linux.h	2013-08-13 10:22:18.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/aarch64/aarch64-linux.h	2014-05-22 15:07:17.967799807 -0300
+Index: b/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,7 +21,12 @@
  #ifndef GCC_AARCH64_LINUX_H
  #define GCC_AARCH64_LINUX_H
@@ -45,9 +53,10 @@ diff -Nura gcc-4.8.3/gcc/config/aarch64/aarch64-linux.h gcc-4.8.3-musl/gcc/confi
  
  #define CPP_SPEC "%{pthread:-D_REENTRANT}"
  
-diff -Nura gcc-4.8.3/gcc/config/arm/linux-eabi.h gcc-4.8.3-musl/gcc/config/arm/linux-eabi.h
---- gcc-4.8.3/gcc/config/arm/linux-eabi.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/arm/linux-eabi.h	2014-05-22 15:07:17.968799848 -0300
+Index: b/gcc/config/arm/linux-eabi.h
+===================================================================
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -77,6 +77,23 @@
      %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
      %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
@@ -72,9 +81,10 @@ diff -Nura gcc-4.8.3/gcc/config/arm/linux-eabi.h gcc-4.8.3-musl/gcc/config/arm/l
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
  #undef  LINK_SPEC
-diff -Nura gcc-4.8.3/gcc/config/i386/linux64.h gcc-4.8.3-musl/gcc/config/i386/linux64.h
---- gcc-4.8.3/gcc/config/i386/linux64.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/i386/linux64.h	2014-05-22 15:07:17.968799848 -0300
+Index: b/gcc/config/i386/linux64.h
+===================================================================
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
 @@ -30,3 +30,10 @@
  #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
  #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
@@ -86,18 +96,20 @@ diff -Nura gcc-4.8.3/gcc/config/i386/linux64.h gcc-4.8.3-musl/gcc/config/i386/li
 +#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
 +#undef MUSL_DYNAMIC_LINKERX32
 +#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
-diff -Nura gcc-4.8.3/gcc/config/i386/linux.h gcc-4.8.3-musl/gcc/config/i386/linux.h
---- gcc-4.8.3/gcc/config/i386/linux.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/i386/linux.h	2014-05-22 15:07:17.968799848 -0300
+Index: b/gcc/config/i386/linux.h
+===================================================================
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
 @@ -21,3 +21,5 @@
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
  #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
 +#undef MUSL_DYNAMIC_LINKER
 +#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-diff -Nura gcc-4.8.3/gcc/config/linux.h gcc-4.8.3-musl/gcc/config/linux.h
---- gcc-4.8.3/gcc/config/linux.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/linux.h	2014-05-22 15:07:17.968799848 -0300
+Index: b/gcc/config/linux.h
+===================================================================
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
 @@ -32,10 +32,12 @@
  #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
  #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
@@ -254,9 +266,10 @@ diff -Nura gcc-4.8.3/gcc/config/linux.h gcc-4.8.3-musl/gcc/config/linux.h
 +    { 0, 0, 0, 0, 0, 0 }				\
 +  }
 +#endif
-diff -Nura gcc-4.8.3/gcc/config/linux.opt gcc-4.8.3-musl/gcc/config/linux.opt
---- gcc-4.8.3/gcc/config/linux.opt	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/linux.opt	2014-05-22 15:07:17.969799879 -0300
+Index: b/gcc/config/linux.opt
+===================================================================
+--- a/gcc/config/linux.opt
++++ b/gcc/config/linux.opt
 @@ -30,3 +30,7 @@
  muclibc
  Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
@@ -265,9 +278,10 @@ diff -Nura gcc-4.8.3/gcc/config/linux.opt gcc-4.8.3-musl/gcc/config/linux.opt
 +mmusl
 +Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
 +Use musl C library
-diff -Nura gcc-4.8.3/gcc/config/microblaze/linux.h gcc-4.8.3-musl/gcc/config/microblaze/linux.h
---- gcc-4.8.3/gcc/config/microblaze/linux.h	2013-03-14 12:43:23.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/microblaze/linux.h	2014-05-22 15:07:17.969799879 -0300
+Index: b/gcc/config/microblaze/linux.h
+===================================================================
+--- a/gcc/config/microblaze/linux.h
++++ b/gcc/config/microblaze/linux.h
 @@ -25,7 +25,23 @@
  #undef TLS_NEEDS_GOT
  #define TLS_NEEDS_GOT 1
@@ -293,18 +307,20 @@ diff -Nura gcc-4.8.3/gcc/config/microblaze/linux.h gcc-4.8.3-musl/gcc/config/mic
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
    { "dynamic_linker", DYNAMIC_LINKER }
-diff -Nura gcc-4.8.3/gcc/config/mips/linux64.h gcc-4.8.3-musl/gcc/config/mips/linux64.h
---- gcc-4.8.3/gcc/config/mips/linux64.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/mips/linux64.h	2014-05-22 15:07:52.473979031 -0300
+Index: b/gcc/config/mips/linux64.h
+===================================================================
+--- a/gcc/config/mips/linux64.h
++++ b/gcc/config/mips/linux64.h
 @@ -29,4 +29,4 @@
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
 -			 BIONIC_DYNAMIC_LINKERN32)
 +			 BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKER)
-diff -Nura gcc-4.8.3/gcc/config/mips/linux.h gcc-4.8.3-musl/gcc/config/mips/linux.h
---- gcc-4.8.3/gcc/config/mips/linux.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/mips/linux.h	2014-05-22 15:07:52.455978418 -0300
+Index: b/gcc/config/mips/linux.h
+===================================================================
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
 @@ -18,3 +18,11 @@
  <http://www.gnu.org/licenses/>.  */
  
@@ -317,9 +333,10 @@ diff -Nura gcc-4.8.3/gcc/config/mips/linux.h gcc-4.8.3-musl/gcc/config/mips/linu
 +#endif
 +#undef MUSL_DYNAMIC_LINKER
 +#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E ".so.1"
-diff -Nura gcc-4.8.3/gcc/config/rs6000/linux64.h gcc-4.8.3-musl/gcc/config/rs6000/linux64.h
---- gcc-4.8.3/gcc/config/rs6000/linux64.h	2014-04-04 12:10:24.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/rs6000/linux64.h	2014-05-22 15:07:52.455978418 -0300
+Index: b/gcc/config/rs6000/linux64.h
+===================================================================
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
 @@ -374,17 +374,23 @@
  #endif
  #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
@@ -348,17 +365,19 @@ diff -Nura gcc-4.8.3/gcc/config/rs6000/linux64.h gcc-4.8.3-musl/gcc/config/rs600
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-diff -Nura gcc-4.8.3/gcc/config/rs6000/secureplt.h gcc-4.8.3-musl/gcc/config/rs6000/secureplt.h
---- gcc-4.8.3/gcc/config/rs6000/secureplt.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/rs6000/secureplt.h	2014-05-22 15:07:52.455978418 -0300
+Index: b/gcc/config/rs6000/secureplt.h
+===================================================================
+--- a/gcc/config/rs6000/secureplt.h
++++ b/gcc/config/rs6000/secureplt.h
 @@ -18,3 +18,4 @@
  <http://www.gnu.org/licenses/>.  */
  
  #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
 +#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-diff -Nura gcc-4.8.3/gcc/config/rs6000/sysv4.h gcc-4.8.3-musl/gcc/config/rs6000/sysv4.h
---- gcc-4.8.3/gcc/config/rs6000/sysv4.h	2014-04-04 11:50:31.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/rs6000/sysv4.h	2014-05-22 15:07:52.456978446 -0300
+Index: b/gcc/config/rs6000/sysv4.h
+===================================================================
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
 @@ -537,6 +537,9 @@
  #ifndef CC1_SECURE_PLT_DEFAULT_SPEC
  #define CC1_SECURE_PLT_DEFAULT_SPEC ""
@@ -409,9 +428,10 @@ diff -Nura gcc-4.8.3/gcc/config/rs6000/sysv4.h gcc-4.8.3-musl/gcc/config/rs6000/
    { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
    { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
    { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
-diff -Nura gcc-4.8.3/gcc/config/sh/linux.h gcc-4.8.3-musl/gcc/config/sh/linux.h
---- gcc-4.8.3/gcc/config/sh/linux.h	2013-03-14 00:01:53.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config/sh/linux.h	2014-05-22 15:07:52.456978446 -0300
+Index: b/gcc/config/sh/linux.h
+===================================================================
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
 @@ -43,7 +43,15 @@
  
  #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
@@ -428,9 +448,10 @@ diff -Nura gcc-4.8.3/gcc/config/sh/linux.h gcc-4.8.3-musl/gcc/config/sh/linux.h
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-diff -Nura gcc-4.8.3/gcc/config.gcc gcc-4.8.3-musl/gcc/config.gcc
---- gcc-4.8.3/gcc/config.gcc	2014-05-06 12:29:04.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/config.gcc	2014-05-22 15:07:17.967799807 -0300
+Index: b/gcc/config.gcc
+===================================================================
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
 @@ -550,7 +550,7 @@
  esac
  
@@ -461,9 +482,10 @@ diff -Nura gcc-4.8.3/gcc/config.gcc gcc-4.8.3-musl/gcc/config.gcc
  	if test x${enable_secureplt} = xyes; then
  		tm_file="rs6000/secureplt.h ${tm_file}"
  	fi
-diff -Nura gcc-4.8.3/gcc/configure gcc-4.8.3-musl/gcc/configure
---- gcc-4.8.3/gcc/configure	2014-04-28 07:05:29.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/configure	2014-05-22 15:07:52.469978896 -0300
+Index: b/gcc/configure
+===================================================================
+--- a/gcc/configure
++++ b/gcc/configure
 @@ -26821,6 +26821,9 @@
  else
    gcc_cv_libc_provides_ssp=no
@@ -492,9 +514,10 @@ diff -Nura gcc-4.8.3/gcc/configure gcc-4.8.3-musl/gcc/configure
  esac
  
  if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-diff -Nura gcc-4.8.3/gcc/configure.ac gcc-4.8.3-musl/gcc/configure.ac
---- gcc-4.8.3/gcc/configure.ac	2014-04-28 07:05:29.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/configure.ac	2014-05-22 15:07:52.471978964 -0300
+Index: b/gcc/configure.ac
+===================================================================
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
 @@ -4750,6 +4750,9 @@
        gcc_cv_libc_provides_ssp,
        [gcc_cv_libc_provides_ssp=no
@@ -523,9 +546,10 @@ diff -Nura gcc-4.8.3/gcc/configure.ac gcc-4.8.3-musl/gcc/configure.ac
  esac
  GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
  if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-diff -Nura gcc-4.8.3/gcc/ginclude/stddef.h gcc-4.8.3-musl/gcc/ginclude/stddef.h
---- gcc-4.8.3/gcc/ginclude/stddef.h	2013-01-10 17:38:27.000000000 -0300
-+++ gcc-4.8.3-musl/gcc/ginclude/stddef.h	2014-05-22 15:07:52.472978998 -0300
+Index: b/gcc/ginclude/stddef.h
+===================================================================
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
 @@ -181,6 +181,7 @@
  #ifndef _GCC_SIZE_T
  #ifndef _SIZET_
@@ -550,52 +574,28 @@ diff -Nura gcc-4.8.3/gcc/ginclude/stddef.h gcc-4.8.3-musl/gcc/ginclude/stddef.h
  #endif /* __size_t */
  #endif /* _SIZET_ */
  #endif /* _GCC_SIZE_T */
-diff -Nura gcc-4.8.3/libgcc/unwind-dw2-fde-dip.c gcc-4.8.3-musl/libgcc/unwind-dw2-fde-dip.c
---- gcc-4.8.3/libgcc/unwind-dw2-fde-dip.c	2013-02-04 16:06:20.000000000 -0300
-+++ gcc-4.8.3-musl/libgcc/unwind-dw2-fde-dip.c	2014-05-22 15:07:52.472978998 -0300
-@@ -46,33 +46,13 @@
- #include "unwind-compat.h"
- #include "gthr.h"
- 
--#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
--    && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ > 2) \
--	|| (__GLIBC__ == 2 && __GLIBC_MINOR__ == 2 && defined(DT_CONFIG)))
--# define USE_PT_GNU_EH_FRAME
--#endif
--
--#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
--    && defined(__BIONIC__)
--# define USE_PT_GNU_EH_FRAME
--#endif
--
--#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
--    && defined(__FreeBSD__) && __FreeBSD__ >= 7
--# define ElfW __ElfN
--# define USE_PT_GNU_EH_FRAME
--#endif
--
--#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
--    && defined(__OpenBSD__)
--# define ElfW(type) Elf_##type
--# define USE_PT_GNU_EH_FRAME
--#endif
--
--#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
--    && defined(TARGET_DL_ITERATE_PHDR) \
--    && defined(__sun__) && defined(__svr4__)
-+#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) && defined(TARGET_DL_ITERATE_PHDR)
+Index: b/libgcc/unwind-dw2-fde-dip.c
+===================================================================
+--- a/libgcc/unwind-dw2-fde-dip.c
++++ b/libgcc/unwind-dw2-fde-dip.c
+@@ -75,6 +75,13 @@
  # define USE_PT_GNU_EH_FRAME
-+# ifdef __OpenBSD__
-+#  define ElfW(type) Elf_##type
-+# elif defined(__FreeBSD__) && __FreeBSD__ >= 7
-+#  define ElfW __ElfN
-+# endif
  #endif
  
++/* For musl libc, TARGET_DL_ITERATE_PHDR gets defined by the configure
++   script. */
++#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
++    && defined(TARGET_DL_ITERATE_PHDR)
++# define USE_PT_GNU_EH_FRAME
++#endif
++
  #if defined(USE_PT_GNU_EH_FRAME)
-diff -Nura gcc-4.8.3/libgomp/config/posix/time.c gcc-4.8.3-musl/libgomp/config/posix/time.c
---- gcc-4.8.3/libgomp/config/posix/time.c	2013-01-14 15:18:49.000000000 -0300
-+++ gcc-4.8.3-musl/libgomp/config/posix/time.c	2014-05-22 15:07:52.472978998 -0300
+ 
+ #include <link.h>
+Index: b/libgomp/config/posix/time.c
+===================================================================
+--- a/libgomp/config/posix/time.c
++++ b/libgomp/config/posix/time.c
 @@ -28,6 +28,8 @@
     The following implementation uses the most simple POSIX routines.
     If present, POSIX 4 clocks should be used instead.  */
@@ -605,9 +605,10 @@ diff -Nura gcc-4.8.3/libgomp/config/posix/time.c gcc-4.8.3-musl/libgomp/config/p
  #include "libgomp.h"
  #include <unistd.h>
  #if TIME_WITH_SYS_TIME
-diff -Nura gcc-4.8.3/libitm/config/arm/hwcap.cc gcc-4.8.3-musl/libitm/config/arm/hwcap.cc
---- gcc-4.8.3/libitm/config/arm/hwcap.cc	2013-02-03 14:46:11.000000000 -0300
-+++ gcc-4.8.3-musl/libitm/config/arm/hwcap.cc	2014-05-22 15:07:52.473979031 -0300
+Index: b/libitm/config/arm/hwcap.cc
+===================================================================
+--- a/libitm/config/arm/hwcap.cc
++++ b/libitm/config/arm/hwcap.cc
 @@ -40,7 +40,11 @@
  
  #ifdef __linux__
@@ -620,9 +621,10 @@ diff -Nura gcc-4.8.3/libitm/config/arm/hwcap.cc gcc-4.8.3-musl/libitm/config/arm
  #include <elf.h>
  
  static void __attribute__((constructor))
-diff -Nura gcc-4.8.3/libitm/config/linux/x86/tls.h gcc-4.8.3-musl/libitm/config/linux/x86/tls.h
---- gcc-4.8.3/libitm/config/linux/x86/tls.h	2013-02-03 14:46:11.000000000 -0300
-+++ gcc-4.8.3-musl/libitm/config/linux/x86/tls.h	2014-05-22 15:07:52.473979031 -0300
+Index: b/libitm/config/linux/x86/tls.h
+===================================================================
+--- a/libitm/config/linux/x86/tls.h
++++ b/libitm/config/linux/x86/tls.h
 @@ -25,16 +25,19 @@
  #ifndef LIBITM_X86_TLS_H
  #define LIBITM_X86_TLS_H 1
@@ -652,9 +654,10 @@ diff -Nura gcc-4.8.3/libitm/config/linux/x86/tls.h gcc-4.8.3-musl/libitm/config/
 +#endif
  
  #endif // LIBITM_X86_TLS_H
-diff -Nura gcc-4.8.3/libstdc++-v3/configure.host gcc-4.8.3-musl/libstdc++-v3/configure.host
---- gcc-4.8.3/libstdc++-v3/configure.host	2013-06-18 22:18:38.000000000 -0300
-+++ gcc-4.8.3-musl/libstdc++-v3/configure.host	2014-05-22 15:07:52.473979031 -0300
+Index: b/libstdc++-v3/configure.host
+===================================================================
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
 @@ -264,6 +264,13 @@
      os_include_dir="os/bsd/freebsd"
      ;;
