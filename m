From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Feb 2019 08:41:29 +0100
Subject: [Buildroot] [git commit branch/next] configs/qemu: Update
 defconfigs to Linux 4.19.16
Message-ID: <20190213214531.2FD668A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd8a02fd75d652b85f64c1cd7e9adf1ee2329261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Linux version are changed to 4.19.16 (LTS) for all qemu defconfigs,
except for riscv. riscv defconfigs are left unchanged because they have
a custom Linux repository causing more difficulties when upgrading to
4.19 for riscv32. And for the riscv64, it has been updated recently to
Linux 4.20 by another contributor.

Patch for arm-versatile-nommu is changed into a git format

Add cache attributes for xtensa-lx60-nommu config because the commit
https://github.com/torvalds/linux/commit/7bb516ca5424e12b42124fab2906b6da9c81ba9c
added a new config variable for memory cache attribute:
CONFIG_MEMMAP_CACHEATTR

All these updated configs have been built successfully.

Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/linux/versatile-nommu.patch            | 73 +++++++++++++++-------
 board/qemu/xtensa-lx60/linux-nommu.config          |  1 +
 configs/qemu_aarch64_virt_defconfig                |  6 +-
 configs/qemu_arm_versatile_defconfig               |  6 +-
 configs/qemu_arm_versatile_nommu_defconfig         |  6 +-
 configs/qemu_arm_vexpress_defconfig                |  6 +-
 configs/qemu_m68k_mcf5208_defconfig                |  6 +-
 configs/qemu_m68k_q800_defconfig                   |  6 +-
 configs/qemu_microblazebe_mmu_defconfig            |  6 +-
 configs/qemu_microblazeel_mmu_defconfig            |  6 +-
 configs/qemu_mips32r2_malta_defconfig              |  6 +-
 configs/qemu_mips32r2el_malta_defconfig            |  6 +-
 configs/qemu_mips32r6_malta_defconfig              |  6 +-
 configs/qemu_mips32r6el_malta_defconfig            |  6 +-
 configs/qemu_mips64_malta_defconfig                |  6 +-
 configs/qemu_mips64el_malta_defconfig              |  6 +-
 configs/qemu_mips64r6_malta_defconfig              |  6 +-
 configs/qemu_mips64r6el_malta_defconfig            |  6 +-
 configs/qemu_nios2_10m50_defconfig                 |  6 +-
 configs/qemu_or1k_defconfig                        |  6 +-
 configs/qemu_ppc64_e5500_defconfig                 |  4 +-
 configs/qemu_ppc64_pseries_defconfig               |  6 +-
 configs/qemu_ppc64le_pseries_defconfig             |  6 +-
 configs/qemu_ppc_g3beige_defconfig                 |  6 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |  6 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |  6 +-
 configs/qemu_sh4_r2d_defconfig                     |  6 +-
 configs/qemu_sh4eb_r2d_defconfig                   |  6 +-
 configs/qemu_sparc64_sun4u_defconfig               |  6 +-
 configs/qemu_sparc_ss10_defconfig                  |  6 +-
 configs/qemu_x86_64_defconfig                      |  6 +-
 configs/qemu_x86_defconfig                         |  6 +-
 configs/qemu_xtensa_lx60_defconfig                 |  6 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |  6 +-
 34 files changed, 147 insertions(+), 117 deletions(-)

diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
index 883bd0de6e..a2c0962f85 100644
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
@@ -1,10 +1,30 @@
+From 4ac4324dcdaf237aa34545b3795acb2e5c42d10e Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 1 Feb 2019 11:36:20 +0100
+Subject: [PATCH] arm-versatile-nommu: Linux patch
+
+Originally made by Waldemar Brodkorb <wbx@openadk.org> from LKML.
+
 Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
-From LKML.
+[Gerome: reformated as a Git patch]
+Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
+[Romain: fix Waldemar's authorship in Git patch]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/arm/Kconfig                       | 11 +++++++++++
+ arch/arm/Kconfig.debug                 |  3 ++-
+ arch/arm/include/asm/mach/map.h        |  1 +
+ arch/arm/mach-versatile/Kconfig        |  5 +++--
+ arch/arm/mach-versatile/Makefile.boot  |  3 +++
+ arch/arm/mach-versatile/versatile_dt.c |  4 ++++
+ 6 files changed, 24 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/mach-versatile/Makefile.boot
 
-diff -Nur linux-4.15.13.orig/arch/arm/Kconfig linux-4.15.13/arch/arm/Kconfig
---- linux-4.15.13.orig/arch/arm/Kconfig	2018-03-24 11:02:53.000000000 +0100
-+++ linux-4.15.13/arch/arm/Kconfig	2018-04-01 03:47:33.415078244 +0100
-@@ -355,6 +355,17 @@
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index e8cd55a5b04c..fc2dbff70394 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -353,6 +353,17 @@ config ARM_SINGLE_ARMV7M
  	select SPARSE_IRQ
  	select USE_OF
  
@@ -22,10 +42,11 @@ diff -Nur linux-4.15.13.orig/arch/arm/Kconfig linux-4.15.13/arch/arm/Kconfig
  config ARCH_EBSA110
  	bool "EBSA-110"
  	select ARCH_USES_GETTIMEOFFSET
-diff -Nur linux-4.15.13.orig/arch/arm/Kconfig.debug linux-4.15.13/arch/arm/Kconfig.debug
---- linux-4.15.13.orig/arch/arm/Kconfig.debug	2018-03-24 11:02:53.000000000 +0100
-+++ linux-4.15.13/arch/arm/Kconfig.debug	2018-04-01 03:47:33.416078232 +0100
-@@ -1795,7 +1795,8 @@
+diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
+index f6fcb8a79889..92fc637d3db8 100644
+--- a/arch/arm/Kconfig.debug
++++ b/arch/arm/Kconfig.debug
+@@ -1843,7 +1843,8 @@ config DEBUG_UNCOMPRESS
  config UNCOMPRESS_INCLUDE
  	string
  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
@@ -35,10 +56,11 @@ diff -Nur linux-4.15.13.orig/arch/arm/Kconfig.debug linux-4.15.13/arch/arm/Kconf
  	default "mach/uncompress.h"
  
  config EARLY_PRINTK
-diff -Nur linux-4.15.13.orig/arch/arm/include/asm/mach/map.h linux-4.15.13/arch/arm/include/asm/mach/map.h
---- linux-4.15.13.orig/arch/arm/include/asm/mach/map.h	2018-03-24 11:02:53.000000000 +0100
-+++ linux-4.15.13/arch/arm/include/asm/mach/map.h	2018-04-01 03:47:17.587276119 +0100
-@@ -62,6 +62,7 @@
+diff --git a/arch/arm/include/asm/mach/map.h b/arch/arm/include/asm/mach/map.h
+index 9b7c328fb207..b1fe9c8b5c3e 100644
+--- a/arch/arm/include/asm/mach/map.h
++++ b/arch/arm/include/asm/mach/map.h
+@@ -62,6 +62,7 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
  #else
  #define iotable_init(map,num)	do { } while (0)
  #define vm_reserve_area_early(a,s,c)	do { } while (0)
@@ -46,9 +68,10 @@ diff -Nur linux-4.15.13.orig/arch/arm/include/asm/mach/map.h linux-4.15.13/arch/
  #endif
  
  #endif
-diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/Kconfig linux-4.15.13/arch/arm/mach-versatile/Kconfig
---- linux-4.15.13.orig/arch/arm/mach-versatile/Kconfig	2018-03-24 11:02:53.000000000 +0100
-+++ linux-4.15.13/arch/arm/mach-versatile/Kconfig	2018-04-01 03:47:33.417078219 +0100
+diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
+index f5c275434d6c..06ad999d5978 100644
+--- a/arch/arm/mach-versatile/Kconfig
++++ b/arch/arm/mach-versatile/Kconfig
 @@ -1,7 +1,8 @@
  # SPDX-License-Identifier: GPL-2.0
  config ARCH_VERSATILE
@@ -60,16 +83,19 @@ diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/Kconfig linux-4.15.13/arch/
  	select ARM_AMBA
  	select ARM_TIMER_SP804
  	select ARM_VIC
-diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/Makefile.boot linux-4.15.13/arch/arm/mach-versatile/Makefile.boot
---- linux-4.15.13.orig/arch/arm/mach-versatile/Makefile.boot	1970-01-01 01:00:00.000000000 +0100
-+++ linux-4.15.13/arch/arm/mach-versatile/Makefile.boot	2018-04-01 03:47:25.644175394 +0100
+diff --git a/arch/arm/mach-versatile/Makefile.boot b/arch/arm/mach-versatile/Makefile.boot
+new file mode 100644
+index 000000000000..eacfc3f5c33e
+--- /dev/null
++++ b/arch/arm/mach-versatile/Makefile.boot
 @@ -0,0 +1,3 @@
 +# Empty file waiting for deletion once Makefile.boot isn't needed any more.
 +# Patch waits for application at
 +# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
-diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/versatile_dt.c linux-4.15.13/arch/arm/mach-versatile/versatile_dt.c
---- linux-4.15.13.orig/arch/arm/mach-versatile/versatile_dt.c	2018-03-24 11:02:53.000000000 +0100
-+++ linux-4.15.13/arch/arm/mach-versatile/versatile_dt.c	2018-04-01 03:47:10.913359555 +0100
+diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
+index 3c8d39c12909..8cfa05a37295 100644
+--- a/arch/arm/mach-versatile/versatile_dt.c
++++ b/arch/arm/mach-versatile/versatile_dt.c
 @@ -37,7 +37,11 @@
  #include <asm/mach/map.h>
  
@@ -82,3 +108,6 @@ diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/versatile_dt.c linux-4.15.1
  #define __io_address(n)		((void __iomem __force *)IO_ADDRESS(n))
  
  /*
+-- 
+2.14.5
+
diff --git a/board/qemu/xtensa-lx60/linux-nommu.config b/board/qemu/xtensa-lx60/linux-nommu.config
index 10f7ee125c..8077645eec 100644
--- a/board/qemu/xtensa-lx60/linux-nommu.config
+++ b/board/qemu/xtensa-lx60/linux-nommu.config
@@ -6,6 +6,7 @@ CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
 # CONFIG_XTENSA_VARIANT_MMU is not set
 CONFIG_XTENSA_UNALIGNED_USER=y
 CONFIG_PREEMPT=y
+CONFIG_MEMMAP_CACHEATTR=0x2cccccc7
 CONFIG_KERNEL_LOAD_ADDRESS=0x00003000
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index a7b097ef40..638e18beb7 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 348b91bc96..ce7cb5efe4 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 910c382439..81fb5b6ca4 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -21,13 +21,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 34a50aa8d5..66f198ac5d 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 8f8d0a048a..44fd918ec0 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index d9238b650f..0dd90a97b3 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 3055a0f8cd..95fdfeda6c 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 073a7173fa..7400dafa5f 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index d07bc11003..0ee7a58888 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 55e68b1fdc..075088df82 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 5802393368..b0bf94ce7b 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 93e2a86509..077d836da3 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 99b457a9f8..12502eac6a 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index f2dacbd760..5ddb759bbe 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index d291213db7..bfa32f657e 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,13 +10,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 4740bdee28..2fd855d79b 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,13 +10,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index cff219257a..d7e7c335a3 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,10 +1,10 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 636a0d25b1..3fc53f4186 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -5,12 +5,12 @@ BR2_or1k=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4,19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 7a325a5070..59b8636918 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -6,12 +6,12 @@ BR2_powerpc_e5500=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Linux headers same as the kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index d2d69f1c3c..5f55b246f7 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 9a85f76dd9..8356e4e250 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 451a9b52d8..4b2f3ed2fe 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 38e41a7fa2..d6ebef7561 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 6824afca3c..c71465dd56 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ec4a91c999..e194d7ecf2 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index e7dbd46a2b..f1aad8b64f 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index baa8dbfb59..f4da2bc08d 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 9943781a5b..e027b73ebf 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 12b30bf764..afa2396931 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 985ff32b44..3441ad5cb1 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index a735c991c7..6bf48a2ada 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index f4d6837bc1..5ff9646270 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
