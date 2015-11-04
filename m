From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 5 Nov 2015 00:12:41 +0100
Subject: [Buildroot] [PATCH v3 1/3] chocolate-doom: new package
In-Reply-To: <1445879578-404-1-git-send-email-rprebello@gmail.com>
References: <1445879578-404-1-git-send-email-rprebello@gmail.com>
Message-ID: <563A90E9.9010503@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rodrigo,

Le 26/10/2015 18:12, Rodrigo Rebello a ?crit :
> Chocolate Doom is a set of conservative source ports for Doom, Heretic,
> Hexen and Strife, with a philosophy of preserving the look, feel, and
> bugs of the vanilla versions of each.
> 
> http://www.chocolate-doom.org
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v2 -> v3:
>   - Rewrite commit message for upstream patch 2 (hopefully clearer now);
>   - Include upstream status in patches.
> ---
>  package/Config.in                                  |  1 +
>  ...ruct-attribute-directive-ignored-warnings.patch | 49 ++++++++++++++++
>  ...-configure-fix-with-PACKAGE-option-checks.patch | 67 ++++++++++++++++++++++
>  package/chocolate-doom/Config.in                   | 12 ++++
>  package/chocolate-doom/chocolate-doom.hash         |  2 +
>  package/chocolate-doom/chocolate-doom.mk           | 43 ++++++++++++++
>  6 files changed, 174 insertions(+)
>  create mode 100644 package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
>  create mode 100644 package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch
>  create mode 100644 package/chocolate-doom/Config.in
>  create mode 100644 package/chocolate-doom/chocolate-doom.hash
>  create mode 100644 package/chocolate-doom/chocolate-doom.mk

[snip]

> diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
> new file mode 100644
> index 0000000..5e0d9c1
> --- /dev/null
> +++ b/package/chocolate-doom/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CHOCOLATE_DOOM
> +	bool "chocolate-doom"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_SDL
> +	select BR2_PACKAGE_SDL_MIXER
> +	select BR2_PACKAGE_SDL_NET

I build tested your package with several toolchains and there is an issue with
uClibc/uClibc-ng toolchain on powerpc (at least).

For some architectures there is no sys/io.h (see opl_linux.c:26:20)

> +	help
> +	  Chocolate Doom is a set of conservative source ports for Doom,
> +	  Heretic, Hexen and Strife, with a philosophy of preserving the
> +	  look, feel, and bugs of the vanilla versions of each.
> +
> +	  http://www.chocolate-doom.org
> diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
> new file mode 100644
> index 0000000..bdf5698
> --- /dev/null
> +++ b/package/chocolate-doom/chocolate-doom.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	ad11e2871667c6fa0658abf2dcba0cd9b26fbd651ee8df55adfdc18ad8fd674a	chocolate-doom-2.2.1.tar.gz
> diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
> new file mode 100644
> index 0000000..78e6628
> --- /dev/null
> +++ b/package/chocolate-doom/chocolate-doom.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# chocolate-doom
> +#
> +################################################################################
> +
> +CHOCOLATE_DOOM_VERSION = 2.2.1
> +CHOCOLATE_DOOM_SOURCE = chocolate-doom-$(CHOCOLATE_DOOM_VERSION).tar.gz
> +CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
> +CHOCOLATE_DOOM_LICENSE = GPLv2+
> +CHOCOLATE_DOOM_LICENSE_FILES = COPYING
> +CHOCOLATE_DOOM_AUTORECONF = YES

Can you add a comment to say why the package needs autoreconf ?

> +CHOCOLATE_DOOM_DEPENDENCIES = sdl sdl_mixer sdl_net
> +
> +# Avoid installing desktop entries, icons, etc.
> +CHOCOLATE_DOOM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# SDL_mixer uses symbols from SDL, but ends up after it on the link
> +# cmdline. Fix it by forcing the SDL libs at the very end.
> +CHOCOLATE_DOOM_CONF_ENV = LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
> +endif
> +
> +CHOCOLATE_DOOM_CONF_OPTS = \
> +	--disable-sdltest \
> +	--with-sdl-prefix=$(STAGING_DIR)/usr \
> +	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +	CHOCOLATE_DOOM_DEPENDENCIES += libpng
> +	CHOCOLATE_DOOM_CONF_OPTS += --with-libpng

Please don't indent here.

> +else
> +	CHOCOLATE_DOOM_CONF_OPTS += --without-libpng

same
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> +	CHOCOLATE_DOOM_DEPENDENCIES += libsamplerate
> +	CHOCOLATE_DOOM_CONF_OPTS += --with-libsamplerate

same

> +else
> +	CHOCOLATE_DOOM_CONF_OPTS += --without-libsamplerate

same

Otherwise, the packaging looks good.

Best regards,
Romain

> +endif
> +
> +$(eval $(autotools-package))
> 
