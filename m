From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:06 +0100
Subject: [Buildroot] [PATCH v2 04/17] uclibc: add patches to simplify Thumb
	handling
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458335299-27409-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a number of patches to uClibc that radically
simplifies the Thumb handling. uClibc currently has three options that
you need to toggle on Thumb configurations depending on the specific
ARM CPU being targeted.

However, it turns out that none of those options are necessary:

 - USE_BX can simply be guessed by looking at the ARM core being
   used. The bx instruction is available for all ARM cores >=
   ARMv4T. This is exactly what glibc is doing.

 - USE_LDREXSTREX can also be guessed by looking at the ARM core being
   used: whenever you have Thumb2, ldrex/strex is available.

 - COMPILE_IN_THUMB becomes useless, since all it does is passing
   -mthumb. But just like the uClibc config options to set
   --march=<foo> have been removed a long time ago, there's no need to
   -have an option to pass -mthumb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-arm-remove-use-of-USE_BX-option.patch     | 53 ++++++++++++++++++++++
 package/uclibc/0002-arm-remove-USE_BX-option.patch | 40 ++++++++++++++++
 .../0003-arm-remove-use-of-USE_LDREXSTREX.patch    | 49 ++++++++++++++++++++
 .../uclibc/0004-arm-remove-USE_LDREXSTREX.patch    | 34 ++++++++++++++
 .../uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch  | 43 ++++++++++++++++++
 5 files changed, 219 insertions(+)
 create mode 100644 package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
 create mode 100644 package/uclibc/0002-arm-remove-USE_BX-option.patch
 create mode 100644 package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
 create mode 100644 package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
 create mode 100644 package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch

diff --git a/package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch b/package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
new file mode 100644
index 0000000..ab330fe
--- /dev/null
+++ b/package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
@@ -0,0 +1,53 @@
+From 5ae09aacbe8b959a36cde130c36547456b7ec8d3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Mar 2016 22:40:19 +0100
+Subject: [PATCH] arm: remove use of USE_BX option
+
+There is no need to have an option for this: knowing whether BX is
+available or not is easy. If you have an ARM > v4 or ARMv4T, then BX
+is available, otherwise it's not. This logic is the one used in glibc:
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libc/sysdeps/linux/arm/bits/arm_bx.h | 10 ++++------
+ libc/sysdeps/linux/arm/clone.S       |  2 +-
+ 2 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/libc/sysdeps/linux/arm/bits/arm_bx.h b/libc/sysdeps/linux/arm/bits/arm_bx.h
+index 2c29089..1c775b6 100644
+--- a/libc/sysdeps/linux/arm/bits/arm_bx.h
++++ b/libc/sysdeps/linux/arm/bits/arm_bx.h
+@@ -23,13 +23,11 @@
+ #error Please include features.h first
+ #endif /* features.h not yet included */
+ 
+-#if defined(__USE_BX__)
+-# if (__ARM_ARCH <= 4 && !defined __ARM_ARCH_4T__)
+-#  error Use of BX was requested, but is not available on the target processor.
+-# endif /* ARCH level */
+-#endif /* __USE_BX__ */
++#if __ARM_ARCH > 4 || defined (__ARM_ARCH_4T__)
++# define ARCH_HAS_BX
++#endif
+ 
+-#if defined(__USE_BX__) && (__ARM_ARCH > 4 || (__ARM_ARCH == 4 && defined __ARM_ARCH_4T__))
++#if defined(ARCH_HAS_BX)
+ # define BX(reg)	bx reg
+ # define BXC(cond, reg)	bx##cond reg
+ #else
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index b4c7d8a..fd7590d 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -69,7 +69,7 @@ __clone:
+ 
+ 	@ pick the function arg and call address off the stack and execute
+ 	ldr	r0, [sp, #4]
+-#if defined(__USE_BX__)
++#if defined(ARCH_HAS_BX)
+ 	ldr	r1, [sp]
+ 	bl	2f	@ blx r1
+ #else
+-- 
+2.6.4
+
diff --git a/package/uclibc/0002-arm-remove-USE_BX-option.patch b/package/uclibc/0002-arm-remove-USE_BX-option.patch
new file mode 100644
index 0000000..12abb42
--- /dev/null
+++ b/package/uclibc/0002-arm-remove-USE_BX-option.patch
@@ -0,0 +1,40 @@
+From b18d26fe870cbe95bb9c9fe43767d8688bad9596 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Mar 2016 22:41:44 +0100
+Subject: [PATCH] arm: remove USE_BX option
+
+Now that __USE_BX__ is no longer used anywhere, we can get rid of the
+configuration option.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ extra/Configs/Config.arm | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index 00cf982..6090ead 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -27,19 +27,11 @@ config CONFIG_ARM_EABI
+ 
+ config COMPILE_IN_THUMB_MODE
+ 	bool "Build using Thumb mode"
+-	select USE_BX
+ 	select USE_LDREXSTREX
+ 	help
+ 	  Say 'y' here to force building uClibc in thumb mode.
+ 	  Say 'n' to use your compiler's default mode.
+ 
+-config USE_BX
+-	bool "Use BX in function return"
+-	help
+-	  Say 'y' to use BX to return from functions on your thumb-aware
+-	  processor. Say 'y' if you need to use interworking. Say 'n' if not.
+-	  It is safe to say 'y' even if you're not doing interworking.
+-
+ config USE_LDREXSTREX
+ 	bool "Use load-store exclusive ASM ops (not supported in SmartFusion)"
+ 	depends on COMPILE_IN_THUMB_MODE
+-- 
+2.6.4
+
diff --git a/package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch b/package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
new file mode 100644
index 0000000..a668ecd
--- /dev/null
+++ b/package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
@@ -0,0 +1,49 @@
+From 45d2eadc3ff8234ed09fe1870dd7ed4144223ecd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Mar 2016 22:45:23 +0100
+Subject: [PATCH] arm: remove use of USE_LDREXSTREX
+
+Whenever Thumb2 is available, ldrex/strex are available, so we can
+simply rely on __thumb2__ to determine whether ldrex/strex should be
+used, without requiring a Config.in option.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h b/libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h
+index 2b877f9..fc17e9b 100644
+--- a/libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h
++++ b/libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h
+@@ -28,8 +28,7 @@
+ # define PT_EI __extern_always_inline
+ #endif
+ 
+-#if defined(__thumb__)
+-#if defined(__USE_LDREXSTREX__)
++#if defined(__thumb2__)
+ PT_EI long int ldrex(int *spinlock)
+ {
+ 	long int ret;
+@@ -63,7 +62,7 @@ testandset (int *spinlock)
+   return ret;
+ }
+ 
+-#else /* __USE_LDREXSTREX__ */
++#elif defined(__thumb__)
+ 
+ /* This will not work on ARM1 or ARM2 because SWP is lacking on those
+    machines.  Unfortunately we have no way to detect this at compile
+@@ -88,7 +87,7 @@ PT_EI long int testandset (int *spinlock)
+ 	: "0"(1), "r"(spinlock));
+   return ret;
+ }
+-#endif
++
+ #else /* __thumb__ */
+ 
+ PT_EI long int testandset (int *spinlock);
+-- 
+2.6.4
+
diff --git a/package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch b/package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
new file mode 100644
index 0000000..30cf420
--- /dev/null
+++ b/package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
@@ -0,0 +1,34 @@
+From 14628e02c40df1229c242270e0e2794f30aeed80 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Mar 2016 22:46:36 +0100
+Subject: [PATCH] arm: remove USE_LDREXSTREX
+
+The USE_LDREXSTREX option is no longer needed, get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ extra/Configs/Config.arm | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index 6090ead..0825c42 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -27,14 +27,6 @@ config CONFIG_ARM_EABI
+ 
+ config COMPILE_IN_THUMB_MODE
+ 	bool "Build using Thumb mode"
+-	select USE_LDREXSTREX
+ 	help
+ 	  Say 'y' here to force building uClibc in thumb mode.
+ 	  Say 'n' to use your compiler's default mode.
+-
+-config USE_LDREXSTREX
+-	bool "Use load-store exclusive ASM ops (not supported in SmartFusion)"
+-	depends on COMPILE_IN_THUMB_MODE
+-	default n
+-	help
+-	  Say 'y' to use LDREX/STREX ASM ops.
+-- 
+2.6.4
+
diff --git a/package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch b/package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch
new file mode 100644
index 0000000..46d29bb
--- /dev/null
+++ b/package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch
@@ -0,0 +1,43 @@
+From 021e407a5ef7d75f62bde70178606b530720d513 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Mar 2016 22:47:16 +0100
+Subject: [PATCH] arm: remove COMPILE_IN_THUMB
+
+One just need to pass the appropriate -mthumb gcc flag, like you
+anyway need to do to build for the proper ARM variant.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Rules.mak                | 1 -
+ extra/Configs/Config.arm | 6 ------
+ 2 files changed, 7 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index b1cecec..0ae3bb1 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -392,7 +392,6 @@ endif
+ ifeq ($(TARGET_ARCH),arm)
+ 	CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=-mlittle-endian
+ 	CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=-mbig-endian
+-	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
+ endif
+ 
+ ifeq ($(TARGET_ARCH),metag)
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index 0825c42..0d02e3f 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -24,9 +24,3 @@ config CONFIG_ARM_EABI
+ 
+ 	  If you say 'n' here, then the library will be built for the
+ 	  old Linux ABI.
+-
+-config COMPILE_IN_THUMB_MODE
+-	bool "Build using Thumb mode"
+-	help
+-	  Say 'y' here to force building uClibc in thumb mode.
+-	  Say 'n' to use your compiler's default mode.
+-- 
+2.6.4
+
-- 
2.6.4
