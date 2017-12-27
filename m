From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 23:17:46 +0100
Subject: [Buildroot] [PATCH 2/2] hostapd: select DRIVER_NONE if no other
 drivers enabled
In-Reply-To: <20171227192928.1129-1-alexander.i.mukhin@gmail.com>
References: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
 <20171227192928.1129-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171227231746.564d6c8a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 22:29:28 +0300, Alexander Mukhin wrote:

> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 1700335c1a..e6c981dbe5 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -17,18 +17,14 @@ HOSTAPD_LICENSE = BSD-3-Clause
>  HOSTAPD_LICENSE_FILES = README
>  HOSTAPD_CONFIG_SET =
>  
> -HOSTAPD_CONFIG_ENABLE = \
> -	CONFIG_HS20 \
> -	CONFIG_IEEE80211AC \
> -	CONFIG_IEEE80211N \
> -	CONFIG_IEEE80211R \
> -	CONFIG_INTERNAL_LIBTOMMATH \
> -	CONFIG_INTERWORKING
> +HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
>  
>  HOSTAPD_CONFIG_DISABLE =
>  
>  HOSTAPD_USE_NL =
>  
> +HOSTAPD_USE_WIRELESS_DRIVERS =

I think this would be better handled via a hidden Config.in option,
something like:

config BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
	bool

config BR2_PACKAGE_HOSTAPD_<something>
	bool "something"
	select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS

> +# Enable CONFIG_DRIVER_NONE if no other drivers enabled
> +ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),y)
> +ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),y)
> +ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
> +ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)

Perhaps this could be simplified to:

ifeq ($(BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS)$(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),)

> +HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_NONE
> +endif
> +endif
> +endif
> +endif
> +
> +# Add options for wireless drivers
> +ifeq ($(HOSTAPD_USE_WIRELESS_DRIVERS),y)

This would use BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
