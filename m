From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Dec 2013 02:29:05 -0600
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent
	kernels
In-Reply-To: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
References: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
Message-ID: <OF53549EA3.A59A17D4-ON86257C38.00296CA0-86257C38.002E9B5D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Pedersen,

Thomas Pedersen <thomas@cozybit.com> wrote on 12/04/2013 05:57:44 PM:

[...]

>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"

Would it be possible to lock the kernel version down by using the custom 
version? This way that when we provide a defconfig with a known working 
kernel. If it were to be left to not use this, the kernel version will 
change with all the bumps.

> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y

What is the need for uImage? zImage is what is supported by default in 
U-Boot for pandaboard - 
http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=blob;f=include/configs/omap4_common.h

This configuration is not going to work out of the box for a user since 
U-Boot searches for a zImage and a omap4-panda-es.dtb. So we would want to 
generate a stand-alone dtb.

> +BR2_LINUX_KERNEL_APPENDED_DTB=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +# might need omap4-panda or omap4-panda-a4 instead
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"

Also could we lock down the version of u-boot too?

Currently it looks like this -

# Bootloaders
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"

Which means we will be pulling the latest version of U-Boot which is also 
not preferable since U-Boot also has a tendency to break. Would you be 
willing to specify a custom version of u-boot too in your update to the 
defconfig?

Thanks,
-Ryan
