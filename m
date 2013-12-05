From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 08:59:35 +0100
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent
 kernels
In-Reply-To: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
References: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
Message-ID: <20131205085935.75f129c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Pedersen,

On Wed,  4 Dec 2013 15:57:44 -0800, Thomas Pedersen wrote:
> The patch "pandaboard: Fix defconfig build" locked the
> default pandaboard kernel to 3.8.11. This is inconvenient,
> however, and we can make the default pandaboard kernel
> build and boot with a few changes:

The lock down to a specific version of the kernel and a specific version
of the kernel headers is intentional. These are here to guarantee that
the defconfig will always produce the same result, regardless of
whether Buildroot updates the default kernel / kernel headers version.

> -# Lock to 3.8 headers to avoid breaking with newer kernels
> -BR2_KERNEL_HEADERS_3_8=y

So this should be kept (possibly updating to a new kernel headers
version of course, but we should keep a kernel headers version here).

>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"

Same thing here. No problem with bumping from 3.8.x to 3.12.x or
something like that, if you've tested 3.12.x, but an explicit version
selection must be kept.

>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
> +BR2_LINUX_KERNEL_APPENDED_DTB=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +# might need omap4-panda or omap4-panda-a4 instead
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
>  
>  # GCC
>  BR2_GCC_VERSION_4_6_X=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
