From: Martin Bark <martin@barkynet.com>
Date: Thu, 17 Dec 2015 23:20:26 +0000
Subject: [Buildroot] [PATCH v2 5/5] package/libuv: fix support for uClibc-ng
In-Reply-To: <1450394426-3349-1-git-send-email-martin@barkynet.com>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
Message-ID: <1450394426-3349-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://bugs.busybox.net/show_bug.cgi?id=8296 for further details on
the origins of this bug.

This patch has been submitted upstream.  See
https://github.com/libuv/libuv/pull/653

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Updated patch to be the same as in libuv/libuv/pull/653
 - Reword commit message
---
 .../0001-unix-fix-support-for-uClibc-ng.patch      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libuv/0001-unix-fix-support-for-uClibc-ng.patch

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
-- 
2.5.0
