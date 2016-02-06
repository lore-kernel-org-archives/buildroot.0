From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Feb 2016 12:51:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/boost: Disable fenv support with
	uClibc
Message-ID: <1454759480-27848-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The boost build system does not recognize the fact that fenv.h is an
optional module in uClibc and tries to use it even if UCLIBC_HAS_FENV
is disabled. This patch disables fenv support completely when compiling
with a uClibc-based toolchain.

Fixes
http://autobuild.buildroot.net/results/160/160e1b98b204148ecf128144826554b6c523931b/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated patch to define BOOST_NO_FENV_H for the linux platform config
    instead of patching the boost source directly

 package/boost/0006-uclibc-fenv.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boost/0006-uclibc-fenv.patch

diff --git a/package/boost/0006-uclibc-fenv.patch b/package/boost/0006-uclibc-fenv.patch
new file mode 100644
index 0000000..ea10f8c
--- /dev/null
+++ b/package/boost/0006-uclibc-fenv.patch
@@ -0,0 +1,26 @@
+Disable fenv.h support for uClibc-based toolchains.
+
+The boost build system does not recognize the fact that fenv.h is an
+optional module in uClibc and tries to use it even if UCLIBC_HAS_FENV
+is disabled. This patch disables fenv support completely when compiling
+with a uClibc-based toolchain. Bug was reported upstream:
+https://svn.boost.org/trac/boost/ticket/11756
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- boost_1_60_0.org/boost/config/platform/linux.hpp	2015-12-08 19:55:19.000000000 +0100
++++ boost_1_60_0/boost/config/platform/linux.hpp	2016-02-06 12:35:25.692754553 +0100
+@@ -47,6 +47,13 @@
+ #endif
+ 
+ //
++// uClibc has no support for fenv.h
++//
++#if defined(__UCLIBC__)
++#  define BOOST_NO_FENV_H
++#endif
++
++//
+ // If glibc is past version 2 then we definitely have
+ // gettimeofday, earlier versions may or may not have it:
+ //
-- 
2.7.0
