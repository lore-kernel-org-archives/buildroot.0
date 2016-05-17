From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:23:42 +0200
Subject: [Buildroot] [git commit] boost: fix build failures on NIOSII and
	Microblaze
Message-ID: <20160517132503.B595981ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f01f2cde09527319c079d1a076143334411912a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fenv support provided by glibc on NIOSII and Microblaze is not
sufficient for Boost, causing the same build failures as the ones we had
with uClibc.

To address this, we adapt (and rename) the existing
0006-uclibc-fenv.patch by forcefully disabling fenv support in Boost on
NIOSII and Microblaze, in addition to the existing uClibc exclusion.

Fixes (for NIOSII):

  http://autobuild.buildroot.net/results/9b8c5d2cd31d63ae70b41d1434868c83e65b8423/

Fixes (for Microblaze):

  http://autobuild.buildroot.net/results/0b9db4c5cfd80d75eb620dbf7a6201faed7230a1/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/0006-fenv.patch        | 37 ++++++++++++++++++++++++++++++++++++
 package/boost/0006-uclibc-fenv.patch | 26 -------------------------
 2 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/package/boost/0006-fenv.patch b/package/boost/0006-fenv.patch
new file mode 100644
index 0000000..95c769a
--- /dev/null
+++ b/package/boost/0006-fenv.patch
@@ -0,0 +1,37 @@
+Disable fenv.h in certain configurations
+
+The boost build system does not properly test whether fenv.h is
+available, and if it is, if it supports all the features used by
+Boost. This causes build failures with uClibc (reported upstream at
+https://svn.boost.org/trac/boost/ticket/11756) but also with glibc on
+specific architectures that don't have a full fenv implementation,
+such as NIOSII or Microblaze.
+
+To address this, we forcefully disable the use of fenv support in the
+affected configurations.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: add Microblaze/NIOSII exclusions.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/boost/config/platform/linux.hpp
+===================================================================
+--- a/boost/config/platform/linux.hpp
++++ b/boost/config/platform/linux.hpp
+@@ -47,6 +47,16 @@
+ #endif
+ 
+ //
++// uClibc has no support for fenv.h, and also a few architectures
++// don't have fenv.h support at all (or incomplete support) even with
++// glibc.
++
++//
++#if defined(__UCLIBC__) || defined(__nios2__) || defined(__microblaze__)
++#  define BOOST_NO_FENV_H
++#endif
++
++//
+ // If glibc is past version 2 then we definitely have
+ // gettimeofday, earlier versions may or may not have it:
+ //
diff --git a/package/boost/0006-uclibc-fenv.patch b/package/boost/0006-uclibc-fenv.patch
deleted file mode 100644
index ea10f8c..0000000
--- a/package/boost/0006-uclibc-fenv.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Disable fenv.h support for uClibc-based toolchains.
-
-The boost build system does not recognize the fact that fenv.h is an
-optional module in uClibc and tries to use it even if UCLIBC_HAS_FENV
-is disabled. This patch disables fenv support completely when compiling
-with a uClibc-based toolchain. Bug was reported upstream:
-https://svn.boost.org/trac/boost/ticket/11756
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- boost_1_60_0.org/boost/config/platform/linux.hpp	2015-12-08 19:55:19.000000000 +0100
-+++ boost_1_60_0/boost/config/platform/linux.hpp	2016-02-06 12:35:25.692754553 +0100
-@@ -47,6 +47,13 @@
- #endif
- 
- //
-+// uClibc has no support for fenv.h
-+//
-+#if defined(__UCLIBC__)
-+#  define BOOST_NO_FENV_H
-+#endif
-+
-+//
- // If glibc is past version 2 then we definitely have
- // gettimeofday, earlier versions may or may not have it:
- //
