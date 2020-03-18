From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Mar 2020 22:34:43 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add optional
 host-dtc dependency
In-Reply-To: <20200318205005.79605-1-thomas.petazzoni@bootlin.com>
References: <20200318205005.79605-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200318213443.GA10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-03-18 21:50 +0100, Thomas Petazzoni spake thusly:
> Some ATF configurations, such as the ones for the STM32MP1 processor
> family, require DTC during the build as Device Tree files are
> used. Without dtc, the build fails:
> 
> /bin/sh: 1: dtc: not found
> dtc version too old (), you need at least version 1.4.4
> plat/st/stm32mp1/platform.mk:239: recipe for target 'check_dtc_version' failed
> make[1]: *** [check_dtc_version] Error 1
> 
> To solve this, this commit implements a
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC option, in a way that mimics
> the BR2_TARGET_UBOOT_NEEDS_DTC option we already have for the U-Boot
> package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

As discused on IRC, if this trend continues, we could/should switch to
depending on the host package if it is enabled, rather than add yet more
such _NEEDS_STUFF options...

Regards,
Yann E. MORIN.

> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 373591d497..737dc587e5 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -160,4 +160,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
>  	  Names of generated image files that are installed in the
>  	  output images/ directory.
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
> +	bool "Needs dtc"
> +	select BR2_PACKAGE_HOST_DTC
> +	help
> +	  Select this option if your ATF board configuration
> +	  requires the Device Tree compiler to be available.
> +
>  endif
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 34737018aa..27f63a87fe 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -29,6 +29,10 @@ endif
>  
>  ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
>  
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
> +endif
> +
>  ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
