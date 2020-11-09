From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:23:46 +0100
Subject: [Buildroot] [git commit] board/qemu/ppc-mpc8544ds: apply Debian
 patch fixing wrong mcpu
Message-ID: <20201109201247.B301481397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=780af51d86c80f102a6b2ac189bf546daffe15a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building the linux kernel for PPC_85xx cpus with GCC 8, the build fail with:

  powerpc-e500v2-linux-gnuspe-gcc: error: unrecognized argument in option '-mcpu=powerpc'
  powerpc-e500v2-linux-gnuspe-gcc: note: valid arguments to '-mcpu=' are: 8540 8548 native

"GCC started treating "PowerPC" and "PowerPC SPE" as two different architectures and
that's the reason for the reduced -mcpu list." [1]

As suggested in the crosstool-ng issue [1], apply the Debian patch to avoid
-mcpu=powerpc or -mcpu=powerpc64.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981654

[1] https://github.com/crosstool-ng/crosstool-ng/issues/1152
[2] https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pc-Fix-mcpu-options-for-SPE-only-compiler.patch | 53 ++++++++++++++++++++++
 configs/qemu_ppc_mpc8544ds_defconfig               |  1 +
 2 files changed, 54 insertions(+)

diff --git a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
new file mode 100644
index 0000000000..a7bc31bda2
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
@@ -0,0 +1,53 @@
+From 44e3424424b447b00fbe1f10ddba81b55817e970 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 26 Dec 2018 00:00:40 +0000
+Subject: [PATCH] powerpc: Fix -mcpu= options for SPE-only compiler
+
+GCC for Debian's "powerpcspe" architecture only supports 32-bit
+SPE targets, and using -mcpu=powerpc or -mcpu=powerpc64 is a fatal
+error.
+
+* Change the test for a biarch compiler to pass both the -m32 and -m64
+  options, so that it doesn't catch 32-bit-only compilers
+* Add an ifdef CONFIG_PPC64 around the 64-bit CPU option definitions
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+[Romain: Patch from Debian repository:
+https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/powerpc/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
+index 37ac731a556b..5211ea4f48b1 100644
+--- a/arch/powerpc/Makefile
++++ b/arch/powerpc/Makefile
+@@ -12,7 +12,7 @@
+ # Rewritten by Cort Dougan and Paul Mackerras
+ #
+ 
+-HAS_BIARCH	:= $(call cc-option-yn, -m32)
++HAS_BIARCH	:= $(call cc-option-yn, -m32 -m64)
+ 
+ # Set default 32 bits cross compilers for vdso and boot wrapper
+ CROSS32_COMPILE ?=
+@@ -166,6 +166,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
+ 
+ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
+ 
++ifdef CONFIG_PPC64
+ ifdef CONFIG_PPC_BOOK3S_64
+ ifdef CONFIG_CPU_LITTLE_ENDIAN
+ CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
+@@ -177,6 +178,7 @@ endif
+ else
+ CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
+ endif
++endif
+ 
+ ifdef CONFIG_FUNCTION_TRACER
+ CC_FLAGS_FTRACE := -pg
+-- 
+2.25.4
+
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 98a10b3535..9ec94a4839 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc=y
 BR2_powerpc_8548=y
 
 # System
+BR2_GLOBAL_PATCH_DIR="board/qemu/ppc-mpc8544ds/patches"
 BR2_SYSTEM_DHCP="eth0"
 
 # Filesystem
