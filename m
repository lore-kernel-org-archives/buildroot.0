From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:43:27 +0200
Subject: [Buildroot] [git commit] freerdp: fix build with uClibc
Message-ID: <20150505204336.6404981DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e701275d96ccebd69dbfceec5fb92e0b7049c71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch disabling use of C99 long double math functions (powl,
ceill, ...) that uClibc(-ng) don't have.

Fixes:
http://autobuild.buildroot.net/results/bda/bda53fffd4a0937fd4b2313cdf2d12ced95cc7a7/
http://autobuild.buildroot.net/results/d96/d9613c9f791157e1de3a34923f1c91b35cec693f/
http://autobuild.buildroot.net/results/bfd/bfd4ef86b257ee918e3c4463ebc5cf77694244a0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-dont-use-unavailable-c99-math.patch       |   95 ++++++++++++++++++++
 1 files changed, 95 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/0003-dont-use-unavailable-c99-math.patch b/package/freerdp/0003-dont-use-unavailable-c99-math.patch
new file mode 100644
index 0000000..1e23c0d
--- /dev/null
+++ b/package/freerdp/0003-dont-use-unavailable-c99-math.patch
@@ -0,0 +1,95 @@
+From c0d27019745184052bd428ba74a50de96053cea1 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 3 May 2015 20:46:22 +0300
+Subject: [PATCH] Don't use unavailable C99 long double math functions
+
+uClibc variants do not provide the C99 long double math functions like ceill,
+powl, etc.. For future compatibility use check_symbol_exists() to check
+whether these functions are available, and keep the result in
+HAVE_MATH_C99_LONG_DOUBLE. Use that instead of the fragile Cygwin version
+check in triodef.h.
+
+Fixes build failures under uClibc(-ng) like:
+
+../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
+../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
+../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
+../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
+../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'
+collect2: error: ld returned 1 exit status
+
+Backported from upstream commit
+https://github.com/FreeRDP/FreeRDP/commit/414663cc363108cb71a290de1c86a1b04384fb39
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ CMakeLists.txt                      |  3 +++
+ config.h.in                         |  1 +
+ winpr/libwinpr/utils/trio/triodef.h | 25 ++++++-------------------
+ 3 files changed, 10 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5b7887601aa0..177e44cfff10 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -279,6 +279,9 @@ if(UNIX OR CYGWIN)
+ 	if (HAVE_EVENTFD_H)
+ 		check_symbol_exists(eventfd_read sys/eventfd.h WITH_EVENTFD_READ_WRITE)
+ 	endif()
++	list(APPEND CMAKE_REQUIRED_LIBRARIES m)
++	check_symbol_exists(ceill math.h HAVE_MATH_C99_LONG_DOUBLE)
++	list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES m)
+ 	set(X11_FEATURE_TYPE "RECOMMENDED")
+ else()
+ 	set(X11_FEATURE_TYPE "DISABLED")
+diff --git a/config.h.in b/config.h.in
+index 55c595d0e162..983310d5b9e6 100755
+--- a/config.h.in
++++ b/config.h.in
+@@ -34,6 +34,7 @@
+ #cmakedefine WITH_WIN8
+ #cmakedefine WITH_RDPSND_DSOUND
+ #cmakedefine WITH_EVENTFD_READ_WRITE
++#cmakedefine HAVE_MATH_C99_LONG_DOUBLE
+ 
+ /* Plugins */
+ #cmakedefine STATIC_CHANNELS
+diff --git a/winpr/libwinpr/utils/trio/triodef.h b/winpr/libwinpr/utils/trio/triodef.h
+index 11c14b9c42c7..2a0479526f33 100644
+--- a/winpr/libwinpr/utils/trio/triodef.h
++++ b/winpr/libwinpr/utils/trio/triodef.h
+@@ -313,25 +313,12 @@ typedef void * trio_pointer_t;
+ # define TRIO_COMPILER_SUPPORTS_LL
+ #endif
+ 
+-#if defined(__CYGWIN__)
+-/*
+- * Cygwin defines the macros for hosted C99, but does not support certain
+- * long double math functions.
+- */
+-# include <cygwin/version.h>
+-# define TRIO_CYGWIN_VERSION_API CYGWIN_VERSION_API_MAJOR * 1000 + \
+-   CYGWIN_VERSION_API_MINOR
+-/*
+- * Please change the version number below when the Cygwin API supports
+- * long double math functions (powl, fmodl, etc.)
+- */
+-# if TRIO_CYGWIN_VERSION_API < 99999999
+-#  define TRIO_NO_FLOORL 1
+-#  define TRIO_NO_CEILL 1
+-#  define TRIO_NO_POWL 1
+-#  define TRIO_NO_FMODL 1
+-#  define TRIO_NO_LOG10L 1
+-# endif
++#if !defined(HAVE_MATH_C99_LONG_DOUBLE)
++# define TRIO_NO_FLOORL 1
++# define TRIO_NO_CEILL 1
++# define TRIO_NO_POWL 1
++# define TRIO_NO_FMODL 1
++# define TRIO_NO_LOG10L 1
+ #endif
+ 
+ #endif /* TRIO_TRIODEF_H */
+-- 
+2.1.4
+
