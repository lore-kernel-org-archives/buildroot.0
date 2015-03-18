From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 00:32:09 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
	PDK
In-Reply-To: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550A0AF9.5050101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 10:43, Vincent Stehl? wrote:
> The i.MX31 Product Development Kit (or PDK) is Freescale development board
> based on the i.MX31 application processor.
> 
> This defconfig is based on Freescale kernel 2.6.28 5.1.0, and is aimed at a PDK
> in "3 stack" configuration, with CPU engine board, personality board and debug
> board.

 Doesn't the upstream MACH_MX31_3DS work? 2.6.28 is extremely old...

> 
> Note that we have a patch to reconciliate the recent GNU make with the "old"
> Makefile in the Linux kernel this configuration refers to.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>

[snip]
> diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
> new file mode 100644
> index 0000000..96c9eb0
> --- /dev/null
> +++ b/configs/freescale_imx31_3stack_defconfig
> @@ -0,0 +1,23 @@
> +# architecture
> +BR2_arm=y
> +BR2_arm1136jf_s_r0=y
> +BR2_ARM_EABIHF=y
> +
> +# toolchain
> +BR2_KERNEL_HEADERS_3_2=y

 That doesn't sound like a good idea when the kernel is 2.6.28...

> +BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

 Why not uClibc and why C++?

> +
> +# system
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

 With a more recent kernel we don't need this crappy option...

> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set

 Why?

> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_2.6.28_5.1.0"
> +BR2_LINUX_KERNEL_PATCH="board/freescale/imx31_3stack/"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx31_3stack"
> +BR2_LINUX_KERNEL_ZIMAGE=y

 If network boot is really the only option, then perhaps it would be nicer to
use an initramfs linked into the kernel? Or doesn't the board have enough memory
to support that?


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
