From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:05:38 +0200
Subject: [Buildroot] [PATCH 35/49 v2] package/libpjsip: add option to
 enable GSM codec
In-Reply-To: <577822438ab319654ee5eaa73ec0b4f96b3a8434.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <577822438ab319654ee5eaa73ec0b4f96b3a8434.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <cec794ed-8219-4289-7d28-22649734f7bc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libpjsip/Config.in   | 12 ++++++++++++
>  package/libpjsip/libpjsip.mk | 14 +++++++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> index 727d2ec3d0..ce15a20567 100644
> --- a/package/libpjsip/Config.in
> +++ b/package/libpjsip/Config.in
> @@ -10,5 +10,17 @@ config BR2_PACKAGE_LIBPJSIP
>  
>  	  http://www.pjsip.org
>  
> +if BR2_PACKAGE_LIBPJSIP
> +
> +config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
> +    bool "GSM codec"
> +    depends on !BR2_STATIC_LIBS # libgsm
> +    select BR2_PACKAGE_LIBGSM

 Is there a good reason to make this an explicit suboption rather than an
automatic one like we usually do?

 I would be more inclined to add something like this to the pjsip help text:

pjsip will include the following codecs if the corresponding package is enabled
in Buildroot: GSM, Speex, iLBC.

 Regards,
 Arnout

> +
> +comment "GSM codec needs a toolchain w/ shared libraries"
> +    depends on BR2_STATIC_LIBS
> +
> +endif # BR2_PACKAGE_LIBPJSIP
> +
>  comment "libpjsip needs a toolchain w/ C++, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 4e2da7d32d..9b25dad2f8 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -26,7 +26,6 @@ LIBPJSIP_CONF_ENV = \
>  
>  LIBPJSIP_CONF_OPTS = \
>  	--disable-sound \
> -	--disable-gsm-codec \
>  	--disable-speex-codec \
>  	--disable-speex-aec \
>  	--disable-resample \
> @@ -70,4 +69,17 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
>  LIBPJSIP_DEPENDENCIES += util-linux
>  endif
>  
> +# Codecs can only be disabled. If explictly enabled, the check is
> +# omitted (but successful), and there is no configure trace "Checking
> +# if [codec] codec is disabled...no". So we only explicitly disable it
> +# and we do not explictly enable it, so we get the configure log in
> +# both cases.
> +
> +ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
> +LIBPJSIP_DEPENDENCIES += libgsm
> +LIBPJSIP_CONF_OPTS += --with-external-gsm
> +else
> +LIBPJSIP_CONF_OPTS += --disable-gsm-codec
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
