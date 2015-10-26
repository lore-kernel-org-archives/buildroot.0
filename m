From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 20:59:06 +0100
Subject: [Buildroot] [PATCH] configs: Add support for Toradex Colibri
 Vybrid modules
In-Reply-To: <f63a9e7f3d885880c6b55b89eec4aa739b497ea1.1445312793.git.maitysanchayan@gmail.com>
References: <f63a9e7f3d885880c6b55b89eec4aa739b497ea1.1445312793.git.maitysanchayan@gmail.com>
Message-ID: <562E860A.2090203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sanchayan,

On 20-10-15 05:49, Sanchayan Maity wrote:
> This patch adds a minimal default configuration for Colibri Vybrid
> modules which has been tested on Colibri Vybrid VF50 and VF61.
> 
> Vybrid is well supported in mainline kernel by Toradex however we
> use the custom git branches maintained by Toradex. The configuration
> only builds a minimal root filesystem. Support for u-boot and flash
> scripts is not added.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
> ---
>  configs/colibri_vf_defconfig | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 configs/colibri_vf_defconfig
> 
> diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
> new file mode 100644
> index 0000000..d096754
> --- /dev/null
> +++ b/configs/colibri_vf_defconfig
> @@ -0,0 +1,34 @@
> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_TOOLCHAIN_EXTERNAL=y

 We prefer to use an internal uClibc-based toolchain for minimal defconfigs,
because it is smaller and gives more fine-tuning options. You do have to fix the
kernel headers to a specific version to guarantee reproducability.

> +BR2_PACKAGE_HOST_GDB=y
> +BR2_PACKAGE_HOST_GDB_PYTHON=y
> +BR2_GDB_VERSION_7_8=y

 We also don't enable gdb in the defconfigs, just like we don't enable any
target package other than busybox.

> +BR2_TARGET_GENERIC_HOSTNAME="colibri-vf"
> +BR2_TARGET_GENERIC_ISSUE="Colibri VF 20151007"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db509ca6ce2a4c04fe0d2a2e0611bb917ebe4aa8"
> +BR2_LINUX_KERNEL_DEFCONFIG="colibri_vf"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-colibri-eval-v3 vf500-colibri-eval-v3"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y

 That is rarely a good idea... You usually put the kernel in a separate mtd
partition or UBI volume.

> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_IPROUTE2=y

 Please don't select any package except busybox.

> +BR2_TARGET_ROOTFS_UBIFS=y
> +BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
> +BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
> +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
> +BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y

 This is the default, how come it appears in your defconfig?

> +BR2_TARGET_ROOTFS_UBIFS_NONE=y

 Same here.

> +BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup"
> +BR2_TARGET_ROOTFS_UBI=y
> +BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
> +BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
> +BR2_TARGET_ROOTFS_UBI_OPTS=""
> 


 We also like to have a readme file, in board/toradex/colibri/readme.txt, that
explains how to get the images to the target. Particularly in this case because
it's not simply a matter of putting it in an SD card. Look at other boards for
examples.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
