From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 12:07:37 +0100
Subject: [Buildroot] [PATCH 1/9] boot: Add new bootloader afboot-stm32
In-Reply-To: <1455901745-18486-2-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
 <1455901745-18486-2-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222120737.510e31f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lee,

On Fri, 19 Feb 2016 17:08:57 +0000, Lee Jones wrote:

> diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
> new file mode 100644
> index 0000000..d6fe13c
> --- /dev/null
> +++ b/boot/afboot-stm32/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_TARGET_AFBOOT_STM32
> +	bool "afboot-stm32"
> +	select BR2_PACKAGE_HOST_OPENOCD

There's no real reason to select host-openocd here. It's not needed to
build/use the bootloader. One could use a different flashing program.

> diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
> new file mode 100644
> index 0000000..60ab3b7
> --- /dev/null
> +++ b/boot/afboot-stm32/afboot-stm32.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# afboot-stm32
> +#
> +################################################################################
> +
> +AFBOOT_STM32_VERSION = v0.1
> +AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))

Since you're sourcing from Github, please add a .hash file for this new
package.

> +define AFBOOT_STM32_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
> +endef
> +
> +define AFBOOT_STM32_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/stm32*.bin $(BINARIES_DIR)

Get rid of the -D option here.

Other than those minor nits, it looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
