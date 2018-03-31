From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 00:34:14 +0200
Subject: [Buildroot] [PATCH] configs: switch to a wget download for
 kernels on github
In-Reply-To: <20180331222803.4982-1-yann.morin.1998@free.fr>
References: <20180331222803.4982-1-yann.morin.1998@free.fr>
Message-ID: <20180331223414.GT25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-04-01 00:28 +0200, Yann E. MORIN spake thusly:
> The linux git tree on github is huge, and takes a long time to
> download, which is not very nice nor convenient for newcomers.
> 
> Switch them to using a wget, with the github macro.
> 
> Mechanical patch, obtained by running (hang-on tight):
> 
> $ sed -r -i -e 's/BR2_LINUX_KERNEL_CUSTOM_GIT/BR2_LINUX_KERNEL_CUSTOM_TARBALL/; /BR2_LINUX_KERNEL_CUSTOM_REPO_URL/N; s:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https\://github.com/([^/]+)/([^.]+)(.git)?"\nBR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="(.+)":BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,\1,\2,\4)/linux-\4.tar.gz":;' $(grep -l 'BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com' configs/*)

As seen IRL, this failed the tweaking on two defconfigs...

Regards,
Yann E. MORIN.

> Except for socrates_cyclone5 which did not work previously (missing tag
> in git tree?) all the affected defconfigs still download their sources.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  configs/amarula_vyasa_rk3288_defconfig           | 5 ++---
>  configs/arcturus_ucls1012a_defconfig             | 5 ++---
>  configs/at91sam9x5ek_defconfig                   | 5 ++---
>  configs/at91sam9x5ek_dev_defconfig               | 5 ++---
>  configs/at91sam9x5ek_mmc_defconfig               | 5 ++---
>  configs/at91sam9x5ek_mmc_dev_defconfig           | 5 ++---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d2_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d3_xplained_defconfig         | 5 ++---
>  configs/atmel_sama5d3_xplained_dev_defconfig     | 5 ++---
>  configs/atmel_sama5d3_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 5 ++---
>  configs/atmel_sama5d3xek_defconfig               | 5 ++---
>  configs/atmel_sama5d4_xplained_defconfig         | 5 ++---
>  configs/atmel_sama5d4_xplained_dev_defconfig     | 5 ++---
>  configs/atmel_sama5d4_xplained_mmc_defconfig     | 5 ++---
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 5 ++---
>  configs/ci20_defconfig                           | 5 ++---
>  configs/galileo_defconfig                        | 5 ++---
>  configs/odroidc2_defconfig                       | 5 ++---
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
>  configs/raspberrypi0_defconfig                   | 5 ++---
>  configs/raspberrypi0w_defconfig                  | 5 ++---
>  configs/raspberrypi2_defconfig                   | 5 ++---
>  configs/raspberrypi3_64_defconfig                | 5 ++---
>  configs/raspberrypi3_defconfig                   | 5 ++---
>  configs/raspberrypi3_qt5we_defconfig             | 5 ++---
>  configs/raspberrypi_defconfig                    | 5 ++---
>  configs/roseapplepi_defconfig                    | 5 ++---
>  configs/socrates_cyclone5_defconfig              | 5 ++---
>  configs/solidrun_macchiatobin_marvell_defconfig  | 5 ++---
>  configs/ts7680_defconfig                         | 2 +-
>  configs/zynq_microzed_defconfig                  | 5 ++---
>  configs/zynq_zc706_defconfig                     | 5 ++---
>  configs/zynq_zed_defconfig                       | 5 ++---
>  36 files changed, 70 insertions(+), 104 deletions(-)
> 
> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
> index 4cd46e79de..ccaab9551e 100644
> --- a/configs/amarula_vyasa_rk3288_defconfig
> +++ b/configs/amarula_vyasa_rk3288_defconfig
> @@ -21,9 +21,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/openedev/linux-openedev"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d127129e85a020879f334154300ddd3f7ec21c1e"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,openedev,linux-openedev,d127129e85a020879f334154300ddd3f7ec21c1e)/linux-d127129e85a020879f334154300ddd3f7ec21c1e.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
> index 0ce7d1341c..9d1da8c2cc 100644
> --- a/configs/arcturus_ucls1012a_defconfig
> +++ b/configs/arcturus_ucls1012a_defconfig
> @@ -13,9 +13,8 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ArcturusNetworks/uCLS1012A-kernel.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v0.2.1811"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v0.2.1811)/linux-v0.2.1811.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
> diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
> index cac305436e..9dd8fbb367 100644
> --- a/configs/at91sam9x5ek_defconfig
> +++ b/configs/at91sam9x5ek_defconfig
> @@ -3,9 +3,8 @@ BR2_arm926t=y
>  # Linux headers same as kernel, a 4.4 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
> diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
> index ba97212dca..dee365a56c 100644
> --- a/configs/at91sam9x5ek_dev_defconfig
> +++ b/configs/at91sam9x5ek_dev_defconfig
> @@ -17,9 +17,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
> diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
> index dc15bbcacb..8777606fe1 100644
> --- a/configs/at91sam9x5ek_mmc_defconfig
> +++ b/configs/at91sam9x5ek_mmc_defconfig
> @@ -11,9 +11,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
> diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
> index 5c8658c356..a8fdad72b7 100644
> --- a/configs/at91sam9x5ek_mmc_dev_defconfig
> +++ b/configs/at91sam9x5ek_mmc_dev_defconfig
> @@ -20,9 +20,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
> diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> index 4cea358b29..f3cb11ce70 100644
> --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> @@ -11,9 +11,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek at91-sama5d27_som1_ek_pda4 at91-sama5d27_som1_ek_pda7 at91-sama5d27_som1_ek_pda7b"
> diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
> index 5be2fe9dcc..57ced6940f 100644
> --- a/configs/atmel_sama5d2_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
> @@ -7,9 +7,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
> diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> index bff9cdf8fa..78d082f9cb 100644
> --- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> @@ -23,9 +23,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
> diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
> index 5b356ed724..b8b33c5e78 100644
> --- a/configs/atmel_sama5d3_xplained_defconfig
> +++ b/configs/atmel_sama5d3_xplained_defconfig
> @@ -4,9 +4,8 @@ BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
> diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
> index 976a77f7a6..91ded5bfeb 100644
> --- a/configs/atmel_sama5d3_xplained_dev_defconfig
> +++ b/configs/atmel_sama5d3_xplained_dev_defconfig
> @@ -19,9 +19,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
> diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
> index 0a40b054d6..8fd9a7c2f8 100644
> --- a/configs/atmel_sama5d3_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
> @@ -6,9 +6,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
> diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> index d3a30bc5b1..20dc8929ab 100644
> --- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> @@ -22,9 +22,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
> diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
> index c57076c9f9..4fa4d79282 100644
> --- a/configs/atmel_sama5d3xek_defconfig
> +++ b/configs/atmel_sama5d3xek_defconfig
> @@ -9,9 +9,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.5)/linux-linux4sam_5.5.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d33ek sama5d34ek sama5d35ek sama5d36ek"
> diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
> index e5a76411ee..522f7fc9d8 100644
> --- a/configs/atmel_sama5d4_xplained_defconfig
> +++ b/configs/atmel_sama5d4_xplained_defconfig
> @@ -5,9 +5,8 @@ BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
> diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
> index d45175bf28..69a71eb51e 100644
> --- a/configs/atmel_sama5d4_xplained_dev_defconfig
> +++ b/configs/atmel_sama5d4_xplained_dev_defconfig
> @@ -20,9 +20,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
> diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
> index 6fbaf3c748..f69acb288a 100644
> --- a/configs/atmel_sama5d4_xplained_mmc_defconfig
> +++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
> @@ -7,9 +7,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
> diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> index 1907a7590a..60692d98cb 100644
> --- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> @@ -23,9 +23,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.8"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
> diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
> index f28dd4da10..6e860b1e7e 100644
> --- a/configs/ci20_defconfig
> +++ b/configs/ci20_defconfig
> @@ -15,9 +15,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
>  
>  # kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dff33297116643485ca37141d804eddd793e834"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MIPS,CI20_linux,7dff33297116643485ca37141d804eddd793e834)/linux-7dff33297116643485ca37141d804eddd793e834.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="ci20"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
> diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
> index 72ab0ff061..03ca23f414 100644
> --- a/configs/galileo_defconfig
> +++ b/configs/galileo_defconfig
> @@ -10,9 +10,8 @@ BR2_ROOTFS_OVERLAY="board/intel/galileo/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8b3c9d8ce1656a26b1097d9091d53bfb39fef640"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,mdr78,Linux-x1000,8b3c9d8ce1656a26b1097d9091d53bfb39fef640)/linux-8b3c9d8ce1656a26b1097d9091d53bfb39fef640.tar.gz"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
> index f52f29adeb..63c5d2edc1 100644
> --- a/configs/odroidc2_defconfig
> +++ b/configs/odroidc2_defconfig
> @@ -14,9 +14,8 @@ BR2_KERNEL_HEADERS_VERSION=y
>  BR2_DEFAULT_KERNEL_VERSION="3.14.79"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,hardkernel,linux,f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa)/linux-f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
> diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> index d076581ede..00f45e5f50 100644
> --- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> @@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
>  # based on Linux version 3.4.113
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc385cc6dfa350382ecc94a520a716b57e654410"
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index 8a213fc4b1..749189b1d5 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -8,9 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B from the kernel sources: the zero is the same
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index 973412380d..b014a5674f 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -8,9 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 962a58cefb..724e0568a1 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -11,9 +11,8 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 6a35ac36a1..9dfa3f35be 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -10,9 +10,8 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 9304f0cb74..01c5198fca 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -10,9 +10,8 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index d4ada47588..5ceb53c7a6 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -11,9 +11,8 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index daca8362e6..2be84b07c6 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -10,9 +10,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,33ee56d5927ceff630fbc87e3f5caa409b6ae114)/linux-33ee56d5927ceff630fbc87e3f5caa409b6ae114.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
> index 6627ff4711..327176254a 100644
> --- a/configs/roseapplepi_defconfig
> +++ b/configs/roseapplepi_defconfig
> @@ -9,9 +9,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/roseapplepi/post-image.sh"
>  
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/xapp-le/kernel.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,xapp-le,kernel,59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b)/linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="actduino_bubble_gum_linux"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
> index 45355c1b85..7995f9acfb 100644
> --- a/configs/socrates_cyclone5_defconfig
> +++ b/configs/socrates_cyclone5_defconfig
> @@ -7,9 +7,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/altera/socrates_cyclone5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.1.33-ltsi_17.07.02_pr"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,altera-opensource,linux-socfpga,rel_socfpga-4.1.33-ltsi_17.07.02_pr)/linux-rel_socfpga-4.1.33-ltsi_17.07.02_pr.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socrates"
> diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
> index 5489136e1c..33700e1b45 100644
> --- a/configs/solidrun_macchiatobin_marvell_defconfig
> +++ b/configs/solidrun_macchiatobin_marvell_defconfig
> @@ -26,9 +26,8 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/linux-marvell"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.4.52-armada-17.10"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.52-armada-17.10.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
> index 09629a7364..d69fd4c7fa 100644
> --- a/configs/ts7680_defconfig
> +++ b/configs/ts7680_defconfig
> @@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.14.28-imx28.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ff01621df09b97d9fd546d1b49f4013060142892"
>  BR2_LINUX_KERNEL_DEFCONFIG="ts76xx"
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index a6366ee0c0..c89b4e6d9d 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -6,9 +6,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.3"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index 069034021d..758069b30f 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -6,9 +6,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.3"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index d08f83db59..26ff245169 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -6,9 +6,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.3"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
