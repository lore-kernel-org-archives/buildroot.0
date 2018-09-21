From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 13:43:18 +0200
Subject: [Buildroot] [PATCH 1/1] Point libxslt to the correct location
 of libxml2
In-Reply-To: <20180921101913.4366-1-ferdinand@ombud.nl>
References: <20180921101913.4366-1-ferdinand@ombud.nl>
Message-ID: <20180921134318.78ba7545@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 12:19:14 +0200, Ferdinand van Aartsen wrote:
> Currently libxslt configure finds native /usr/bin/xml2-config.
> 
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>

Thanks for this contribution! The commit title should always follow the
format:

	<package>: <description>

so, something like:

	libxslt: point to the correct location of xml2-config

> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index 972d5b80d5..fb5d03ab44 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -13,7 +13,8 @@ LIBXSLT_LICENSE_FILES = COPYING
>  LIBXSLT_CONF_OPTS = \
>  	--with-gnu-ld \
>  	--without-debug \
> -	--without-python
> +	--without-python \
> +	--with-libxml-prefix=$(STAGING_DIR)/usr
>  LIBXSLT_CONFIG_SCRIPTS = xslt-config
>  LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
>  
> @@ -25,7 +26,11 @@ else
>  LIBXSLT_CONF_OPTS += --without-crypto
>  endif
>  
> -HOST_LIBXSLT_CONF_OPTS = --without-debug --without-python --without-crypto
> +HOST_LIBXSLT_CONF_OPTS = \
> +	--without-debug \
> +	--without-python \
> +	--without-crypto \
> +	--with-libxml-prefix=$(HOST_DIR)/usr

This should be just $(HOST_DIR), and not $(HOST_DIR)/usr.

Those two minor comments can be fixed when applying the patch, no need
to resend just for that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
