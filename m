From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 21:41:05 +0100
Subject: [Buildroot] [RFC PATCH] Add OpenTyrian package (SDL game)
In-Reply-To: <1391624243-10898-1-git-send-email-julien.boibessot@free.fr>
References: <1391624243-10898-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140205214105.197ea58c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Feb 2014 19:17:23 +0100, julien.boibessot at free.fr wrote:

> diff --git a/package/opentyrian/Config.in b/package/opentyrian/Config.in
> new file mode 100644
> index 0000000..81050bd
> --- /dev/null
> +++ b/package/opentyrian/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_OPENTYRIAN
> +	bool "OpenTyrian"
> +	select BR2_PACKAGE_SDL
> +	select BR2_PACKAGE_SDL_NET

Why are you selecting SDL_NET here, and then provide an option for the
network support below? This looks odd.

> +	help
> +	  OpenTyrian is a port of the DOS shoot-em-up Tyrian. It uses SDL,
> +	  making it easily cross-platform.
> +	  The original Tyrian data files, that have since been released as
> +	  Freeware, will be installed.
> +	  A display with minimum 640x480 resolution and a keyboard are needed
> +	  to play the game.
> +	  If you want some sound, activate ALSA with OSS emulation.
> +
> +	  http://code.google.com/p/opentyrian/
> +
> +if BR2_PACKAGE_OPENTYRIAN
> +
> +config BR2_PACKAGE_OPENTYRIAN_NET
> +	bool "network support"
> +	default y
> +	select BR2_PACKAGE_SDL_NET
> +	help
> +	  Activates network support in OpenTyrian. Will add SDL_net.
> +
> +endif
> diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
> new file mode 100644
> index 0000000..f0a635d
> --- /dev/null
> +++ b/package/opentyrian/opentyrian.mk
> @@ -0,0 +1,55 @@
> +###############################################################################
> +#
> +# OpenTyrian

All lower-case.

> +#
> +###############################################################################
> +
> +OPENTYRIAN_VERSION = 2.1.20130907
> +OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases/
> +OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION)-src.tar.gz
> +OPENTYRIAN_LICENSE = GPLv2+ Freeware

What is under GPLv2+ and what is under a Freeware license?

> +OPENTYRIAN_LICENSE_FILES = COPYING README
> +
> +OPENTYRIAN_DEPENDENCIES = sdl
> +
> +ifeq ($(BR2_PACKAGE_OPENTYRIAN_NET),y)
> +OPENTYRIAN_DEPENDENCIES += sdl_net
> +OPENTYRIAN_NETWORK = true
> +else
> +OPENTYRIAN_NETWORK = false
> +endif
> +
> +OPENTYRIAN_DATA = tyrian21.zip
> +OPENTYRIAN_DATA_SITE = http://sites.google.com/a/camanis.net/opentyrian/tyrian/
> +
> +define OPENTYRIAN_DOWNLOAD_DATA
> +	@$(call MESSAGE,Downloading data)
> +#	@$(call DOWNLOAD,$(OPENTYRIAN_DATA_SITE),$(OPENTYRIAN_DATA)) << doesn't work !!

Even if it was working, it is not a good solution, because it does not
integrate properly with the download and licensing infrastructure.

We have the <pkg>_EXTRA_DOWNLOADS, but it works only if the file has to
be downloaded from the same site.

So my recommendation would be to create a separate package called
opentyrian-data, that installs this. And unless the data is needed at
build time, this package can be a runtime dependency, i.e selected from
Config.in, but not mentioned in OPENTYRIAN_DEPENDENCIES.

> +	cd $(DL_DIR); $(WGET) -nc $(OPENTYRIAN_DATA_SITE)/$(OPENTYRIAN_DATA)
> +endef
> +OPENTYRIAN_POST_DOWNLOAD_HOOKS += OPENTYRIAN_DOWNLOAD_DATA
> +
> +define OPENTYRIAN_EXTRACT_DATA
> +	unzip $(DL_DIR)/$(OPENTYRIAN_DATA) -d $(@D)
> +endef
> +OPENTYRIAN_POST_EXTRACT_HOOKS += OPENTYRIAN_EXTRACT_DATA
> +
> +define OPENTYRIAN_BUILD_CMDS
> +        $(MAKE) PLATFORM=UNIX \
> +		CC="$(TARGET_CC)" \
> +		STRIP="$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)" \
> +		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
> +		LDFLAGS="-lm" \
> +		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
> +		-C $(@D) release
> +endef
> +
> +define OPENTYRIAN_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(TARGET_DIR)/usr/games/opentyrian
> +	mkdir -p $(TARGET_DIR)/usr/share/opentyrian/data/
> +	cp $(@D)/tyrian21/* $(TARGET_DIR)/usr/share/opentyrian/data/
> +	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.doc
> +	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.exe
> +endef
> +
> +$(eval $(generic-package))

Other than that, it looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
