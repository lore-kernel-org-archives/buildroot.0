From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:40:47 +0200
Subject: [Buildroot] [PATCH] ppc64 e5500 arch: new qemu target
In-Reply-To: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180401164047.68f5ed75@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit title should be:

	configs/qemu_ppc64_e5500: new defconfig

On Sun,  1 Apr 2018 09:15:30 -0500, Matt Weber wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index ac7a47f..dd7e389 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1165,6 +1165,7 @@ F:	package/ts4900-fpga/
>  N:	Matt Weber <matthew.weber@rockwellcollins.com>
>  F:	board/freescale/p*
>  F:	board/freescale/t*
> +F:	board/qemu/ppc64-e5500/
>  F:	configs/freescale_p*
>  F:	configs/freescale_t*

As you mentioned, missing entry for the defconfig file itself.

>  F:	package/argp-standalone/
> diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
> new file mode 100644
> index 0000000..81993d2
> --- /dev/null
> +++ b/board/qemu/ppc64-e5500/linux.fragment
> @@ -0,0 +1,2 @@
> +# Enables generic e500 arch support for QEMU
> +CONFIG_PPC_QEMU_E500=y

E500, while it's E5500 ?

> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> new file mode 100644
> index 0000000..55c5644
> --- /dev/null
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -0,0 +1,18 @@
> +# Architecture
> +BR2_powerpc64=y
> +BR2_powerpc_e5500=y

You need an option here to specify the version of the kernel headers
being used.

> +
> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
> +BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y

The Qemu emulation doesn't support emulating some hard drive, to use a
more regular ext4 setup ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
