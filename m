From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Nov 2017 18:08:01 +0100
Subject: [Buildroot] [NEXT v2 1/7] libpjsip: remove disable-ext-sound
 option
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <d4a83256-3597-c135-8f98-b8e8a5cb39ec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 14-11-17 17:07, Adam Duskett wrote:
> The configure option --disable-ext-sound currently isn't a valid option
> in libpjsip. Originally it was used to prevent portaudio from building
> in the third_party directory, however, portaudio no longer exists in that
> directory.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added this patch to the start of the series.
> 
>  package/libpjsip/libpjsip.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index c772d41..2eaefaf 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -37,7 +37,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-libwebrtc \
>  	--disable-opus \
>  	--disable-oss \
> -	--disable-ext-sound \

 I tried all combinations of the different sound options, and these are my
conclusions:

1. --enable-sound and --disable-sound both work as expected and have the effect
of enabling alsa support. It has no other effect. So, I think patch 2/7 should
pass --enable-sound if alsa is enabled, and --disable-sound if not.

2. --disable-ext-sound has no effect at all. However, since the option still
exists, and to be future-safe in case that it may make a difference, I would not
remove the option (just like you don't remove --disable-oss).

3. --with-external-pa also has no effect on the build result, other than giving
the warning
<command-line>:0:0: warning: "PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO" redefined

 Indeed, os-auto.mk will set this define twice: it is set to 1 due to
--with-external-pa, and then set to 0 due to --enable-sound
(AC_PJMEDIA_SND=alsa) or --disable-sound (AC_PJMEDIA_SND=null). The 0 "wins" so
portaudio is not used at all.

 Therefore, I'd remove patch 3/7 entirely and instead add an explicit
--without-external-pa.


 Regards,
 Arnout


>  	--disable-g711-codec \
>  	--disable-l16-codec \
>  	--disable-g722-codec \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
