From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 29 Oct 2017 11:23:19 +0100
Subject: [Buildroot] [PATCHv4] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <20171029095248.24830-1-yann.morin.1998@free.fr>
References: <20171029095248.24830-1-yann.morin.1998@free.fr>
Message-ID: <510a1160-933f-4a37-f956-aef579136196@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 29/10/2017 ? 10:52, Yann E. MORIN a ?crit?:
> glibc upstream has ruled against doing regular point-releases, but they
> do have a lot of interesting and important fixes for regressions and
> security.
> 
> Backporting each patch, or cherry-picking individual patches is off
> limits for us, so we just switch to using the currently-latest HEAD of
> the maintenance branch instead.
> 
> The version number is obtained with:
>     $ git describe --match 'glibc-*' --abbrev=40 origin/release/2.26/master
> 
> The alternative options were:
>   - download the tarball from the git tree
>     --> does nto work; not an option
>   - download the 2.26 tarball, and bundle the individual patches in
>     Buildroot
>     --> maintenance of patches is a burden; not an option
>   - download the 2.26 tarball, maintain the list of patches to download from
>     the git tree
>     --> not an option for the same reason
> 
> So we end up just doing a git clone. The git tree is today about ten
> times the size of the tarball, so a rough estimate makes it at about ten
> times the download time.
> 
> Also upstream doesn't officially provide an https download location [1].
> There is one but it's not reliable, sometimes the connection time out and
> end-up with a corrupted git repo:
> 
> fatal: unable to access 'https://sourceware.org/git/glibc.git/': Failed to connect to sourceware.org port 443: Connection timed out
> 
> So switch to using a git mirror from github which is updated once a day [2].
> This allow at the same time to clone the git repository faster.
> 
> Note: The glibc 2.26 patches are not keept for the arc toolchain since they
> are fixing an issue with the new float128 support introduced in x86, x86_64
> and powerpc64le.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=summary
> [2] https://github.com/bminor/glibc.git
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Evgeniy Didin <didin@synopsys.com>
> CC: Alexey Brodkin <abrodkin@synopsys.com>
> [Romain: bump 4b692dffb95ac4812b161eb6a16113d7e824982e]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [yann.morin.1998 at free.fr: update comment to never decide on the mirror]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for the final respin.
Ok for me.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> ---
> Changes v3 -> v4:
>   - update comment, to never use the mirror as a reference
> ---
>  ...__builtin_types_compatible_p-in-C-mode-bu.patch |  50 -----
>  ...02-Do-not-use-generic-selection-in-C-mode.patch |  56 -----
>  ...-version-of-issignaling-that-does-not-use.patch | 225 ---------------------
>  ...ersion-of-issignaling-when-__NO_LONG_DOUB.patch |  47 -----
>  ...-version-of-iszero-that-does-not-use-__MA.patch | 210 -------------------
>  ...ify-use-the-builtin-when-optimizing-for-s.patch |  63 ------
>  package/glibc/glibc.hash                           |   4 +-
>  package/glibc/glibc.mk                             |  14 +-
>  8 files changed, 13 insertions(+), 656 deletions(-)
>  delete mode 100644 package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch
>  delete mode 100644 package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch
>  delete mode 100644 package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch
>  delete mode 100644 package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch
>  delete mode 100644 package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch
>  delete mode 100644 package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch
> 
> diff --git a/package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch b/package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch
> deleted file mode 100644
> index 27a785e310..0000000000
> --- a/package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From f7439f9b1089e17b6721f28e228682831a2f0135 Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gftg@linux.vnet.ibm.com>
> -Date: Mon, 21 Aug 2017 14:23:27 +0200
> -Subject: [PATCH] Do not use __builtin_types_compatible_p in C++ mode (bug
> - 21930)
> -
> -The logic to define isinf for float128 depends on the availability of
> -__builtin_types_compatible_p, which is only available in C mode,
> -however, the conditionals do not check for C or C++ mode.  This lead to
> -an error in libstdc++ configure, as reported by bug 21930.
> -
> -This patch adds a conditional for C mode in the definition of isinf for
> -float128.  No definition is provided in C++ mode, since libstdc++
> -headers undefine isinf.
> -
> -Tested for powerpc64le (glibc test suite and libstdc++-v3 configure).
> -
> -	[BZ #21930]
> -	* math/math.h (isinf): Check if in C or C++ mode before using
> -	__builtin_types_compatible_p, since this is a C mode feature.
> -
> -(cherry picked from commit 47a67213a9f51c5f8816d240500b10db605d8b77)
> -[Romain rebase on glibc 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - math/math.h | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/math/math.h b/math/math.h
> -index e217080..dea8dbe 100644
> ---- a/math/math.h
> -+++ b/math/math.h
> -@@ -442,8 +442,12 @@ enum
> - 
> - /* Return nonzero value if X is positive or negative infinity.  */
> - # if __HAVE_DISTINCT_FLOAT128 && !__GNUC_PREREQ (7,0) \
> --     && !defined __SUPPORT_SNAN__
> --   /* __builtin_isinf_sign is broken for float128 only before GCC 7.0.  */
> -+     && !defined __SUPPORT_SNAN__ && !defined __cplusplus
> -+   /* Since __builtin_isinf_sign is broken for float128 before GCC 7.0,
> -+      use the helper function, __isinff128, with older compilers.  This is
> -+      only provided for C mode, because in C++ mode, GCC has no support
> -+      for __builtin_types_compatible_p (and when in C++ mode, this macro is
> -+      not used anyway, because libstdc++ headers undefine it).  */
> - #  define isinf(x) \
> -     (__builtin_types_compatible_p (__typeof (x), _Float128) \
> -      ? __isinff128 (x) : __builtin_isinf_sign (x))
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch b/package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch
> deleted file mode 100644
> index 7321eebd6e..0000000000
> --- a/package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From bb21afc362a3ecba07ab386a0bc4385e75fbd4b5 Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gftg@linux.vnet.ibm.com>
> -Date: Mon, 14 Aug 2017 17:51:51 -0300
> -Subject: [PATCH] Do not use generic selection in C++ mode
> -
> -The logic to protect the use of generic selection (_Generic) does not
> -check for C or C++ mode, however, generic selection is a C-only
> -feature.
> -
> -Tested for powerpc64le.
> -
> -	* misc/sys/cdefs.h (__HAVE_GENERIC_SELECTION): Define to 0, if
> -	in C++ mode.
> -
> -(cherry picked from commit 6913ad65e00bb32417ad39c41d292b976171e27e)
> -[Romain rebase on glibc 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - misc/sys/cdefs.h | 19 ++++++++++---------
> - 1 file changed, 10 insertions(+), 9 deletions(-)
> -
> -diff --git a/misc/sys/cdefs.h b/misc/sys/cdefs.h
> -index 06523bf..0c80821 100644
> ---- a/misc/sys/cdefs.h
> -+++ b/misc/sys/cdefs.h
> -@@ -464,17 +464,18 @@
> - # define __glibc_macro_warning(msg)
> - #endif
> - 
> --/* Support for generic selection (ISO C11) is available in GCC since
> --   version 4.9.  Previous versions do not provide generic selection,
> --   even though they might set __STDC_VERSION__ to 201112L, when in
> --   -std=c11 mode.  Thus, we must check for !defined __GNUC__ when
> --   testing __STDC_VERSION__ for generic selection support.
> -+/* Generic selection (ISO C11) is a C-only feature, available in GCC
> -+   since version 4.9.  Previous versions do not provide generic
> -+   selection, even though they might set __STDC_VERSION__ to 201112L,
> -+   when in -std=c11 mode.  Thus, we must check for !defined __GNUC__
> -+   when testing __STDC_VERSION__ for generic selection support.
> -    On the other hand, Clang also defines __GNUC__, so a clang-specific
> -    check is required to enable the use of generic selection.  */
> --#if __GNUC_PREREQ (4, 9) \
> --    || __glibc_clang_has_extension (c_generic_selections) \
> --    || (!defined __GNUC__ && defined __STDC_VERSION__ \
> --	&& __STDC_VERSION__ >= 201112L)
> -+#if !defined __cplusplus \
> -+    && (__GNUC_PREREQ (4, 9) \
> -+	|| __glibc_clang_has_extension (c_generic_selections) \
> -+	|| (!defined __GNUC__ && defined __STDC_VERSION__ \
> -+	    && __STDC_VERSION__ >= 201112L))
> - # define __HAVE_GENERIC_SELECTION 1
> - #else
> - # define __HAVE_GENERIC_SELECTION 0
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch b/package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch
> deleted file mode 100644
> index b9cd3df396..0000000000
> --- a/package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch
> +++ /dev/null
> @@ -1,225 +0,0 @@
> -From 9bcf391a21677c6d5fa1c2be71554ec181e24f39 Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gftg@linux.vnet.ibm.com>
> -Date: Mon, 14 Aug 2017 13:46:15 -0300
> -Subject: [PATCH] Provide a C++ version of issignaling that does not use
> - __MATH_TG
> -
> -The macro __MATH_TG contains the logic to select between long double and
> -_Float128, when these types are ABI-distinct.  This logic relies on
> -__builtin_types_compatible_p, which is not available in C++ mode.
> -
> -On the other hand, C++ function overloading provides the means to
> -distinguish between the floating-point types.  The overloading
> -resolution will match the correct parameter regardless of type
> -qualifiers, i.e.: const and volatile.
> -
> -Tested for powerpc64le, s390x, and x86_64.
> -
> -	* math/math.h [defined __cplusplus] (issignaling): Provide a C++
> -	definition for issignaling that does not rely on __MATH_TG,
> -	since __MATH_TG uses __builtin_types_compatible_p, which is only
> -	available in C mode.
> -	(CFLAGS-test-math-issignaling.cc): New variable.
> -	* math/Makefile [CXX] (tests): Add test-math-issignaling.
> -	* math/test-math-issignaling.cc: New test for C++ implementation
> -	of type-generic issignaling.
> -	* sysdeps/powerpc/powerpc64le/Makefile [subdir == math]
> -	(CXXFLAGS-test-math-issignaling.cc): Add -mfloat128 to the build
> -	options of test-math-issignaling on powerpc64le.
> -
> -(cherry picked from commit a16e8bc08edca84d507715c66d6cddbbc7ed3b62)
> -[Romain rebase on glibc 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - math/Makefile                        |   3 +-
> - math/math.h                          |  19 +++++-
> - math/test-math-issignaling.cc        | 113 +++++++++++++++++++++++++++++++++++
> - sysdeps/powerpc/powerpc64le/Makefile |   1 +
> - 4 files changed, 134 insertions(+), 2 deletions(-)
> - create mode 100644 math/test-math-issignaling.cc
> -
> -diff --git a/math/Makefile b/math/Makefile
> -index e09b0c0..0130fcf 100644
> ---- a/math/Makefile
> -+++ b/math/Makefile
> -@@ -203,7 +203,7 @@ tests-static = test-fpucw-static test-fpucw-ieee-static \
> - 	       test-signgam-ullong-static test-signgam-ullong-init-static
> - 
> - ifneq (,$(CXX))
> --tests += test-math-isinff test-math-iszero
> -+tests += test-math-isinff test-math-iszero test-math-issignaling
> - endif
> - 
> - ifneq (no,$(PERL))
> -@@ -350,6 +350,7 @@ CFLAGS-test-signgam-ullong-init-static.c = -std=c99
> - 
> - CFLAGS-test-math-isinff.cc = -std=gnu++11
> - CFLAGS-test-math-iszero.cc = -std=gnu++11
> -+CFLAGS-test-math-issignaling.cc = -std=gnu++11
> - 
> - CFLAGS-test-iszero-excess-precision.c = -fexcess-precision=standard
> - CFLAGS-test-iseqsig-excess-precision.c = -fexcess-precision=standard
> -diff --git a/math/math.h b/math/math.h
> -index dea8dbe..add86af 100644
> ---- a/math/math.h
> -+++ b/math/math.h
> -@@ -474,7 +474,24 @@ enum
> - # include <bits/iscanonical.h>
> - 
> - /* Return nonzero value if X is a signaling NaN.  */
> --# define issignaling(x) __MATH_TG ((x), __issignaling, (x))
> -+# ifndef __cplusplus
> -+#  define issignaling(x) __MATH_TG ((x), __issignaling, (x))
> -+# else
> -+   /* In C++ mode, __MATH_TG cannot be used, because it relies on
> -+      __builtin_types_compatible_p, which is a C-only builtin.  On the
> -+      other hand, overloading provides the means to distinguish between
> -+      the floating-point types.  The overloading resolution will match
> -+      the correct parameter (regardless of type qualifiers (i.e.: const
> -+      and volatile).  */
> -+extern "C++" {
> -+inline int issignaling (float __val) { return __issignalingf (__val); }
> -+inline int issignaling (double __val) { return __issignaling (__val); }
> -+inline int issignaling (long double __val) { return __issignalingl (__val); }
> -+#  if __HAVE_DISTINCT_FLOAT128
> -+inline int issignaling (_Float128 __val) { return __issignalingf128 (__val); }
> -+#  endif
> -+} /* extern C++ */
> -+# endif
> - 
> - /* Return nonzero value if X is subnormal.  */
> - # define issubnormal(x) (fpclassify (x) == FP_SUBNORMAL)
> -diff --git a/math/test-math-issignaling.cc b/math/test-math-issignaling.cc
> -new file mode 100644
> -index 0000000..22ae9e1
> ---- /dev/null
> -+++ b/math/test-math-issignaling.cc
> -@@ -0,0 +1,113 @@
> -+/* Test for the C++ implementation of issignaling.
> -+   Copyright (C) 2017 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#define _GNU_SOURCE 1
> -+#include <math.h>
> -+#include <stdio.h>
> -+
> -+#include <limits>
> -+
> -+/* There is no signaling_NaN for _Float128 in std::numeric_limits.
> -+   Include ieee754_float128.h and use the bitfields in the union
> -+   ieee854_float128.ieee_nan to build a signaling NaN.  */
> -+#if __HAVE_DISTINCT_FLOAT128
> -+# include <ieee754_float128.h>
> -+#endif
> -+
> -+static bool errors;
> -+
> -+static void
> -+check (int actual, int expected, const char *actual_expr, int line)
> -+{
> -+  if (actual != expected)
> -+    {
> -+      errors = true;
> -+      printf ("%s:%d: error: %s\n", __FILE__, line, actual_expr);
> -+      printf ("%s:%d:   expected: %d\n", __FILE__, line, expected);
> -+      printf ("%s:%d:   actual: %d\n", __FILE__, line, actual);
> -+    }
> -+}
> -+
> -+#define CHECK(actual, expected) \
> -+  check ((actual), (expected), #actual, __LINE__)
> -+
> -+template <class T>
> -+static void
> -+check_type ()
> -+{
> -+  typedef std::numeric_limits<T> limits;
> -+  CHECK (issignaling (T{0}), 0);
> -+  if (limits::has_infinity)
> -+    {
> -+      CHECK (issignaling (limits::infinity ()), 0);
> -+      CHECK (issignaling (-limits::infinity ()), 0);
> -+    }
> -+  if (limits::has_quiet_NaN)
> -+    CHECK (issignaling (limits::quiet_NaN ()), 0);
> -+  if (limits::has_signaling_NaN)
> -+    CHECK (issignaling (limits::signaling_NaN ()), 1);
> -+}
> -+
> -+#if __HAVE_DISTINCT_FLOAT128
> -+static void
> -+check_float128 ()
> -+{
> -+  ieee854_float128 q;
> -+
> -+  q.d = 0;
> -+  CHECK (issignaling (q.d), 0);
> -+
> -+  /* Infinity.  */
> -+  q.ieee.negative = 0;
> -+  q.ieee.exponent = 0x7FFF;
> -+  q.ieee.mantissa0 = 0x0000;
> -+  q.ieee.mantissa1 = 0x00000000;
> -+  q.ieee.mantissa2 = 0x00000000;
> -+  q.ieee.mantissa3 = 0x00000000;
> -+  CHECK (issignaling (q.d), 0);
> -+
> -+  /* Quiet NaN.  */
> -+  q.ieee_nan.quiet_nan = 1;
> -+  q.ieee_nan.mantissa0 = 0x0000;
> -+  CHECK (issignaling (q.d), 0);
> -+
> -+  /* Still a quiet NaN.  */
> -+  q.ieee_nan.quiet_nan = 1;
> -+  q.ieee_nan.mantissa0 = 0x4000;
> -+  CHECK (issignaling (q.d), 0);
> -+
> -+  /* Signaling NaN.  */
> -+  q.ieee_nan.quiet_nan = 0;
> -+  q.ieee_nan.mantissa0 = 0x4000;
> -+  CHECK (issignaling (q.d), 1);
> -+}
> -+#endif
> -+
> -+static int
> -+do_test (void)
> -+{
> -+  check_type<float> ();
> -+  check_type<double> ();
> -+  check_type<long double> ();
> -+#if __HAVE_DISTINCT_FLOAT128
> -+  check_float128 ();
> -+#endif
> -+  return errors;
> -+}
> -+
> -+#include <support/test-driver.c>
> -diff --git a/sysdeps/powerpc/powerpc64le/Makefile b/sysdeps/powerpc/powerpc64le/Makefile
> -index 77617b6..19adbfa 100644
> ---- a/sysdeps/powerpc/powerpc64le/Makefile
> -+++ b/sysdeps/powerpc/powerpc64le/Makefile
> -@@ -16,6 +16,7 @@ $(foreach suf,$(all-object-suffixes),%f128_r$(suf)): CFLAGS += -mfloat128
> - $(foreach suf,$(all-object-suffixes),$(objpfx)test-float128%$(suf)): CFLAGS += -mfloat128
> - $(foreach suf,$(all-object-suffixes),$(objpfx)test-ifloat128%$(suf)): CFLAGS += -mfloat128
> - CFLAGS-libm-test-support-float128.c += -mfloat128
> -+CFLAGS-test-math-issignaling.cc += -mfloat128
> - $(objpfx)test-float128% $(objpfx)test-ifloat128%: \
> -   gnulib-tests += $(f128-loader-link)
> - endif
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch b/package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch
> deleted file mode 100644
> index 5e32f754d0..0000000000
> --- a/package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 9dbd8386a1b706beb30291a7e76bbfe69c2620cf Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gftg@linux.vnet.ibm.com>
> -Date: Wed, 23 Aug 2017 10:16:54 -0300
> -Subject: [PATCH] Fix the C++ version of issignaling when __NO_LONG_DOUBLE_MATH
> - is defined
> -
> -When __NO_LONG_DOUBLE_MATH is defined, __issignalingl is not available,
> -thus issignaling with long double argument should call __issignaling,
> -instead.
> -
> -Tested for powerpc64le.
> -
> -	* math/math.h [defined __cplusplus] (issignaling): In the long
> -	double case, call __issignalingl only if __NO_LONG_DOUBLE_MATH
> -	is not defined.  Call __issignaling, otherwise.
> -
> -(cherry picked from commit 3d7b66f66cb223e899a7ebc0f4c20f13e711c9e0)
> -[Romain rebase on glibc 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - math/math.h | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/math/math.h b/math/math.h
> -index add86af..60dfa31 100644
> ---- a/math/math.h
> -+++ b/math/math.h
> -@@ -486,7 +486,15 @@ enum
> - extern "C++" {
> - inline int issignaling (float __val) { return __issignalingf (__val); }
> - inline int issignaling (double __val) { return __issignaling (__val); }
> --inline int issignaling (long double __val) { return __issignalingl (__val); }
> -+inline int
> -+issignaling (long double __val)
> -+{
> -+#  ifdef __NO_LONG_DOUBLE_MATH
> -+  return __issignaling (__val);
> -+#  else
> -+  return __issignalingl (__val);
> -+#  endif
> -+}
> - #  if __HAVE_DISTINCT_FLOAT128
> - inline int issignaling (_Float128 __val) { return __issignalingf128 (__val); }
> - #  endif
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch b/package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch
> deleted file mode 100644
> index e12c8438fd..0000000000
> --- a/package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch
> +++ /dev/null
> @@ -1,210 +0,0 @@
> -From 45970aa26d1af87b016ef95b4b35c566aeb6e841 Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gftg@linux.vnet.ibm.com>
> -Date: Tue, 22 Aug 2017 16:34:42 -0300
> -Subject: [PATCH] Provide a C++ version of iszero that does not use __MATH_TG
> - (bug 21930)
> -
> -When signaling nans are enabled (with -fsignaling-nans), the C++ version
> -of iszero uses the fpclassify macro, which is defined with __MATH_TG.
> -However, when support for float128 is available, __MATH_TG uses the
> -builtin __builtin_types_compatible_p, which is only available in C mode.
> -
> -This patch refactors the C++ version of iszero so that it uses function
> -overloading to select between the floating-point types, instead of
> -relying on fpclassify and __MATH_TG.
> -
> -Tested for powerpc64le, s390x, x86_64, and with build-many-glibcs.py.
> -
> -	[BZ #21930]
> -	* math/math.h [defined __cplusplus && defined __SUPPORT_SNAN__]
> -	(iszero): New C++ implementation that does not use
> -	fpclassify/__MATH_TG/__builtin_types_compatible_p, when
> -	signaling nans are enabled, since __builtin_types_compatible_p
> -	is a C-only feature.
> -	* math/test-math-iszero.cc: When __HAVE_DISTINCT_FLOAT128 is
> -	defined, include ieee754_float128.h for access to the union and
> -	member ieee854_float128.ieee.
> -	[__HAVE_DISTINCT_FLOAT128] (do_test): Call check_float128.
> -	[__HAVE_DISTINCT_FLOAT128] (check_float128): New function.
> -	* sysdeps/powerpc/powerpc64le/Makefile [subdir == math]
> -	(CXXFLAGS-test-math-iszero.cc): Add -mfloat128 to the build
> -	options of test-math-zero on powerpc64le.
> -
> -(cherry picked from commit 42496114ec0eb7d6d039d05d4262e109951c600c)
> -[Romain rebase on glibc 2.26]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - math/math.h                          | 33 +++++++++++++--
> - math/test-math-iszero.cc             | 79 ++++++++++++++++++++++++++++++++++++
> - sysdeps/powerpc/powerpc64le/Makefile |  3 +-
> - 3 files changed, 110 insertions(+), 5 deletions(-)
> -
> -diff --git a/math/math.h b/math/math.h
> -index 60dfa31..7c0fc6d 100644
> ---- a/math/math.h
> -+++ b/math/math.h
> -@@ -513,15 +513,40 @@ inline int issignaling (_Float128 __val) { return __issignalingf128 (__val); }
> - #  endif
> - # else	/* __cplusplus */
> - extern "C++" {
> -+#  ifdef __SUPPORT_SNAN__
> -+inline int
> -+iszero (float __val)
> -+{
> -+  return __fpclassifyf (__val) == FP_ZERO;
> -+}
> -+inline int
> -+iszero (double __val)
> -+{
> -+  return __fpclassify (__val) == FP_ZERO;
> -+}
> -+inline int
> -+iszero (long double __val)
> -+{
> -+#   ifdef __NO_LONG_DOUBLE_MATH
> -+  return __fpclassify (__val) == FP_ZERO;
> -+#   else
> -+  return __fpclassifyl (__val) == FP_ZERO;
> -+#   endif
> -+}
> -+#   if __HAVE_DISTINCT_FLOAT128
> -+inline int
> -+iszero (_Float128 __val)
> -+{
> -+  return __fpclassifyf128 (__val) == FP_ZERO;
> -+}
> -+#   endif
> -+#  else
> - template <class __T> inline bool
> - iszero (__T __val)
> - {
> --#  ifdef __SUPPORT_SNAN__
> --  return fpclassify (__val) == FP_ZERO;
> --#  else
> -   return __val == 0;
> --#  endif
> - }
> -+#  endif
> - } /* extern C++ */
> - # endif	/* __cplusplus */
> - #endif /* Use IEC_60559_BFP_EXT.  */
> -diff --git a/math/test-math-iszero.cc b/math/test-math-iszero.cc
> -index 027e972..5c07261 100644
> ---- a/math/test-math-iszero.cc
> -+++ b/math/test-math-iszero.cc
> -@@ -22,6 +22,13 @@
> - 
> - #include <limits>
> - 
> -+/* Support for _Float128 in std::numeric_limits is limited.
> -+   Include ieee754_float128.h and use the bitfields in the union
> -+   ieee854_float128.ieee_nan to build corner-case inputs.  */
> -+#if __HAVE_DISTINCT_FLOAT128
> -+# include <ieee754_float128.h>
> -+#endif
> -+
> - static bool errors;
> - 
> - static void
> -@@ -72,12 +79,84 @@ check_type ()
> -          std::numeric_limits<T>::has_denorm == std::denorm_absent);
> - }
> - 
> -+#if __HAVE_DISTINCT_FLOAT128
> -+static void
> -+check_float128 ()
> -+{
> -+  ieee854_float128 q;
> -+
> -+  q.d = 0.0Q;
> -+  CHECK (iszero (q.d), 1);
> -+  q.d = -0.0Q;
> -+  CHECK (iszero (q.d), 1);
> -+  q.d = 1.0Q;
> -+  CHECK (iszero (q.d), 0);
> -+  q.d = -1.0Q;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Normal min.  */
> -+  q.ieee.negative = 0;
> -+  q.ieee.exponent = 0x0001;
> -+  q.ieee.mantissa0 = 0x0000;
> -+  q.ieee.mantissa1 = 0x00000000;
> -+  q.ieee.mantissa2 = 0x00000000;
> -+  q.ieee.mantissa3 = 0x00000000;
> -+  CHECK (iszero (q.d), 0);
> -+  q.ieee.negative = 1;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Normal max.  */
> -+  q.ieee.negative = 0;
> -+  q.ieee.exponent = 0x7FFE;
> -+  q.ieee.mantissa0 = 0xFFFF;
> -+  q.ieee.mantissa1 = 0xFFFFFFFF;
> -+  q.ieee.mantissa2 = 0xFFFFFFFF;
> -+  q.ieee.mantissa3 = 0xFFFFFFFF;
> -+  CHECK (iszero (q.d), 0);
> -+  q.ieee.negative = 1;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Infinity.  */
> -+  q.ieee.negative = 0;
> -+  q.ieee.exponent = 0x7FFF;
> -+  q.ieee.mantissa0 = 0x0000;
> -+  q.ieee.mantissa1 = 0x00000000;
> -+  q.ieee.mantissa2 = 0x00000000;
> -+  q.ieee.mantissa3 = 0x00000000;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Quiet NaN.  */
> -+  q.ieee_nan.quiet_nan = 1;
> -+  q.ieee_nan.mantissa0 = 0x0000;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Signaling NaN.  */
> -+  q.ieee_nan.quiet_nan = 0;
> -+  q.ieee_nan.mantissa0 = 0x4000;
> -+  CHECK (iszero (q.d), 0);
> -+
> -+  /* Denormal min.  */
> -+  q.ieee.negative = 0;
> -+  q.ieee.exponent = 0x0000;
> -+  q.ieee.mantissa0 = 0x0000;
> -+  q.ieee.mantissa1 = 0x00000000;
> -+  q.ieee.mantissa2 = 0x00000000;
> -+  q.ieee.mantissa3 = 0x00000001;
> -+  CHECK (iszero (q.d), 0);
> -+  q.ieee.negative = 1;
> -+  CHECK (iszero (q.d), 0);
> -+}
> -+#endif
> -+
> - static int
> - do_test (void)
> - {
> -   check_type<float> ();
> -   check_type<double> ();
> -   check_type<long double> ();
> -+#if __HAVE_DISTINCT_FLOAT128
> -+  check_float128 ();
> -+#endif
> -   return errors;
> - }
> - 
> -diff --git a/sysdeps/powerpc/powerpc64le/Makefile b/sysdeps/powerpc/powerpc64le/Makefile
> -index 19adbfa..dea2290 100644
> ---- a/sysdeps/powerpc/powerpc64le/Makefile
> -+++ b/sysdeps/powerpc/powerpc64le/Makefile
> -@@ -17,7 +17,8 @@ $(foreach suf,$(all-object-suffixes),$(objpfx)test-float128%$(suf)): CFLAGS += -
> - $(foreach suf,$(all-object-suffixes),$(objpfx)test-ifloat128%$(suf)): CFLAGS += -mfloat128
> - CFLAGS-libm-test-support-float128.c += -mfloat128
> - CFLAGS-test-math-issignaling.cc += -mfloat128
> --$(objpfx)test-float128% $(objpfx)test-ifloat128%: \
> -+CFLAGS-test-math-iszero.cc += -mfloat128
> -+$(objpfx)test-float128% $(objpfx)test-ifloat128% $(objpfx)test-math-iszero: \
> -   gnulib-tests += $(f128-loader-link)
> - endif
> - 
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch b/package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch
> deleted file mode 100644
> index 37807c4598..0000000000
> --- a/package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 33f54cf4f81a51e5c8cbfb2408edd439bdee9435 Mon Sep 17 00:00:00 2001
> -From: "Gabriel F. T. Gomes" <gabriel@inconstante.eti.br>
> -Date: Wed, 20 Sep 2017 15:10:26 -0300
> -Subject: [PATCH] Let fpclassify use the builtin when optimizing for size in
> - C++ mode (bug 22146)
> -
> -When optimization for size is on (-Os), fpclassify does not use the
> -type-generic __builtin_fpclassify builtin, instead it uses __MATH_TG.
> -However, when library support for float128 is available, __MATH_TG uses
> -__builtin_types_compatible_p, which is not available in C++ mode.
> -
> -On the other hand, libstdc++ undefines (in cmath) many macros from
> -math.h, including fpclassify, so that it can provide its own functions.
> -However, during its configure tests, libstdc++ just tests for the
> -availability of the macros (it does not undefine them, nor does it
> -provide its own functions).
> -
> -Finally, when libstdc++ is configured with optimization for size
> -enabled, its configure tests include math.h and get the definition of
> -fpclassify that uses __MATH_TG (and __builtin_types_compatible_p).
> -Since libstdc++ does not undefine the macros during its configure tests,
> -they fail.
> -
> -This patch lets fpclassify use the builtin in C++ mode, even when
> -optimization for size is on.  This allows the configure test in
> -libstdc++ to work.
> -
> -Tested for powerpc64le and x86_64.
> -
> -	[BZ #22146]
> -	math/math.h: Let fpclassify use the builtin in C++ mode, even
> -	when optimazing for size.
> -
> -(cherry picked from commit c5c4a626098ec884b8527356abdf2a4bb7b6bf27)
> -
> -[Romain rebase on glibc 2.26)
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - math/math.h | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/math/math.h b/math/math.h
> -index 7c0fc6d..f9348ec 100644
> ---- a/math/math.h
> -+++ b/math/math.h
> -@@ -402,7 +402,13 @@ enum
> - 
> - /* Return number of classification appropriate for X.  */
> - # if __GNUC_PREREQ (4,4) && !defined __SUPPORT_SNAN__			      \
> --     && !defined __OPTIMIZE_SIZE__
> -+     && (!defined __OPTIMIZE_SIZE__ || defined __cplusplus)
> -+     /* The check for __cplusplus allows the use of the builtin, even
> -+	when optimization for size is on.  This is provided for
> -+	libstdc++, only to let its configure test work when it is built
> -+	with -Os.  No further use of this definition of fpclassify is
> -+	expected in C++ mode, since libstdc++ provides its own version
> -+	of fpclassify in cmath (which undefines fpclassify).  */
> - #  define fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE,	      \
> -      FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)
> - # else
> --- 
> -2.9.5
> -
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 66b9c4ffb3..f72c88e19d 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking pgp signature (glibc)
> -sha256	e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd	glibc-2.26.tar.xz
> +# Locally calculated (fetched from Github)
> +sha256  f1f2566fea1518dd7244d322882242bbd654eb215fba51a7ab001b8fd2c9bcbe     glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e.tar.gz
>  # Locally calculated (fetched from Github)
>  sha256  adf2dd19a76705a6fb748492eba30cb0be621422190116382a891a3cf099e895     glibc-arc-2017.09-eng010.tar.gz
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0b8b440ef1..b77742c7dd 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -9,9 +9,17 @@ GLIBC_VERSION =  arc-2017.09-eng010
>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
>  else
> -GLIBC_VERSION = 2.26
> -GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
> -GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
> +# Generate version string using:
> +#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> +GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
> +# Upstream doesn't officially provide an https download link.
> +# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> +# sometimes the connection times out. So use an unofficial github mirror.
> +# When updating the version, check it on the official repository;
> +# *NEVER* decide on a version string by looking at the mirror.
> +# Then check that the mirror has been synced already (happens once a day.)
> +GLIBC_SITE = https://github.com/bminor/glibc.git
> +GLIBC_SITE_METHOD = git
>  endif
>  
>  GLIBC_SRC_SUBDIR = .
> 
