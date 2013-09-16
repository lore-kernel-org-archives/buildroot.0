From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 21:12:54 +0200
Subject: [Buildroot] [PATCH 1/3] support for cubieboard2 added
In-Reply-To: <1379328727-2577-2-git-send-email-carlos@crqgestion.es>
References: <1379328727-2577-1-git-send-email-carlos@crqgestion.es>
 <1379328727-2577-2-git-send-email-carlos@crqgestion.es>
Message-ID: <52375836.4070400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/09/13 12:52, Carlos Quijano wrote:
>
> Signed-off-by: Carlos Quijano <carlos@crqgestion.es>
> ---
>   board/cubietech/cubieboard2/boot.cmd               |    4 +
>   .../cubieboard2/cubieboard2_kernel.config          | 3158 ++++++++++++++++++++
>   board/cubietech/cubieboard2/mkcubiecard.sh         |  116 +
>   board/cubietech/cubieboard2/post-build.sh          |   14 +
>   board/cubietech/cubieboard2/readme.txt             |   59 +
>   configs/cubieboard2_defconfig                      |   40 +
>   package/sunxi-boards/sunxi-boards.mk               |    2 +-
>   7 files changed, 3392 insertions(+), 1 deletion(-)
>   create mode 100644 board/cubietech/cubieboard2/boot.cmd
>   create mode 100644 board/cubietech/cubieboard2/cubieboard2_kernel.config
>   create mode 100755 board/cubietech/cubieboard2/mkcubiecard.sh
>   create mode 100755 board/cubietech/cubieboard2/post-build.sh
>   create mode 100644 board/cubietech/cubieboard2/readme.txt

  As far as I can see, the scripts and readme are an exact copy of 
cubieboard. I think it makes more sense then to make them symlinks to the 
cubieboard directory, to ensure consistency. Or perhaps it's even better 
to keep using the cubieboard directory for cubieboard2, and make a 
linux-cubieboard2.config.

>   create mode 100644 configs/cubieboard2_defconfig

[snip]
> diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
> new file mode 100644
> index 0000000..b72a611
> --- /dev/null
> +++ b/configs/cubieboard2_defconfig
> @@ -0,0 +1,40 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-build.sh"

  This should be cubieboard2/post-build.sh, right? :-)

> +
> +# Additional tools
> +BR2_PACKAGE_HOST_SUNXI_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/cubieboard2.fex"
> +
> +# Kernel headers
> +BR2_KERNEL_HEADERS_3_4=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5dda5145c877335e17bd9ca48954841acc0f785a"
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/cubietech/cubieboard2/cubieboard2_kernel.config"
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="cubieboard2"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_VERSION="sunxi"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
> index 6c28e42..ef5b34d 100644
> --- a/package/sunxi-boards/sunxi-boards.mk
> +++ b/package/sunxi-boards/sunxi-boards.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
> +SUNXI_BOARDS_VERSION = 25a868189dbaa40872b2ac7d8a941dd73972eb08

  I think this version bump should be a separate patch.

  Regards,
  Arnout

>   SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/$(SUNXI_BOARDS_VERSION)
>   SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
>   SUNXI_BOARDS_INSTALL_IMAGES = YES
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
