From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 15:48:36 +0100
Subject: [Buildroot] [PATCH 1/3] package: arm-gnu-rm-toolchain: Add
 ARM-RM toolchain
In-Reply-To: <20190204143137.32224-2-kostap@marvell.com>
References: <20190204143137.32224-1-kostap@marvell.com>
 <20190204143137.32224-2-kostap@marvell.com>
Message-ID: <20190204154836.0fb7e76e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Title should be:

	package/arm-gnu-rm-toolchain: new package

On Mon, 4 Feb 2019 16:31:35 +0200
<kostap@marvell.com> wrote:

> Add host-only ARM RM toolchain for supporting firmware

"host-only" doesn't mean much here. It's a cross-compilation toolchain,
so it's not really "host-only".

> This patch installs pre-build bate metal ARM GNU-RM toolchain

pre-build -> "a pre-built"

> into the host file system folder /opt/gcc-arm for covering the
> above mentioned cases.

"into the host filesystem folder /opt/gcc-arm" ->
$(HOST_DIR)/opt/gcc-arm

> diff --git a/package/Config.in.host b/package/Config.in.host
> index 16b474fc9d..41dfd76785 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -67,5 +67,6 @@ menu "Host utilities"
>  	source "package/xorriso/Config.in.host"
>  	source "package/zip/Config.in.host"
>  	source "package/zstd/Config.in.host"
> +	source "package/arm-gnu-rm-toolchain/Config.in.host"

I don't think we need a Config.in.host option for this.

> diff --git a/package/arm-gnu-rm-toolchain/Config.in.host b/package/arm-gnu-rm-toolchain/Config.in.host
> new file mode 100644
> index 0000000000..3341760acd
> --- /dev/null
> +++ b/package/arm-gnu-rm-toolchain/Config.in.host
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_HOST_ARM_GNU_RM_TOOLCHAIN
> +	bool "host arm-gnu-rm-toolchain"
> +	depends on BR2_HOSTARCH = "x86_64"
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS

These two lines together don't make sense. If you select
BR2_HOSTARCH_NEEDS_IA32_LIBS, it's because the pre-built binaries are
for x86 32 bits, and therefore the 32 bit compat libraries are needed
when running on a x86-64 system. If pre-built binaries are for x86 32
bits, then surely the dependency on BR2_HOSTARCH = "x86_64" is not
correct.

But anyway as stated above, I don't think a Config.in.host file is
needed here.

> diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> new file mode 100644
> index 0000000000..be02130f28
> --- /dev/null
> +++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# arm-gnu-rm-toolchain
> +#
> +################################################################################
> +
> +ARM_GNU_RM_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2
> +ARM_GNU_RM_TOOLCHAIN_VERSION = 7-2018-q2-update
> +ARM_GNU_RM_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)-linux.tar.bz2
> +
> +define HOST_ARM_GNU_RM_TOOLCHAIN_EXTRACT_CMDS
> +	$(TAR) xf $(HOST_ARM_GNU_RM_TOOLCHAIN_DL_DIR)/$(ARM_GNU_RM_TOOLCHAIN_SOURCE) -C $(BUILD_DIR)
> +	mv $(BUILD_DIR)/gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)/* $(@D)
> +	rmdir $(BUILD_DIR)/gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)/
> +endef

Why do you need custom extract commands ? It seems to be just a regular
tarball.

> +
> +define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/opt/gcc-arm/
> +	cp -a $(@D)/* $(HOST_DIR)/opt/gcc-arm/

Install in gcc-arm-none-eabi so that it's clear it's a bare-metal
toolchain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
