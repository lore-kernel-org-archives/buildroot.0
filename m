From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 10:02:48 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest kernel version
Message-ID: <1476363768-30018-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop m68k-mcf5208 kernel patch since it's upstream.

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.8.1   2.6.0           YES     OK (3)
arm_versatile           4.8.1   2.5.0           YES     OK
arm_vexpress            4.8.1   2.5.0           YES     OK
m68k_mcf5208            4.8.1   2.5.0           YES     OK
m68k_q800               4.8.1   q800-v2.4.0     NO (2)  OK
microblazebe            4.8.1   2.5.0           YES     OK
microblazeel            4.8.1   2.5.0           YES     OK
mips32r2el_malta        4.8.1   2.5.0           YES     OK
mips32r2_malta          4.8.1   2.5.0           YES     OK
mips32r6el_malta        4.8.1   2.6.0           YES     OK (3)
mips32r6_malta          4.8.1   2.6.0           YES     OK (3)
mips64el_malta          4.8.1   2.5.0           YES     OK
mips64_malta            4.8.1   2.5.0           YES     OK
mips64r6el_malta        4.8.1   2.7.0           YES     OK (3)(4)
mips64r6_malta          4.8.1   2.7.0           YES     OK (3)(4)
ppc_g3beige             4.8.1   2.5.0           YES     OK
ppc_mpc8544ds           4.8.1   2.5.0           YES     OK
ppc_virtex_ml507        4.8.1   2.5.0           NO      OK
ppc64_pseries           4.8.1   2.5.0           YES     OK
sh4                     4.8.1   2.5.0           YES     OK
sh4eb                   4.8.1   2.5.0           NO (1)  OK
sparc_ss10              4.8.1   2.5.0           YES     OK
sparc64_sun4u           4.8.1   2.5.0           YES     OK
sparc_sun4u             4.8.1   2.5.0           YES     OK
x86                     4.8.1   2.5.0           YES     OK
x86_64                  4.8.1   2.5.0           YES     OK
xtensa_lx60             4.8.1   2.6.0           YES     OK
xtensa_lx60_nommu       4.8.1   2.6.0           YES     OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Known to fail with qemu versions lower than 2.6.0
(4) - Might work with 2.6.0, but the cpu definition changed in 2.7.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../patches/linux/m68knommu-fix-signal.patch       | 45 ----------------------
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../linux-4.8.config}                              |  0
 .../linux-4.8.config}                              |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../linux-4.8.config}                              |  0
 board/qemu/mips64r6-malta/readme.txt               |  7 +++-
 .../linux-4.8.config}                              |  0
 board/qemu/mips64r6el-malta/readme.txt             |  5 ++-
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../sh4-r2d/{linux-4.7.config => linux-4.8.config} |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 board/qemu/x86/linux-4.7.config                    |  1 -
 board/qemu/x86/linux-4.8.config                    |  1 +
 .../x86_64/{linux-4.7.config => linux-4.8.config}  |  0
 ...nux-4.7-nommu.config => linux-4.8-nommu.config} |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 configs/pc_x86_64_bios_defconfig                   |  8 ++--
 configs/pc_x86_64_efi_defconfig                    |  8 ++--
 configs/qemu_aarch64_virt_defconfig                |  8 ++--
 configs/qemu_arm_versatile_defconfig               |  8 ++--
 configs/qemu_arm_vexpress_defconfig                |  6 +--
 configs/qemu_m68k_mcf5208_defconfig                | 10 ++---
 configs/qemu_m68k_q800_defconfig                   |  8 ++--
 configs/qemu_microblazebe_mmu_defconfig            |  8 ++--
 configs/qemu_microblazeel_mmu_defconfig            |  8 ++--
 configs/qemu_mips32r2_malta_defconfig              |  8 ++--
 configs/qemu_mips32r2el_malta_defconfig            |  8 ++--
 configs/qemu_mips32r6_malta_defconfig              |  8 ++--
 configs/qemu_mips32r6el_malta_defconfig            |  8 ++--
 configs/qemu_mips64_malta_defconfig                |  8 ++--
 configs/qemu_mips64el_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6el_malta_defconfig            |  8 ++--
 configs/qemu_ppc64_pseries_defconfig               |  6 +--
 configs/qemu_ppc_g3beige_defconfig                 |  8 ++--
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 ++--
 configs/qemu_ppc_virtex_ml507_defconfig            |  8 ++--
 configs/qemu_sh4_r2d_defconfig                     |  8 ++--
 configs/qemu_sh4eb_r2d_defconfig                   |  8 ++--
 configs/qemu_sparc64_sun4u_defconfig               |  8 ++--
 configs/qemu_sparc_ss10_defconfig                  |  8 ++--
 configs/qemu_x86_64_defconfig                      |  8 ++--
 configs/qemu_x86_defconfig                         |  8 ++--
 configs/qemu_xtensa_lx60_defconfig                 |  8 ++--
 configs/qemu_xtensa_lx60_nommu_defconfig           |  8 ++--
 58 files changed, 124 insertions(+), 165 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/arm-versatile/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/m68k-mcf5208/{linux-4.7.config => linux-4.8.config} (100%)
 delete mode 100644 board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
 rename board/qemu/m68k-q800/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/mips32r2-malta/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/mips32r2el-malta/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/{mips32r6el-malta/linux-4.7.config => mips32r6-malta/linux-4.8.config} (100%)
 rename board/qemu/{mips32r6-malta/linux-4.7.config => mips32r6el-malta/linux-4.8.config} (100%)
 rename board/qemu/mips64-malta/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/{mips64r6el-malta/linux-4.7.config => mips64r6-malta/linux-4.8.config} (100%)
 rename board/qemu/{mips64r6-malta/linux-4.7.config => mips64r6el-malta/linux-4.8.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/ppc-mpc8544ds/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/ppc-virtex-ml507/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/sh4eb-r2d/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/sparc64-sun4u/{linux-4.7.config => linux-4.8.config} (100%)
 delete mode 120000 board/qemu/x86/linux-4.7.config
 create mode 120000 board/qemu/x86/linux-4.8.config
 rename board/qemu/x86_64/{linux-4.7.config => linux-4.8.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-4.7-nommu.config => linux-4.8-nommu.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-4.7.config => linux-4.8.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.7.config b/board/qemu/aarch64-virt/linux-4.8.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.7.config
rename to board/qemu/aarch64-virt/linux-4.8.config
diff --git a/board/qemu/arm-versatile/linux-4.7.config b/board/qemu/arm-versatile/linux-4.8.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.7.config
rename to board/qemu/arm-versatile/linux-4.8.config
diff --git a/board/qemu/m68k-mcf5208/linux-4.7.config b/board/qemu/m68k-mcf5208/linux-4.8.config
similarity index 100%
rename from board/qemu/m68k-mcf5208/linux-4.7.config
rename to board/qemu/m68k-mcf5208/linux-4.8.config
diff --git a/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch b/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
deleted file mode 100644
index b56994b..0000000
--- a/board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-m68knommu: fix user a5 register being overwritten
-
-On no-MMU systems the application a5 register can be overwitten with the
-address of the process data segment when processing application signals.
-For flat format applications compiled with full absolute relocation this
-effectively corrupts the a5 register on signal processing - and this very
-quickly leads to process crash and often takes out the whole system with
-a panic as well.
-
-This has no effect on flat format applications compiled with the more
-common PIC methods (such as -msep-data). These format applications reserve
-a5 for the pointer to the data segment anyway - so it doesn't change it.
-
-A long time ago the a5 register was used in the code packed into the user
-stack to enable signal return processing. And so it had to be restored on
-end of signal cleanup processing back to the original a5 user value. This
-was historically done by saving away a5 in the sigcontext structure. At
-some point (a long time back it seems) the a5 restore process was changed
-and it was hard coded to put the user data segment address directly into a5.
-Which is ok for the common PIC compiled application case, but breaks the
-full relocation application code.
-
-We no longer use this type of signal handling mechanism and so we don't
-need to do anything special to save and restore a5 at all now. So remove the
-code that hard codes a5 to the address of the user data segment.
-
-Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
----
- arch/m68k/kernel/signal.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
-index 2dcee3a..9202f82 100644
---- a/arch/m68k/kernel/signal.c
-+++ b/arch/m68k/kernel/signal.c
-@@ -213,7 +213,6 @@ static inline int frame_extra_sizes(int f)
- 
- static inline void adjustformat(struct pt_regs *regs)
- {
--	((struct switch_stack *)regs - 1)->a5 = current->mm->start_data;
- 	/*
- 	 * set format byte to make stack appear modulo 4, which it will
- 	 * be when doing the rte
--- 
-1.9.1
diff --git a/board/qemu/m68k-q800/linux-4.7.config b/board/qemu/m68k-q800/linux-4.8.config
similarity index 100%
rename from board/qemu/m68k-q800/linux-4.7.config
rename to board/qemu/m68k-q800/linux-4.8.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.7.config b/board/qemu/microblazebe-mmu/linux-4.8.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.7.config
rename to board/qemu/microblazebe-mmu/linux-4.8.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.7.config b/board/qemu/microblazeel-mmu/linux-4.8.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.7.config
rename to board/qemu/microblazeel-mmu/linux-4.8.config
diff --git a/board/qemu/mips32r2-malta/linux-4.7.config b/board/qemu/mips32r2-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips32r2-malta/linux-4.7.config
rename to board/qemu/mips32r2-malta/linux-4.8.config
diff --git a/board/qemu/mips32r2el-malta/linux-4.7.config b/board/qemu/mips32r2el-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips32r2el-malta/linux-4.7.config
rename to board/qemu/mips32r2el-malta/linux-4.8.config
diff --git a/board/qemu/mips32r6el-malta/linux-4.7.config b/board/qemu/mips32r6-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips32r6el-malta/linux-4.7.config
rename to board/qemu/mips32r6-malta/linux-4.8.config
diff --git a/board/qemu/mips32r6-malta/linux-4.7.config b/board/qemu/mips32r6el-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips32r6-malta/linux-4.7.config
rename to board/qemu/mips32r6el-malta/linux-4.8.config
diff --git a/board/qemu/mips64-malta/linux-4.7.config b/board/qemu/mips64-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.7.config
rename to board/qemu/mips64-malta/linux-4.8.config
diff --git a/board/qemu/mips64el-malta/linux-4.7.config b/board/qemu/mips64el-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.7.config
rename to board/qemu/mips64el-malta/linux-4.8.config
diff --git a/board/qemu/mips64r6el-malta/linux-4.7.config b/board/qemu/mips64r6-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips64r6el-malta/linux-4.7.config
rename to board/qemu/mips64r6-malta/linux-4.8.config
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index 8f792a0..4a6c5fe 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -1,7 +1,10 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -cpu MIPS64R6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
+ qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.7.0
+
+Might work with 2.6.0 by changing the -cpu entry to MIPS64R6-generic
+since the naming was updated and the old name removed in 2.7.0
diff --git a/board/qemu/mips64r6-malta/linux-4.7.config b/board/qemu/mips64r6el-malta/linux-4.8.config
similarity index 100%
rename from board/qemu/mips64r6-malta/linux-4.7.config
rename to board/qemu/mips64r6el-malta/linux-4.8.config
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index 3459a87..b1dc23a 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -1,7 +1,10 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -cpu MIPS64R6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
+ qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
 Tested with QEMU 2.6.0
+
+Might work with 2.6.0 by changing the -cpu entry to MIPS64R6-generic
+since the naming was updated and the old name removed in 2.7.0
diff --git a/board/qemu/ppc-g3beige/linux-4.7.config b/board/qemu/ppc-g3beige/linux-4.8.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.7.config
rename to board/qemu/ppc-g3beige/linux-4.8.config
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.7.config b/board/qemu/ppc-mpc8544ds/linux-4.8.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.7.config
rename to board/qemu/ppc-mpc8544ds/linux-4.8.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.7.config b/board/qemu/ppc-virtex-ml507/linux-4.8.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.7.config
rename to board/qemu/ppc-virtex-ml507/linux-4.8.config
diff --git a/board/qemu/sh4-r2d/linux-4.7.config b/board/qemu/sh4-r2d/linux-4.8.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.7.config
rename to board/qemu/sh4-r2d/linux-4.8.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.7.config b/board/qemu/sh4eb-r2d/linux-4.8.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.7.config
rename to board/qemu/sh4eb-r2d/linux-4.8.config
diff --git a/board/qemu/sparc-ss10/linux-4.7.config b/board/qemu/sparc-ss10/linux-4.8.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.7.config
rename to board/qemu/sparc-ss10/linux-4.8.config
diff --git a/board/qemu/sparc64-sun4u/linux-4.7.config b/board/qemu/sparc64-sun4u/linux-4.8.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.7.config
rename to board/qemu/sparc64-sun4u/linux-4.8.config
diff --git a/board/qemu/x86/linux-4.7.config b/board/qemu/x86/linux-4.7.config
deleted file mode 120000
index 22732f6..0000000
--- a/board/qemu/x86/linux-4.7.config
+++ /dev/null
@@ -1 +0,0 @@
-../x86_64/linux-4.7.config
\ No newline at end of file
diff --git a/board/qemu/x86/linux-4.8.config b/board/qemu/x86/linux-4.8.config
new file mode 120000
index 0000000..fca759e
--- /dev/null
+++ b/board/qemu/x86/linux-4.8.config
@@ -0,0 +1 @@
+../x86_64/linux-4.8.config
\ No newline at end of file
diff --git a/board/qemu/x86_64/linux-4.7.config b/board/qemu/x86_64/linux-4.8.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.7.config
rename to board/qemu/x86_64/linux-4.8.config
diff --git a/board/qemu/xtensa-lx60/linux-4.7-nommu.config b/board/qemu/xtensa-lx60/linux-4.8-nommu.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.7-nommu.config
rename to board/qemu/xtensa-lx60/linux-4.8-nommu.config
diff --git a/board/qemu/xtensa-lx60/linux-4.7.config b/board/qemu/xtensa-lx60/linux-4.8.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.7.config
rename to board/qemu/xtensa-lx60/linux-4.8.config
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 020be85..242d3bf 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 13194881..118cc59 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -23,15 +23,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 2f5429b..acde354 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.8.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 738c727..452ed5f 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.8.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 381c0eb..e841bac 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 659ae3d..c6c9098 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,17 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches"
-
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 6ebd6fa..1d59d77 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index ecff6c3..188304e 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.8.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 67534b3..471d86a 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.8.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 7aa8fc0..16cc0ca 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 6c6b3cd..a66bdbd 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index bddde48..a74c101 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index f0d64ff..5202e2c 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 211bf01..92bacc0 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index b80b3eb..d3cac61 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 43e141d..c68d887 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index c3acc1c..c0ad304 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 5c18357..810f6e6 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index ab3276d..d0cd2cc 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index a77936f..ed10eee 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index d2581cb..c8571b6 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ce387c2..11c4d26 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.8.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 246e39e..e88b638 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.8.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 288945b..a4c0e96 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.8.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 42efa48..0f3b474 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.8.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 40840be..8284d3f 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index a17ced4..0a4c6a8 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.8.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index cf60100..020ea0c 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4,8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index ab9de6a..b2ff479 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.7-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.7.3
