From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 3 Apr 2017 20:18:02 +0200
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.23
Message-ID: <20170403181802.GA1816@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfix release, internal RPC implementation removed.
All patches applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - add legacy handling, requested by Thomas P.
---
 Config.in.legacy                                   |  6 ++
 ...0001-fstat-make-new-code-aarch64-specific.patch | 29 --------
 .../0002-arm-fix-static-linking-issues.patch       | 38 ----------
 ...3-or1k-add-missing-definition-of-ucontext.patch | 33 ---------
 .../0004-sync-header-with-GNU-libc-kernel.patch    | 85 ----------------------
 package/uclibc/Config.in                           |  7 --
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           | 21 +-----
 8 files changed, 8 insertions(+), 213 deletions(-)
 delete mode 100644 package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch
 delete mode 100644 package/uclibc/0002-arm-fix-static-linking-issues.patch
 delete mode 100644 package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch
 delete mode 100644 package/uclibc/0004-sync-header-with-GNU-libc-kernel.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index dfd4d67..9679843 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
+	bool
+	select BR2_LEGACY
+	help
+	  uClibc-ng removed internal RPC implementation in 1.0.23.
+
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
 	int "extra size in blocks has been removed"
 	default 0
diff --git a/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch b/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch
deleted file mode 100644
index eb0198d..0000000
--- a/package/uclibc/0001-fstat-make-new-code-aarch64-specific.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 71127e5cc937878883e6021da3da337a7aa9c099 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 3 Feb 2017 06:04:16 +0100
-Subject: [PATCH 10229/10229] fstat: make new code aarch64 specific
-
-The new code get's used by MIPS64 N64 and fails.
-Make the new code aarch64 specific.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libc/sysdeps/linux/common/fstat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/fstat.c b/libc/sysdeps/linux/common/fstat.c
-index ac77eb2..c27f926 100644
---- a/libc/sysdeps/linux/common/fstat.c
-+++ b/libc/sysdeps/linux/common/fstat.c
-@@ -21,7 +21,7 @@ int fstat(int fd, struct stat *buf)
- }
- libc_hidden_def(fstat)
- 
--#elif __WORDSIZE == 64 && defined __NR_newfstatat
-+#elif __WORDSIZE == 64 && defined __NR_newfstatat && __aarch64__
- #include <fcntl.h>
- 
- int fstat(int fd, struct stat *buf)
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-arm-fix-static-linking-issues.patch b/package/uclibc/0002-arm-fix-static-linking-issues.patch
deleted file mode 100644
index 5480b0d..0000000
--- a/package/uclibc/0002-arm-fix-static-linking-issues.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 94810a91c48ac62daed55b4aec70d04a44c10795 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Thu, 16 Feb 2017 20:22:21 +0100
-Subject: [PATCH] arm: fix static linking issues
-
-As reported by Buildroot developers these files causing static
-linking issues. The original contribution with the ARM unwind-resume
-rework and GNU libc sync was made before the combined libc change.
-But the patch was applied later, after the libc change and
-it seems the test coverage for static linking didn't catch it in
-the regression testing. Remove the files.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c | 2 --
- libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c | 1 -
- 2 files changed, 3 deletions(-)
- delete mode 100644 libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
- delete mode 100644 libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
-
-diff --git a/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c b/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
-deleted file mode 100644
-index fd0cec4..0000000
---- a/libpthread/nptl/sysdeps/arm/pt-arm-unwind-resume.c
-+++ /dev/null
-@@ -1,2 +0,0 @@
--__asm__ (".set __libgcc_s_init, pthread_cancel_init");
--#include <arm-unwind-resume.c>
-diff --git a/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c b/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
-deleted file mode 100644
-index 2641dc5..0000000
---- a/libpthread/nptl/sysdeps/arm/rt-arm-unwind-resume.c
-+++ /dev/null
-@@ -1 +0,0 @@
--#include <arm-unwind-resume.c>
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch b/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch
deleted file mode 100644
index 7c60228..0000000
--- a/package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 228d03bf0032e5799e9bf04810170c0653ca846d Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 17 Feb 2017 22:33:49 +0100
-Subject: [PATCH] or1k: add missing definition of ucontext
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libc/sysdeps/linux/or1k/sys/ucontext.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/or1k/sys/ucontext.h b/libc/sysdeps/linux/or1k/sys/ucontext.h
-index b11928e..dd97b60 100644
---- a/libc/sysdeps/linux/or1k/sys/ucontext.h
-+++ b/libc/sysdeps/linux/or1k/sys/ucontext.h
-@@ -20,6 +20,14 @@
- 
- #include <features.h>
- #include <signal.h>
--#include <asm/ucontext.h>
-+#include <bits/sigcontext.h>
-+
-+typedef struct ucontext {
-+	unsigned long	  uc_flags;
-+	struct ucontext  *uc_link;
-+	stack_t		  uc_stack;
-+	struct sigcontext uc_mcontext;
-+	sigset_t	  uc_sigmask;	/* mask last for extensibility */
-+} ucontext_t;
- 
- #endif /* sys/ucontext.h */
--- 
-2.1.4
-
diff --git a/package/uclibc/0004-sync-header-with-GNU-libc-kernel.patch b/package/uclibc/0004-sync-header-with-GNU-libc-kernel.patch
deleted file mode 100644
index 41a35f6..0000000
--- a/package/uclibc/0004-sync-header-with-GNU-libc-kernel.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From bf2fd9c0c451a83aa729394255394744fc81d8a3 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 5 Mar 2017 01:58:17 +0100
-Subject: [PATCH] sync header with GNU libc / kernel
-
-The header is not in sync with GNU libc and Linux kernel and
-therefore produces compile errors with qemu-user (2.8.0).
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- include/sys/timex.h | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/include/sys/timex.h b/include/sys/timex.h
-index 4cb81d2..76fefa7 100644
---- a/include/sys/timex.h
-+++ b/include/sys/timex.h
-@@ -1,5 +1,4 @@
--/* Copyright (C) 1995, 1996, 1997, 1999 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-+/* Copyright (C) 1995-2017 Free Software Foundation, Inc.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-@@ -22,13 +21,14 @@
- #include <sys/time.h>
- #include <time.h>
- 
--/* These definitions from linux/timex.h as of 2.2.0.  */
-+/* These definitions from linux/timex.h as of 3.18.  */
- 
- struct ntptimeval
- {
-   struct timeval time;	/* current time (ro) */
-   long int maxerror;	/* maximum error (us) (ro) */
-   long int esterror;	/* estimated error (us) (ro) */
-+  long int tai;		/* TAI offset (ro) */
- };
- 
- struct timex
-@@ -44,7 +44,6 @@ struct timex
-   long int tolerance;	/* clock frequency tolerance (ppm) (read only) */
-   struct timeval time;	/* (read only) */
-   long int tick;	/* (modified) usecs between clock ticks */
--
-   long int ppsfreq;	/* pps frequency (scaled ppm) (ro) */
-   long int jitter;	/* pps jitter (us) (ro) */
-   int shift;		/* interval duration (s) (shift) (ro) */
-@@ -54,6 +53,8 @@ struct timex
-   long int errcnt;	/* calibration errors (ro) */
-   long int stbcnt;	/* stability limit exceeded (ro) */
- 
-+  int tai;		/* TAI offset (ro) */
-+
-   /* ??? */
-   int  :32; int  :32; int  :32; int  :32;
-   int  :32; int  :32; int  :32; int  :32;
-@@ -83,6 +84,9 @@ struct timex
- #define MOD_TIMECONST	ADJ_TIMECONST
- #define MOD_CLKB	ADJ_TICK
- #define MOD_CLKA	ADJ_OFFSET_SINGLESHOT /* 0x8000 in original */
-+#define MOD_TAI		ADJ_TAI
-+#define MOD_MICRO	ADJ_MICRO
-+#define MOD_NANO	ADJ_NANO
- 
- 
- /* Status codes (timex.status) */
-@@ -102,9 +106,12 @@ struct timex
- #define STA_PPSERROR	0x0800	/* PPS signal calibration error (ro) */
- 
- #define STA_CLOCKERR	0x1000	/* clock hardware fault (ro) */
-+#define STA_NANO	0x2000	/* resolution (0 = us, 1 = ns) (ro) */
-+#define STA_MODE	0x4000	/* mode (0 = PLL, 1 = FLL) (ro) */
-+#define STA_CLK		0x8000	/* clock source (0 = A, 1 = B) (ro) */
- 
- #define STA_RONLY (STA_PPSSIGNAL | STA_PPSJITTER | STA_PPSWANDER | \
--    STA_PPSERROR | STA_CLOCKERR) /* read-only bits */
-+    STA_PPSERROR | STA_CLOCKERR | STA_NANO | STA_MODE | STA_CLK)
- 
- /* Clock states (time_state) */
- #define TIME_OK		0	/* clock synchronized, no leap second */
--- 
-2.1.4
-
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0628af3..28d2bcc 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -22,13 +22,6 @@ config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main uClibc configuration file.
 
-config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
-	bool "Enable RPC support"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  Enable this option if you want your toolchain to support
-	  RPC (needed for NFS, for example).
-
 config BR2_TOOLCHAIN_BUILDROOT_WCHAR
 	bool "Enable WCHAR support"
 	select BR2_USE_WCHAR
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index d2fbd0a..f5c49de 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  f2004c85db8e07e9f1c2e8b7c513fa7c237bc9f9685d8e1bfc89535b8a85449b        uClibc-ng-1.0.22.tar.xz
+sha256  a76ee9a69bce031d14cae22ce34527a856f724f888a6641bf53e6f07c6345c70        uClibc-ng-1.0.23.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 91baf73..b1e6112 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.22
+UCLIBC_VERSION = 1.0.23
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
@@ -268,24 +268,6 @@ endif
 UCLIBC_IPV6_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_IPV6,$(@D)/.config)
 
 #
-# RPC
-#
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_RPC),y)
-define UCLIBC_RPC_CONFIG
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_RPC,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FULL_RPC,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_REENTRANT_RPC,$(@D)/.config)
-endef
-else
-define UCLIBC_RPC_CONFIG
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_RPC,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_FULL_RPC,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_REENTRANT_RPC,$(@D)/.config)
-endef
-endif
-
-#
 # soft-float
 #
 
@@ -427,7 +409,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_LARGEFILE_CONFIG)
 	$(UCLIBC_IPV6_CONFIG)
-	$(UCLIBC_RPC_CONFIG)
 	$(UCLIBC_FLOAT_CONFIG)
 	$(UCLIBC_SSP_CONFIG)
 	$(UCLIBC_THREAD_CONFIG)
-- 
2.1.4
