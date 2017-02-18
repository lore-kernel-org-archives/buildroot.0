From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 18 Feb 2017 18:45:40 -0200
Subject: [Buildroot] [PATCH v2] util-linux: build schedutils without
	enabling basic binaries
In-Reply-To: <bug-9656-163-MVhQ2W5IfX@https.bugs.busybox.net/>
References: <bug-9656-163-MVhQ2W5IfX@https.bugs.busybox.net/>
Message-ID: <1487450740-24211-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pull a patch already sent upstream tp fix AM_CONDITIONAL parameters that
conditioned the build of ionice, taskset an chrt to the wrong variable.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9656
  https://github.com/karelzak/util-linux/issues/415

Reported-by: Aaron Holtzman <aholtzma@gmail.com>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...build-when-configured-with-disable-all-pr.patch | 52 ++++++++++++++++++++++
 package/util-linux/util-linux.mk                   |  4 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch

diff --git a/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch b/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch
new file mode 100644
index 0000000..812927e
--- /dev/null
+++ b/package/util-linux/0003-schedutils-build-when-configured-with-disable-all-pr.patch
@@ -0,0 +1,52 @@
+From e1578c3d32cc9f817f19729b5eee21e49b639185 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sat, 18 Feb 2017 17:23:37 -0200
+Subject: [PATCH] schedutils: build when configured with --disable-all-programs
+
+Fix AM_CONDITIONAL parameters that conditioned ionice, taskset an chrt
+to the values of build_{ionice,taskset,chrt} respectively, instead of
+build_schedutils.
+
+Fixes:
+  https://bugs.busybox.net/show_bug.cgi?id=9656
+  https://github.com/karelzak/util-linux/issues/415
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ad241fe..1933741 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1935,7 +1935,7 @@ UL_REQUIRES_SYSCALL_CHECK([ionice],
+ 	  [x86_64*],	[252])],
+ 	[ioprio_get])
+ 
+-AM_CONDITIONAL([BUILD_IONICE], [test "x$build_ionice" = xyes])
++AM_CONDITIONAL([BUILD_IONICE], [test "x$build_schedutils" = xyes])
+ 
+ UL_BUILD_INIT([taskset], [check])
+ UL_REQUIRES_BUILD([taskset], [schedutils])
+@@ -1943,7 +1943,7 @@ UL_REQUIRES_HAVE([taskset], [cpu_set_t], [cpu_set_t type])
+ UL_REQUIRES_SYSCALL_CHECK([taskset],
+ 	[UL_CHECK_SYSCALL([sched_getaffinity])],
+ 	[sched_getaffinity])
+-AM_CONDITIONAL([BUILD_TASKSET], [test "x$build_taskset" = xyes])
++AM_CONDITIONAL([BUILD_TASKSET], [test "x$build_schedutils" = xyes])
+ 
+ 
+ have_schedsetter=no
+@@ -1953,7 +1953,7 @@ AS_IF([test "x$ac_cv_func_sched_setscheduler" = xyes], [have_schedsetter=yes],
+ UL_BUILD_INIT([chrt], [check])
+ UL_REQUIRES_BUILD([chrt], [schedutils])
+ UL_REQUIRES_HAVE([chrt], [schedsetter], [sched_set functions])
+-AM_CONDITIONAL([BUILD_CHRT], [test "x$build_chrt" = xyes])
++AM_CONDITIONAL([BUILD_CHRT], [test "x$build_schedutils" = xyes])
+ 
+ AS_IF([test "x$build_chrt" = xyes], [
+ 	UL_CHECK_SYSCALL([sched_setattr])
+-- 
+2.7.4
+
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 441c252..f991b44 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,8 +8,8 @@ UTIL_LINUX_VERSION_MAJOR = 2.29
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-# For 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch and
-# 0002-build-sys-improve-detection-of-the-isnan-function-in.patch
+
+# Required because of the patches for configure.ac.
 UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
-- 
2.7.4
