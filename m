From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 19:43:18 +0100
Subject: [Buildroot] [PATCH] package/openFPGALoader: new package
In-Reply-To: <20200217181825.29766-1-jeanburgat33@gmail.com>
References: <20200217181825.29766-1-jeanburgat33@gmail.com>
Message-ID: <20200217194318.3733ee25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! See below for a number of comments.

On Mon, 17 Feb 2020 19:18:24 +0100
Jean Burgat <jeanburgat33@gmail.com> wrote:

> Signed-off-by: Jean Burgat <jeanburgat33@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/openFPGALoader/Config.in           | 18 ++++++++++++++++++
>  package/openFPGALoader/openFPGALoader.hash |  3 +++
>  package/openFPGALoader/openFPGALoader.mk   | 13 +++++++++++++
>  4 files changed, 35 insertions(+)

Could you add an entry to the DEVELOPERS file for this package ?

Also, could you name the package openfpgaloader, i.e in lower-case ?

> diff --git a/package/openFPGALoader/Config.in b/package/openFPGALoader/Config.in
> new file mode 100644
> index 0000000000..0e96e81906
> --- /dev/null
> +++ b/package/openFPGALoader/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_OPENFPGALOADER
> +	bool "openFPGALoader"

	bool "openfpgaloader"

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

This dependency is also because of libftdi1

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # argp

Use the argp-standalone package to provide argp functionality for
non-glibc toolchains.

> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
> +	depends on BR2_USE_WCHAR # libftdipp1
> +	select BR2_PACKAGE_LIBFTDI1
> +	select BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
> +	help
> +	  Universal utility for programming FPGA
> +
> +	  https://github.com/trabucayre/openFPGALoader/
> +
> +comment "openFPGALoader needs a glibc toolchain w/ threads, wchar, C++, udev"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

So here you will be able to lift the glibc dependency thanks to
argp-standalone.

> diff --git a/package/openFPGALoader/openFPGALoader.mk b/package/openFPGALoader/openFPGALoader.mk
> new file mode 100644
> index 0000000000..6706e7ffbf
> --- /dev/null
> +++ b/package/openFPGALoader/openFPGALoader.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# openFPGALoader

lower case.

> +#
> +################################################################################
> +
> +OPENFPGALOADER_VERSION = 849e5751e06d4d00f323205d5f02ee01f9f59a61
> +OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,$(OPENFPGALOADER_VERSION))
> +OPENFPGALOADER_LICENSE = AGPL-3.0

Interesting to use the AGPL for such a project, but oh well :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
