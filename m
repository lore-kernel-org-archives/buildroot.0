From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:09:15 +0100
Subject: [Buildroot] [PATCH try 2] wine: New package
In-Reply-To: <54AC4E25.4050601@dawncrow.de>
References: <54AC4E25.4050601@dawncrow.de>
Message-ID: <20150107220915.3f5bbb2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Tue, 06 Jan 2015 22:05:41 +0100, Andr? Hentschel wrote:
> Adds new package: wine
> 
>   Wine is a compatibility layer capable of running Windows applications on Linux.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
> No comments on my last RFC makes me think it's good enough for submission.
> try 2: Fix issue spotted by baruch

Thanks for this new version. See some comments below.

First, one thing that surprises me is the number of optional features
that you try to support. Did you really tried all of them? Are you
using all of them? In general, when we add a new package, we don't
necessarily try to support all possible optional dependencies, because
it's not necessarily easy.

But well, as long as you're ready to fix potential build issues that
will arise in the autobuilders after building the wine package, I'm
fine :-)

> +WINE_VERSION = 1.6.2
> +WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
> +WINE_SITE = http://source.winehq.org/git/wine.git/snapshot/

Since you're download a tarball, please add a wine.hash file. See the
Buildroot manual for more details about hash files.

> +WINE_LICENSE = LGPLv2.1+
> +WINE_LICENSE_FILES = COPYING.LIB
> +WINE_INSTALL_TARGET = YES
> +WINE_DEPENDENCIES = host-wine
> +
> +#Wine needs its own directory structure and tools for cross compiling
> +WINE_CONF_OPTS += --with-wine-tools=../host-wine-$(WINE_VERSION)
> +WINE_CONF_OPTS += --disable-tests
> +WINE_CONF_OPTS += --without-opengl
> +WINE_CONF_OPTS += $(if $(BR2_ARCH_IS_64),--enable-win64)

Please use only one assigment:

WINE_CONF_OPTS = \
	--with-wine-tools=... \
	--disable-tests \
	--without-opengl \
	$(if ...)


> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
> +	WINE_CONF_OPTS += --with-freetype
> +	HOST_WINE_CONF_OPTS += --with-freetype
> +	WINE_DEPENDENCIES += freetype
> +	HOST_WINE_DEPENDENCIES += host-freetype

This is not correct: BR2_PACKAGE_FREETYPE indicates that the target
freetype package is enabled, not that we want freetype support in
host-wine. Please only adjust WINE_CONF_OPTS and WINE_DEPENDENCIES, not
HOST_WINE_CONF_OPTS and HOST_WINE_DEPENDENCIES. Unless you have a
really good reason to do so, which should be explained in a comment.

> +else
> +	WINE_CONF_OPTS += --without-freetype
> +	HOST_WINE_CONF_OPTS += --without-freetype
> +endif

Ditto.

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +	WINE_CONF_OPTS += --with-x
> +	WINE_DEPENDENCIES += xlib_libX11
> +else
> +	WINE_CONF_OPTS += --without-x
> +endif

If you do this, then you need:

	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7

in wine/Config.in.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
