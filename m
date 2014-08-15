From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 18:38:02 +0200
Subject: [Buildroot] [PATCHv2 5/7] gcc/4.7: fix C++ exceptions and
	pthread_exit()
In-Reply-To: <1408120684-18295-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408120684-18295-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408120684-18295-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the introduction of the support for the musl C library, the
support of C++ exceptions or features like pthread_exit() got broken
even with other libraries such as glibc. This was reported as bug

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
---
 package/gcc/4.7.4/900-musl-support.patch | 61 ++++++++++++--------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/package/gcc/4.7.4/900-musl-support.patch b/package/gcc/4.7.4/900-musl-support.patch
index fffb84a..1cb6701 100644
--- a/package/gcc/4.7.4/900-musl-support.patch
+++ b/package/gcc/4.7.4/900-musl-support.patch
@@ -13,6 +13,12 @@ https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
    causing build failure. Bug reported upstream at
    https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
 
+ * change the USE_PT_GNU_EH_FRAME logic to keep the existing gcc logic
+   and only add the musl one as an addition, not as a replacement. Not
+   doing this breaks C++ exception handling with glibc, because
+   USE_PT_GNU_EH_FRAME doesn't get defined due to the configure script
+   not testing dl_iterate_phdr() on any system except Solaris.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
 
@@ -71,7 +77,7 @@ Index: b/gcc/config.gcc
      *)
        tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
        ;;
-@@ -2092,6 +2095,10 @@
+@@ -2091,6 +2094,10 @@
  	    powerpc*-*-linux*paired*)
  		tm_file="${tm_file} rs6000/750cl.h" ;;
  	esac
@@ -299,46 +305,25 @@ Index: b/libgcc/unwind-dw2-fde-dip.c
 ===================================================================
 --- a/libgcc/unwind-dw2-fde-dip.c
 +++ b/libgcc/unwind-dw2-fde-dip.c
-@@ -47,28 +47,13 @@
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
+@@ -71,6 +71,13 @@
  # define USE_PT_GNU_EH_FRAME
-+# ifdef __OpenBSD__
-+#  define ElfW(type) Elf_##typ
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
+ 
+ #include <link.h>
 Index: b/gcc/configure
 ===================================================================
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -26787,6 +26787,9 @@
+@@ -26791,6 +26791,9 @@
  else
    gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -348,7 +333,7 @@ Index: b/gcc/configure
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        # glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -26820,6 +26823,7 @@
+@@ -26824,6 +26827,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -356,7 +341,7 @@ Index: b/gcc/configure
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
-@@ -26902,6 +26906,9 @@
+@@ -26906,6 +26910,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -370,7 +355,7 @@ Index: b/gcc/configure.ac
 ===================================================================
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -4664,6 +4664,9 @@
+@@ -4669,6 +4669,9 @@
        gcc_cv_libc_provides_ssp,
        [gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -380,7 +365,7 @@ Index: b/gcc/configure.ac
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        [# glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -4697,6 +4700,7 @@
+@@ -4702,6 +4705,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -388,7 +373,7 @@ Index: b/gcc/configure.ac
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
-@@ -4762,6 +4766,9 @@
+@@ -4767,6 +4771,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
-- 
2.0.0
