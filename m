From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 20 Jan 2013 21:55:41 +0000
Subject: [Buildroot] [PATCH] avr32: support uClibc 0.9.33.2
Message-ID: <1358718941-25383-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Add a uClibc patch from OpenWRT, and tweak an existing patch to cope with
the lack of a dup3 Linux syscall on avr32. This allow uClibc 0.9.33.2 to be
built for avr32.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 toolchain/toolchain-buildroot/Config.in.2                |    3 ++-
 toolchain/uClibc/Config.in                               |    3 +--
 .../uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch   |   14 ++++++++++++++
 toolchain/uClibc/uClibc-0.9.33.2-dup3.patch              |    4 +++-
 4 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index d27c9f3..a713727 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -68,7 +68,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI && !BR2_xtensa
+	default BR2_PTHREADS_NATIVE if (!BR2_UCLIBC_VERSION_0_9_31) && !BR2_ARM_OABI && !(BR2_avr32 || BR2_xtensa)
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
@@ -95,6 +95,7 @@ choice
 		depends on !BR2_UCLIBC_VERSION_0_9_31
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
+		depends on !BR2_avr32
 		depends on !BR2_xtensa
 endchoice
 
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index e47bc9b..a48b6a0 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,6 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_31 if BR2_avr32 # 0.9.32 broken
 	default BR2_UCLIBC_VERSION_0_9_33
 	help
 	  Select the version of uClibc you wish to use.
@@ -20,7 +19,7 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		depends on !(BR2_avr32 || BR2_xtensa)
+		depends on !BR2_xtensa
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch b/toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch
new file mode 100644
index 0000000..5edc31e
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch
@@ -0,0 +1,14 @@
+Patch from OpenWRT for avr32.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+--- a/libc/sysdeps/linux/avr32/bits/atomic.h
++++ b/libc/sysdeps/linux/avr32/bits/atomic.h
+@@ -28,6 +28,7 @@ typedef uintmax_t uatomic_max_t;
+ 
+ #define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)	\
+ 	({								\
++		__uint32_t __result;					\
+ 		__typeof__(*(mem)) __prev;				\
+ 		__asm__ __volatile__(					\
+ 			"/* __arch_compare_and_exchange_val_32_acq */\n" \
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch b/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
index 66b419e..87fe2a6 100644
--- a/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
+++ b/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
@@ -29,7 +29,7 @@ new file mode 100644
 index 0000000..5fdab2e
 --- /dev/null
 +++ b/libc/sysdeps/linux/common/dup3.c
-@@ -0,0 +1,15 @@
+@@ -0,0 +1,17 @@
 +/* vi: set sw=4 ts=4: */
 +/*
 + * dup3() for uClibc
@@ -43,8 +43,10 @@ index 0000000..5fdab2e
 +#include <unistd.h>
 +
 +
++#ifdef __NR_dup3
 +_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
 +libc_hidden_def(dup3)
++#endif
 -- 
 1.7.5.4
 
-- 
1.7.10.4
