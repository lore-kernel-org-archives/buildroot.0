From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 04 Apr 2016 11:49:22 +0200
Subject: [Buildroot] [PATCH] linux: use zImage by default on ARM
In-Reply-To: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <570238A2.6000006@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 31/03/2016 21:34, Thomas Petazzoni wrote:
> Since quite some time, the kernel and bootloader communities consider
> zImage as the default format for kernel images on ARM, replacing
> uImage. The load address information in uImage is no longer needed,
> since the kernel is position-independent in terms of physical address,
> except on a few old platforms. For most people, using zImage is simply
> better/simpler, so let's switch to zImage as the default image format
> on ARM.
>
> All defconfigs are updated: 46 defconfigs no longer need to select
> explicitly zImage because it's the default, and 16 defconfigs now need
> to explicitly select uImage because that's no longer the default.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Julien Boibessot <julien.boibessot@armadeus.com>

Best Regards,

> ---
>  configs/acmesystems_aria_g25_128mb_defconfig     | 1 -
>  configs/acmesystems_aria_g25_256mb_defconfig     | 1 -
>  configs/acmesystems_arietta_g25_128mb_defconfig  | 1 -
>  configs/acmesystems_arietta_g25_256mb_defconfig  | 1 -
>  configs/altera_socdk_defconfig                   | 1 -
>  configs/altera_sockit_defconfig                  | 1 +
>  configs/armadeus_apf27_defconfig                 | 1 +
>  configs/armadeus_apf28_defconfig                 | 1 +
>  configs/armadeus_apf51_defconfig                 | 1 +
>  configs/armadeus_apf9328_defconfig               | 1 +
>  configs/at91sam9260eknf_defconfig                | 1 -
>  configs/at91sam9g45m10ek_defconfig               | 1 -
>  configs/at91sam9rlek_defconfig                   | 1 -
>  configs/at91sam9x5ek_defconfig                   | 1 -
>  configs/atmel_sama5d2_xplained_mmc_defconfig     | 1 -
>  configs/atmel_sama5d3_xplained_defconfig         | 1 -
>  configs/atmel_sama5d3_xplained_mmc_defconfig     | 1 -
>  configs/atmel_sama5d3xek_defconfig               | 1 -
>  configs/atmel_sama5d4_xplained_defconfig         | 1 -
>  configs/atmel_sama5d4_xplained_mmc_defconfig     | 1 -
>  configs/atmel_sama5d4ek_defconfig                | 1 -
>  configs/beaglebone_defconfig                     | 1 -
>  configs/calao_qil_a9260_defconfig                | 1 -
>  configs/calao_tny_a9g20_lpw_defconfig            | 1 -
>  configs/calao_usb_a9260_defconfig                | 1 -
>  configs/calao_usb_a9263_defconfig                | 1 -
>  configs/calao_usb_a9g20_lpw_defconfig            | 1 -
>  configs/cubieboard2_defconfig                    | 1 -
>  configs/firefly_rk3288_defconfig                 | 1 +
>  configs/firefly_rk3288_demo_defconfig            | 1 +
>  configs/freescale_imx28evk_defconfig             | 1 -
>  configs/freescale_imx31_3stack_defconfig         | 1 -
>  configs/freescale_imx6dlsabreauto_defconfig      | 1 +
>  configs/freescale_imx6dlsabresd_defconfig        | 1 +
>  configs/freescale_imx6qsabreauto_defconfig       | 1 +
>  configs/freescale_imx6qsabresd_defconfig         | 1 +
>  configs/freescale_imx6sololiteevk_defconfig      | 1 +
>  configs/freescale_imx6sxsabresd_defconfig        | 1 -
>  configs/freescale_imx6ulevk_defconfig            | 1 -
>  configs/mx53loco_defconfig                       | 1 -
>  configs/nitrogen6sx_defconfig                    | 1 -
>  configs/nitrogen6x_defconfig                     | 1 -
>  configs/nitrogen7_defconfig                      | 1 -
>  configs/olimex_a20_olinuxino_lime2_defconfig     | 1 -
>  configs/olimex_a20_olinuxino_lime_defconfig      | 1 -
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 1 -
>  configs/olimex_a20_olinuxino_micro_defconfig     | 1 -
>  configs/orangepipc_defconfig                     | 1 -
>  configs/pandaboard_defconfig                     | 1 -
>  configs/qemu_arm_versatile_defconfig             | 1 -
>  configs/qemu_arm_vexpress_defconfig              | 1 -
>  configs/qemu_sh4_r2d_defconfig                   | 1 -
>  configs/qemu_sh4eb_r2d_defconfig                 | 1 -
>  configs/qemu_sparc_ss10_defconfig                | 1 -
>  configs/qmx6_defconfig                           | 1 +
>  configs/raspberrypi2_defconfig                   | 1 -
>  configs/raspberrypi_defconfig                    | 1 -
>  configs/riotboard_defconfig                      | 1 +
>  configs/udoo_quad_defconfig                      | 1 +
>  configs/via_imx6_vab820_defconfig                | 1 +
>  configs/wandboard_defconfig                      | 1 -
>  configs/warpboard_defconfig                      | 1 -
>  linux/Config.in                                  | 1 +
>  63 files changed, 17 insertions(+), 46 deletions(-)
>
> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
> index b619166..fea30fa 100644
> --- a/configs/acmesystems_aria_g25_128mb_defconfig
> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>  
> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
> index 584d8b4..f838a8e 100644
> --- a/configs/acmesystems_aria_g25_256mb_defconfig
> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>  
> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
> index 44cb4e5..061cb8b 100644
> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>  BR2_LINUX_KERNEL_XZ=y
> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
> index 48a8190..2d62837 100644
> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
>  BR2_LINUX_KERNEL_XZ=y
> diff --git a/configs/altera_socdk_defconfig b/configs/altera_socdk_defconfig
> index a7b78ca..f5a2fc7 100644
> --- a/configs/altera_socdk_defconfig
> +++ b/configs/altera_socdk_defconfig
> @@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
>  BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socdk"
>  
> diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
> index 1ababaa..0addbde 100644
> --- a/configs/altera_sockit_defconfig
> +++ b/configs/altera_sockit_defconfig
> @@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
>  BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_sockit"
> diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
> index 04a7cdc..69c6c01 100644
> --- a/configs/armadeus_apf27_defconfig
> +++ b/configs/armadeus_apf27_defconfig
> @@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.6"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.18.config"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
> diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
> index cbaf5b7..965f3c2 100644
> --- a/configs/armadeus_apf28_defconfig
> +++ b/configs/armadeus_apf28_defconfig
> @@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf28/linux-3.12.config"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-apf28dev"
> diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
> index ac01c1d..f70593b 100644
> --- a/configs/armadeus_apf51_defconfig
> +++ b/configs/armadeus_apf51_defconfig
> @@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.6"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-3.12.config"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x90008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-apf51dev"
> diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
> index d1526a5..324a7dc 100644
> --- a/configs/armadeus_apf9328_defconfig
> +++ b/configs/armadeus_apf9328_defconfig
> @@ -27,4 +27,5 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x08008000"
> diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
> index d01cfeb..f0d1d74 100644
> --- a/configs/at91sam9260eknf_defconfig
> +++ b/configs/at91sam9260eknf_defconfig
> @@ -28,4 +28,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/atmel/at91sam9260ek/linux-3.9.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
> index ab6083e..70176e8 100644
> --- a/configs/at91sam9g45m10ek_defconfig
> +++ b/configs/at91sam9g45m10ek_defconfig
> @@ -7,7 +7,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9m10g45ek"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
> index 1980e21..5c6643b 100644
> --- a/configs/at91sam9rlek_defconfig
> +++ b/configs/at91sam9rlek_defconfig
> @@ -7,7 +7,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9rlek"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
> index df7cff6..2160a7e 100644
> --- a/configs/at91sam9x5ek_defconfig
> +++ b/configs/at91sam9x5ek_defconfig
> @@ -7,7 +7,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
> index 74fa2b5..b9eaf5e 100644
> --- a/configs/atmel_sama5d2_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
> @@ -10,7 +10,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
>  BR2_TARGET_AT91BOOTSTRAP3=y
> diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
> index 197b5ac..0ab5799 100644
> --- a/configs/atmel_sama5d3_xplained_defconfig
> +++ b/configs/atmel_sama5d3_xplained_defconfig
> @@ -8,7 +8,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
> index 2fb1fa4..6d99038 100644
> --- a/configs/atmel_sama5d3_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
> @@ -8,7 +8,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
>  BR2_TARGET_AT91BOOTSTRAP3=y
> diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
> index 193fa13..079378c 100644
> --- a/configs/atmel_sama5d3xek_defconfig
> +++ b/configs/atmel_sama5d3xek_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d31ek_pda4 sama5d31ek_pda7 sama5d31ek_revc sama5d31ek_revc_pda4 sama5d31ek_revc_pda7 sama5d33ek sama5d33ek_pda4 sama5d33ek_pda7 sama5d33ek_revc sama5d33ek_revc_pda4 sama5d33ek_revc_pda7 sama5d34ek sama5d34ek_pda4 sama5d34ek_pda7 sama5d34ek_revc sama5d34ek_revc_pda4 sama5d34ek_revc_pda7 sama5d35ek sama5d35ek_revc sama5d36ek sama5d36ek_pda4 sama5d36ek_pda7 sama5d36ek_revc sama5d36ek_revc_pda4 sama5d36ek_revc_pda7"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
> index 7efc119..48ef699 100644
> --- a/configs/atmel_sama5d4_xplained_defconfig
> +++ b/configs/atmel_sama5d4_xplained_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
> index 3533df0..7dca15b 100644
> --- a/configs/atmel_sama5d4_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
> @@ -9,7 +9,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
>  BR2_TARGET_AT91BOOTSTRAP3=y
> diff --git a/configs/atmel_sama5d4ek_defconfig b/configs/atmel_sama5d4ek_defconfig
> index 92b0840..31f5a51 100644
> --- a/configs/atmel_sama5d4ek_defconfig
> +++ b/configs/atmel_sama5d4ek_defconfig
> @@ -10,7 +10,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4ek"
>  BR2_TARGET_ROOTFS_UBIFS=y
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index c3f5276..839c1a9 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -35,6 +35,5 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
>  BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux/"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
> diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
> index 271a034..e59363a 100644
> --- a/configs/calao_qil_a9260_defconfig
> +++ b/configs/calao_qil_a9260_defconfig
> @@ -18,4 +18,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/qil-a9260/linux-3.4.7.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
> index 1b38092..0f5d723 100644
> --- a/configs/calao_tny_a9g20_lpw_defconfig
> +++ b/configs/calao_tny_a9g20_lpw_defconfig
> @@ -26,6 +26,5 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.4"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/tny-a9g20-lpw/linux-3.9.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="tny_a9g20"
> diff --git a/configs/calao_usb_a9260_defconfig b/configs/calao_usb_a9260_defconfig
> index fa1c51e..d8bfd0d 100644
> --- a/configs/calao_usb_a9260_defconfig
> +++ b/configs/calao_usb_a9260_defconfig
> @@ -16,4 +16,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.10"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9260/linux-3.7.4.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
> index ab8f2d0..c87e960 100644
> --- a/configs/calao_usb_a9263_defconfig
> +++ b/configs/calao_usb_a9263_defconfig
> @@ -15,4 +15,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.10"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9263/linux-3.4.4.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
> index 7cfa34c..956d007 100644
> --- a/configs/calao_usb_a9g20_lpw_defconfig
> +++ b/configs/calao_usb_a9g20_lpw_defconfig
> @@ -15,4 +15,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.10"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9g20-lpw/linux-3.4.4.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
> index a68c507..a3b1b85 100644
> --- a/configs/cubieboard2_defconfig
> +++ b/configs/cubieboard2_defconfig
> @@ -12,7 +12,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.3"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
> index 0affd67..017a7ee 100644
> --- a/configs/firefly_rk3288_defconfig
> +++ b/configs/firefly_rk3288_defconfig
> @@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
>  BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
> diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
> index 59bbe77..7dadc6b 100644
> --- a/configs/firefly_rk3288_demo_defconfig
> +++ b/configs/firefly_rk3288_demo_defconfig
> @@ -13,6 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
>  BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
> diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
> index 8cb31dc..9a430f7 100644
> --- a/configs/freescale_imx28evk_defconfig
> +++ b/configs/freescale_imx28evk_defconfig
> @@ -13,7 +13,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="mxs"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
>  
> diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
> index ead520a..bf1afad 100644
> --- a/configs/freescale_imx31_3stack_defconfig
> +++ b/configs/freescale_imx31_3stack_defconfig
> @@ -16,6 +16,5 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.10"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_TARGET_ROOTFS_CPIO_GZIP=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
> index a11bb75..699e684 100644
> --- a/configs/freescale_imx6dlsabreauto_defconfig
> +++ b/configs/freescale_imx6dlsabreauto_defconfig
> @@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
> diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
> index 49e37e6..b6d31e0 100644
> --- a/configs/freescale_imx6dlsabresd_defconfig
> +++ b/configs/freescale_imx6dlsabresd_defconfig
> @@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
> diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
> index c721f4a..23ca2dc 100644
> --- a/configs/freescale_imx6qsabreauto_defconfig
> +++ b/configs/freescale_imx6qsabreauto_defconfig
> @@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
> diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
> index 558ae5a..bf446a3 100644
> --- a/configs/freescale_imx6qsabresd_defconfig
> +++ b/configs/freescale_imx6qsabresd_defconfig
> @@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
> diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
> index 28d4e46..72a1e2d 100644
> --- a/configs/freescale_imx6sololiteevk_defconfig
> +++ b/configs/freescale_imx6sololiteevk_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
> diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
> index 4a97021..06ab10a 100644
> --- a/configs/freescale_imx6sxsabresd_defconfig
> +++ b/configs/freescale_imx6sxsabresd_defconfig
> @@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
>  
> diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
> index 9d63a75..b8a1f86 100644
> --- a/configs/freescale_imx6ulevk_defconfig
> +++ b/configs/freescale_imx6ulevk_defconfig
> @@ -14,7 +14,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
>  
> diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
> index bc09bd2..3cb1b74 100644
> --- a/configs/mx53loco_defconfig
> +++ b/configs/mx53loco_defconfig
> @@ -24,4 +24,3 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b3912bb8a4caf3ec50909135e88af959982c43ca"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx5"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index 161130e..9d25317 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  # Last version of branch boundary-imx_3.14.52_1.1.0_ga
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="boundary"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx"
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index be8877f..866b1f8 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  # Last version of branch boundary-imx_3.14.52_1.1.0_ga
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="boundary"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index 3761845..9d54d78 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  # Last version of branch boundary-imx_3.14.52_1.1.0_ga
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="boundary"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-nitrogen7"
> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> index 1e3fa4a..57dda72 100644
> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -13,7 +13,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.4"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index b212767..bfa95c4 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -21,7 +21,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
>  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> index 737c690..42c8a7c 100644
> --- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> @@ -21,7 +21,6 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
>  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>  BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
>  # sunxi packages
> diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
> index 3574a75..17fe6cf 100644
> --- a/configs/olimex_a20_olinuxino_micro_defconfig
> +++ b/configs/olimex_a20_olinuxino_micro_defconfig
> @@ -20,7 +20,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.2"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
> index 69db410..cb04d74 100644
> --- a/configs/orangepipc_defconfig
> +++ b/configs/orangepipc_defconfig
> @@ -10,7 +10,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
>  BR2_TARGET_ROOTFS_EXT2=y
> diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
> index 973d41d..49747e0 100644
> --- a/configs/pandaboard_defconfig
> +++ b/configs/pandaboard_defconfig
> @@ -11,7 +11,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index b62286d..55a03e4 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -19,6 +19,5 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.5.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index 77b4750..23fdde8 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -21,6 +21,5 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index c7f4ec1..57d5578 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -19,4 +19,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.5.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index 06215c9..d356434 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -18,4 +18,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.5.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> index 08cbca3..47e8dd5 100644
> --- a/configs/qemu_sparc_ss10_defconfig
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -18,4 +18,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.5.config"
> -BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
> index 49c39bc..cb80cad 100644
> --- a/configs/qmx6_defconfig
> +++ b/configs/qmx6_defconfig
> @@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/imx6_kernel_3.14.
>  # Last version of branch cgt_qmx6_3.14.28_1.0.0
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="105820d6bd251deb49c3dd3f71fa0d76adce97c7"
>  BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index ce41ee3..1d82f60 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -15,7 +15,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  
>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 3b3cc50..615c052 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -14,7 +14,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
> index 73677c7..d486e1e 100644
> --- a/configs/riotboard_defconfig
> +++ b/configs/riotboard_defconfig
> @@ -27,6 +27,7 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.6"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
> diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
> index 6cb05be..5344446 100644
> --- a/configs/udoo_quad_defconfig
> +++ b/configs/udoo_quad_defconfig
> @@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/UDOOboard/Kernel_Unico"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8a6eb060a0d968048f88d5a94510fc6db2c37939"
>  BR2_LINUX_KERNEL_PATCH="https://github.com/torvalds/linux/commit/455bd4c430b0c0a361f38e8658a0d6cb469942b5.patch https://github.com/torvalds/linux/commit/418df63adac56841ef6b0f1fcf435bc64d4ed177.patch"
>  BR2_LINUX_KERNEL_DEFCONFIG="UDOO"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
> diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
> index b813dec..a86c513 100644
> --- a/configs/via_imx6_vab820_defconfig
> +++ b/configs/via_imx6_vab820_defconfig
> @@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-kernel-bsp.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.10.17_2.0.6"
>  BR2_LINUX_KERNEL_DEFCONFIG="via_vab820"
> +BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-vab820"
> diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
> index e7ec9b3..cf71eb2 100644
> --- a/configs/wandboard_defconfig
> +++ b/configs/wandboard_defconfig
> @@ -26,7 +26,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/wandboard-org/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e2213f9a98dd7413ee5a9ca40cf60e8cb8292f4a"
>  BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
> index 4cfeb28..8bc3117 100644
> --- a/configs/warpboard_defconfig
> +++ b/configs/warpboard_defconfig
> @@ -20,7 +20,6 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/Freescale/linux-fslc/tarball/38ec11d/linux-fslc-38ec11d.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> -BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
>  
> diff --git a/linux/Config.in b/linux/Config.in
> index 93968cd..49b6994 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -173,6 +173,7 @@ config BR2_LINUX_KERNEL_UBOOT_IMAGE
>  
>  choice
>  	prompt "Kernel binary format"
> +	default BR2_LINUX_KERNEL_ZIMAGE if BR2_arm || BR2_armeb
>  
>  config BR2_LINUX_KERNEL_UIMAGE
>  	bool "uImage"
