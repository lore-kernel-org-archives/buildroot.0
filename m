From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 May 2021 00:07:53 +0200
Subject: [Buildroot] [PATCH v3 6/7] boot/beaglev-secondboot: new package
In-Reply-To: <20210504205139.1055360-7-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-7-thomas.petazzoni@bootlin.com>
Message-ID: <20210507220753.GG2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> This packages allows to build the first stage bootloader used on the
> BeagleV, which is used even before the DDR initialization and
> OpenSBI/U-Boot. Yes, "secondboot" is strange for what is the first
> stage bootloader, but that's the upstream name.

I've added a hash file.

I also changed the comment to not mention 'HEAD' since this will no
longer be the case when upstream pushes a new commit.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  DEVELOPERS                                    |  1 +
>  boot/Config.in                                |  1 +
>  boot/beaglev-secondboot/Config.in             |  9 ++++++
>  boot/beaglev-secondboot/beaglev-secondboot.mk | 29 +++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 boot/beaglev-secondboot/Config.in
>  create mode 100644 boot/beaglev-secondboot/beaglev-secondboot.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 39bc71ea34..1d786b6ffa 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2605,6 +2605,7 @@ F:	arch/Config.in.arm
>  F:	board/beaglev/
>  F:	board/stmicroelectronics/stm32mp157c-dk2/
>  F:	boot/beaglev-ddrinit/
> +F:	boot/beaglev-secondboot/
>  F:	boot/boot-wrapper-aarch64/
>  F:	boot/grub2/
>  F:	boot/gummiboot/
> diff --git a/boot/Config.in b/boot/Config.in
> index f581205c6c..08d9ac06b2 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -7,6 +7,7 @@ source "boot/at91dataflashboot/Config.in"
>  source "boot/arm-trusted-firmware/Config.in"
>  source "boot/barebox/Config.in"
>  source "boot/beaglev-ddrinit/Config.in"
> +source "boot/beaglev-secondboot/Config.in"
>  source "boot/binaries-marvell/Config.in"
>  source "boot/boot-wrapper-aarch64/Config.in"
>  source "boot/grub2/Config.in"
> diff --git a/boot/beaglev-secondboot/Config.in b/boot/beaglev-secondboot/Config.in
> new file mode 100644
> index 0000000000..a9695fc138
> --- /dev/null
> +++ b/boot/beaglev-secondboot/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_TARGET_BEAGLEV_SECONDBOOT
> +	bool "beaglev-secondboot"
> +	depends on BR2_riscv
> +	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
> +	help
> +	  This package builds the SecondBoot firmware used on the
> +	  BeagleV platform.
> +
> +	  https://github.com/starfive-tech/beagle_secondBoot
> diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
> new file mode 100644
> index 0000000000..f3b255fb0c
> --- /dev/null
> +++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# beaglev-secondboot
> +#
> +################################################################################
> +
> +# HEAD of the starfive branch
> +BEAGLEV_SECONDBOOT_VERSION = a4f0b4307f877890f998b3216cffcc9f27a5f993
> +BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
> +BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
> +BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
> +BEAGLEV_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
> +# unfortunately, no real license file, but several sources files are
> +# under GPL-2.0+, making the whole work GPL-2.0+
> +BEAGLEV_SECONDBOOT_LICENSE = GPL-2.0+
> +
> +define BEAGLEV_SECONDBOOT_BUILD_CMDS
> +	$(MAKE) -C $(@D)/build \
> +		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
> +		SUFFIX=buildroot \
> +		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
> +endef
> +
> +define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-BEAGLEV-buildroot.bin.out \
> +		$(BINARIES_DIR)/bootloader-BEAGLEV-buildroot.bin.out
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.30.2
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
