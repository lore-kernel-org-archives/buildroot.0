From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 11:53:32 +0100
Subject: [Buildroot] [PATCH] initial support for Blackfin processors
In-Reply-To: <1290076044-31558-1-git-send-email-vapier@gentoo.org>
References: <1290076044-31558-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101118115332.71de42e2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nice to see support for Blackfin processors!

On Thu, 18 Nov 2010 05:27:24 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
> index 86c656d..47657fc 100644
> --- a/boot/u-boot/Config.in
> +++ b/boot/u-boot/Config.in
> @@ -71,6 +71,10 @@ config BR2_TARGET_UBOOT_FORMAT_KWB
>  	depends on BR2_arm
>  	bool "u-boot.kwb (Marvell)"
>  
> +config BR2_TARGET_UBOOT_FORMAT_LDR
> +	depends on BR2_bfin
> +	bool "u-boot.ldr"
> +

Maybe make it the default choice when BR2_bfin is enabled ?

>  ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
> +ifeq ($(KERNEL_ARCH),blackfin)
> +LINUX26_IMAGE_NAME=vmImage
> +else
>  LINUX26_IMAGE_NAME=uImage
> +endif

That looks strange, if you want uImage, you want uImage, right ? Or is
Blackfin's vmImage in fact a uImage (in which case a short comment
above this condition would be nice).

>  choice
>  	prompt "Serial port to run a getty on"
> -	default BR2_TARGET_GENERIC_GETTY_TTYS0
> +	default BR2_TARGET_GENERIC_GETTY_TTYS0 if !BR2_bfin
> +	default BR2_TARGET_GENERIC_GETTY_TTYBF0 if BR2_bfin

We are going to move away from this and replace all that stuff by a
free-form text field. Patches have been posted, but haven't been merged
yet. As I am reworking board support and system-level configuration, I
think I'll take care of them.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
