From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 15:41:21 +0200
Subject: [Buildroot] [git commit branch/next] package/libunwind: enable on
 AArch64
Message-ID: <20200516132514.D658E9149E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcfdd8a80dffd1c7c4973d4e359c32372430c83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since version 1.2, libunwind has support for the AArch64 architecture.

It builds fine on glibc, needs a small patch on musl, but doesn't
build with uClibc (stack_t undefined).

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12836

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sigset_t-instead-of-__sigset_t-on-AArch64.patch | 46 ++++++++++++++++++++++
 package/libunwind/Config.in                        |  7 ++--
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/0002-Use-sigset_t-instead-of-__sigset_t-on-AArch64.patch b/package/libunwind/0002-Use-sigset_t-instead-of-__sigset_t-on-AArch64.patch
new file mode 100644
index 0000000000..035bdae803
--- /dev/null
+++ b/package/libunwind/0002-Use-sigset_t-instead-of-__sigset_t-on-AArch64.patch
@@ -0,0 +1,46 @@
+From b9627ed74ab1f58be0de075be68d5cd2e96b8750 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 3 May 2020 23:08:54 +0200
+Subject: [PATCH] Use sigset_t instead of __sigset_t on AArch64
+
+This fixes the build with the musl C library. sigset_t is the
+documented type exposed by <signal.h>.
+
+This fix comes from Alpine Linux:
+
+  https://git.alpinelinux.org/aports/plain/main/libunwind/fix-aarch64-sigset_t.patch
+
+It was authored by Leo <thinkabit.ukim@gmail.com>.
+
+The issue has been reported upstream at
+https://github.com/libunwind/libunwind/issues/176.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/libunwind-aarch64.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/libunwind-aarch64.h b/include/libunwind-aarch64.h
+index 778b4362..926fbbc0 100644
+--- a/include/libunwind-aarch64.h
++++ b/include/libunwind-aarch64.h
+@@ -34,6 +34,7 @@ extern "C" {
+ #include <inttypes.h>
+ #include <stddef.h>
+ #include <ucontext.h>
++#include <signal.h>
+ 
+ #define UNW_TARGET      aarch64
+ #define UNW_TARGET_AARCH64      1
+@@ -192,7 +193,7 @@ typedef struct
+ 	unsigned long uc_flags;
+ 	struct ucontext *uc_link;
+ 	stack_t uc_stack;
+-	__sigset_t uc_sigmask;
++	sigset_t uc_sigmask;
+ 	struct unw_sigcontext uc_mcontext;
+   } unw_tdep_context_t;
+ 
+-- 
+2.26.2
+
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index be576d13c4..5284b5864c 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -10,13 +10,14 @@
 config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64)
+		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_mips || BR2_mipsel || \
+		 BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sh || \
+		 BR2_i386 || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_x86_64)
+		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_x86_64)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
