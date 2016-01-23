From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 13:40:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: Fix musl build
Message-ID: <1453552812-29296-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e81/e8156d0b89e7157b8f10e428fc0958b0eb29e50a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0005-Use-exported-definitions-of-SIGRTMIN.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/gdb/7.9.1/0005-Use-exported-definitions-of-SIGRTMIN.patch

diff --git a/package/gdb/7.9.1/0005-Use-exported-definitions-of-SIGRTMIN.patch b/package/gdb/7.9.1/0005-Use-exported-definitions-of-SIGRTMIN.patch
new file mode 100644
index 0000000..431de59
--- /dev/null
+++ b/package/gdb/7.9.1/0005-Use-exported-definitions-of-SIGRTMIN.patch
@@ -0,0 +1,62 @@
+Fix musl build
+
+Patch downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jun 2015 20:21:38 -0700
+Subject: [PATCH] Use exorted definitions of SIGRTMIN
+
+Define W_STOPCODE if not defined already
+
+__SIGRTMIN is internal to glibc and other libcs e.g. musl
+may not provide them
+
+Fixes
+https://sourceware.org/bugzilla/show_bug.cgi?id=13012
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ gdb/linux-nat.c     | 4 ++--
+ gdb/nat/linux-nat.h | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
+index 396c30c..50320ee 100644
+--- a/gdb/linux-nat.c
++++ b/gdb/linux-nat.c
+@@ -4856,10 +4856,10 @@ lin_thread_get_thread_signals (sigset_t *set)
+      fortunately they don't change!  */
+ 
+   if (restart == 0)
+-    restart = __SIGRTMIN;
++    restart = SIGRTMIN;
+ 
+   if (cancel == 0)
+-    cancel = __SIGRTMIN + 1;
++    cancel = SIGRTMIN + 1;
+ 
+   sigaddset (set, restart);
+   sigaddset (set, cancel);
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 83a6d91..efbe0fd 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,4 +25,8 @@
+    instead SIGTRAP with bit 7 set.  */
+ #define SYSCALL_SIGTRAP (SIGTRAP | 0x80)
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #endif /* LINUX_NAT_H */
+-- 
+2.1.4
+
-- 
2.7.0.rc3
