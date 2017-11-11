From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 10:33:51 +0100
Subject: [Buildroot] [NEXT 07/17] libpjsip: add ffmpeg option
In-Reply-To: <20171110202109.25215-7-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
 <20171110202109.25215-7-aduskett@gmail.com>
Message-ID: <ea87b1a3-113c-983d-bd7c-d2db44af825e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-11-17 21:20, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libpjsip/Config.in   | 11 +++++++++++
>  package/libpjsip/libpjsip.mk |  8 +++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> index 20b8568d52..1ad7d77f2a 100644
> --- a/package/libpjsip/Config.in
> +++ b/package/libpjsip/Config.in
> @@ -35,6 +35,17 @@ endif # BR2_PACKAGE_LIBPJSIP_SOUND
>  config BR2_PACKAGE_LIBPJSIP_VIDEO
>  	bool "Enable video"
>  
> +if BR2_PACKAGE_LIBPJSIP_VIDEO
> +
> +config BR2_PACKAGE_LIBPJSIP_FFMPEG
> +	bool "ffmpeg support"
> +	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> +	select BR2_PACKAGE_FFMPEG
> +	help
> +	  Enable ffmpeg support
> +
> +endif # BR2_PACKAGE_LIBPJSIP_VIDEO
> +
>  endif # BR2_PACKAGE_LIBPJSIP
>  
>  comment "libpjsip needs a toolchain w/ C++, threads"
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index f45d9d1caf..5421789948 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -40,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-g722-codec \
>  	--disable-libsamplerate \
>  	--disable-sdl \
> -	--disable-ffmpeg \
>  	--disable-v4l2 \
>  	--disable-openh264 \
>  	--disable-libyuv \
> @@ -86,4 +85,11 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_VIDEO),y)
>  LIBPJSIP_CONF_OPTS += --disable-video
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBPJSIP_FFMPEG),y)
> +LIBPJSIP_DEPENDENCIES += ffmpeg
> +LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr/lib

 Why is this needed? This is the standard library search path so shouldn't be
needed. Also, normally it would be --with-ffmpeg=$(STAGING_DIR)/usr and
configure uses .../include for -I and .../lib for -L. Please add an explanation
in the commit log.

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
