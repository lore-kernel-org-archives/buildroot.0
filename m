From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:52:07 +0100
Subject: [Buildroot] [git commit] package/libuv: fix support for uClibc-ng
Message-ID: <20151223174835.E434A826EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa2c3975eb7749cd715dfb513e0b47808b8696fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://bugs.busybox.net/show_bug.cgi?id=8296 for further details on
the origins of this bug.

Submitted upstream to libuv and accepted, see
https://github.com/libuv/libuv/pull/653 and
https://github.com/libuv/libuv/commit/c861972

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-unix-fix-support-for-uClibc-ng.patch      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch b/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch
new file mode 100644
index 0000000..6aec436
--- /dev/null
+++ b/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch
@@ -0,0 +1,30 @@
+From 21dcb3a98feb3ae6ba862cfbf25fba3361bc8a9b Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Mon, 14 Dec 2015 21:46:17 +0000
+Subject: [PATCH] unix: fix support for uClibc-ng
+
+uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
+version test so that HAVE_IFADDRS_H is defined for uClibc versions
+after v0.9.32.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/unix/linux-core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unix/linux-core.c b/src/unix/linux-core.c
+index 3ff6fb1..4735bc4 100644
+--- a/src/unix/linux-core.c
++++ b/src/unix/linux-core.c
+@@ -39,7 +39,7 @@
+ #define HAVE_IFADDRS_H 1
+ 
+ #ifdef __UCLIBC__
+-# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
++# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
+ #  undef HAVE_IFADDRS_H
+ # endif
+ #endif
+-- 
+2.5.0
+
