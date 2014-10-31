From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 16:18:48 +0100
Subject: [Buildroot] [git commit] configs/qemu: update to the latest
	kernel/headers version
Message-ID: <20141031152829.DF700B25DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be949527709843de01701df1d2726ba711821444
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop the sparc memset patch, it's upstream as of 3.17.2.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../linux/linux-0001-sparc-memset-fix.patch        |   50 --------------------
 configs/qemu_aarch64_virt_defconfig                |    4 +-
 configs/qemu_arm_nuri_defconfig                    |    4 +-
 configs/qemu_arm_versatile_defconfig               |    4 +-
 configs/qemu_arm_vexpress_defconfig                |    4 +-
 configs/qemu_microblazebe_mmu_defconfig            |    4 +-
 configs/qemu_microblazeel_mmu_defconfig            |    4 +-
 configs/qemu_mips64_malta_defconfig                |    4 +-
 configs/qemu_mips64el_malta_defconfig              |    4 +-
 configs/qemu_mips_malta_defconfig                  |    4 +-
 configs/qemu_mipsel_malta_defconfig                |    4 +-
 configs/qemu_ppc64_pseries_defconfig               |    4 +-
 configs/qemu_ppc_g3beige_defconfig                 |    4 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |    4 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |    4 +-
 configs/qemu_sh4_r2d_defconfig                     |    4 +-
 configs/qemu_sparc_ss10_defconfig                  |    4 +-
 configs/qemu_x86_64_defconfig                      |    4 +-
 configs/qemu_x86_defconfig                         |    4 +-
 configs/qemu_xtensa_lx60_defconfig                 |    4 +-
 20 files changed, 38 insertions(+), 88 deletions(-)

diff --git a/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch b/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch
deleted file mode 100644
index 022c87b..0000000
--- a/board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-This makes memset follow the standard (instead of returning 0 on success). This
-is needed when certain versions of gcc optimizes around memset calls and assume
-that the address argument is preserved in %o0.
-
-Signed-off-by: Andreas Larsson <andreas@gaisler.com>
-
-diff -Nur linux-3.16.2.orig/arch/sparc/lib/memset.S linux-3.16.2/arch/sparc/lib/memset.S
---- linux-3.16.2.orig/arch/sparc/lib/memset.S	2014-09-06 01:37:11.000000000 +0200
-+++ linux-3.16.2/arch/sparc/lib/memset.S	2014-09-18 09:53:49.563047773 +0200
-@@ -65,6 +65,8 @@
- 	.globl	__memset_start, __memset_end
- __memset_start:
- memset:
-+	mov	%o0, %g1
-+	mov	1, %g4
- 	and	%o1, 0xff, %g3
- 	sll	%g3, 8, %g2
- 	or	%g3, %g2, %g3
-@@ -89,6 +91,7 @@
- 	 sub	%o0, %o2, %o0
- 
- __bzero:
-+	clr	%g4
- 	mov	%g0, %g3
- 1:
- 	cmp	%o1, 7
-@@ -151,8 +154,8 @@
- 	bne,a	8f
- 	 EX(stb	%g3, [%o0], and %o1, 1)
- 8:
--	retl
--	 clr	%o0
-+	b	0f
-+	 nop
- 7:
- 	be	13b
- 	 orcc	%o1, 0, %g0
-@@ -164,6 +167,12 @@
- 	bne	8b
- 	 EX(stb	%g3, [%o0 - 1], add %o1, 1)
- 0:
-+	andcc	%g4, 1, %g0
-+	be	5f
-+	 nop
-+	retl
-+	 mov	%g1, %o0
-+5:
- 	retl
- 	 clr	%o0
- __memset_end:
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index beb9a86..6873c04 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.17.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 0ce98e0..a2dd38c 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.58"
+BR2_DEFAULT_KERNEL_VERSION="3.10.59"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.58"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.59"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 70cb761..dbc2a16 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.17.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 47e66b5..e90cc74 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -15,12 +15,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index c6e706e..a8a3d57 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.17.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index be12126..ab9ebb3 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.17.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2726a91..9d6f746 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 130a246..959da94 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index a607dac..56b8cf2 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 22a1cb6..2ab05e4 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index dcb0ec4..7a8e20f 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index f99b7c1..da9bdce 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.17.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index d556f0a..587c87a 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index b6cea31..8b2f1ed 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Use soft float
@@ -17,7 +17,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index f835c40..b998a3c 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -16,13 +16,13 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.17.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 4a8fe9e..c1c3ecb 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-3.17.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index b633d7d..29da150 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.17.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 70657ed..fef2cc1 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.17.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 4ad47b5..31139f0 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,13 +16,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.1"
+BR2_DEFAULT_KERNEL_VERSION="3.17.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.17.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
