From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Aug 2016 22:40:29 +0200
Subject: [Buildroot] [PATCH v2] m68k: disable BR2_BINFMT_FLAT_SEP_DATA for
	coldfire
Message-ID: <20160821204029.GA14971@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_BINFMT_FLAT_SEP_DATA can be used to create XIP userland and works fine
for m68k. Unfortunately a lot of basic packages as pcre are not compileable
because of a CPU or hardware limitation. The reason for failing are very
big functions used in the libraries or application code.

Typical errors are:

Fatal error: Tried to convert PC relative branch to absolute jump
or
error: value -yyyyy out of range

Add kernel patch from 4ec5542679264bc06a0356ef92f06ad7a0abe06d to make
BR2_BINFMT_FLAT_ONE compiled firmware work fine.

Fixes:
  http://autobuild.buildroot.net/results/20b/20b1586757450d6aad8583ad7a787a7ca11acef1/
  http://autobuild.buildroot.net/results/d31/d311955ada1ffcd7f69e82965c8fe33eabe488cd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - add missing kernel patch from -next commit, requested by Thomas
   Petazzoni
 - add more verbose commit message, requested by Thomas Petazzoni
---
 arch/Config.in                                     |  3 +-
 .../patches/linux/m68knommu-fix-signal.patch       | 45 ++++++++++++++++++++++
 configs/qemu_m68k_mcf5208_defconfig                |  2 +
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch

diff --git a/arch/Config.in b/arch/Config.in
index b980e05..4906be3 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -331,13 +331,12 @@ choice
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
-	depends on !BR2_m68k
 	help
 	  All segments are linked into one memory region.
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
-	depends on BR2_m68k || BR2_bfin
+	depends on BR2_bfin
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
diff --git a/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch b/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
new file mode 100644
index 0000000..b56994b
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
@@ -0,0 +1,45 @@
+m68knommu: fix user a5 register being overwritten
+
+On no-MMU systems the application a5 register can be overwitten with the
+address of the process data segment when processing application signals.
+For flat format applications compiled with full absolute relocation this
+effectively corrupts the a5 register on signal processing - and this very
+quickly leads to process crash and often takes out the whole system with
+a panic as well.
+
+This has no effect on flat format applications compiled with the more
+common PIC methods (such as -msep-data). These format applications reserve
+a5 for the pointer to the data segment anyway - so it doesn't change it.
+
+A long time ago the a5 register was used in the code packed into the user
+stack to enable signal return processing. And so it had to be restored on
+end of signal cleanup processing back to the original a5 user value. This
+was historically done by saving away a5 in the sigcontext structure. At
+some point (a long time back it seems) the a5 restore process was changed
+and it was hard coded to put the user data segment address directly into a5.
+Which is ok for the common PIC compiled application case, but breaks the
+full relocation application code.
+
+We no longer use this type of signal handling mechanism and so we don't
+need to do anything special to save and restore a5 at all now. So remove the
+code that hard codes a5 to the address of the user data segment.
+
+Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
+---
+ arch/m68k/kernel/signal.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
+index 2dcee3a..9202f82 100644
+--- a/arch/m68k/kernel/signal.c
++++ b/arch/m68k/kernel/signal.c
+@@ -213,7 +213,6 @@ static inline int frame_extra_sizes(int f)
+ 
+ static inline void adjustformat(struct pt_regs *regs)
+ {
+-	((struct switch_stack *)regs - 1)->a5 = current->mm->start_data;
+ 	/*
+ 	 * set format byte to make stack appear modulo 4, which it will
+ 	 * be when doing the rte
+-- 
+1.9.1
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index f911467..659ae3d 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,6 +9,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches"
+
 # Linux headers same as kernel, a 4.7 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-- 
2.1.4
