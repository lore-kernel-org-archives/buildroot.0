From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 16:33:26 +0200
Subject: [Buildroot] [PATCH 1/6] uclibc: bump uClibc-ng to 1.0.3
In-Reply-To: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1434292411-5003-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps uClibc-ng to the latest version, and drops the two
patches that have been merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-static-linking-of-pthread-apps.patch  |  72 -------------
 ...ert-Do-not-define-unimplemented-functions.patch | 118 ---------------------
 package/uclibc/Config.in                           |   2 +-
 package/uclibc/uclibc.hash                         |   2 +-
 4 files changed, 2 insertions(+), 192 deletions(-)
 delete mode 100644 package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
 delete mode 100644 package/uclibc/1.0.2/0002-Revert-Do-not-define-unimplemented-functions.patch

diff --git a/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch b/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
deleted file mode 100644
index e3e6621..0000000
--- a/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 74c69da52ad5029cd2fc2d3d41d581022ed0a7aa Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 15 Apr 2015 12:47:57 -0500
-Subject: [PATCH] fix static linking of pthread apps
-
-When compiling python you get duplicate symbol problem.
-Seen in the autobuilders of buildroot project.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/sysdeps/linux/common/setregid.c  | 2 +-
- libc/sysdeps/linux/common/setresgid.c | 4 ++--
- libc/sysdeps/linux/common/setresuid.c | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/setregid.c b/libc/sysdeps/linux/common/setregid.c
-index 15d590a..aaa7293 100644
---- a/libc/sysdeps/linux/common/setregid.c
-+++ b/libc/sysdeps/linux/common/setregid.c
-@@ -37,4 +37,4 @@ int setregid(gid_t rgid, gid_t egid)
- }
- #endif
- 
--libc_hidden_def(setregid)
-+libc_hidden_weak(setregid)
-diff --git a/libc/sysdeps/linux/common/setresgid.c b/libc/sysdeps/linux/common/setresgid.c
-index 95decc2..b6d1647 100644
---- a/libc/sysdeps/linux/common/setresgid.c
-+++ b/libc/sysdeps/linux/common/setresgid.c
-@@ -16,7 +16,7 @@
- # define __NR_setresgid __NR_setresgid32
- 
- _syscall3(int, setresgid, gid_t, rgid, gid_t, egid, gid_t, sgid)
--libc_hidden_def(setresgid)
-+libc_hidden_weak(setresgid)
- 
- #elif defined(__NR_setresgid)
- 
-@@ -34,7 +34,7 @@ int setresgid(gid_t rgid, gid_t egid, gid_t sgid)
- 	}
- 	return (__syscall_setresgid(rgid, egid, sgid));
- }
--libc_hidden_def(setresgid)
-+libc_hidden_weak(setresgid)
- 
- #endif
- 
-diff --git a/libc/sysdeps/linux/common/setresuid.c b/libc/sysdeps/linux/common/setresuid.c
-index 022ccfe..a2a2183 100644
---- a/libc/sysdeps/linux/common/setresuid.c
-+++ b/libc/sysdeps/linux/common/setresuid.c
-@@ -16,7 +16,7 @@
- # define __NR_setresuid __NR_setresuid32
- 
- _syscall3(int, setresuid, uid_t, ruid, uid_t, euid, uid_t, suid)
--libc_hidden_def(setresuid)
-+libc_hidden_weak(setresuid)
- 
- #elif defined(__NR_setresuid)
- 
-@@ -34,7 +34,7 @@ int setresuid(uid_t ruid, uid_t euid, uid_t suid)
- 	}
- 	return (__syscall_setresuid(ruid, euid, suid));
- }
--libc_hidden_def(setresuid)
-+libc_hidden_weak(setresuid)
- 
- #endif
- 
--- 
-2.3.2 (Apple Git-55)
-
diff --git a/package/uclibc/1.0.2/0002-Revert-Do-not-define-unimplemented-functions.patch b/package/uclibc/1.0.2/0002-Revert-Do-not-define-unimplemented-functions.patch
deleted file mode 100644
index 66780ce..0000000
--- a/package/uclibc/1.0.2/0002-Revert-Do-not-define-unimplemented-functions.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 650380248eaad577445c88b7314307d3acd166fc Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 25 Apr 2015 07:09:40 -0500
-Subject: [PATCH] Revert "Do not define unimplemented functions"
-
-This reverts commit bd3eaf83ef1b4954b6c0e7ba8bbdd29b2cd4a833.
-
-They are now implemented.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- include/math.h                             |  2 --
- libc/sysdeps/linux/common/bits/mathcalls.h | 18 ------------------
- 2 files changed, 20 deletions(-)
-
-diff --git a/include/math.h b/include/math.h
-index c79af3f..1b54c9e 100644
---- a/include/math.h
-+++ b/include/math.h
-@@ -118,7 +118,6 @@ __BEGIN_DECLS
- #  define _Mfloat_		float
- # endif
- # define _Mdouble_		_Mfloat_
--# define _Mdouble_is_float_
- # ifdef __STDC__
- #  define __MATH_PRECNAME(name,r) name##f##r
- # else
-@@ -127,7 +126,6 @@ __BEGIN_DECLS
- # define _Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99
- # define _Mdouble_END_NAMESPACE   __END_NAMESPACE_C99
- # include <bits/mathcalls.h>
--# undef _Mdouble_is_float_
- # undef	_Mdouble_
- # undef _Mdouble_BEGIN_NAMESPACE
- # undef _Mdouble_END_NAMESPACE
-diff --git a/libc/sysdeps/linux/common/bits/mathcalls.h b/libc/sysdeps/linux/common/bits/mathcalls.h
-index 3d7e34f..9bebb51 100644
---- a/libc/sysdeps/linux/common/bits/mathcalls.h
-+++ b/libc/sysdeps/linux/common/bits/mathcalls.h
-@@ -291,9 +291,7 @@ __END_NAMESPACE_C99
- #ifdef __USE_ISOC99
- __BEGIN_NAMESPACE_C99
- /* True gamma function.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (tgamma,, (_Mdouble_))
--# endif
- __END_NAMESPACE_C99
- #endif
- 
-@@ -324,9 +322,7 @@ __MATHCALLX (nextafter,, (_Mdouble_ __x, _Mdouble_ __y), (__const__))
- libm_hidden_proto(nextafterl)
- # endif
- # if defined __USE_ISOC99 && !defined __LDBL_COMPAT
--#  ifndef _Mdouble_is_float_
- __MATHCALLX (nexttoward,, (_Mdouble_ __x, long double __y), (__const__))
--#  endif
- # endif
- 
- /* Return the remainder of integer divison X / Y with infinite precision.  */
-@@ -343,15 +339,11 @@ __MATHDECLI (int,ilogb,, (_Mdouble_ __x))
- 
- #ifdef __USE_ISOC99
- /* Return X times (2 to the Nth power).  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (scalbln,, (_Mdouble_ __x, long int __n))
--# endif
- 
- /* Round X to integral value in floating-point format using current
-    rounding direction, but do not raise inexact exception.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (nearbyint,, (_Mdouble_ __x))
--# endif
- 
- /* Round X to nearest integral value, rounding halfway cases away from
-    zero.  */
-@@ -364,9 +356,7 @@ __MATHCALLX (trunc,, (_Mdouble_ __x), (__const__))
- /* Compute remainder of X and Y and put in *QUO a value with sign of x/y
-    and magnitude congruent `mod 2^n' to the magnitude of the integral
-    quotient x/y, with n >= 3.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (remquo,, (_Mdouble_ __x, _Mdouble_ __y, int *__quo))
--# endif
- 
- 
- /* Conversion functions.  */
-@@ -383,19 +373,13 @@ __MATHDECLI (long long int,llround,, (_Mdouble_ __x))
- 
- 
- /* Return positive difference between X and Y.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (fdim,, (_Mdouble_ __x, _Mdouble_ __y))
--# endif
- 
- /* Return maximum numeric value from X and Y.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (fmax,, (_Mdouble_ __x, _Mdouble_ __y))
--# endif
- 
- /* Return minimum numeric value from X and Y.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (fmin,, (_Mdouble_ __x, _Mdouble_ __y))
--# endif
- 
- 
- /* Classify given number.  */
-@@ -406,9 +390,7 @@ __MATHDECL_PRIV (int, signbit,, (_Mdouble_ __value), (__const__))
- 
- 
- /* Multiply-add function computed as a ternary operation.  */
--# ifndef _Mdouble_is_float_
- __MATHCALLI (fma,, (_Mdouble_ __x, _Mdouble_ __y, _Mdouble_ __z))
--# endif
- #endif /* Use ISO C99.  */
- 
- #if defined __USE_MISC || defined __USE_XOPEN_EXTENDED || defined __USE_ISOC99
--- 
-2.3.2 (Apple Git-55)
-
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f69cc25..0e954d19 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -64,7 +64,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.2"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.3"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index fe60291..841c96b 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/trac/
-sha256  7e92e99995daa634cbdc63c297784df6e8fe39cc1d3bbd2d37eb5c3ced8a86e5        uClibc-ng-1.0.2.tar.xz
+sha256  b4c73fe3e7af4eeabf7510ee66ca85f775c3ed44d20b1bcd30c6ac481dd753cd        uClibc-ng-1.0.3.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2014.12.tar.gz
-- 
2.1.0
