From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 10:29:34 +0100
Subject: [Buildroot] [NEXT 02/17] libpjsip: add enable sound option
In-Reply-To: <20171110202109.25215-2-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
 <20171110202109.25215-2-aduskett@gmail.com>
Message-ID: <d90117ce-7868-a9d3-c5d8-45e0cd1977a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 10-11-17 21:20, Adam Duskett wrote:
> This is the first patch in a series that will enable several features
> for libpjsip.  This patch does the following:
> 
> - make libpjsip a menuconfig option

 You could have done that in a separate patch, to make it easier to apply only
part of the series.

> - add a option for "Enable sound"
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libpjsip/Config.in   | 11 ++++++++++-
>  package/libpjsip/libpjsip.mk |  5 ++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> index 727d2ec3d0..a39d053e03 100644
> --- a/package/libpjsip/Config.in
> +++ b/package/libpjsip/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_LIBPJSIP
> +menuconfig BR2_PACKAGE_LIBPJSIP
>  	bool "libpjsip"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -10,5 +10,14 @@ config BR2_PACKAGE_LIBPJSIP
>  
>  	  http://www.pjsip.org
>  
> +if BR2_PACKAGE_LIBPJSIP
> +
> +config BR2_PACKAGE_LIBPJSIP_SOUND
> +	bool "Enable sound"
> +	help
> +	  Use sound instead of a null device.

 Is it useful to make this optional? Does it have a significant impact on size?

 Same goes for all the other options you add, e.g. v4l2 support: except if the
v4l2 support adds significantly to the size of libpjsip, you can just enable it
when BR2_PACKAGE_LIBV4L is selected.

 That said, you may have good reasons to choose this route. It helps to explain
that in the commit log.

 Finally, specifically about sound: does this option make sense if no sound
backend is selected?

> +
> +endif # BR2_PACKAGE_LIBPJSIP
> +
>  comment "libpjsip needs a toolchain w/ C++, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index c772d4117a..a9d4ed4ed0 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
>  	CFLAGS="$(LIBPJSIP_CFLAGS)"
>  
>  LIBPJSIP_CONF_OPTS = \
> -	--disable-sound \
>  	--disable-gsm-codec \
>  	--disable-speex-codec \
>  	--disable-speex-aec \
> @@ -68,4 +67,8 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
>  LIBPJSIP_DEPENDENCIES += util-linux
>  endif
>  
> +ifneq ($(BR2_PACKAGE_LIBPJSIP_SOUND),y)

 We prefer to use ifeq ($(BR2_PACKAGE_LIBPJSIP_SOUND),)

 However, why not do --enable-sound? You mention something for the codecs, does
that also apply here?


 I'm going to mark the entire series as Changes Requested, even though you may
actually keep it mostly as it is after discussion. Still, there are probably
small things to be fixed in some patches (like the typo in the first one) and
it's easier to resubmit the series as a whole.


 Regards,
 Arnout

> +LIBPJSIP_CONF_OPTS += --disable-sound
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
