From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Wed, 29 May 2013 09:07:18 +0200
Subject: [Buildroot] [PATCH 1/1] kmod : protect against architectures
	without __NR_finit_module
Message-ID: <1369811238-31522-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bug caused udev to fail to load any module, crashing with Illegal
instruction.

The patch was taken from upstream and should be integrated in the next
version of kmod (version 14)

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
This bug went undetected because it only triggers when modules are loaded
via libkmod and buildroot will use busybox to implement modprobe.
---
 package/kmod/kmod-001-no-syscall--1.patch |   31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/kmod/kmod-001-no-syscall--1.patch

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
-- 
1.7.10.4
