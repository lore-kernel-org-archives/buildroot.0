From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 18:28:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/ustr: Fix musl build by forcing
	glibc detection to true
Message-ID: <1463848097-26113-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f51/f5115516bd514afbb71a9460e82c889bcc18e7e2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ustr/0001-force-glibc.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/ustr/0001-force-glibc.patch

diff --git a/package/ustr/0001-force-glibc.patch b/package/ustr/0001-force-glibc.patch
new file mode 100644
index 0000000..1300dfe
--- /dev/null
+++ b/package/ustr/0001-force-glibc.patch
@@ -0,0 +1,26 @@
+Fix musl build by forcing glibc detection to true
+
+Ustr has no autoconf support, we use a Debian patchset which provides
+it. This patchset uses __GLIBC__ to check for vsnprintf support:
+
+https://sources.debian.net/src/ustr/1.0.4-5/debian/patches/fixes/autoconf.diff/#L1726
+
+This check is true for glibc and uClibc, but not for musl because it does
+not define __GLIBC__. If the test fails configure.ac stops when cross
+compiling:
+
+https://sources.debian.net/src/ustr/1.0.4-5/debian/patches/fixes/autoconf.diff/#L1773
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ustr-1.0.4/configure.ac.orig	2016-05-21 18:08:02.000000000 +0200
++++ ustr-1.0.4/configure.ac	2016-05-21 18:18:47.170881727 +0200
+@@ -24,7 +24,7 @@
+ int version = __GLIBC__;
+ 	]])],
+ 	[AC_MSG_RESULT([yes]); GLIBC_USED=1;],
+-	[AC_MSG_RESULT([no]); GLIBC_USED=0;])
++	[AC_MSG_RESULT([no]); GLIBC_USED=1;])
+ 
+ # check if vsnprintf() is retarded
+ define([check_vsnprintf_retarded_code], [[AC_LANG_SOURCE([[
-- 
2.8.1
