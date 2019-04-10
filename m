From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 11:50:46 +0200
Subject: [Buildroot] [PATCH] package: coreutils: allow building
 individual binaries
In-Reply-To: <20190409220454.736-1-mmayer@broadcom.com>
References: <20190409220454.736-1-mmayer@broadcom.com>
Message-ID: <20190410115046.6b78289a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Tue,  9 Apr 2019 15:04:54 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> so that coreutils can be built and installed as individual binaries.
> 
> The approach is modelled after Busybox's similarly named configuration
> option.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Thanks for your patch. Could you adjust the commit log to explain the
use case for wanting individual binaries ? The change looks perfectly
OK, but it's good to have an explanation of the "why".

Also, the commit title prefix should be "package/coreutils" and not
"package: coreutils".

More comments below.

> diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
> index 11a6019e820f..0142db4bddd1 100644
> --- a/package/coreutils/Config.in
> +++ b/package/coreutils/Config.in
> @@ -19,3 +19,17 @@ comment "coreutils needs a toolchain w/ wchar"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +
> +config BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> +	bool "Individual binaries"
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  By default (i.e. with this option disabled), coreutils is
> +	  installed as a single binary (Busybox style) called
> +	  /usr/bin/coreutils, and all core utilities are symbolic
> +	  links to this binary.
> +
> +	  With this option enabled, each utility is a separate binary.
> +
> +comment "Coreutils individual binaries need a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS

All this code should be enclosed in a if BR2_PACKAGE_COREUTILS .. endif
block, otherwise this option appears even when coreutils is disabled.

The comment should use "coreutils" and not "Coreutils"

> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 3e8efbf04706..37351663f705 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -14,7 +14,11 @@ COREUTILS_LICENSE_FILES = COPYING
>  COREUTILS_AUTORECONF = YES
>  COREUTILS_GETTEXTIZE = YES
>  
> -COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
> +ifneq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
> +	CUSTOM_COREUTILS_CONF_OPTS=--enable-single-binary=symlinks
> +endif
> +
> +COREUTILS_CONF_OPTS = --disable-rpath $(CUSTOM_COREUTILS_CONF_OPTS) \
>  	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)

Please do it like this:

COREUTILS_CONF_OPTS = \
	--disable-rpath \
	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)

ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
