From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 21:47:30 +0200
Subject: [Buildroot] [RFC PATCH v4 3/9] at-spi2-atk: new package
In-Reply-To: <20180614224820.27126-4-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-4-joseph.kogut@gmail.com>
Message-ID: <20180615214730.4428402a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

Pretty much the same comments as for the at-spi2-core package. See
below.

On Thu, 14 Jun 2018 15:48:14 -0700, Joseph Kogut wrote:

> diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
> new file mode 100644
> index 0000000000..b354c77ffe
> --- /dev/null
> +++ b/package/at-spi2-atk/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_AT_SPI2_ATK
> +	bool "at-spi2-atk"
> +	select BR2_PACKAGE_AT_SPI2_CORE

You also need to select BR2_PACKAGE_ATK and BR2_PACKAGE_LIBGLIB2 to be
consistent with the dependencies variable in your .mk file. And of
course, propagate the "depends on".

> +	help
> +	  The At-Spi2 Atk package contains a library that bridges ATK to At-Spi2 D-Bus service.

Line too long, missing upstream URL. Please run ./utils/check-package

> diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
> new file mode 100644
> index 0000000000..6f7d68ab87
> --- /dev/null
> +++ b/package/at-spi2-atk/at-spi2-atk.hash
> @@ -0,0 +1,4 @@
> +# locally calculated
> +sha256 61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e  at-spi2-atk-2.26.2.tar.xz
> +sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
> +

Line not needed.

> diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
> new file mode 100644
> index 0000000000..a3bccbb0d9
> --- /dev/null
> +++ b/package/at-spi2-atk/at-spi2-atk.mk
> @@ -0,0 +1,17 @@
> +###############################################################################
> +#
> +# at-spi2-atk
> +#
> +###############################################################################
> +
> +AT_SPI2_ATK_VERSION_MAJOR = 2.26
> +AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
> +AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
> +AT_SPI2_ATK_SITE =  http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
> +ATK_LICENSE = LGPL-2.0+
> +ATK_LICENSE_FILES = COPYING
> +AT_SPI2_ATK_INSTALL_STAGING = YES
> +AT_SPI2_ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install

Those LDFLAGS should not be needed, they are the default.

> +AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
> +
> +$(eval $(autotools-package))

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
