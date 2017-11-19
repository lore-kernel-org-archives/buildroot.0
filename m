From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Nov 2017 14:58:23 +0100
Subject: [Buildroot] [NEXT v2 4/7] libpjsip: enable ffmpeg support
In-Reply-To: <20171114160712.20086-4-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
 <20171114160712.20086-4-aduskett@gmail.com>
Message-ID: <5f3314c1-43eb-e8d7-fe82-9cf55cf4d509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-11-17 17:07, Adam Duskett wrote:
> If FFmpeg is selected, libpjsip should depend on it.
> Specifying --with-ffmpeg= is necessary because passing --enable-FFmpeg
> actually disables FFmpeg when cross compiling.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Remove the option to enable or disable FFmpeg support in favor of
>     just depending on FFmpeg if it's selected by the user.
>   - Add explination as to why with-ffmpeg is being passed to libpjsip (Arnout)
> 
>  package/libpjsip/libpjsip.mk | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 3c9d789..982e088 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-speex-codec \
>  	--disable-speex-aec \
>  	--disable-resample \
> -	--disable-video \

 This bit should have a bit more explanation in the commit message. Like:

--enable-video has no effect at all on Linux (only on Android and darwin).
--disable-video has the effect of disabling SDL, ffmpeg, v4l2, openh264 and
libyuv. Since all of these are enabled/disabled explicitly already, there is no
need to specify --disable-video. To do so correctly is non-trivial when we want
to support e.g. ffmpeg OR v4l2.

>  	--disable-opencore-amr \
>  	--disable-g7221-codec \
>  	--disable-ilbc-codec \
> @@ -41,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-g722-codec \
>  	--disable-libsamplerate \
>  	--disable-sdl \
> -	--disable-ffmpeg \
>  	--disable-v4l2 \
>  	--disable-openh264 \
>  	--disable-libyuv \
> @@ -75,4 +73,13 @@ LIBPJSIP_DEPENDENCIES += portaudio
>  LIBPJSIP_CONF_OPTS += --with-external-pa
>  endif
>  
> +# Passing --enable-ffmpeg actually disables it. Instead, --with-ffmpeg
> +# must be passed to compile ffmpeg support.

 Here, I would also give the full explanation in the commit message:

When --enable-ffmpeg is given, the code to enable ffmpeg is not executed. Also,
when cross-compiling and no --with-ffmpeg option is given, ffmpeg is disbled.
Therefore, a --with-ffmpeg option needs to be given. Normally it is used to pass
the path to the directory where ffmpeg is installed, but since we install it
directly under sysroot we can pass it empty.

> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +LIBPJSIP_DEPENDENCIES += ffmpeg
> +LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr

 --with-ffmpeg without anything works as well, i.e.:

LIBPJSIP_CONF_OPTS += --with-ffmpeg

 Regards,
 Arnout

> +else
> +LIBPJSIP_CONF_OPTS += --disable-ffmpeg
> +endif
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
