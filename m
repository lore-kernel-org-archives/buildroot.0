From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 13:54:19 +0200
Subject: [Buildroot] [PATCH 08/10] uclibc: add patch to fix fcntl64() on 64
	bits targets
In-Reply-To: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <06fb5390fda3cd71aaef56cd928959bb42ea8ad5.1276516273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch is already in upstream uClibc, in the master branch, at
http://git.buildroot.net/uClibc/commit/?id=6f1daaaf2d94c1e6184add44eda38b0781b88cf0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch b/toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch
new file mode 100644
index 0000000..763bfd3
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch
@@ -0,0 +1,34 @@
+From 6f1daaaf2d94c1e6184add44eda38b0781b88cf0 Mon Sep 17 00:00:00 2001
+From: Rob Landley <rob@landley.net>
+Date: Sun, 16 May 2010 21:41:36 +0000
+Subject: Fix fcntl64 for 64 bit targets.
+
+64 bit targets often don't have a separate fcntl64() system call, because they don't need one.
+
+Signed-off-by: Rob Landley <rob@landley.net>
+Signed-off-by: Austin Foxley <austinf@cetoncorp.com>
+---
+diff --git a/include/fcntl.h b/include/fcntl.h
+index e37073f..3cfb25f 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -73,7 +73,7 @@ __BEGIN_DECLS
+ 
+    This function is a cancellation point and therefore not marked with
+    __THROW.  */
+-#ifndef __USE_FILE_OFFSET64
++#if !defined(__USE_FILE_OFFSET64) || defined(__LP64__)
+ extern int fcntl (int __fd, int __cmd, ...);
+ libc_hidden_proto(fcntl)
+ #else
+@@ -83,7 +83,7 @@ extern int __REDIRECT (fcntl, (int __fd, int __cmd, ...), fcntl64);
+ #  define fcntl fcntl64
+ # endif
+ #endif
+-#ifdef __USE_LARGEFILE64
++#if defined(__USE_LARGEFILE64) && !defined(__LP64__)
+ extern int fcntl64 (int __fd, int __cmd, ...);
+ libc_hidden_proto(fcntl64)
+ #endif
+--
+cgit v0.8.2.1
-- 
1.7.0.4
