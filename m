From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:01:04 +0100
Subject: [Buildroot] [PATCH v3 1/4] mv-ddr-marvell: new package
In-Reply-To: <20171203181818.10087-2-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-2-geomatsi@gmail.com>
Message-ID: <20171203230104.4675eeda@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As I replied on the cover letter, I've adopted this patch in my series,
after doing a number of changes. See below the details of the changes
I've made.

On Sun,  3 Dec 2017 21:18:15 +0300, Sergey Matyukevich wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index d96884b7fb..d223be9643 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1508,8 +1508,9 @@ F:	package/lua-resty-http/
>  F:	package/mpir/
>  
>  N:	Sergey Matyukevich <geomatsi@gmail.com>
> -F:	package/xr819-xradio/
> +F:	boot/mv-ddr-marvell/
>  F:	package/armbian-firmware/
> +F:	package/xr819-xradio/
>  F:	board/orangepi/orangepi-zero
>  F:	board/orangepi/orangepi-one
>  F:	board/linksprite/pcduino

You're mixing unrelated changes here, which is why I committed
separately the alphabetic ordering fix.

> diff --git a/boot/mv-ddr-marvell/Config.in b/boot/mv-ddr-marvell/Config.in
> new file mode 100644
> index 0000000000..d5c28af97a
> --- /dev/null
> +++ b/boot/mv-ddr-marvell/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_TARGET_MV_DDR_MARVELL
> +	bool "Marvell DDR training code for ATF"

I've changed that to use the package name mv-ddr-marvell, like we do
for all other packages (yes I know there are a few historical
exceptions in boot/).

> +	depends on BR2_aarch64
> +	help
> +	  Marvell keeps algorithms for DDR training in a separate repository.
> +	  This code is not built separately, it is needed as dependency
> +	  to build ATF firmware for Marvell Armada 7040 and 8040 SoCs.

I've rewrapped those lines that were too long, and added the URL to
the upstream project on Github.

> diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> new file mode 100644
> index 0000000000..e33065c24e
> --- /dev/null
> +++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# Marvell Armada DDR training code
> +#
> +################################################################################
> +
> +MV_DDR_MARVELL_VERSION = 656440a9690f3d07be9e3d2c39d7cf56fd96eb7b
> +MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
> +MV_DDR_MARVELL_LICENSE = GPL-2.0+, GPL-2.1 with FreeRTOS exception, BSD, Marvell Commercial

I've changed that to:

MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial

indeed, it's LGPL-2.1 and not GPL-2.1 (GPL-2.1 does not exist), the
SDPX license code for the FreeRTOS exception is
"freertos-exception-2.0", and BSD-3-Clause is the valid SPDX license
code matching the license.

> +MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
> +
> +define MV_DDR_MARVELL_SRC_SYMLINK
> +	ln -s $(BUILD_DIR)/mv-ddr-marvell-$(MV_DDR_MARVELL_VERSION) $(BUILD_DIR)/mv-ddr-marvell
> +endef
> +
> +MV_DDR_MARVELL_POST_EXTRACT_HOOKS += MV_DDR_MARVELL_SRC_SYMLINK

I've removed this post-extract hook. The ATF code will directly use the
mv-ddr code from its normal build directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
