From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:03:32 +0100
Subject: [Buildroot] [PATCH v3 3/5] grub2: enable support for arm and
 aarch64 targets
In-Reply-To: <20180926223719.12604-4-nunes.erico@gmail.com>
References: <20180926223719.12604-1-nunes.erico@gmail.com>
 <20180926223719.12604-4-nunes.erico@gmail.com>
Message-ID: <20181126220332.0c3279a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:37:17 +0200, Erico Nunes wrote:

> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index f760f95e84..5e0e47a5bb 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -2,10 +2,13 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_i386
>  	default y if BR2_x86_64
> +	default y if BR2_arm
> +	default y if BR2_aarch64

... here!

>  
>  config BR2_TARGET_GRUB2
>  	bool "grub2"
>  	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU

I have moved this architecture dependency up here...


>  config BR2_TARGET_GRUB2_BUILTIN_MODULES
>  	string "builtin modules"
>  	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
>  	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
> -		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
> +		if BR2_TARGET_GRUB2_I386_EFI || \
> +		BR2_TARGET_GRUB2_X86_64_EFI || \
> +		BR2_TARGET_GRUB2_ARM_EFI || \\

There was a double backslash here, I simplified to a single backslash
and also reformatted this a bit.

>  comment "grub2 needs a toolchain w/ wchar"
>  	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU

This dependency is no longer needed, since BR2_USE_MMU is now part of
BR2_TARGET_GRUB2_ARCH_SUPPORTS.

Applied to next with those changes!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
