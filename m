From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:06:20 +0200
Subject: [Buildroot] [PATCH 38/49 v2] package/libpjsip: add option to
 enable G.711 codec
In-Reply-To: <528297671d94a208c1c5a18e1bb34895347da626.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <528297671d94a208c1c5a18e1bb34895347da626.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <5b53a258-aab7-a965-7c37-13af59943fbf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libpjsip/Config.in   | 3 +++
>  package/libpjsip/libpjsip.mk | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> index 0bb446e9d9..1c9d2ce900 100644
> --- a/package/libpjsip/Config.in
> +++ b/package/libpjsip/Config.in
> @@ -12,6 +12,9 @@ config BR2_PACKAGE_LIBPJSIP
>  
>  if BR2_PACKAGE_LIBPJSIP
>  
> +config BR2_PACKAGE_LIBPJSIP_CODEC_G711
> +	bool "G.711 codec"

 I believe this codec (and the other ones as well) is rather small. Is there any
reason to make it optional?

 Regards,
 Arnout

> +
>  config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
>      bool "GSM codec"
>      depends on !BR2_STATIC_LIBS # libgsm
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 1259a292e4..10016fa732 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -37,7 +37,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-ext-sound \
>  	--disable-small-filter \
>  	--disable-large-filter \
> -	--disable-g711-codec \
>  	--disable-l16-codec \
>  	--disable-g722-codec \
>  	--disable-libsamplerate \
> @@ -73,6 +72,10 @@ endif
>  # and we do not explictly enable it, so we get the configure log in
>  # both cases.
>  
> +ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
> +LIBPJSIP_CONF_OPTS += --disable-g711-codec
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
>  LIBPJSIP_DEPENDENCIES += libgsm
>  LIBPJSIP_CONF_OPTS += --with-external-gsm
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
