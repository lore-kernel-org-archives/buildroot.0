From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Sep 2014 15:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] uclibc/ffmpeg: Fix fminf-related build error
Message-ID: <1411479699-16331-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build error I saw while bumping ffmpeg to 2.3.1 was caused by uClibc, not
ffmpeg:
http://news.gmane.org/find-root.php?message_id=20140804213955.42443190%40debian

ffmpeg-0001-fminf.patch can be removed in favour of uclibc-0063-fminf.patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg-0001-fminf.patch          |   47 ---------
 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch |  127 +++++++++++++++++++++++
 2 files changed, 127 insertions(+), 47 deletions(-)
 delete mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch

diff --git a/package/ffmpeg/ffmpeg-0001-fminf.patch b/package/ffmpeg/ffmpeg-0001-fminf.patch
deleted file mode 100644
index 1e08517..0000000
--- a/package/ffmpeg/ffmpeg-0001-fminf.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fix build error
-
-CC      libavdevice/alldevices.o
-In file included from ./libavutil/internal.h:167:0,
-                 from ./libavutil/common.h:415,
-                 from ./libavutil/avutil.h:289,
-                 from ./libavutil/log.h:25,
-                 from libavdevice/avdevice.h:46,
-                 from libavdevice/alldevices.c:22:
-./libavutil/libm.h:87:40: error: static declaration of 'fminf' follows non-static declaration
- static av_always_inline av_const float fminf(float x, float y)
-                                        ^
-make: *** [libavdevice/alldevices.o] Error 1
-
-using buildroot-compiled uClibc toolchain, used defconfig:
-
-BR2_x86_64=y
-BR2_x86_corei7=y
-BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
-BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
-BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-diff -uNr ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h
---- ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h	2014-07-16 20:37:20.000000000 +0200
-+++ ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h	2014-07-17 22:58:01.781316442 +0200
-@@ -82,16 +82,6 @@
- #define exp2f(x) ((float)exp2(x))
- #endif /* HAVE_EXP2F */
- 
--#if !HAVE_FMINF
--#undef fminf
--static av_always_inline av_const float fminf(float x, float y)
--{
--    //Note, the NaN special case is needed for C spec compliance, it should be
--    //optimized away if the users compiler is configured to assume no NaN
--    return x > y ? y : (x == x ? x : y);
--}
--#endif
--
- #if !HAVE_ISINF
- static av_always_inline av_const int isinf(float x)
- {
diff --git a/package/uclibc/0.9.33.2/uclibc-0063-fminf.patch b/package/uclibc/0.9.33.2/uclibc-0063-fminf.patch
new file mode 100644
index 0000000..0cb5ca3
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0063-fminf.patch
@@ -0,0 +1,127 @@
+To fix the fminf-related build error in ffmpeg a patch for uClibc is necessary,
+taken from upstream patchwork:
+
+http://patchwork.ozlabs.org/patch/392465/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From patchwork Tue Sep 23 12:17:25 2014
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: Do not define unimplemented functions
+From: Cristian Morales Vega <cristian@samknows.com>
+X-Patchwork-Id: 392465
+Message-Id: <1411474645-19490-1-git-send-email-cristian@samknows.com>
+To: uclibc at uclibc.org
+Date: Tue, 23 Sep 2014 13:17:25 +0100
+
+e.g. fminf() is not implemented, only fmin(), but both are defined.
+
+Signed-off-by: Cristian Morales Vega <cristian@samknows.com>
+---
+ include/math.h                             |  2 ++
+ libc/sysdeps/linux/common/bits/mathcalls.h | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/include/math.h b/include/math.h
+index ecb9aa6..40dd90e 100644
+--- a/include/math.h
++++ b/include/math.h
+@@ -118,6 +118,7 @@ __BEGIN_DECLS
+ #  define _Mfloat_		float
+ # endif
+ # define _Mdouble_		_Mfloat_
++# define _Mdouble_is_float_
+ # ifdef __STDC__
+ #  define __MATH_PRECNAME(name,r) name##f##r
+ # else
+@@ -126,6 +127,7 @@ __BEGIN_DECLS
+ # define _Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99
+ # define _Mdouble_END_NAMESPACE   __END_NAMESPACE_C99
+ # include <bits/mathcalls.h>
++# undef _Mdouble_is_float_
+ # undef	_Mdouble_
+ # undef _Mdouble_BEGIN_NAMESPACE
+ # undef _Mdouble_END_NAMESPACE
+diff --git a/libc/sysdeps/linux/common/bits/mathcalls.h b/libc/sysdeps/linux/common/bits/mathcalls.h
+index 84b793c..4270273 100644
+--- a/libc/sysdeps/linux/common/bits/mathcalls.h
++++ b/libc/sysdeps/linux/common/bits/mathcalls.h
+@@ -271,7 +271,9 @@ __END_NAMESPACE_C99
+ #ifdef __USE_ISOC99
+ __BEGIN_NAMESPACE_C99
+ /* True gamma function.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (tgamma,, (_Mdouble_))
++# endif
+ __END_NAMESPACE_C99
+ #endif
+ 
+@@ -299,7 +301,9 @@ __MATHCALLI (rint,, (_Mdouble_ __x))
+ /* Return X + epsilon if X < Y, X - epsilon if X > Y.  */
+ __MATHCALLX (nextafter,, (_Mdouble_ __x, _Mdouble_ __y), (__const__))
+ # if defined __USE_ISOC99 && !defined __LDBL_COMPAT
++#  ifndef _Mdouble_is_float_
+ __MATHCALLX (nexttoward,, (_Mdouble_ __x, long double __y), (__const__))
++#  endif
+ # endif
+ 
+ /* Return the remainder of integer divison X / Y with infinite precision.  */
+@@ -316,11 +320,15 @@ __MATHDECLI (int,ilogb,, (_Mdouble_ __x))
+ 
+ #ifdef __USE_ISOC99
+ /* Return X times (2 to the Nth power).  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (scalbln,, (_Mdouble_ __x, long int __n))
++# endif
+ 
+ /* Round X to integral value in floating-point format using current
+    rounding direction, but do not raise inexact exception.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (nearbyint,, (_Mdouble_ __x))
++# endif
+ 
+ /* Round X to nearest integral value, rounding halfway cases away from
+    zero.  */
+@@ -333,7 +341,9 @@ __MATHCALLX (trunc,, (_Mdouble_ __x), (__const__))
+ /* Compute remainder of X and Y and put in *QUO a value with sign of x/y
+    and magnitude congruent `mod 2^n' to the magnitude of the integral
+    quotient x/y, with n >= 3.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (remquo,, (_Mdouble_ __x, _Mdouble_ __y, int *__quo))
++# endif
+ 
+ 
+ /* Conversion functions.  */
+@@ -350,13 +360,19 @@ __MATHDECLI (long long int,llround,, (_Mdouble_ __x))
+ 
+ 
+ /* Return positive difference between X and Y.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (fdim,, (_Mdouble_ __x, _Mdouble_ __y))
++# endif
+ 
+ /* Return maximum numeric value from X and Y.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (fmax,, (_Mdouble_ __x, _Mdouble_ __y))
++# endif
+ 
+ /* Return minimum numeric value from X and Y.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (fmin,, (_Mdouble_ __x, _Mdouble_ __y))
++# endif
+ 
+ 
+ /* Classify given number.  */
+@@ -367,7 +383,9 @@ __MATHDECL_PRIV (int, signbit,, (_Mdouble_ __value), (__const__))
+ 
+ 
+ /* Multiply-add function computed as a ternary operation.  */
++# ifndef _Mdouble_is_float_
+ __MATHCALLI (fma,, (_Mdouble_ __x, _Mdouble_ __y, _Mdouble_ __z))
++# endif
+ #endif /* Use ISO C99.  */
+ 
+ #if defined __USE_MISC || defined __USE_XOPEN_EXTENDED || defined __USE_ISOC99
-- 
1.7.10.4
