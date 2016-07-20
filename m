From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 21:47:11 +0200
Subject: [Buildroot] [PATCH] gamin: improve PTHREAD_MUTEX_RECURSIVE_NP patch
	to fix build issue
Message-ID: <1469044031-2875-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the gamin package, patch
0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch was introduced to fix
the build with musl. Indeed, while musl defines "linux", it does not
define PTHREAD_MUTEX_RECURSIVE_NP, but only PTHREAD_MUTEX_RECURSIVE. So
the check was simplified to only verify if PTHREAD_MUTEX_RECURSIVE_NP is
defined.

However, this doesn't work well with uClibc linuxthreads. In uClibc,
PTHREAD_MUTEX_RECURSIVE_NP and PTHREAD_MUTEX_RECURSIVE are not
pre-processor defines, but enum values. For this reason, even if
PTHREAD_MUTEX_RECURSIVE_NP actually exists, #if
defined(PTHREAD_MUTEX_RECURSIVE_NP) is false. So, the gamin code falls
back to using PTHREAD_MUTEX_RECURSIVE.

Except that for uClibc linuxthreads, PTHREAD_MUTEX_RECURSIVE is defined
only if __USE_UNIX98 is defined. For the NPTL implementation,
PTHREAD_MUTEX_RECURSIVE is defined either if __USE_UNIX98 or
__USE_XOPEN2K8 are defined. This strange difference has been reported to
uClibc-ng upstream [1].

However, regardless of this uClibc behavior, using #if defined to check
for the availability of PTHREAD_MUTEX_RECURSIVE_NP is not good. This
commit therefore switches to using a proper AC_CHECK_DECL() autoconf
test, which works regardless of whether the value is #define'd or
defined as an enum value.

This fixes the build of gamin on linuxthreads platforms, such as
Microblaze or m68k.

Fixes:

  http://autobuild.buildroot.net/results/887df97196d7777efbf18a7bee91aa45c1a98700/ (Microblaze)
  http://autobuild.buildroot.net/results/eb4389474e1b30b5c395a07a857da13a66763bdb/ (m68k)

[1] http://mailman.uclibc-ng.org/pipermail/devel/2016-July/001087.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...03-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
index 4291277..b5f2e6c 100644
--- a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
+++ b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
@@ -1,20 +1,39 @@
 Fix missing PTHREAD_MUTEX_RECURSIVE_NP
 
 The musl C library does not provide the non portable
-PTHREAD_MUTEX_RECURSIVE_NP. Test for PTHREAD_MUTEX_RECURSIVE_NP only.
+PTHREAD_MUTEX_RECURSIVE_NP. In addition, uClibc does not define it as
+a #define, but as an enum value, so doing a #if defined() check
+doesn't work properly. Instead, add a AC_CHECK_DECL() autoconf check.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
+[Thomas: switch to an autoconf check.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-diff -Nuar gamin-0.1.10-orig/libgamin/gam_data.c gamin-0.1.10/libgamin/gam_data.c
---- gamin-0.1.10-orig/libgamin/gam_data.c	2007-07-04 16:36:48.000000000 +0300
-+++ gamin-0.1.10/libgamin/gam_data.c	2016-03-01 14:50:18.931696959 +0200
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -294,6 +294,10 @@
+ 	   AC_DEFINE([HAVE_LIBPTHREAD], [], [Define if pthread library is there (-lpthread)])
+ 	   AC_DEFINE([HAVE_PTHREAD_H], [], [Define if <pthread.h> is there])
+ 	   WITH_THREADS="1"]))
++
++    AC_CHECK_DECL([PTHREAD_MUTEX_RECURSIVE_NP],
++		[AC_DEFINE([HAVE_PTHREAD_MUTEX_RECURSIVE_NP], [], [whether HAVE_PTHREAD_MUTEX_RECURSIVE_NP is defined])],
++		[], [#include <pthread.h>])
+ fi
+ 
+ dnl Use weak symbols on linux/gcc to avoid imposing libpthreads to apps
+Index: b/libgamin/gam_data.c
+===================================================================
+--- a/libgamin/gam_data.c
++++ b/libgamin/gam_data.c
 @@ -470,7 +470,7 @@
      }
      if (is_threaded > 0) {
  	pthread_mutexattr_init(&attr);
 -#if defined(linux) || defined(PTHREAD_MUTEX_RECURSIVE_NP)
-+#if defined(PTHREAD_MUTEX_RECURSIVE_NP)
++#if defined(HAVE_PTHREAD_MUTEX_RECURSIVE_NP)
  	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
  #else
  	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
-- 
2.7.4
