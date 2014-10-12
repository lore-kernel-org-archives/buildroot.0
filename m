From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 21:40:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.19
In-Reply-To: <1413141057-21530-1-git-send-email-jkrause@posteo.de>
References: <1413141057-21530-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141012214016.04260709@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 12 Oct 2014 21:10:57 +0200, J?rg Krause wrote:

> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 8884464..c4a263a 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -1,12 +1,14 @@
>  menuconfig BR2_PACKAGE_MPD
>  	bool "mpd"
> +	depends on BR2_LARGEFILE # boost

Then the comment at the bottom of mpd's Config.in should be updated as
well.

> +config BR2_PACKAGE_MPD_ICU
> +	bool "icu"

"icu support", or "Unicode support"

> +	default y

Any reason to enable it by default?

> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 932df08..b98043d 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -MPD_VERSION_MAJOR = 0.18
> -MPD_VERSION = $(MPD_VERSION_MAJOR).16
> +MPD_VERSION_MAJOR = 0.19
> +MPD_VERSION = $(MPD_VERSION_MAJOR)

The MPD_VERSION_MAJOR variable becomes a bit useless, but ok, we can
believe that they will do some 0.19.x release in the future.

>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
> -MPD_DEPENDENCIES = host-pkgconf libglib2
> +MPD_DEPENDENCIES = host-pkgconf boost libglib2
>  MPD_LICENSE = GPLv2+
>  MPD_LICENSE_FILES = COPYING
>  
> @@ -175,6 +175,13 @@ else
>  MPD_CONF_OPTS += --disable-ffmpeg
>  endif
>  
> +# icu is enabled by default
> +ifeq ($(BR2_PACKAGE_MPD_ICU),y)
> +MPD_DEPENDENCIES += icu

MPD_CONF_OPTS += --enable-icu

> +else
> +MPD_CONF_OPTS += --disable-icu
> +endif
> +
>  define MPD_INSTALL_EXTRA_FILES
>  	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
>  		$(INSTALL) -D package/mpd/mpd.conf \


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
