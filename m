From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:14:25 +0200
Subject: [Buildroot] [PATCH v5 1/3] package/arm-gnu-a-toolchain: new
 package
In-Reply-To: <1585371871-29406-2-git-send-email-sunil@amarulasolutions.com>
References: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
 <1585371871-29406-2-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200329151425.25f92077@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied your patch, but after doing a number of changes, see below.

On Sat, 28 Mar 2020 10:34:29 +0530
sunil at amarulasolutions.com wrote:

>  DEVELOPERS                                         |  3 +++
>  package/Config.in.host                             |  1 +
>  package/arm-gnu-a-toolchain/Config.in.host         |  9 ++++++++

I've entirely dropped the visible Config.in.host option for this
package, it is merely a build dependency of ATF, so we don't need (at
this point at least) a visible option.

> +N:	Suniel Mahesh <sunil@amarulasolutions.com>
> +F:	package/arm-gnu-a-toolchain

Directories end with a / in DEVELOPERS.

> +config BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN
> +	bool "host arm-gnu-a-toolchain"
> +	help
> +	  arm trusted firmware requires a bare metal toolchain to build some platforms
> +	  which host cortex-m series core, for instance rockchip rk3399 has a cortex-m0 core. 
> +	  This package installs a pre-built cross-compilation ARM-A bare metal toolchain for
> +	  the host machine.

Lines where way too long: you forgot to run "make check-package", which
would have pointed out this coding style issue. Of course, since I
dropped the Config.in.host, it was not a big issue.

> --- /dev/null
> +++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# arm-gnu-a-toolchain
> +#
> +################################################################################
> +
> +ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel

You should have used the <pkg>_VERSION variable here instead of hardcoding 9.2-2019.12.

> +ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
> +ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
> +ARM_GNU_A_TOOLCHAIN_LICENSE_FILES =

I've dropped this last variable, since it's empty.

> +HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
> +
> +define HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_CMDS
> +	rm -rf $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +	mkdir -p $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +	cp -rf $(@D)/* $(HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR)
> +
> +	cd $(HOST_DIR)/bin && \

You need to create $(HOST_DIR)/bin before cd-ing into it, as this
directory may not exist.

> +	for i in $(HOST_DIR)/opt/gcc-arm-none-eabi/bin/*; do \
> +		ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \

Simplified as:

        cd $(HOST_DIR)/bin && \
        for i in ../opt/gcc-arm-none-eabi/bin/*; do \
                ln -sf $$i; \
        done

I was also not sure these symlinks where really useful, it would have
been possible to pass an explicit path to the toolchain when building
ATF. But ok, I've kept the symlinks, we'll see how it goes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
