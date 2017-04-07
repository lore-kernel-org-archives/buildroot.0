From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 10:06:54 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170407075444.GA12962@panicking>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
 <20170406183218.66cab07e@free-electrons.com>
 <20170406185739.3caf46f6@free-electrons.com>
 <20170407075444.GA12962@panicking>
Message-ID: <20170407100654.32f1da84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 09:54:46 +0200, Michael Trimarchi wrote:

> diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
> index cfc1039ec..ba60297dd 100644
> --- a/board/beaglebone/genimage.cfg
> +++ b/board/beaglebone/genimage.cfg
> @@ -9,7 +9,6 @@ image boot.vfat {
>  			"am335x-evmsk.dtb",
>  			"am335x-bone.dtb",
>  			"am335x-boneblack.dtb",
> -			"am335x-bonegreen.dtb",

No, we want to keep this one. Instead, we want to upgrade the kernel
version used in beaglebone_qt5_defconfig.

Can you try replacing:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"

by:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="adde2ca9f86797071f6e7b2b9e779fa5e4a8f3cd"

in beaglebone_qt5_defconfig.

I'm adding Lothar in Cc as well, since he did the
beaglebone_qt5_defconfig, and he will know if the SGX stuff works fine
with the 4.4 TI kernel.


> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1d464d967..edfc27fa7 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -195,8 +195,9 @@ endef
>  endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>  
>  define UBOOT_BUILD_CMDS
> -	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
> -		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
> +	UBOOT_CUSTOM_DTS_PATH=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
> +	$(if $(UBOOT_CUSTOM_DTS_PATH),
> +		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
>  	)

Why is this needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
