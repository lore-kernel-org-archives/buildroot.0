From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:45:07 +0200
Subject: [Buildroot] [PATCH v2] package/uacme: new package
In-Reply-To: <20190501141234.GA10484@einstein.dilieto.eu>
References: <20190501141234.GA10484@einstein.dilieto.eu>
Message-ID: <20191002234507.23806140@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicola,

Thanks for your contribution, and sorry for the very slow answer.

On Wed, 1 May 2019 16:12:34 +0200
Nicola Di Lieto <nicola.dilieto@gmail.com> wrote:

> +UACME_VERSION = 1.0.7

I updated to the latest version 1.0.19

> +# Released versions are on branch upstream/latest, tagged as upstream/X.Y.Z
> +# Do not use vX.Y.Z tags from master, as they do not include .tarball-version
> +UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
> +UACME_LICENSE = GPL-3.0+
> +UACME_LICENSE_FILES = COPYING

You forgot:

UACME_DEPENDENCIES = libcurl

> +
> +UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug

I dropped these, we typically leave the default.

> +
> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +UACME_CONF_OPTS += --with-mbedtls
> +UACME_DEPENDENCIES += mbedtls
> +else
> +UACME_CONF_OPTS += --without-mbedtls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +UACME_CONF_OPTS += --with-gnutls=

The = at the end of the line here was not needed.

> +UACME_DEPENDENCIES += gnutls
> +else
> +UACME_CONF_OPTS += --without-gnutls
> +endif
> +
> +$(eval $(autotools-package))

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
