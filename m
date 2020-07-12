From: Paul Cercueil <paul@crapouillou.net>
Date: Sun, 12 Jul 2020 21:15:21 +0200
Subject: [Buildroot] [PATCH 1/2] sdl_mixer: add FluidSynth support
In-Reply-To: <20200712210613.0d8085bc@windsurf.home>
References: <20200702152547.258093-1-paul@crapouillou.net>
 <20200712155630.7b0cae9f@windsurf.home>
 <0EADDQ.RW12BTKCKRWM3@crapouillou.net>
 <20200712210613.0d8085bc@windsurf.home>
Message-ID: <LTEDDQ.J6DCEMZ3G7E9@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le dim. 12 juil. 2020 ? 21:06, Thomas Petazzoni 
<thomas.petazzoni@bootlin.com> a ?crit :
> On Sun, 12 Jul 2020 19:39:36 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  > I've applied both patches, but I've changed a bit how the .mk file
>>  > handles the option. After both patches, it looks like this:
>>  >
>>  > ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
>>  > SDL_MIXER_DEPENDENCIES += fluidsynth
>>  > SDL_MIXER_CONF_OPTS += \
>>  > 	--enable-music-midi \
>>  > 	--enable-music-fluidsynth-midi
>>  > SDL_MIXER_HAS_MIDI = YES
>>  > endif
>>  >
>>  > ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
>>  > SDL_MIXER_CONF_OPTS += \
>>  > 	--enable-music-midi \
>>  > 	--enable-music-timidity-midi
>>  > SDL_MIXER_HAS_MIDI = YES
>>  > endif
>>  >
>>  > ifneq ($(SDL_MIXER_HAS_MIDI),YES)
>>  > SDL_MIXER_CONF_OPTS += --disable-music-midi
>>  > endif
>> 
>>  It won't work then. --enable-music-midi automatically enables
>>  --enable-music-{native,fluidsynth,timidity}-midi, so these need to 
>> be
>>  manually disabled. Otherwise when you enable e.g. Fluidsynth, it 
>> will
>>  also enable Timidity even though the SDL_MIXER_MIDI_TIMIDITY option 
>> is
>>  OFF.
> 
> So, I guess we need this instead:
> 
> ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
> SDL_MIXER_DEPENDENCIES += fluidsynth
> SDL_MIXER_CONF_OPTS += --enable-music-fluidsynth-midi
> SDL_MIXER_HAS_MIDI = YES
> else
> SDL_MIXER_CONF_OPTS += --disable-music-fluidsynth-midi
> endif
> 
> ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
> SDL_MIXER_CONF_OPTS += --enable-music-timidity-midi
> SDL_MIXER_HAS_MIDI = YES
> else
> SDL_MIXER_CONF_OPTS += --disable-music-timidity-midi
> endif
> 
> ifeq ($(SDL_MIXER_HAS_MIDI),YES)
> SDL_MIXER_CONF_OPTS += --disable-music-midi
> else
> SDL_MIXER_CONF_OPTS += --disable-music-midi
> endif
> 
> what do you think ?

That would work.

-Paul

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
