From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:20:40 +0200
Subject: [Buildroot] [git commit] gcc/4.9: fix C++ exceptions and
	pthread_exit()
Message-ID: <20140817072258.790AB9D44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6953d5ffebf01ff6b24963058b6d12a3704cbd3f
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
 package/gcc/4.9.1/900-musl-support.patch |   66 ++++++++++-------------------
 1 files changed, 23 insertions(+), 43 deletions(-)

diff --git a/package/gcc/4.9.1/900-musl-support.patch b/package/gcc/4.9.1/900-musl-support.patch
index 5b3dfa5..56502b8 100644
--- a/package/gcc/4.9.1/900-musl-support.patch
+++ b/package/gcc/4.9.1/900-musl-support.patch
@@ -13,6 +13,12 @@ https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
    causing build failure. Bug reported upstream at
    https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
 
+ * change the USE_PT_GNU_EH_FRAME logic to keep the existing gcc logic
+   and only add the musl one as an addition, not as a replacement. Not
+   doing this breaks C++ exception handling with glibc, because
+   USE_PT_GNU_EH_FRAME doesn't get defined due to the configure script
+   not testing dl_iterate_phdr() on any system except Solaris.
+
 [Gustavo: remove upstream applied gcc/config/sh/sh.c chunk for 4.9.1]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -54,7 +60,7 @@ Index: b/gcc/config.gcc
      *)
        tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
        ;;
-@@ -2323,6 +2326,10 @@
+@@ -2322,6 +2325,10 @@
  	    powerpc*-*-linux*paired*)
  		tm_file="${tm_file} rs6000/750cl.h" ;;
  	esac
@@ -446,7 +452,7 @@ Index: b/gcc/configure
 ===================================================================
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -27300,6 +27300,9 @@
+@@ -27328,6 +27328,9 @@
  else
    gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -456,7 +462,7 @@ Index: b/gcc/configure
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        # glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -27332,6 +27335,7 @@
+@@ -27360,6 +27363,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -464,7 +470,7 @@ Index: b/gcc/configure
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
-@@ -27421,6 +27425,9 @@
+@@ -27449,6 +27453,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -478,7 +484,7 @@ Index: b/gcc/configure.ac
 ===================================================================
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5001,6 +5001,9 @@
+@@ -5016,6 +5016,9 @@
        gcc_cv_libc_provides_ssp,
        [gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -488,7 +494,7 @@ Index: b/gcc/configure.ac
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        # glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -5027,6 +5030,7 @@
+@@ -5042,6 +5045,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -496,7 +502,7 @@ Index: b/gcc/configure.ac
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
-@@ -5093,6 +5097,9 @@
+@@ -5108,6 +5112,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -538,43 +544,17 @@ Index: b/libgcc/unwind-dw2-fde-dip.c
 ===================================================================
 --- a/libgcc/unwind-dw2-fde-dip.c
 +++ b/libgcc/unwind-dw2-fde-dip.c
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
+@@ -73,6 +73,13 @@
+     && defined(TARGET_DL_ITERATE_PHDR) \
+     && defined(__sun__) && defined(__svr4__)
  # define USE_PT_GNU_EH_FRAME
-+# ifdef __OpenBSD__
-+#  define ElfW(type) Elf_##type
-+# elif defined(__FreeBSD__) && __FreeBSD__ >= 7
-+#  define ElfW __ElfN
-+# endif
++ #endif
++
++/* For musl libc, TARGET_DL_ITERATE_PHDR gets defined by the configure
++   script. */
++#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR)	\
++  && defined(TARGET_DL_ITERATE_PHDR)
++# define USE_PT_GNU_EH_FRAME
  #endif
  
  #if defined(USE_PT_GNU_EH_FRAME)
