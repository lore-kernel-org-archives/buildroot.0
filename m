From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 11:51:14 +0100
Subject: [Buildroot] [PATCH 13/14] package/jack2: add optional support
 for opus
In-Reply-To: <1456048218-4061-13-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
 <1456048218-4061-13-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56C996A2.2080108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/16 10:50, Bernd Kuhls wrote:
> When opus was compiled before, jack2 will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/jackd | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libjackserver.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I checked that there is no way to explicitly turn on/off the optional packages
in jack2.

 Note that it also seems to have an optional dependency on celt051, dbus,
libsndfile, libsamplerate (based on looking at the wscripts).

 Which makes me wonder: how did you find these optional dependencies? I assumed
that you had built an allyesconfig, then deleted output/build, then built again,
and then did a readelf. But in that case, you should have caught these other
dependencies.


 Regards,
 Arnout

> ---
>  package/jack2/jack2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> index 73328d3..e018861 100644
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -10,6 +10,10 @@ JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
>  JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
>  JACK2_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_OPUS),y)
> +JACK2_DEPENDENCIES += opus
> +endif
> +
>  define JACK2_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_CONFIGURE_OPTS)	\
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
