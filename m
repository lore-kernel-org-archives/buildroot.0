From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 6 Feb 2018 15:22:49 +0100
Subject: [Buildroot] [PATCH 2/3] hostapd: make ACS dependent on nl80211
In-Reply-To: <20171230155736.1668-3-alexander.i.mukhin@gmail.com>
References: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
 <20171230155736.1668-3-alexander.i.mukhin@gmail.com>
Message-ID: <CAH=K+6=-RuredsV3bXUP_i3pmsdJ1vRmFdAEJfhf=UWTD_-owg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 30, 2017 at 4:57 PM, Alexander Mukhin
<alexander.i.mukhin@gmail.com> wrote:
> According to hostapd's defconfig file, ACS is currently only supported
> through the nl80211 driver. Search through the source code also confirms
> that ACS machinery is present in the nl80211 driver only.
>
> Although hostapd can be built with ACS enabled and nl80211 disabled, an
> attempt to use ACS with other drivers by setting a wireless channel to 0
> results in a runtime failure (driver doesn't accept this value). So we
> might save a user from selecting a meaningless combination by making ACS
> dependent on nl80211.
>
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Reviewed-by: Sam Voss <sam.voss@rockwellcollins.com>

> ---
>  package/hostapd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index f6182a9268..d23e5e1dca 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -53,6 +53,7 @@ config BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
>  config BR2_PACKAGE_HOSTAPD_ACS
>         bool "Enable ACS"
>         default y
> +       depends on BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
>         help
>           Enable support for standard ACS (Automatic Channel Selection).
>           Some propietary drivers use a custom algorithm which requires
> @@ -60,6 +61,9 @@ config BR2_PACKAGE_HOSTAPD_ACS
>           causing hostapd to use the standard one which doesn't work
>           for those cases.
>
> +comment "ACS is currently only supported through the nl80211 driver"
> +       depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
> +
>  config BR2_PACKAGE_HOSTAPD_EAP
>         bool "Enable EAP"
>         depends on !BR2_STATIC_LIBS
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
