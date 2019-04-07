From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Apr 2019 23:33:21 +0200
Subject: [Buildroot] [git commit] package/gettext: turn into virtual
 package
In-Reply-To: <20190331121707.C1C2D86602@busybox.osuosl.org>
References: <20190331121707.C1C2D86602@busybox.osuosl.org>
Message-ID: <e1d4694d-420f-c479-7595-a1ccebed4f2e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 31/03/2019 ? 14:04, Thomas Petazzoni a ?crit?:
> commit: https://git.buildroot.net/buildroot/commit/?id=ea1e7ee6068265d3f8ade97a387d77c77335b38e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Re-work gettext to be a virtual package which may allow to use
> different gettext's providers, and rename the original one into
> gettext-gnu package.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

[...]

>  
> -config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
> -	bool
> -	default y if BR2_SYSTEM_ENABLE_NLS
> -	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
> +config BR2_PACKAGE_PROVIDES_GETTEXT
> +	default "gettext-gnu"
>  
>  endif
>  

[...]

> diff --git a/package/gettext/gettext.mk b/package/gettext-gnu/gettext-gnu.mk
> similarity index 57%
> copy from package/gettext/gettext.mk
> copy to package/gettext-gnu/gettext-gnu.mk
> index ec9588f8ad..61adf72738 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext-gnu/gettext-gnu.mk
> @@ -1,23 +1,24 @@
>  ################################################################################
>  #
> -# gettext
> +# gettext-gnu
>  #
>  ################################################################################
>  
> -GETTEXT_VERSION = 0.19.8.1
> -GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
> -GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
> -GETTEXT_INSTALL_STAGING = YES
> -GETTEXT_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
> -GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
> +GETTEXT_GNU_VERSION = 0.19.8.1
> +GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
> +GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
> +GETTEXT_GNU_INSTALL_STAGING = YES
> +GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
> +GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
>  # 0002-Update-after-gnulib-changed.patch
> -GETTEXT_AUTORECONF = YES
> -GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +GETTEXT_GNU_AUTORECONF = YES
> +GETTEXT_GNU_PROVIDES = gettext
> +GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  

[...]

>  
>  # Force the build of libintl, even if the C library provides a stub
>  # gettext implementation
> -ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> -GETTEXT_CONF_OPTS += --with-included-gettext
> +ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)

It seems this patch introduced a typo here, There is no
BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL option but
BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL.

Even with this patch my host-flex build is broken.

Best regards,
Romain
