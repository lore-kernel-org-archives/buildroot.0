From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Nov 2010 12:13:26 +0100
Subject: [Buildroot] [PATCH v2] autotools: add with/without and
 enable/disable helpers
In-Reply-To: <1290162216-30689-1-git-send-email-vapier@gentoo.org>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<1290162216-30689-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101119121326.3185e990@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Nov 2010 05:23:36 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Rather than have to write ugly logic in every package .mk file to check
> a config var and then expand into a --{en,dis}able-foo flag, add helpers
> so code can cleanly expand things.
> 
> A simple example:
> - ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
> - SDL_MIXER_CONF_OPT += --enable-music-ogg
> - else
> - SDL_MIXER_CONF_OPT += --disable-music-ogg
> - endif
> + SDL_MIXER_CONF_OPT += $(call USE_ENABLE,PACKAGE_LIBVORBIS,music-ogg)

So typically, one would do:

SDL_MIXER_CONF_OPT += $(call USE_ENABLE,PACKAGE_LIBVORBIS,music-ogg)
SDL_MIXER_DEPENDENCIES-$(BR2_PACKAGE_LIBVORBIS) += libvorbis

what about doing something more consistent, like:

SDL_MIXER_CONF_OPT     += $(call USE_ENABLE,PACKAGE_LIBVORBIS,music-ogg)
SDL_MIXER_DEPENDENCIES += $(call USE_DEP,PACKAGE_LIBVORBIS,libvorbis)

I know it's a litte bit more characters that the previous solution, but
it looks more consistent to me.

> +# $(call _USE_CONF,enable,disable,LIB_FFMPEG,video,blah) -> --enable-video=blah if LIB_FFMPEG
> +# $(call _USE_CONF,with,without,LIB_FFMPEG,video)        -> --with-video if LIB_FFMPEG
> +_USE_CONF = $(if $(BR2_$(3)), --$(1)-$(4)$(if $(5),=$(5)), --$(2)-$(4))

What about testing directly BR2_PACKAGE_$(3), since all packages are
prefixed by BR2_PACKAGE_ ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
