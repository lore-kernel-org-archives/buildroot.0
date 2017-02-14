From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Feb 2017 14:43:06 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
Message-ID: <CAAXf6LW6cYn74LCorK2OiCRQUhvZkhXAFDsodDrtWc2RSk3L-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2017 at 9:15 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> This commit teaches the generic package handling code how to extract .tar.lz
> archives. When lzip is not installed on the host, host-lzip gets built
> automatically.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3: split extractor-dependency to a separate patch (Thomas DS)
> v2: add host-extractor to fix host lzip check
> ---
>  Config.in                               |  7 +++++++
>  Makefile                                |  1 +
>  package/pkg-utils.mk                    |  1 +
>  support/dependencies/check-host-lzip.mk |  5 +++++
>  support/dependencies/check-host-lzip.sh | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 support/dependencies/check-host-lzip.mk
>  create mode 100755 support/dependencies/check-host-lzip.sh
>
> diff --git a/Config.in b/Config.in
> index ccd777e8bb00..bd8f0d1a10ee 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -158,6 +158,13 @@ config BR2_XZCAT
>           Command to be used to extract a xz'ed file to stdout.
>           Default is "xzcat"
>
> +config BR2_LZCAT
> +       string "lzcat command"
> +       default "lzip -d -c"
> +       help
> +         Command to be used to extract a lzip'ed file to stdout.
> +         Default is "lzip -d -c"
> +
>  config BR2_TAR_OPTIONS
>         string "Tar options"
>         default ""
> diff --git a/Makefile b/Makefile
> index df3b64eb03ec..b4550e098958 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -431,6 +431,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  ZCAT := $(call qstrip,$(BR2_ZCAT))
>  BZCAT := $(call qstrip,$(BR2_BZCAT))
>  XZCAT := $(call qstrip,$(BR2_XZCAT))
> +LZCAT := $(call qstrip,$(BR2_LZCAT))
>  TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>
>  # packages compiled for the host go here
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 4821456da5b0..9c9b3bea9f30 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -36,6 +36,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
>  # Define extractors for different archive suffixes
>  INFLATE.bz2  = $(BZCAT)
>  INFLATE.gz   = $(ZCAT)
> +INFLATE.lz   = $(LZCAT)
>  INFLATE.lzma = $(XZCAT)
>  INFLATE.tbz  = $(BZCAT)
>  INFLATE.tbz2 = $(BZCAT)
> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
> new file mode 100644
> index 000000000000..708105acd892
> --- /dev/null
> +++ b/support/dependencies/check-host-lzip.mk
> @@ -0,0 +1,5 @@
> +ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
> +DEPENDENCIES_HOST_PREREQ += host-lzip
> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
> +endif
> diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
> new file mode 100755
> index 000000000000..4f8a2ba3de5b
> --- /dev/null
> +++ b/support/dependencies/check-host-lzip.sh
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +candidate="$1"
> +
> +lzip=`which $candidate 2>/dev/null`
> +if [ ! -x "$lzip" ]; then
> +       lzip=`which lzip 2>/dev/null`
> +       if [ ! -x "$lzip" ]; then
> +               # echo nothing: no suitable lzip found
> +               exit 1
> +       fi
> +fi
> +
> +echo $lzip

Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
