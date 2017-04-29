From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:41:55 +0200
Subject: [Buildroot] [PATCH v7 31/31] package/kodi: Add support for more
	archs
In-Reply-To: <8b5332b4-ff7b-7afc-a545-a5cef63612b4@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <8b5332b4-ff7b-7afc-a545-a5cef63612b4@t-online.de>
Message-ID: <20170429154155.5be161a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 15:25:04 +0200, Bernd Kuhls wrote:

> > Have these patches any chance of being merged upstream? Indeed, it's
> > very unlikely that Kodi will ever be used on any of those architectures,
> > so having to carry forever those patches doesn't seem like a great
> > thing. I would prefer to exclude those architectures in Config.in.  
> 
> the patches are currently under review upstream, based on their decision
> I will sent the next version of this patch.

Great, thanks!

> > Kodi doesn't really support all architectures, since it contains
> > architecture-specific definitions in several files...  
> 
> I am not sure that I understood what you mean here.

What I mean here is that Kodi *does* have architecture dependencies,
since it contains a bunch of .c/.h files that have conditionals based
on the architectures.

Therefore, pretending in our Config.in that Kodi builds on all
architectures is not correct. It only builds for those that Kodi
supports. Your patch works today, but if tomorrow we add support for
architecture "barfoo", then Kodi will fail to build on this
architecture.

Therefore, since Kodi has support only for a selection of
architectures, I would prefer if kodi/Config.in was reflecting this
list of architectures.

Some other packages that have architecture dependencies are more
fundamental (like libffi) and therefore we really want them to exist on
all architectures we support. However, Kodi is unlikely to be used on
ARC, SuperH, Sparc, Xtensa, etc, so putting effort to make Kodi build
on those platforms is not very useful.

> >> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> >> +KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi +KODI_DEPENDENCIES +=
> >> rpi-userland +ifeq
> >> ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
> >> +KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)  
> > 
> > Why only for Raspberry Pi ?  
> 
> These CPU-specific options are only needed for rbpi:
> https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/
> ArchSetup.cmake#L13

OK, then again, comment needed. The fact that Kodi handles RPi
specially is very confusing.

> >> +endif +else  # BR2_PACKAGE_RPI_USERLAND +ifeq
> >> ($(BR2_arceb)$(BR2_arcle),y)
> >> +KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc +else ifeq
> >> ($(BR2_armeb),y)
> >>  KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
> >> -else ifeq ($(BR2_mips),y)  
> > 
> > MIPS is handled here...  
> 
> Not anymore, because I removed the check for mips ...

Aaah, yes, my bad. It was a "-" at the beginning of the line, not a
"+". Sorry about that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
