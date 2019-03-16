From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Mar 2019 08:41:24 +0100
Subject: [Buildroot] [PATCH 2/3] boot: riscv: Initial commit of OpenSBI
In-Reply-To: <20190315230540.4311-2-alistair.francis@wdc.com>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
 <20190315230540.4311-2-alistair.francis@wdc.com>
Message-ID: <20190316084124.2dbf3e47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Mar 2019 23:06:38 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> index 8a57cb2e23..a8978856ad 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1383,6 +1383,7 @@ F:	arch/arch.mk.riscv
>  F:	arch/Config.in.riscv
>  F:	board/qemu/riscv32-virt/
>  F:	board/qemu/riscv64-virt/
> +F:	boot/opensbi/

Why is this added under the name of Mark Corbin, and not yours? Is Mark
fine with this? Why don't you add opensbi under your entry in the
DEVELOPERS file?


> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> new file mode 100644
> index 0000000000..01ee342215
> --- /dev/null
> +++ b/boot/opensbi/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_OPENSBI
> +	bool "OpenSBI"

All lower-case "opensbi".

> +	depends on BR2_riscv
> +	help
> +	  OpenSBI aims to provide an open-source and extensible
> +	  implementation of the RISC-V SBI specification for a platform
> +	  specific firmware (M-mode) and a general purpose OS, hypervisor
> +	  or bootloader (S-mode or HS-mode). OpenSBI implementation can
> +	  be easily extended by RISC-V platform or System-on-Chip vendors
> +	  to fit a particular hadware configuration.
> +
> +	  https://github.com/riscv/opensbi.git
> +
> +if BR2_TARGET_OPENSBI
> +config BR2_TARGET_OPENSBI_USE_PLAT
> +	bool "Build OpenSBI for Platform"
> +	depends on BR2_TARGET_OPENSBI

This "depends on" is not needed, you are already inside a if
BR2_TARGET_OPENSBI...endif block.

But this option is not needed: you can simply decide whether you want
to do a "platform" build depending on whether the
BR2_TARGET_OPENSBI_PLAT option is empty or not.

> +config BR2_TARGET_OPENSBI_PLAT
> +	string "OpenSBI Platform"
> +	depends on BR2_TARGET_OPENSBI_USE_PLAT
> +	default "qemu/virt" if BR2_RISCV_QEMU_VIRT
> +	default "qemu/sifive_u" if BR2_RISCV_QEMU_SIFIVE_U

Instead of this, you should simply make it a string option, and it's
the responsibility of the user to fill it in with the right value.
Example defconfigs can help users for well-known platforms. That's how
we do things for Linux, U-Boot, and all other platform-specific
components.

> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> new file mode 100644
> index 0000000000..9da4e7f44e
> --- /dev/null
> +++ b/boot/opensbi/opensbi.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# OpenSBI
> +#
> +################################################################################
> +
> +OPENSBI_VERSION = ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f
> +OPENSBI_SITE = git://github.com/riscv/opensbi.git
> +OPENSBI_LICENSE = BSD-2-Clause
> +OPENSBI_LICENSE_FILES = COPYING.BSD
> +OPENSBI_INSTALL_IMAGES = YES
> +
> +OPENSBI_MAKE_ENV = \
> +	CROSS_COMPILE=$(TARGET_CROSS)
> +
> +ifeq ($(BR2_TARGET_OPENSBI_USE_PLAT),y)
> +	OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))

So you're re-using the name of the U-Boot defconfig ? Aren't you
supposed to use BR2_TARGET_OPENSBI_PLAT here ?

> +	OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
> +endif

I believe this block of code should instead be:

OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
ifneq ($(OPENSBI_PLAT),)
OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
endif

> +define OPENSBI_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +ifeq ($(BR2_TARGET_OPENSBI_USE_PLAT),y)

So when there's no platform defined, nothing gets installed ? This
looks weird.

I'm not sure how much it makes sense for a build without a platform
defined. Shouldn't we do like U-Boot/Linux and simply disallow building
with an undefined platform/configuration ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
