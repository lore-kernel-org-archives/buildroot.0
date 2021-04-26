From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 22:12:15 +0200
Subject: [Buildroot] [PATCH] configs/microchip_sama5d2_icp: new
 defconfigs
In-Reply-To: <20210423114512.1360778-1-eugen.hristev@microchip.com>
References: <20210423114512.1360778-1-eugen.hristev@microchip.com>
Message-ID: <20210426221215.0a22e610@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Fri, 23 Apr 2021 14:45:12 +0300
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Add the new SAMA5D2 ICP (Industrial Connectivity Board)
> with linux4sam_2020.10 components.
> Update README file with new defconfigs.
> 
> https://www.linux4sam.org/bin/view/Linux4SAM/Sama5d2IcpMainPage
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

This looks mostly good, and in fact I would have probably applied if
there wasn't the issue with at91bootstrap4 package (to which I replied
separately).

> This patch requires patch
> [PATCH] boot: introduce at91bootstrap4

Could you send both patches as a series, then? This is the standard way
to indicate that there is a dependency.

> diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
> new file mode 100644
> index 0000000000..07c07fd1e6
> --- /dev/null
> +++ b/configs/microchip_sama5d2_icp_mmc_defconfig
> @@ -0,0 +1,33 @@
> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_PTHREAD_DEBUG=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Why are these three last options needed, in a minimal defconfig?

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

Why is this option needed?

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama5d2_icp/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.10)/linux-linux4sam-2020.10.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
> +BR2_PACKAGE_LINUX_TOOLS_IIO=y

This option should not be part of a minimal defconfig.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_AT91BOOTSTRAP4=y
> +BR2_TARGET_AT91BOOTSTRAP4_DEFCONFIG="sama5d2_icpsd_uboot"

We want to use a fixed version of at91bootstrap, not just "the latest".
This is similar to what you're doing for linux and u-boot. This commit
also applies to the "dev" defconfig.

Could you adjust those minor details, and send an updated version, in
the same series as the reworked at91bootstrap4 packaging?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
