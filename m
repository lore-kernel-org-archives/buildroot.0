From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 11 Oct 2018 08:23:48 +0200
Subject: [Buildroot] [PATCH] glibc: fix build breakage
Message-ID: <20181011062348.22396-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

On platforms with soft floating point glibc produces a compile time
warning (maybe-uninitialized) that will be regarded as an error.

Add upstream patch fixing this issue.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...soft-fp-ignore-maybe-uninitialized-w.patch | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch

diff --git a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
new file mode 100644
index 0000000000..febcd36f79
--- /dev/null
+++ b/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
@@ -0,0 +1,88 @@
+From 4a06ceea33ecc220bbfe264d8f1e74de2f04e90d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 2 Oct 2018 15:38:43 +0000
+Subject: [PATCH] sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
+ [BZ #19444]
+
+* with -O, -O1, -Os it fails with:
+
+In file included from ../soft-fp/soft-fp.h:318,
+                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
+../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
+../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
+                         ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+                                    ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
+                 ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+              ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+
+Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
+with -O, -O1, -Os.
+For AARCH64 it needs one more fix in locale for -Os.
+
+	[BZ #19444]
+	* sysdeps/ieee754/soft-fp/s_fdiv.c: Include <libc-diag.h> and use
+	DIAG_PUSH_NEEDS_COMMENT, DIAG_IGNORE_NEEDS_COMMENT and
+	DIAG_POP_NEEDS_COMMENT to disable -Wmaybe-uninitialized.
+
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sysdeps/ieee754/soft-fp/s_fdiv.c | 12 ++++++++++++
+ 1 files changed, 12 insertions(+)
+
+diff --git a/sysdeps/ieee754/soft-fp/s_fdiv.c b/sysdeps/ieee754/soft-fp/s_fdiv.c
+index 341339f5ed..7a15cbeee6 100644
+--- a/sysdeps/ieee754/soft-fp/s_fdiv.c
++++ b/sysdeps/ieee754/soft-fp/s_fdiv.c
+@@ -25,6 +25,16 @@
+ #undef fdivl
+ 
+ #include <math-narrow.h>
++#include <libc-diag.h>
++
++/* R_f[01] are not set in cases where they are not used in packing,
++   but the compiler does not see that they are set in all cases where
++   they are used, resulting in warnings that they may be used
++   uninitialized.  The location of the warning differs in different
++   versions of GCC, it may be where R is defined using a macro or it
++   may be where the macro is defined.  This happens only with -O1.  */
++DIAG_PUSH_NEEDS_COMMENT;
++DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ #include <soft-fp.h>
+ #include <single.h>
+ #include <double.h>
+@@ -53,4 +63,6 @@ __fdiv (double x, double y)
+   CHECK_NARROW_DIV (ret, x, y);
+   return ret;
+ }
++DIAG_POP_NEEDS_COMMENT;
++
+ libm_alias_float_double (div)
+-- 
+2.17.0
+
-- 
2.17.0
