From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:54:32 +0100
Subject: [Buildroot] [PATCH v2] SDL_mixer: Prefer Tremor over libvorbis
In-Reply-To: <20191212171859.783617-1-paul@crapouillou.net>
References: <20191212171859.783617-1-paul@crapouillou.net>
Message-ID: <20191212215432.33196aeb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Dec 2019 18:18:59 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> When Tremor is enabled, configure SDL_mixer to use this Vorbis decoding
> library instead of libvorbis. Since Tremor does fixed-point math, it is
> safe to assume that if it's enabled then it is faster than libvorbis on
> the target architecture.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The expected format/capitalization for the commit title is:

	package/sdl_mixer: prefer tremor over libvorbis

> +ifeq ($(BR2_PACKAGE_TREMOR),y)
> +SDL_MIXER_CONF_OPTS += --enable-music-ogg-tremor
> +SDL_MIXER_DEPENDENCIES += tremor
> +else
>  ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
>  SDL_MIXER_CONF_OPTS += --enable-music-ogg
>  SDL_MIXER_DEPENDENCIES += libvorbis
>  else
>  SDL_MIXER_CONF_OPTS += --disable-music-ogg
>  endif
> +endif

These conditions are better written like this:

ifeq ...

else ifeq ...

else ...

endif

Note how having the "ifeq" on the same line as the "else" avoids the
need for an additional "endif" at the end of condition.

I fixed both minor nits, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
