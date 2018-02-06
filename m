From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 6 Feb 2018 15:27:14 +0100
Subject: [Buildroot] [PATCH 1/3] hostapd: select driver support
In-Reply-To: <20171230155736.1668-2-alexander.i.mukhin@gmail.com>
References: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
 <20171230155736.1668-2-alexander.i.mukhin@gmail.com>
Message-ID: <CAH=K+6mO7Ya5poxq9+bh+oRa87byu6KRv2K+_t=-JZcuHpyt4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 30, 2017 at 4:57 PM, Alexander Mukhin
<alexander.i.mukhin@gmail.com> wrote:
> Add support for the wired driver. Add configuration options to select
> which drivers to build. Select DRIVER_NONE if no other drivers enabled
> (this may be the case when building hostapd as a standalone RADIUS
> server).
>
> Update makefile logic and apply wireless-specific options only if at
> least one wireless driver enabled. Otherwise, an attempt to build a
> wired-only or RADIUS-only hostapd will fail.
>
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Reviewed-by: Sam Voss <sam.voss@rockwellcollins.com>

> ---
>  package/hostapd/Config.in  | 31 +++++++++++++++++++++++++++++++
>  package/hostapd/hostapd.mk | 31 ++++++++++++++++++++++++++-----
>  2 files changed, 57 insertions(+), 5 deletions(-)
>
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 84156e8f11..f6182a9268 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -14,11 +14,42 @@ config BR2_PACKAGE_HOSTAPD
>
>  if BR2_PACKAGE_HOSTAPD
>
> +config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
> +       bool "Enable hostap driver"
> +       default y
> +       select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
> +       help
> +         Enable support for Host AP driver.
> +
> +config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
> +       bool "Enable nl80211 driver"
> +       default y
> +       select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
> +       help
> +         Enable support for drivers using the nl80211 kernel interface.
> +
>  config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
>         bool "Enable rtl871xdrv driver"
> +       select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
>         help
>           Enable support for Realtek wireless chips.
>
> +config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
> +       bool "Enable wired driver"
> +       help
> +         Enable support for wired authenticator.
> +
> +config BR2_PACKAGE_HOSTAPD_DRIVER_NONE
> +       bool
> +       default y
> +       depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
> +       depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
> +       depends on !BR2_PACKAGE_HOSTAPD_DRIVER_RTW
> +       depends on !BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
> +
> +config BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
> +       bool
> +
>  config BR2_PACKAGE_HOSTAPD_ACS
>         bool "Enable ACS"
>         default y
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 1696670383..f9072784eb 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -18,12 +18,7 @@ HOSTAPD_LICENSE_FILES = README
>  HOSTAPD_CONFIG_SET =
>
>  HOSTAPD_CONFIG_ENABLE = \
> -       CONFIG_HS20 \
> -       CONFIG_IEEE80211AC \
> -       CONFIG_IEEE80211N \
> -       CONFIG_IEEE80211R \
>         CONFIG_INTERNAL_LIBTOMMATH \
> -       CONFIG_INTERWORKING \
>         CONFIG_LIBNL32
>
>  HOSTAPD_CONFIG_DISABLE =
> @@ -45,11 +40,37 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
>  HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>  endif
>
> +ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),)
> +HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_HOSTAP
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),)
> +HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
>  HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
>  HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
>  endif
>
> +ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_WIRED),y)
> +HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_WIRED
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NONE),y)
> +HOSTAPD_CONFIG_ENABLE += CONFIG_DRIVER_NONE
> +endif
> +
> +# Add options for wireless drivers
> +ifeq ($(BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS),y)
> +HOSTAPD_CONFIG_ENABLE += \
> +       CONFIG_HS20 \
> +       CONFIG_IEEE80211AC \
> +       CONFIG_IEEE80211N \
> +       CONFIG_IEEE80211R \
> +       CONFIG_INTERWORKING
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
>  HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
>  endif
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
