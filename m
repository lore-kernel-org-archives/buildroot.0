From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:56:30 +0200
Subject: [Buildroot] [PATCH 1/2] sdl_mixer: add FluidSynth support
In-Reply-To: <20200702152547.258093-1-paul@crapouillou.net>
References: <20200702152547.258093-1-paul@crapouillou.net>
Message-ID: <20200712155630.7b0cae9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jul 2020 17:25:46 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Add support for MIDI playback using FluidSynth.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/sdl_mixer/sdl_mixer.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I've applied both patches, but I've changed a bit how the .mk file
handles the option. After both patches, it looks like this:

ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
SDL_MIXER_DEPENDENCIES += fluidsynth
SDL_MIXER_CONF_OPTS += \
	--enable-music-midi \
	--enable-music-fluidsynth-midi
SDL_MIXER_HAS_MIDI = YES
endif

ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
SDL_MIXER_CONF_OPTS += \
	--enable-music-midi \
	--enable-music-timidity-midi
SDL_MIXER_HAS_MIDI = YES
endif

ifneq ($(SDL_MIXER_HAS_MIDI),YES)
SDL_MIXER_CONF_OPTS += --disable-music-midi
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
