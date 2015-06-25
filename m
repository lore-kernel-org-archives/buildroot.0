From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 01:29:33 +0200
Subject: [Buildroot] [V3 2/2] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <1434983952-7662-3-git-send-email-francois.perrad@gadz.org>
References: <1434983952-7662-1-git-send-email-francois.perrad@gadz.org>
 <1434983952-7662-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <558C8EDD.1070505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 16:39, Francois Perrad wrote:
> config mali / sunxi
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[snip]
> diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> new file mode 100644
> index 0000000..a515ded
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> @@ -0,0 +1,47 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Kernel headers
> +BR2_KERNEL_HEADERS_3_4=y

 We normally even fix the patchlevel:

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.4.108"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y

though honestly I don't see why we shouldn't follow the bumping of the patchlevel.

> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot-mali.cmd $(TARGET_DIR)/boot"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"

 This is a hidden symbol so it has no place in the defconfig.

> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y

 It's either CUSTOM_GIT or CUSTOM_TARBALL, not both... _GIT should be removed.

 Regards,
 Arnout

> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# sunxi packages
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
