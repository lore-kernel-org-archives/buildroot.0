From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:52:55 +0200
Subject: [Buildroot] [PATCH v5 3/4] toolchain-external-andes-nds32: new
 package
In-Reply-To: <20190416072545.17633-4-nylon7@andestech.com>
References: <20190416072545.17633-1-nylon7@andestech.com>
 <20190416072545.17633-4-nylon7@andestech.com>
Message-ID: <20190417095255.0624b2f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Apr 2019 15:25:44 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> This commit adds a new package for the Andes external toolchain for
> the nds32 Little Endian architecture.
> 
> https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>

First of all, this patch should have been *before* the defconfig patch,
and the defconfig should have used this external toolchain package.

In addition, this patch had many problems. It was clearly not tested
properly, see below for the details.

> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 1f14f0350a..5135168890 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -124,6 +124,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
>  # ARC
>  source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
>  
> +# Andes
> +source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options"

You forgot to also include the Config.in file, so the toolchain could
not be visible in menuconfig.

> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> new file mode 100644
> index 0000000000..af57d6cd06
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32

This was missing:

	bool "Andes nds32"

so that the toolchain has a visible option.

> +	depends on BR2_nds32
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17

The toolchain provides RPC and SSP support, so this is missing:

	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
	select BR2_TOOLCHAIN_HAS_SSP

> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
> new file mode 100644
> index 0000000000..3632e59564
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
> @@ -0,0 +1,14 @@
> +if BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
> +
> +config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> +	default "nds32le-linux"
> +
> +config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> +	default "toolchain-external-andes-nds32"
> +
> +config BR2_TOOLCHAIN_EXTERNAL_URL
> +	string "Toolchain URL"
> +	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
> +	help
> +	  URL of the custom toolchain tarball to download and install.

This option is totally unnecessary, the toolchain URL is defined in
the .mk and should not be configurable.

> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash

This file should have been named toolchain-external-andes-nds32.hash to
match the package name.

> new file mode 100644
> index 0000000000..4314bb1f55
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash
> @@ -0,0 +1,2 @@
> +# From https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
> +sha256 6050601df85ad93a4c211c1d57ed3773edb62aa505f7e07d7d555652e83af2cc  nds32le-linux-glibc-v3-upstream.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk

This file should have been named toolchain-external-andes-nds32.mk to
match the package name.

> new file mode 100644
> index 0000000000..c0df49e716
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk
> @@ -0,0 +1,10 @@
> +################################################################################
> +#
> +# toolchain-external-andes-nds32
> +#
> +################################################################################

Missing empty line here.

> +TOOLCHAIN_EXTERNAL_ANDES_NDS32_SITE = https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/$(TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE)

This URL is wrong, as it finishes with the file name, while it should
not. The download clearly doesn't work with this.

> +TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE = nds32le-linux-glibc-v3-upstream.tar.gz
> +
> +$(eval $(toolchain-external-package))
> +

This empty line at the end of the file was causing a check-package
warning.

I fixed all those issues and applied the patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
