From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Apr 2015 19:47:58 +0200
Subject: [Buildroot] [PATCH 1/1] miraclecast: new package
In-Reply-To: <1428030634-23928-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428030634-23928-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150403174758.GA4428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

Miraclecast... Mmmm! Cookie! :-)

On 2015-04-02 22:10 -0500, Ryan Barnett spake thusly:
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
[--SNIP--]
> diff --git a/package/miraclecast/Config.in b/package/miraclecast/Config.in
> new file mode 100644
> index 0000000..fbba349
> --- /dev/null
> +++ b/package/miraclecast/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_MIRACLECAST
> +	bool "miraclecast"
> +	depends on BR2_PACKAGE_SYSTEMD
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2

You forgot to select glib2. Even if gstreamer needs it, miraclecast
needs glib for itself, too, so you need to select it.

> +	select BR2_PACKAGE_GSTREAMER

Don't you also need at least some codecs?

Looking at res/test_viewer.sh, it seems you need at least those:
    udpsrc rtpjitterbuffer rtpmp2tdepay tsdemux h264parse avdec_h264
    autovideosink

> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
> +	help
> +	  The MiracleCast project provides software to connect external
> +	  monitors to your system via Wifi. It is compatible to the
> +	  Wifi-Display specification also known as Miracast. MiracleCast
> +	  implements the Display-Source as well as Display-Sink side.
> +
> +	  https://github.com/albfan/miraclecast
> +
> +comment "miraclecast needs a glibc toolchain w/ threads, wchar and systemd"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_PACKAGE_SYSTEMD || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU

comment "miraclecast needs systemd and a glibc toolchain w/ threads, wchar"
        depends on BR2_USE_MMU
        depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR \
                || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD

> diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
> new file mode 100644
> index 0000000..4f649a7
> --- /dev/null
> +++ b/package/miraclecast/miraclecast.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# miraclecast
> +#
> +################################################################################
> +
> +MIRACLECAST_VERSION = 8b61f733da124ccbfd1b85e188581fad1c41c1e1
> +MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
> +MIRACLECAST_DEPENDENCIES = systemd gstreamer readline
> +MIRACLECAST_LICENSE = LGPLv2.1+ GPLv2 (gdhcp) GPLv2.1 (htable)
> +MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
> +MIRACLECAST_AUTORECONF = YES

Please comment on why this is needed, like:

    # Straight out of the repository, no ./configure
    MIRACLECAST_AUTORECONF = YES

> +$(eval $(autotools-package))
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 98bda02..a94ce04 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -77,6 +77,11 @@ else
>  SYSTEMD_CONF_OPTS += --disable-seccomp
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MIRACLECAST),y)
> +# Must enable kdbus in order to get sd-events.h in staging
> +SYSTEMD_CONF_OPTS += --enable-kdbus
> +endif

I won't repeat what's already been said by Baruch, since I agree with
what he said.

/me is looking forward to seeing that integrated! :-)

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
>  SYSTEMD_DEPENDENCIES += \
>  	xz 		\
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
