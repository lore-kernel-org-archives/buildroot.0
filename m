From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 11 Mar 2017 21:33:37 +0100
Subject: [Buildroot] [PATCH] boost: add patch to fix test of FPE support
Message-ID: <20170311203337.31569-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We recently bumped boost from version 1.61.0 to 1.63.0.

Upstream has updated the handling of FPE support in 1.63.0 resulting in build
errors for some architectures, like SH4 and OpenRISC, which were build
successfully with 1.61.0.

The problem is that uClibc also define __GLIBC__ and __USE_GNU__,
and boost uses these macros to enable the usage of `feclearexcept` and
`feenableexcept` as the latter is a GNU extensions. Unfortunately, boost
enables these macros without the check if fenv.h is available, resulting
in the following build errors:

```
In file included from libs/test/src/execution_monitor.cpp:16:0:
./boost/test/impl/execution_monitor.ipp: In function 'unsigned int boost::fpe::enable(unsigned int)':
./boost/test/impl/execution_monitor.ipp:1382:32: error: 'feclearexcept' was not declared in this scope
     feclearexcept(BOOST_FPE_ALL);
                                ^
./boost/test/impl/execution_monitor.ipp:1383:36: error: 'feenableexcept' was not declared in this scope
     int res = feenableexcept( mask );
                                    ^
./boost/test/impl/execution_monitor.ipp: In function 'unsigned int boost::fpe::disable(unsigned int)':
./boost/test/impl/execution_monitor.ipp:1422:32: error: 'feclearexcept' was not declared in this scope
     feclearexcept(BOOST_FPE_ALL);
                                ^
./boost/test/impl/execution_monitor.ipp:1423:37: error: 'fedisableexcept' was not declared in this scope
     int res = fedisableexcept( mask );
```

The issue has been reported to upstream:
https://svn.boost.org/trac/boost/ticket/11756

Fetch a patch from upstream which fix the test of FPE support:
https://github.com/boostorg/test/commit/066e28ccecb4bad5c0477606a138591f1da1963e

Fixes:
http://autobuild.buildroot.net/results/d36/d362e7eee7f66768cfdf658effe749a702c50985/
http://autobuild.buildroot.net/results/140/140e7211cbf4ccfcb37d6155d51f22e6213e6341/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/0005-fix-test-of-fpe-support.patch | 119 +++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 package/boost/0005-fix-test-of-fpe-support.patch

diff --git a/package/boost/0005-fix-test-of-fpe-support.patch b/package/boost/0005-fix-test-of-fpe-support.patch
new file mode 100644
index 000000000..4d8f827e5
--- /dev/null
+++ b/package/boost/0005-fix-test-of-fpe-support.patch
@@ -0,0 +1,119 @@
+From 066e28ccecb4bad5c0477606a138591f1da1963e Mon Sep 17 00:00:00 2001
+From: Raffi Enficiaud <raffi.enficiaud@free.fr>
+Date: Mon, 30 Jan 2017 22:09:12 +0100
+Subject: [PATCH] Preventing the compilation of floating points with GCC when
+ glibc is not in use
+
+- Gathering the support of FPE in one place/several macros and using those in both
+  execution_monitor.hpp and execution_monitor.ipp in a more coherent way
+- Updating the support of the floating point exceptions: fenableexcept/fdisableexcept are
+  GLIBC extensions and the definition of FENV does not imply the existance of those functions
+
+Fetch from:
+https://github.com/boostorg/test/commit/066e28ccecb4bad5c0477606a138591f1da1963e
+
+[Adjust github patch to tarball release]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ boost/test/execution_monitor.hpp      | 17 +++++++++++++++--
+ boost/test/impl/execution_monitor.ipp | 21 +++++++--------------
+ 2 files changed, 22 insertions(+), 16 deletions(-)
+
+diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
+index f53348a..12c5644 100644
+--- a/boost/test/execution_monitor.hpp
++++ b/boost/test/execution_monitor.hpp
+@@ -66,6 +66,19 @@
+ 
+ #endif
+ 
++#if defined(BOOST_SEH_BASED_SIGNAL_HANDLING) && !defined(UNDER_CE)
++  //! Indicates tha the floating point exception handling is supported
++  //! through SEH
++  #define BOOST_TEST_FPE_SUPPORT_WITH_SEH__
++#elif !defined(BOOST_SEH_BASED_SIGNAL_HANDLING) && !defined(UNDER_CE)
++  #if !defined(BOOST_NO_FENV_H) && !defined(BOOST_CLANG) && \
++      (defined(__GLIBC__) && defined(__USE_GNU))
++  //! Indicates that floating point exception handling is supported for the
++  //! non SEH version of it, for the GLIBC extensions only
++  #define BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__
++  #endif
++#endif
++
+ 
+ // Additional macro documentations not being generated without this hack
+ #ifdef BOOST_TEST_DOXYGEN_DOC__
+@@ -489,7 +502,7 @@ namespace fpe {
+ enum masks {
+     BOOST_FPE_OFF       = 0,
+ 
+-#ifdef BOOST_SEH_BASED_SIGNAL_HANDLING /* *** */
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__) /* *** */
+     BOOST_FPE_DIVBYZERO = EM_ZERODIVIDE,
+     BOOST_FPE_INEXACT   = EM_INEXACT,
+     BOOST_FPE_INVALID   = EM_INVALID,
+@@ -498,7 +511,7 @@ enum masks {
+ 
+     BOOST_FPE_ALL       = MCW_EM,
+ 
+-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) /* *** */
++#elif !defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)/* *** */
+     BOOST_FPE_ALL       = BOOST_FPE_OFF,
+ 
+ #else /* *** */
+diff --git a/boost/test/impl/execution_monitor.ipp b/boost/test/impl/execution_monitor.ipp
+index 416004d..0c5690c 100644
+--- a/boost/test/impl/execution_monitor.ipp
++++ b/boost/test/impl/execution_monitor.ipp
+@@ -1354,11 +1354,7 @@ unsigned
+ enable( unsigned mask )
+ {
+     boost::ignore_unused(mask);
+-
+-#if defined(UNDER_CE)
+-    /* Not Implemented in Windows CE */
+-    return BOOST_FPE_OFF;
+-#elif defined(BOOST_SEH_BASED_SIGNAL_HANDLING)
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__)
+     _clearfp();
+ 
+ #if BOOST_WORKAROUND( BOOST_MSVC, <= 1310)
+@@ -1373,9 +1369,10 @@ enable( unsigned mask )
+     if( ::_controlfp_s( 0, old_cw & ~mask, BOOST_FPE_ALL ) != 0 )
+         return BOOST_FPE_INV;
+ #endif
+-
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU)
++
++#elif defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)
++    // same macro definition as in execution_monitor.hpp
+     if (BOOST_FPE_ALL == BOOST_FPE_OFF)
+         /* Not Implemented */
+         return BOOST_FPE_OFF;
+@@ -1395,12 +1392,8 @@ disable( unsigned mask )
+ {
+     boost::ignore_unused(mask);
+ 
+-#if defined(UNDER_CE)
+-    /* Not Implemented in Windows CE */
+-    return BOOST_FPE_INV;
+-#elif defined(BOOST_SEH_BASED_SIGNAL_HANDLING)
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__)
+     _clearfp();
+-
+ #if BOOST_WORKAROUND( BOOST_MSVC, <= 1310)
+     unsigned old_cw = ::_controlfp( 0, 0 );
+     ::_controlfp( old_cw | mask, BOOST_FPE_ALL );
+@@ -1413,9 +1406,9 @@ disable( unsigned mask )
+     if( ::_controlfp_s( 0, old_cw | mask, BOOST_FPE_ALL ) != 0 )
+         return BOOST_FPE_INV;
+ #endif
+-
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU)
++
++#elif defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)
+     if (BOOST_FPE_ALL == BOOST_FPE_OFF)
+         /* Not Implemented */
+         return BOOST_FPE_INV;
-- 
2.12.0
