From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 May 2016 23:47:21 +0200
Subject: [Buildroot] [PATCH 3/3] Default config for OrangePi Plus.
	Generates kernel using sunxi/for-next branch of
	git.kernel.org/git/mripard U-boot built from git tag v2016.05-rc3
In-Reply-To: <1463268790-1076-4-git-send-email-troy@dack.com.au> (Troy Dack's
 message of "Sun, 15 May 2016 09:33:10 +1000")
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
 <1463268790-1076-4-git-send-email-troy@dack.com.au>
Message-ID: <878tzbgfiu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Troy" == Troy Dack <troy@dack.com.au> writes:

 > Signed-off-by: Troy Dack <troy@dack.com.au>
 > ---
 >  configs/orangepi_plus_defconfig | 64 +++++++++++++++++++++++++++++++++++++++++

Thanks. This should be in the same patch as the one adding the
post-image/build scripts.

>  1 file changed, 64 insertions(+)
 >  create mode 100644 configs/orangepi_plus_defconfig

 > diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
 > new file mode 100644
 > index 0000000..c4668ad
 > --- /dev/null
 > +++ b/configs/orangepi_plus_defconfig
 > @@ -0,0 +1,64 @@
 > +BR2_arm=y
 > +BR2_cortex_a7=y
 > +BR2_ARM_FPU_VFPV4=y
 > +# Kernel is a pre-release of 4.5, so we do not yet have a _CUSTOM_4_5
 > +# option for the headers. Thus, we stick with the 4.4 headers for now.
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="4.4"
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 > +BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 > +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Plus"
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi_plus/post-build.sh"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi_plus/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="sunxi/for-next"
 > +BR2_LINUX_KERNEL_VERSION="sunxi/for-next"

Why can't you use 4.5 like orangepipc_defconfig? This for-next branch
most likely isn't stable (E.G. it gets rebased and recreated once it is
merged into mainline). We want reproducable builds, so  _REPO_VERSION
has to point to a git commit hash or a tag, and not to a branch.

> +BR2_LINUX_KERNEL_PATCH=""
 > +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 > +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=""

Please drop unneeded lines (E.G. the ones equal to the default values).

 > +BR2_LINUX_KERNEL_UBOOT_IMAGE=y
 > +BR2_LINUX_KERNEL_UIMAGE=y

Why? U-boot supports zImage (and orangepipc_defconfig already uses it)

 > +BR2_LINUX_KERNEL_GZIP=y
 > +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
 > +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL=""
 > +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION=""

Huh?

 > +
 > +BR2_TARGET_ROOTFS_CPIO=y
 > +BR2_TARGET_ROOTFS_CPIO_GZIP=y
 > +BR2_TARGET_ROOTFS_CPIO_UIMAGE=y

What is this for? Fel boot?

 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +
 > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 > +
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.05-rc3"
 > +BR2_TARGET_UBOOT_VERSION="v2016.05-rc3"
 > +BR2_TARGET_UBOOT_PATCH=""
 > +BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_plus"
 > +BR2_TARGET_UBOOT_NEEDS_DTC=y
 > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"


 > +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL=""
 > +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION=""

Again, huh?


 > +
 > +BR2_CCACHE=y
 > +BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache"
 > +BR2_CCACHE_INITIAL_SETUP=""
 > +BR2_CCACHE_USE_BASEDIR=y

This is not specific to this board, so it doesn't belong here.

Care to fixup these issues and resend? Thanks!

-- 
Bye, Peter Korsgaard
