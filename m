From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 23:02:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: fix build with uClibc-ng
Message-ID: <1454191379-2800-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/fde/fdefe50f4a1ff0888105feedbabab186ab6294cb/
http://autobuild.buildroot.net/results/f49/f49dc42d81a3abf5515ef68940037e34caee6a1e/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/boost/0006-uclibc-no-fenv.patch | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/boost/0006-uclibc-no-fenv.patch

diff --git a/package/boost/0006-uclibc-no-fenv.patch b/package/boost/0006-uclibc-no-fenv.patch
new file mode 100644
index 0000000..88cd440
--- /dev/null
+++ b/package/boost/0006-uclibc-no-fenv.patch
@@ -0,0 +1,39 @@
+Fix build with uClibc
+
+Our config does not enable UCLIBC_HAS_FENV which breaks the build.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr boost_1_60_0.org/boost/test/execution_monitor.hpp boost_1_60_0/boost/test/execution_monitor.hpp
+--- boost_1_60_0.org/boost/test/execution_monitor.hpp	2015-12-06 09:50:28.000000000 +0100
++++ boost_1_60_0/boost/test/execution_monitor.hpp	2016-01-30 22:55:36.000000000 +0100
+@@ -484,7 +484,7 @@
+     BOOST_FPE_UNDERFLOW = EM_UNDERFLOW|EM_DENORMAL,
+ 
+     BOOST_FPE_ALL       = MCW_EM,
+-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) || defined(__UCLIBC__)
+     BOOST_FPE_ALL       = 1,
+ #else
+     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
+diff -uNr boost_1_60_0.org/boost/test/impl/execution_monitor.ipp boost_1_60_0/boost/test/impl/execution_monitor.ipp
+--- boost_1_60_0.org/boost/test/impl/execution_monitor.ipp	2015-12-06 09:50:28.000000000 +0100
++++ boost_1_60_0/boost/test/impl/execution_monitor.ipp	2016-01-30 22:56:53.000000000 +0100
+@@ -1379,7 +1379,7 @@
+ #endif
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
++#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H) && !defined(__UCLIBC__)
+     ::feclearexcept(BOOST_FPE_ALL);
+     int res = ::feenableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
+@@ -1416,7 +1416,7 @@
+ #endif
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
++#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H) && !defined(__UCLIBC__)
+     ::feclearexcept(BOOST_FPE_ALL);
+     int res = ::fedisableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
-- 
2.7.0.rc3
