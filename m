From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 16:45:37 +0100
Subject: [Buildroot] [git commit] package/boost: Disable fenv support with
	uClibc
Message-ID: <20160213154551.5CD108016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbef0a871dc2d50d3a86b96fa61cef2fd36bd828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost build system does not recognize the fact that fenv.h is an
optional module in uClibc and tries to use it even if UCLIBC_HAS_FENV
is disabled. This patch disables fenv support completely when compiling
with a uClibc-based toolchain.

Fixes
http://autobuild.buildroot.net/results/160/160e1b98b204148ecf128144826554b6c523931b/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/0006-uclibc-fenv.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

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
