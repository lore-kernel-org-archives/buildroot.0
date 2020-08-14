From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 14 Aug 2020 11:01:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200813232351.1552307-1-aduskett@gmail.com>
Message-ID: <ff2-5f365300-3-6f7f4f00@51783553>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Friday, August 14, 2020 01:23 CEST, aduskett at gmail.com wrote: 
 
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, if gobject-introspection is built before avahi, avahi will fail
> to build with several undefined reference errors due to several .libs
> directories not being in the PATH when linking the .gir file.

Happened only if BR2_PACKAGE_DBUS=y.

> 
> To resolve this issue, do the following if gobject-introspection is selected:
>   - Add gobject-introspection to AVAHI_DEPENDENCIES
>   - Add --enable-gobject to AVAHI_CONF_OPTS
>   - Add the appropriate directories to GIR_EXTRA_LIBS_PATH.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Tested-by: Michael Nosthoff <buildroot@heine.tech>

Compile tested on x64 for cortex-a15 with toolchain-external-arm-arm.

Regards,
Michael

> ---
>  package/avahi/avahi.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 73db37545f..3e858083af 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -94,6 +94,13 @@ else
>  AVAHI_CONF_OPTS += --disable-glib --disable-gobject
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +AVAHI_DEPENDENCIES += gobject-introspection
> +AVAHI_CONF_OPTS += --enable-gobject
> +AVAHI_MAKE_ENV += \
> +	GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  AVAHI_CONF_ENV += \
>  	am_cv_pathless_PYTHON=python \
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
