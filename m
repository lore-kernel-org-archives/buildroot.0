From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Jun 2015 23:48:57 +0200
Subject: [Buildroot] [PATCH 1/4] defconfig for warpboard
In-Reply-To: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <55848E49.1030304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/15 17:29, Arthur LAMBERT wrote:
> This is a set of patch to add support for warpboard (Freescale board based on imx6sl)
> 
> Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
> ---
>  configs/warpboard_defconfig | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 configs/warpboard_defconfig
> 
> diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
> new file mode 100644
> index 0000000..188ea4d
> --- /dev/null
> +++ b/configs/warpboard_defconfig
> @@ -0,0 +1,31 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a9=y

 Please also fix the kernel headers to a specific version. Pretty soon 4.1 will
be the default, and they may be incompatible with the kernel you build.


> +
> +# system
> +BR2_TARGET_GENERIC_HOSTNAME="warpboard"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:Freescale/linux-fslc.git"

 For github, we prefer to use a wget download rather than a a git download,
since it's a lot faster. So:

BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=$(call
github,Freescale,linux-fscl,38ec11d74b0fbe110b658a6e1a86eeac7e5a383e)

> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="patches-4.0"

 This is a branch, not a tag, so it's a moving target. Since there don't seem to
be tags in this repository, you'll have to specify a commit sha instead (as I've
shown above).


> +BR2_LINUX_KERNEL_PATCH="board/freescale/warpboard/linux/"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/warpboard/linux-4.0.config"

 You forgot to include this file in the patch. Please make sure that it's a
defconfig, not a full config.

> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
> +
> +# rootfs
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_TAR_BZIP2=y

 We generally don't make a tarball at all, since the ext4 is enough.

> +BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"

 Also this is missing. Why is an overlay needed to begin with?

> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_VERSION="2015.04"

 This can't be right, BR2_TARGET_UBOOT_VERSION is a hidden symbol. It should be:

BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.04"

> +BR2_TARGET_UBOOT_BOARDNAME="warp"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y


 We also usually add a readme.txt file with an explanation of how to put
everything on an SD card.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
