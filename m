From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 21:40:53 +0200
Subject: [Buildroot] [git commit] kmod: bump version
Message-ID: <20130703194340.D760E9A19A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c3211ccde7fc37aaf9192e83cb55d7159001c17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syscall patch is now upstream and static linking is no longer supported.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod-001-no-syscall--1.patch |   31 -----------------------------
 package/kmod/kmod.mk                      |    6 ++++-
 2 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/package/kmod/kmod-001-no-syscall--1.patch b/package/kmod/kmod-001-no-syscall--1.patch
deleted file mode 100644
index e7a3a11..0000000
--- a/package/kmod/kmod-001-no-syscall--1.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5eac795b8b067842caec32f96d55a7554c3c67f9 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <jlu@pengutronix.de>
-Date: Thu, 02 May 2013 14:47:12 +0000
-Subject: libkmod: Avoid calling syscall() with -1
-
-At least in qemu 1.4.1 for vexpress/arm-cortexa9, this resulted in an
-illegal instruction error. Solve that by returning an error when
-__NR_finit_module is -1.
----
-diff --git a/libkmod/missing.h b/libkmod/missing.h
-index edb88b9..b45bbe2 100644
---- a/libkmod/missing.h
-+++ b/libkmod/missing.h
-@@ -20,8 +20,15 @@
- #endif
- 
- #ifndef HAVE_FINIT_MODULE
-+#include <errno.h>
-+
- static inline int finit_module(int fd, const char *uargs, int flags)
- {
-+	if (__NR_finit_module == -1) {
-+		errno = ENOSYS;
-+		return -1;
-+	}
-+
- 	return syscall(__NR_finit_module, fd, uargs, flags);
- }
- #endif
---
-cgit v0.9.2
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 6cd2a20..72a24af 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 13
+KMOD_VERSION = 14
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
@@ -14,6 +14,10 @@ KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPLv2.1+
 KMOD_LICENSE_FILES = libkmod/COPYING
 
+# static linking not supported, see
+# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
+KMOD_CONF_OPT = --disable-static --enable-shared
+
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 KMOD_CONF_OPT += --disable-manpages
 endif
