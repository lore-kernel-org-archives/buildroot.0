From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 17:48:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: fix missing
 __exchange_and_add symbol
In-Reply-To: <20200513073537.17950-1-james.hilliard1@gmail.com>
References: <20200513073537.17950-1-james.hilliard1@gmail.com>
Message-ID: <20200808174830.776bc0b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ARC maintainers,

Could you have a look at the below issue ? It seems really odd that
just ARC and Sparc have this issue. I'd like to understand better
before linking manually with libstdc++. I'm sure your toolchain experts
will be able to shed some useful light on this weird issue.

Thanks a lot for your help,

Thomas

On Wed, 13 May 2020 01:35:37 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> It seems libsupc++.a is missing __exchange_and_add for uclibc on some
> platforms so link with libstdc++ as well on sparc and arcle.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bb9/bb96f327d5343a3561ea978f480585b418ce52e1/build-end.log
> http://autobuild.buildroot.net/results/5a5/5a513669b0e56f38418e42d9ae733554fe6c73f1/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/apcupsd/apcupsd.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
> index 410bce9aec..6088a41cc3 100644
> --- a/package/apcupsd/apcupsd.mk
> +++ b/package/apcupsd/apcupsd.mk
> @@ -14,10 +14,18 @@ ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
>  APCUPSD_CONF_ENV += ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
>  ifeq ($(BR2_STATIC_LIBS),y)
>  APCUPSD_DEPENDENCIES += host-pkgconf
> -APCUPSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libusb`"
> +APCUPSD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libusb`
>  endif
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +# __exchange_and_add symbol is missing from libsupc++ on these platforms
> +ifeq ($(BR2_sparc)$(BR2_arcle),y)
> +APCUPSD_LIBS += -lstdc++
> +endif
> +endif
> +APCUPSD_CONF_ENV += LIBS+="$(APCUPSD_LIBS)"
> +
>  ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
>  APCUPSD_CONF_OPTS += --enable-apcsmart
>  else



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
