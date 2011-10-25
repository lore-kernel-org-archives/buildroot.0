From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 12:31:07 +0200
Subject: [Buildroot] [git commit] qemu_sh4_r2d: update to kernel 3.1 and
	update readme
Message-ID: <20111025103119.461498F12E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1836d23386d8976a8b9b75b4ac02c5a40a4857f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-missing-consts-to-sys_execve-declaration.patch |   17 -----------------
 .../linux-sh-fix-kconfig-warning.patch             |   13 -------------
 .../{linux-2.6.36.config => linux-3.1.config}      |    0
 board/qemu/sh4-r2d/readme.txt                      |   18 +++---------------
 configs/qemu_sh4_r2d_defconfig                     |    9 ++++++---
 5 files changed, 9 insertions(+), 48 deletions(-)

diff --git a/board/qemu/sh4-r2d/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch b/board/qemu/sh4-r2d/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
deleted file mode 100644
index f702abe..0000000
--- a/board/qemu/sh4-r2d/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff --git a/arch/sh/include/asm/syscalls_32.h b/arch/sh/include/asm/syscalls_32.h
-index be201fd..454538a 100644
---- a/arch/sh/include/asm/syscalls_32.h
-+++ b/arch/sh/include/asm/syscalls_32.h
-@@ -19,8 +19,10 @@ asmlinkage int sys_clone(unsigned long clone_flags, unsigned long newsp,
- asmlinkage int sys_vfork(unsigned long r4, unsigned long r5,
- 			 unsigned long r6, unsigned long r7,
- 			 struct pt_regs __regs);
--asmlinkage int sys_execve(const char __user *ufilename, char __user * __user *uargv,
--			  char __user * __user *uenvp, unsigned long r7,
-+asmlinkage int sys_execve(const char __user *ufilename,
-+			  const char __user *const __user *uargv,
-+			  const char __user *const __user *uenvp,
-+			  unsigned long r7,
- 			  struct pt_regs __regs);
- asmlinkage int sys_sigsuspend(old_sigset_t mask, unsigned long r5,
- 			      unsigned long r6, unsigned long r7,
diff --git a/board/qemu/sh4-r2d/kernel-patches/linux-sh-fix-kconfig-warning.patch b/board/qemu/sh4-r2d/kernel-patches/linux-sh-fix-kconfig-warning.patch
deleted file mode 100644
index 0ac07f2..0000000
--- a/board/qemu/sh4-r2d/kernel-patches/linux-sh-fix-kconfig-warning.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
-index 33990fa..06645b6 100644
---- a/arch/sh/Kconfig
-+++ b/arch/sh/Kconfig
-@@ -45,7 +45,7 @@ config SUPERH32
- 	select HAVE_ARCH_KGDB
- 	select HAVE_HW_BREAKPOINT
- 	select HAVE_MIXED_BREAKPOINTS_REGS
--	select PERF_EVENTS if HAVE_HW_BREAKPOINT
-+	select PERF_EVENTS
- 	select ARCH_HIBERNATION_POSSIBLE if MMU
- 
- config SUPERH64
diff --git a/board/qemu/sh4-r2d/linux-2.6.36.config b/board/qemu/sh4-r2d/linux-3.1.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-2.6.36.config
rename to board/qemu/sh4-r2d/linux-3.1.config
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index b237596..76eafac 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,17 +1,5 @@
-This little documentation explains how to build a kernel and a rootfs
-for qemu with sh4 architecture.
+Run the emulation with:
 
-1) Select qemu sh4 configuration and compile it :
+  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda noiotrap"
 
-make sh4_defconfig
-make all
-
-2) Run qemu-system-sh4 with the kernel and rootfs previously generated
-
-It's recommended to use a git release for qemu (the current stable
-version has framebuffer display issues). If you want to avoid building
-all target, you can use this option on qemu configure :
---target-list=sh4-softmmu
-
-The command is :
-qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda console=ttySC1,115200 noiotrap
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index f40633c..32835de 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -2,6 +2,10 @@
 BR2_sh=y
 BR2_sh4=y
 
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -14,8 +18,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
-BR2_LINUX_KERNEL_PATCH="board/qemu/sh4-r2d/kernel-patches/"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-2.6.36.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.1.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
