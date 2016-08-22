From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 00:05:37 +0200
Subject: [Buildroot] [git commit] m68k: flat one memory region works with
	small kernel patch
Message-ID: <20160822220917.9586D802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9aee4b5819809b18b51189f3593c074af58fc3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Greg Ungerer fixed recently a bug in the Linux kernel, which
allows to use one memory region again.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: cherry-picked from next to master, in order to be able to use
BR2_BINFMT_FLAT_ONE by default on m68k, since BR2_BINFMT_FLAT_SEP_DATA
causes too much problems.]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in                                     |  1 -
 .../patches/linux/m68knommu-fix-signal.patch       | 45 ++++++++++++++++++++++
 configs/qemu_m68k_mcf5208_defconfig                |  2 +
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index b980e05..8000dca 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -331,7 +331,6 @@ choice
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
-	depends on !BR2_m68k
 	help
 	  All segments are linked into one memory region.
 
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
 
