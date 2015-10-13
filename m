From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 22:57:08 +0200
Subject: [Buildroot] [PATCH] mplayer: needs zlib
In-Reply-To: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151013225708.3aa5e0aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

I'm adding Bernd in Cc, since he has done numerous contributions to the
mplayer package. Also adding Gustavo, who did some mplayer packaging IIRC.

On Tue, 13 Oct 2015 10:58:33 +0100, Vicente Olivert Riera wrote:
> Otherwise it will fail to compile with an error message like this one:
> 
> libavcodec/pngdec.c:35:18: fatal error: zlib.h: No such file or
> directory
>  #include <zlib.h>
>                   ^
> compilation terminated.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mplayer/Config.in  |    1 +
>  package/mplayer/mplayer.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
> index 7a8b03f..80ad7f1 100644
> --- a/package/mplayer/Config.in
> +++ b/package/mplayer/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
>  		|| BR2_microblaze || BR2_nios2)
>  	# Broken support for <ARMv5
>  	depends on !BR2_ARM_CPU_ARMV4
> +	select BR2_PACKAGE_ZLIB
>  
>  config BR2_PACKAGE_MPLAYER
>  	bool "mplayer"
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index d896b35..0f5ced5 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -7,7 +7,7 @@
>  MPLAYER_VERSION = 1.2
>  MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
>  MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
> -MPLAYER_DEPENDENCIES = host-pkgconf
> +MPLAYER_DEPENDENCIES = host-pkgconf zlib
>  MPLAYER_LICENSE = GPLv2
>  MPLAYER_LICENSE_FILES = LICENSE Copyright
>  MPLAYER_CFLAGS = $(TARGET_CFLAGS)

While this solution is simple, I am not sure if this is the right one.
It is in fact perfectly possible to build mplayer without zlib, by
doing:

+MPLAYER_CONF_OPTS += --disable-decoder=apng --disable-encoder=apng --disable-decoder=tdsc

So in fact, zlib is only needed for two decoders/encoders in the ffmpeg
code. However, it is not really clear to me how to handle this
properly: there is one configure script at the top-level directory, and
then another one in the ffmpeg/ directory. And it is really the ffmpeg
encoders/decoders that have this zlib requirement (and probably
others?).

So, simple solution is to make zlib mandatory (which is reasonable:
zlib is small, and probably already part of most systems). However, I
wonder if there are not some other dependencies for certain
encoders/decoders.

Bernd, Gustavo, do you have some suggestions ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
