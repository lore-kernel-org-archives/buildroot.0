From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:38:53 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linuxconsoletools: bump
 version to 1.7.0
In-Reply-To: <20191117135913.GD13372@coltrane>
References: <20191117135913.GD13372@coltrane>
Message-ID: <20191118223853.64c89953@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Koen,

Thanks for your contribution and this new version of your patch!

On Sun, 17 Nov 2019 14:59:13 +0100
Koen Martens <gmc@sonologic.nl> wrote:

> This version changed the (optional) dependency from sdl and
> sdl-config to sdl2 and pkg-config. Therefore, the patch that
> provided the correct path to sdl-config has been dropped and
> the dependency has been changed to BR2_PACKAGE_SDL2.
> 
> Somehow, SDL2 fails to build without shared library support,
> but this is not explicitly depended on by SDL2,

I don't understand why you say that, because:

config BR2_PACKAGE_SDL2
        bool "sdl2"
        depends on !BR2_STATIC_LIBS

> therefore
> a dependency to BR2_SHARED_LIBS was added to the force-
> feedback utility configuration option.

The reason you have to do this is because a "select" is "stronger" than
a "depends on", so if you "select BR2_PACKAGE_SDL2", the depends on of
BR2_PACKAGE_SDL2 on !BR2_STATIC_LIBS is ignored, and that's why you
have to replicate this depends on !BR2_STATIC_LIBS.

> -LINUXCONSOLETOOLS_VERSION = 1.6.1
> +LINUXCONSOLETOOLS_VERSION = 1.7.0
>  LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
>  LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
>  LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
> @@ -21,8 +21,8 @@ endif
>  ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
>  LINUXCONSOLETOOLS_MAKE_OPTS += \
>  	ENABLE_FORCEFEEDBACK=1 \
> -	SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
> -LINUXCONSOLETOOLS_DEPENDENCIES += sdl
> +	CFLAGS="--std=gnu99"

This looks wrong because you're no longer passing TARGET_CFLAGS, so
this should be:

	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

(I think the option is -std, not --std).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
