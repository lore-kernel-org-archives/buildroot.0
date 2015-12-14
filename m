From: Martin Bark <martin@barkynet.com>
Date: Mon, 14 Dec 2015 19:44:55 +0000
Subject: [Buildroot] [PATCH 3/3] package/libuv: Fix support for uClibc-ng
In-Reply-To: <1450122295-5311-1-git-send-email-martin@barkynet.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
Message-ID: <1450122295-5311-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://bugs.busybox.net/show_bug.cgi?id=8296 for further details on
the origins of this bug.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/libuv/0001-Fix-support-for-uClibc-ng.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libuv/0001-Fix-support-for-uClibc-ng.patch

diff --git a/package/libuv/0001-Fix-support-for-uClibc-ng.patch b/package/libuv/0001-Fix-support-for-uClibc-ng.patch
new file mode 100644
index 0000000..fbb919a
--- /dev/null
+++ b/package/libuv/0001-Fix-support-for-uClibc-ng.patch
@@ -0,0 +1,30 @@
+From e116adf6a0c85b3e4444fc6c87a41e9de036b80f Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Mon, 14 Dec 2015 12:04:44 +0000
+Subject: [PATCH] Fix support for uClibc-ng
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
+2.6.2
+
-- 
2.5.0
