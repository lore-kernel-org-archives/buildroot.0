From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 11 Nov 2019 16:30:25 +0100
Subject: [Buildroot] [PATCH v5 2/2] configs/freescale_imx7ulpevk: new
 defconfig
In-Reply-To: <20191111101452.32032-2-fabrice.goucem@nxp.com>
References: <20191110230831.11479-1-fabrice.goucem@nxp.com>
 <20191111101452.32032-1-fabrice.goucem@nxp.com>
 <20191111101452.32032-2-fabrice.goucem@nxp.com>
Message-ID: <CAKcgs2zqnx+7LYK4bJH4AOC=TSXgrzUkLOQGBuPWVcTtpFzNJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice, all,

Le lun. 11 nov. 2019 ? 11:15, Fabrice Goucem <fabrice.goucem@nxp.com> a ?crit :
>
> Add basic support for NXP's i.MX7 ULP EVK board:
>
> https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-7ulp-applications-processor:MCIMX7ULP-EVK
>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
>
> ---
> Changes v4 -> v5:
>   - Changed all occurences of m4-firmware to m4-demos (suggested by
>     Gilles Talis)
>   - Changed wrong flag name in post-image.sh (indirectly suggested by
>     Gilles Talis)
>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
> ---
>  .gitlab-ci.yml                         |  1 +
>  DEVELOPERS                             |  2 +
>  board/freescale/imx7ulpevk/readme.txt  | 76 ++++++++++++++++++++++++++
>  configs/freescale_imx7ulpevk_defconfig | 28 ++++++++++
>  package/freescale-imx/Config.in        |  8 ++-
>  5 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 100644 board/freescale/imx7ulpevk/readme.txt
>  create mode 100644 configs/freescale_imx7ulpevk_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1d71257a20..74ee5b732e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -177,6 +177,7 @@ freescale_imx6qsabreauto_defconfig: { extends: .defconfig }
>  freescale_imx6qsabresd_defconfig: { extends: .defconfig }
>  freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
>  freescale_imx7dsabresd_defconfig: { extends: .defconfig }
> +freescale_imx7ulpevk_defconfig: { extends: .defconfig }
>  freescale_imx8mmevk_defconfig: { extends: .defconfig }
>  freescale_imx8mqevk_defconfig: { extends: .defconfig }
>  freescale_imx8qxpmek_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b2519ca2c2..ccd331e364 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -875,6 +875,8 @@ F:  package/tinymembench/
>  F:     package/whois/
>
>  N:     Fabrice Goucem <fabrice.goucem@nxp.com>
> +F:     board/freescale/imx7ulpevk/
> +F:     configs/freescale_imx7ulpevk_defconfig
>  F:     package/freescale-imx/imx-m4-demos/
>
>  N:     Falco Hyfing <hyfinglists@gmail.com>
> diff --git a/board/freescale/imx7ulpevk/readme.txt b/board/freescale/imx7ulpevk/readme.txt
> new file mode 100644
> index 0000000000..c18f901010
> --- /dev/null
> +++ b/board/freescale/imx7ulpevk/readme.txt
> @@ -0,0 +1,76 @@
> +****************************
> +Freescale i.MX7ULP EVK board
> +****************************
> +
> +This file documents the Buildroot support for the Freescale i.MX7ULP EVK board.
> +
> +Build
> +=====
> +
> +First, configure Buildroot for your i.MX7ULP EVK board:
> +
> +  make freescale_imx7ulpevk_defconfig
> +
> +Build all components:
> +
> +  make
> +
> +You will find in output/images/ the following files:
> +  - boot.vfat
> +  - imx7ulp-evkb.dtb
> +  - m4_imx7ulp_erpc_matrix_multiply_rpmsg_rtos_imxcm4.img
> +  - m4_imx7ulp_m4_demo.img
> +  - m4_imx7ulp_rpmsg_lite_pingpong_rtos.img
> +  - m4_imx7ulp_rpmsg_lite_str_echo_rtos.img
> +  - m4_imx7ulp_wireless_uart_bridge.img
> +  - rootfs.ext2
> +  - rootfs.ext4
> +  - rootfs.tar
> +  - sdcard.img
> +  - u-boot.imx
> +  - zImage
> +
> +Create a bootable SD card
> +=========================
> +
> +To determine the device associated to the SD card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be dumped on a SD card. Launch the following
> +command as root:
> +
> +  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
> +
> +*** WARNING! This will destroy all the card content. Use with care! ***
> +
> +For details about the medium image layout, see the definition in
> +board/freescale/common/imx/genimage.cfg.template.
> +
> +Flash QSPI with Cortex-M4 demo
> +==============================
> +
> +Cortex-M4 demo can be flashed onto QSPI NOR memory.
> +To do so, stop at u-boot prompt and run the following commands:
> +
> +  sf probe
> +  sf erase 0 30000
> +  fatload mmc 0 62000000 m4_imx7ulp_m4_demo.img
> +  sf write 62000000 0 30000
> +
> +Boot the i.MX7ULP EVK board
> +===========================
> +
> +To boot your newly created system (refer to the i.MX 7ULP EVK Quick Start Guide [1] for guidance):
> +- insert the SD card in the micro SD slot of the board;
> +- put a micro USB cable into the Debug USB Port and connect using a terminal
> +  emulator at 115200 bps, 8n1;
> +- power on the board.
> +
> +Enjoy!
> +
> +References
> +==========
> +[1] https://www.nxp.com/docs/en/user-guide/IMX7ULPQSG.pdf
> diff --git a/configs/freescale_imx7ulpevk_defconfig b/configs/freescale_imx7ulpevk_defconfig
> new file mode 100644
> index 0000000000..7998eb04ad
> --- /dev/null
> +++ b/configs/freescale_imx7ulpevk_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.0.0"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evkb"
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP=y
> +BR2_PACKAGE_IMX_M4_DEMOS=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx7ulp_evk"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.0.0"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 55cd53aa37..639b789ebe 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -38,7 +38,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>         bool "imx6ul/imx6ull"
>
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> -       bool "imx7d/imx7ulp"
> +       bool "imx7d"
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
> +       bool "imx7ulp"
>
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>         bool "imx8m"
> @@ -62,6 +65,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>         default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>         default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>         default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> +       default "IMX7ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
>         default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
> @@ -80,12 +84,14 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
> +               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_M4
>         bool
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
> +               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> --
> 2.24.0.rc1
>

Reviewed-by: Gilles Talis <gilles.talis@gmail.com>
