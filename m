From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 21:29:04 +0200
Subject: [Buildroot] [git commit] kmod : protect against architectures
	without __NR_finit_module
Message-ID: <20130529193615.730FB9A653@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46da491ecdd0d1cb940d3b97899e5e4af34a40c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bug caused udev to fail to load any module, crashing with Illegal
instruction.

The patch was taken from upstream and should be integrated in the next
version of kmod (version 14)

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod-001-no-syscall--1.patch |   31 +++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod-001-no-syscall--1.patch b/package/kmod/kmod-001-no-syscall--1.patch
new file mode 100644
index 0000000..e7a3a11
--- /dev/null
+++ b/package/kmod/kmod-001-no-syscall--1.patch
@@ -0,0 +1,31 @@
+From 5eac795b8b067842caec32f96d55a7554c3c67f9 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <jlu@pengutronix.de>
+Date: Thu, 02 May 2013 14:47:12 +0000
+Subject: libkmod: Avoid calling syscall() with -1
+
+At least in qemu 1.4.1 for vexpress/arm-cortexa9, this resulted in an
+illegal instruction error. Solve that by returning an error when
+__NR_finit_module is -1.
+---
+diff --git a/libkmod/missing.h b/libkmod/missing.h
+index edb88b9..b45bbe2 100644
+--- a/libkmod/missing.h
++++ b/libkmod/missing.h
+@@ -20,8 +20,15 @@
+ #endif
+ 
+ #ifndef HAVE_FINIT_MODULE
++#include <errno.h>
++
+ static inline int finit_module(int fd, const char *uargs, int flags)
+ {
++	if (__NR_finit_module == -1) {
++		errno = ENOSYS;
++		return -1;
++	}
++
+ 	return syscall(__NR_finit_module, fd, uargs, flags);
+ }
+ #endif
+--
+cgit v0.9.2
