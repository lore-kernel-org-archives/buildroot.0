From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Aug 2016 18:33:02 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: add syscall-number for
	sched_(gs)etattr() for SH4
Message-ID: <1471278782-26712-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on kernel headers >= 3.14 was added by
b9fa6c00b1213fd038f2aed52057f22c7e18fd4b since
librttest requires __NR_sched_setattr and
__NR_sched_getattr syscalls (rt-sched).

But these syscalls have just been added to kernel 4.8 for SH4.

Fixes:
http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: copy syscall-number from kernel 4.8 (Baruch)
---
 ...scall-number-for-sched_-gs-etattr-for-SH4.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch

diff --git a/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch b/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch
new file mode 100644
index 0000000..9d606a4
--- /dev/null
+++ b/package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch
@@ -0,0 +1,34 @@
+From 53c7e8bc75f0f27752309ddae49e8d3b867a7681 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 15 Aug 2016 18:20:47 +0200
+Subject: [PATCH] Add syscall-number for sched_(gs)etattr() for SH4
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/include/rt-sched.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
+index 679c4bd..83394c6 100644
+--- a/src/include/rt-sched.h
++++ b/src/include/rt-sched.h
+@@ -51,6 +51,16 @@
+ #endif
+ #endif
+ 
++/* SCHED_DEADLINE available on sh4 since kernel 4.8 */
++#ifdef __SH4__
++#ifndef __NR_sched_setattr
++#define __NR_sched_setattr		370
++#endif
++#ifndef __NR_sched_getattr
++#define __NR_sched_getattr		369
++#endif
++#endif
++
+ #ifdef __tilegx__
+ #define __NR_sched_setattr		274
+ #define __NR_sched_getattr		275
+-- 
+2.5.5
+
-- 
2.5.5
