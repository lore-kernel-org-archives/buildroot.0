From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 01:09:34 +0000
Subject: [Buildroot] [PATCH 1/1] configs/qemu_*: bump kernel version to
 5.4.88
In-Reply-To: <20210110203910.24698-1-geoffrey.legourrierec@gmail.com>
References: <20210110203910.24698-1-geoffrey.legourrierec@gmail.com>
Message-ID: <CACPK8Xe5gCZpxEs0VROgax9KV19s42JWo5mR_ShTJGjUheCdng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Jan 2021 at 20:39, Geoffrey Le Gourri?rec
<geoffrey.legourrierec@gmail.com> wrote:
>
> Bump QEMU defconfigs to latest longterm kernel 5.4.88.
>
> Please note that QEMU boards not based on 5.4.y were ignored:
> - qemu_csky810_virt_defconfig
> - qemu_csky807_virt_defconfig
> - qemu_csky610_virt_defconfig
> - qemu_csky860_virt_defconfig
>
> Tests were carried out on all QEMU boards using Gitlab [1] (commit
> message was slightly different, but the patch is identical)
>
> Additional actions needed were:
> - board/qemu/sh4-r2d: Remove one of the two kernel patches [2] provided
>   by Alan Modra fixing rodata alignment, carried here by Romain Naour [3]
>   to fix an issue preventing kernel from booting with binutils 2.23.
>   Patch is present in upstream Linux now.
>
> [1] https://gitlab.com/clumsyape/buildroot/-/pipelines/239483891
> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> [3] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
>
> Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>

Thanks for doing this. For the powerpc boards in particular:

Reviewed-by: Joel Stanley <joel@jms.id.au>

Is there a plan to move boards up to v5.10 now that is the latest LTS?

Cheers,

Joel

> ---
>  ...02-include-asm-generic-vmlinux.lds.h.patch | 32 -------------------
>  ...02-include-asm-generic-vmlinux.lds.h.patch | 27 ----------------
>  configs/qemu_aarch64_virt_defconfig           |  2 +-
>  configs/qemu_arm_versatile_defconfig          |  2 +-
>  configs/qemu_arm_versatile_nommu_defconfig    |  2 +-
>  configs/qemu_arm_vexpress_defconfig           |  2 +-
>  configs/qemu_arm_vexpress_tz_defconfig        |  2 +-
>  configs/qemu_m68k_mcf5208_defconfig           |  2 +-
>  configs/qemu_m68k_q800_defconfig              |  2 +-
>  configs/qemu_microblazebe_mmu_defconfig       |  2 +-
>  configs/qemu_microblazeel_mmu_defconfig       |  2 +-
>  configs/qemu_mips32r2_malta_defconfig         |  2 +-
>  configs/qemu_mips32r2el_malta_defconfig       |  2 +-
>  configs/qemu_mips32r6_malta_defconfig         |  2 +-
>  configs/qemu_mips32r6el_malta_defconfig       |  2 +-
>  configs/qemu_mips64_malta_defconfig           |  2 +-
>  configs/qemu_mips64el_malta_defconfig         |  2 +-
>  configs/qemu_mips64r6_malta_defconfig         |  2 +-
>  configs/qemu_mips64r6el_malta_defconfig       |  2 +-
>  configs/qemu_nios2_10m50_defconfig            |  2 +-
>  configs/qemu_or1k_defconfig                   |  2 +-
>  configs/qemu_ppc64_e5500_defconfig            |  2 +-
>  configs/qemu_ppc64_pseries_defconfig          |  2 +-
>  configs/qemu_ppc64le_pseries_defconfig        |  2 +-
>  configs/qemu_ppc_g3beige_defconfig            |  2 +-
>  configs/qemu_ppc_mac99_defconfig              |  2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig          |  2 +-
>  configs/qemu_ppc_virtex_ml507_defconfig       |  2 +-
>  configs/qemu_riscv32_virt_defconfig           |  2 +-
>  configs/qemu_riscv64_virt_defconfig           |  2 +-
>  configs/qemu_sh4_r2d_defconfig                |  2 +-
>  configs/qemu_sh4eb_r2d_defconfig              |  2 +-
>  configs/qemu_sparc64_sun4u_defconfig          |  2 +-
>  configs/qemu_sparc_ss10_defconfig             |  2 +-
>  configs/qemu_x86_64_defconfig                 |  2 +-
>  configs/qemu_x86_defconfig                    |  2 +-
>  configs/qemu_xtensa_lx60_defconfig            |  2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig      |  2 +-
>  38 files changed, 36 insertions(+), 95 deletions(-)
>  delete mode 100644 board/qemu/sh4-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
>  delete mode 100644 board/qemu/sh4eb-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
>
> diff --git a/board/qemu/sh4-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch b/board/qemu/sh4-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
> deleted file mode 100644
> index 1faffea63e..0000000000
> --- a/board/qemu/sh4-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 7f92adbba385a4e512abfd6633ac0f9f0cdf91f8 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Sat, 21 Dec 2019 11:54:07 +0100
> -Subject: [PATCH] include/asm-generic: vmlinux.lds.h
> -
> -Building the kernel using a toolchain built with Binutils 2.33.1 prevent
> -booting a sh4 system under Qemu.
> -Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
> -
> -[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> -[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - include/asm-generic/vmlinux.lds.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> -index d7701d466b60..1aa33597e91e 100644
> ---- a/include/asm-generic/vmlinux.lds.h
> -+++ b/include/asm-generic/vmlinux.lds.h
> -@@ -306,6 +306,7 @@
> -  */
> - #ifndef RO_AFTER_INIT_DATA
> - #define RO_AFTER_INIT_DATA                                            \
> -+      . = ALIGN(8);                                                   \
> -       __start_ro_after_init = .;                                      \
> -       *(.data..ro_after_init)                                         \
> -       __end_ro_after_init = .;
> ---
> -2.24.1
> -
> diff --git a/board/qemu/sh4eb-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch b/board/qemu/sh4eb-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
> deleted file mode 100644
> index 445b71f40d..0000000000
> --- a/board/qemu/sh4eb-r2d/patches/linux/0002-include-asm-generic-vmlinux.lds.h.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 7f92adbba385a4e512abfd6633ac0f9f0cdf91f8 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Sat, 21 Dec 2019 11:54:07 +0100
> -Subject: [PATCH] include/asm-generic: vmlinux.lds.h
> -
> -https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - include/asm-generic/vmlinux.lds.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> -index d7701d466b60..1aa33597e91e 100644
> ---- a/include/asm-generic/vmlinux.lds.h
> -+++ b/include/asm-generic/vmlinux.lds.h
> -@@ -306,6 +306,7 @@
> -  */
> - #ifndef RO_AFTER_INIT_DATA
> - #define RO_AFTER_INIT_DATA                                            \
> -+      . = ALIGN(8);                                                   \
> -       __start_ro_after_init = .;                                      \
> -       *(.data..ro_after_init)                                         \
> -       __end_ro_after_init = .;
> ---
> -2.24.1
> -
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 67dccc604a..a0ea422e84 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 6dc212397c..e8c602fd07 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
> index 4108e706ca..1deac2d468 100644
> --- a/configs/qemu_arm_versatile_nommu_defconfig
> +++ b/configs/qemu_arm_versatile_nommu_defconfig
> @@ -31,7 +31,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index a106530ec8..fc0a14e3ee 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -25,7 +25,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 7f5a06f0ab..f554e7f0ab 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index 0806dc0ac8..2dcb0d4ec3 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index b54d502be9..5f1260590a 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index a989e555bf..b5c110bced 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index ccd679fd92..5cc2056eee 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>  BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index f56e95b146..35fc897126 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 9548a82186..4743c1c675 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index 935fc4c2a8..6e2b651c67 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index dfaf11afb8..d1642f8b69 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index 4a0531947a..a1fca695c1 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.35"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index 06e80b3391..6a3f5ec64a 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 035c664fe3..07bf4d4af9 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index 26e945853a..6408a70d27 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
> index cfb83ff66e..007c21971b 100644
> --- a/configs/qemu_nios2_10m50_defconfig
> +++ b/configs/qemu_nios2_10m50_defconfig
> @@ -1,7 +1,7 @@
>  BR2_nios2=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="10m50"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index 4ccb58ef10..f27e6e2aa1 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 1e030f5c77..0dae31ea7e 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 91d0c528fc..03bd672fab 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
>
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index effc3cf8fd..d7a7947911 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>  BR2_LINUX_KERNEL_VMLINUX=y
>
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index c04260cf94..b468281976 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index 33e819426e..cfef5de26c 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index 9ec94a4839..8776deeeea 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
> index 6425e1a8b2..0d1ab8e5d7 100644
> --- a/configs/qemu_ppc_virtex_ml507_defconfig
> +++ b/configs/qemu_ppc_virtex_ml507_defconfig
> @@ -19,7 +19,7 @@ BR2_POWERPC_SOFT_FLOAT=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index 5447342dd9..079da1604b 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.61"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
>  BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>  BR2_LINUX_KERNEL_IMAGE=y
>
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index 01633d5ad8..f7de7d1b27 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_IMAGE=y
>
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index a465547c89..75e639c814 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index 24a9f21690..68d7d73c2b 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>  BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 254f2d9247..6ad2605aac 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index 1fdebfced2..8fb9c499de 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
>
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index 60b446861a..b8140c3e39 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index ef38d98dd3..71bcca87b5 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index 79ae11d8fb..26b7b5da66 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -21,7 +21,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index 09a3888689..9fa81b4d63 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -25,7 +25,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> --
> 2.17.1
>
