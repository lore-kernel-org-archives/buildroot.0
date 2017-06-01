From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jun 2017 10:37:13 +0200
Subject: [Buildroot] [PATCH] new package: ratpoison
In-Reply-To: <20170512220246.18575-1-mrugiero@gmail.com>
References: <20170512220246.18575-1-mrugiero@gmail.com>
Message-ID: <20170601103713.7cad99d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution. However, there's a number of things that
aren't really correct in the patch. See my comments below.

On Fri, 12 May 2017 19:02:46 -0300, Mario J. Rugiero wrote:

>  package/Config.in                |  1 +
>  package/ratpoison/Config.in      | 22 ++++++++++++++++++++++
>  package/ratpoison/ratpoison.hash |  2 ++
>  package/ratpoison/ratpoison.mk   | 22 ++++++++++++++++++++++

Missing addition to the DEVELOPERS file.

> +config BR2_PACKAGE_RATPOISON
> +	bool "ratpoison"
> +	depends on BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7

BR2_PACKAGE_XORG doesn't exist, so this should just be:

	depends on BR2_PACKAGE_XORG7	

> +	depends on BR2_PACKAGE_XLIB_LIBX11

This should be a "select".

> +	select BR2_PACKAGE_LIBERATION
> +	select BR2_PACKAGE_FONTCONFIG

And please order selects by alphabetic ordering.

> +	help
> +	  Ratpoison is a simple Window Manager. It is largely modelled after
> +	  GNU Screen and focuses on the keyboard instead of a mouse.
> +
> +	  The screen can be split into non-overlapping frames.
> +	  All windows are kept maximized inside their frames to take full
> +	  advantage of your precious screen real estate. 
> +
> +	  http://www.nongnu.org/ratpoison/
> +
> +config BR2_PACKAGE_RATPOISON_RANDR
> +	bool "Xrandr support"
> +	depends on BR2_PACKAGE_RATPOISON
> +	depends on BR2_PACKAGE_XLIB_LIBXRANDR
> +	help
> +	  Build ratpoison with randr support, mainly for multihead.

No need for a sub-option, just enable xrandr support in the .mk file
when BR2_PACKAGE_XLIB_LIBXRANDR is enabled.

> diff --git a/package/ratpoison/ratpoison.hash b/package/ratpoison/ratpoison.hash
> new file mode 100644
> index 000000000..0f6e169d4
> --- /dev/null
> +++ b/package/ratpoison/ratpoison.hash
> @@ -0,0 +1,2 @@
> +#Locally computed

Space between # and Locally.

> +sha256 d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1 ratpoison-1.4.9.tar.xz
> diff --git a/package/ratpoison/ratpoison.mk b/package/ratpoison/ratpoison.mk
> new file mode 100644
> index 000000000..1545cb17c
> --- /dev/null
> +++ b/package/ratpoison/ratpoison.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# ratpoison
> +#
> +#############################################################

Wrong number of #. Please pass your package through
supports/scripts/check-package before submission.

> +RATPOISON_VERSION = 1.4.9
> +RATPOISON_SOURCE = ratpoison-$(RATPOISON_VERSION).tar.xz
> +RATPOISON_SITE = http://download.savannah.nongnu.org/releases/ratpoison

Missing license and license file.

> +
> +RATPOISON_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
> +		      --x-libraries=$(STAGING_DIR)/usr/lib
> +
> +RATPOISON_DEPENDENCIES = $(XSERVER) xlib_libX11

$(XSERVER) doesn't exist.

> +
> +ifeq ($(BR2_PACKAGE_RATPOISON_RANDR),y)
> +	RATPOISON_DEPENDENCIES += xlib_libXrandr
> +else
> +	RATPOISON_CONF_OPTS += --without-xrandr
> +endif

Please replace with:

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
RATPOISON_DEPENDENCIES += xlib_libXrandr
RATPOISON_CONF_OPTS += --with-xrandr
else
RATPOISON_CONF_OPTS += --without-xrandr
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
