From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:10 -0000
Subject: [Buildroot] [git commit branch/next] uclibc: fix static linking of
	pthread apps for x86/x86_64
Message-ID: <20150808105640.2CFF77F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b146a0225809be236995aa4e102d30352eb2274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/182424bd2fea36af95eea31f7dd53f0399433616/
http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uclibc/1.0.4/0001-fix-static-linking-bug.patch |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/1.0.4/0001-fix-static-linking-bug.patch b/package/uclibc/1.0.4/0001-fix-static-linking-bug.patch
new file mode 100644
index 0000000..a580a67
--- /dev/null
+++ b/package/uclibc/1.0.4/0001-fix-static-linking-bug.patch
@@ -0,0 +1,64 @@
+From 76513cbe06ec45d6cf0310c00eaf71d3250ed57f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Wed, 22 Jul 2015 14:54:07 +0200
+Subject: [PATCH] fix static builds of pthread apps for x86/x86_64
+
+Found via buildroot autobuilder.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S |    6 ++++++
+ libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S    |    6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S b/libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S
+index f38703b..ff9a784 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S
+@@ -70,6 +70,9 @@
+ 	.globl	__lll_lock_wait_private
+ 	.type	__lll_lock_wait_private, at function
+ 	.hidden	__lll_lock_wait_private
++#ifndef IS_IN_libpthread
++	.weak	__lll_lock_wait_private
++#endif
+ 	.align	16
+ __lll_lock_wait_private:
+ 	cfi_startproc
+@@ -320,6 +323,9 @@ __lll_timedlock_wait:
+ 	.globl	__lll_unlock_wake_private
+ 	.type	__lll_unlock_wake_private, at function
+ 	.hidden	__lll_unlock_wake_private
++#ifndef IS_IN_libpthread
++	.weak	__lll_unlock_wake_private
++#endif
+ 	.align	16
+ __lll_unlock_wake_private:
+ 	cfi_startproc
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S b/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S
+index 50aacea..894c683 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S
+@@ -75,6 +75,9 @@
+ 	.globl	__lll_lock_wait_private
+ 	.type	__lll_lock_wait_private, at function
+ 	.hidden	__lll_lock_wait_private
++#ifndef IS_IN_libpthread
++	.weak   __lll_lock_wait_private
++#endif
+ 	.align	16
+ __lll_lock_wait_private:
+ 	cfi_startproc
+@@ -317,6 +320,9 @@ __lll_timedlock_wait:
+ 	.globl	__lll_unlock_wake_private
+ 	.type	__lll_unlock_wake_private, at function
+ 	.hidden	__lll_unlock_wake_private
++#ifndef IS_IN_libpthread
++	.weak	__lll_unlock_wake_private
++#endif
+ 	.align	16
+ __lll_unlock_wake_private:
+ 	cfi_startproc
+-- 
+1.7.10.4
+
