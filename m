From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 17:34:27 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
Message-ID: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

clamav wants to use backtrace, and decides whether it can use it if it
detects a glibc >= 2.1.

But uClibc does impersonate a glibc >= 2.1, so clamav concludes it is
possible to use backtrace. So it includes execinfo.h, which is missing
in our default uClibc config file.

So, just extend the test so that backtrace support is disable on uClibc,
unless it has been configured with backtrace support.

A far better solution would be to add a ./configure check for backtrace,
but this patch is sufficient enough.

Fixes:
    http://autobuild.buildroot.net/results/cff/cffa32fcedda735983d4805d6d4fa77844539b10/
    http://autobuild.buildroot.net/results/e0a/e0a765a94a538b0b936ea512f7aba0264fac6309/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/clamav/clamav-0003-backtrace-uClibc.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/clamav/clamav-0003-backtrace-uClibc.patch

diff --git a/package/clamav/clamav-0003-backtrace-uClibc.patch b/package/clamav/clamav-0003-backtrace-uClibc.patch
new file mode 100644
index 0000000..82ad673
--- /dev/null
+++ b/package/clamav/clamav-0003-backtrace-uClibc.patch
@@ -0,0 +1,22 @@
+mbox: do not use backtrace if using uClibc without backtrace support
+
+Since uClibc can be configured without support for backtrace, disable
+the backtrace if we are building with a uClibc that was built without
+backtrace.
+
+This is a bit hacky, and would greatly benefit from a test in ./configure
+instead, but does nicely as a quick fix for now.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN clamav-0.98.4.orig/libclamav/mbox.c clamav-0.98.4/libclamav/mbox.c
+--- clamav-0.98.4.orig/libclamav/mbox.c	2014-05-21 17:25:05.000000000 +0200
++++ clamav-0.98.4/libclamav/mbox.c	2014-11-16 17:21:04.885383286 +0100
+@@ -83,7 +83,7 @@
+ #include <features.h>
+ #endif
+ 
+-#if __GLIBC__ == 2 && __GLIBC_MINOR__ >= 1
++#if __GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 && !defined(__UCLIBC__) || defined(__UCLIBC_HAS_BACKTRACE__)
+ #define HAVE_BACKTRACE
+ #endif
+ #endif
-- 
1.9.1
