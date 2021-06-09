From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Jun 2021 17:38:10 +1000
Subject: [Buildroot] [PATCH 1/3] beaglev: update to new starfive linux
 and u-boot
In-Reply-To: <20210609063834.2193864-1-drew@beagleboard.org>
References: <20210609063834.2193864-1-drew@beagleboard.org>
Message-ID: <CAKmqyKMJQKarWEq_Z7D+ctP4GbjcKh+gcCm0TXEZxshtXkBtLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 9, 2021 at 5:15 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> Update the commit id for u-boot to include fixes from the starfive-tech
> u-boot repository:
>
> 494e5ef7b807 jh7100: Enable full 2M L2 cache
> 4571f5a4e1e4 vic7100: enable cache ways (L2 cache)
> abb06422a5cd Remove fdt_high and initrd_high for Starfive
> 93099a61c7b0 starfive: beaglev: Disable SIFIVE_CLINT and enable RISCV_TIMER
> bfb5abac3d1f Revert "riscv: Enable the SiFive CLINT block driver in S-Mode(VIC7100 ONLY)"
> 7b70e1d44ba9 defconfig: enable cache_wayenable for better performance
> 7c585978616b configs: earlycon=sbi is deprecated
>
> The commit abb06422a5cd ("Remove fdt_high and initrd_high for Starfive")
> has removed the need for buildroot to patch the fdt_addr_r address.
>
> Update linux from commit in the old 5.10 branch that Fedora image was
> using to head of esmil_starlight branch [1] which is currently based
> on 5.13-rc5 and represents the best kernel for this board [2].
>
> In addition, the updated kernel now has jh7100-beaglev-starlight.dtb so
> buildroot no longer needs to copy the dtb from u-boot.
>
> [1] https://github.com/starfive-tech/linux/tree/esmil_starlight
> [2] https://github.com/starfive-tech/linux/issues/26
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  board/beaglev/extlinux.conf                   |  2 +-
>  ...s-starfive-vic7100-adjust-fdt_addr_r.patch | 39 -------------------
>  board/beaglev/post-build.sh                   |  6 ---
>  configs/beaglev_defconfig                     | 15 +++----
>  4 files changed, 9 insertions(+), 53 deletions(-)
>  delete mode 100644 board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
>
> diff --git a/board/beaglev/extlinux.conf b/board/beaglev/extlinux.conf
> index c5444d094c82..9daf6a758142 100644
> --- a/board/beaglev/extlinux.conf
> +++ b/board/beaglev/extlinux.conf
> @@ -1,4 +1,4 @@
>  label linux
>    kernel /boot/Image
> -  devicetree /boot/starfive_vic7100_beagle_v.dtb
> +  devicetree /boot/jh7100-beaglev-starlight.dtb
>    append console=ttyS0,115200 earlyprintk root=PARTUUID=0fef845a-c6e1-45bc-82f7-002fa720f958 rootwait
> diff --git a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> deleted file mode 100644
> index 74d70f2721ad..000000000000
> --- a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 2c4c813940c577590f3352cef0c49a8def17905d Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Wed, 28 Apr 2021 22:58:45 +0200
> -Subject: [PATCH] include/configs/starfive-vic7100: adjust fdt_addr_r
> -
> -The default fdt_addr_r of 0x88000000 doesn't work, the kernel never
> -boots. Using 0x90000000 works fine.
> -
> -Since it would overlap with the kernel_comp_addr_r area, this one is
> -moved 16 MB further, at 0x91000000.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - include/configs/starfive-vic7100.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/include/configs/starfive-vic7100.h b/include/configs/starfive-vic7100.h
> -index 8c5915a73c..7150a23873 100644
> ---- a/include/configs/starfive-vic7100.h
> -+++ b/include/configs/starfive-vic7100.h
> -@@ -111,13 +111,13 @@
> -       "fdt_high=0xffffffffffffffff\0" \
> -       "initrd_high=0xffffffffffffffff\0" \
> -       "kernel_addr_r=0x84000000\0" \
> --      "fdt_addr_r=0x88000000\0" \
> -+      "fdt_addr_r=0x90000000\0" \
> -       "scriptaddr=0x88100000\0" \
> -       "script_offset_f=0x1fff000\0" \
> -       "script_size_f=0x1000\0" \
> -       "pxefile_addr_r=0x88200000\0" \
> -       "ramdisk_addr_r=0x88300000\0" \
> --      "kernel_comp_addr_r=0x90000000\0" \
> -+      "kernel_comp_addr_r=0x91000000\0" \
> -       "kernel_comp_size=0x10000000\0" \
> -       "type_guid_gpt_loader1=" TYPE_GUID_LOADER1 "\0" \
> -       "type_guid_gpt_loader2=" TYPE_GUID_LOADER2 "\0" \
> ---
> -2.30.2
> -
> diff --git a/board/beaglev/post-build.sh b/board/beaglev/post-build.sh
> index b19b9bf6d06b..fe61fd33cc84 100755
> --- a/board/beaglev/post-build.sh
> +++ b/board/beaglev/post-build.sh
> @@ -1,12 +1,6 @@
>  #!/bin/sh
>  BOARD_DIR=$(dirname $0)
>
> -# The DTB to use is provided within the U-Boot source tree, so we grab
> -# it from there, and install it to TARGET_DIR/boot/.
> -eval $(make -C ${CONFIG_DIR} --no-print-directory QUOTED_VARS=YES VARS=UBOOT_DIR printvars)
> -install -D -m0644 ${UBOOT_DIR}/arch/riscv/dts/starfive_vic7100_beagle_v.dtb \
> -       ${TARGET_DIR}/boot/starfive_vic7100_beagle_v.dtb
> -
>  # Bring the extlinux.conf file in.
>  install -D -m 0644 ${BOARD_DIR}/extlinux.conf \
>         ${TARGET_DIR}/boot/extlinux/extlinux.conf
> diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
> index bbb69ca26814..895902a11a7c 100644
> --- a/configs/beaglev_defconfig
> +++ b/configs/beaglev_defconfig
> @@ -4,16 +4,17 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
>  BR2_RISCV_ISA_CUSTOM_RVF=y
>  BR2_RISCV_ISA_CUSTOM_RVD=y
>  BR2_RISCV_ISA_CUSTOM_RVC=y
> -BR2_GLOBAL_PATCH_DIR="board/beaglev/patches/"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# HEAD of the Fedora branch
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,710cf052d6abda73584481d920b4b6befc7240ea)/linux-710cf052d6abda73584481d920b4b6befc7240ea.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="starfive_vic7100_evb_sd_net"
> +# HEAD of the 5.13 branch (esmil_starlight)
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,83dba1f25dfc118cacec991c31a7a4cfa7405c89)/linux-83dba1f25dfc118cacec991c31a7a4cfa7405c89.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="starlight"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-beaglev-starlight"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> @@ -31,8 +32,8 @@ BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -# HEAD of the Fedora branch
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,3f3ac01a29ad1cd5fa519d86f81daead2447f1d4)/uboot-3f3ac01a29ad1cd5fa519d86f81daead2447f1d4.tar.gz"
> +# HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,494e5ef7b8071d0b2fba50616d97771e44cbcb7c)/uboot-494e5ef7b8071d0b2fba50616d97771e44cbcb7c.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_JH71XX_TOOLS=y
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
