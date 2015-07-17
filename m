From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jul 2015 09:39:34 +0300
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: Add an explicit option
 to enable nl80211.
In-Reply-To: <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20150713112947.7e14fd64@free-electrons.com>
 <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20150717063934.GD3147@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

On Thu, Jul 16, 2015 at 03:02:33PM +0200, Nicolas Cavallari wrote:
> Currently, nl80211 support is conditional with libnl being enabled,
> using implicit dependencies.  This causes problems since it is not
> obvious and wpa_supplicant without nl80211 isn't what most user expects.
> 
> If nl80211 isn't enabled, then buildroot only enables the wext driver,
> which will only work if some deprecated kernel feature isn't left
> disabled, or if using a outdated out-of-tree linux driver which doesn't
> use the cfg80211 infrastructure.
> 
> This makes nl80211 support an explicit option, which
> "select BR2_PACKAGE_LIBNL" accordingly.  To handle upgrades nicely, it
> would have been nice to have "default y if BR2_PACKAGE_LIBNL", but
> Kconfig treats this as a circular dependency.  So instead, this enables
> the option by default, which is less worse than not enabling nl80211
> when it was previously implicitly enabled.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/wpa_supplicant/Config.in         | 16 ++++++++++++++++
>  package/wpa_supplicant/wpa_supplicant.mk |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index f32a867..1824f95 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -8,6 +8,22 @@ config BR2_PACKAGE_WPA_SUPPLICANT
>  
>  if BR2_PACKAGE_WPA_SUPPLICANT
>  
> +config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> +	bool "Enable nl80211 support"
> +	default y
> +	select BR2_PACKAGE_LIBNL

BR2_PACKAGE_LIBNL depends on BR2_TOOLCHAIN_HAS_THREADS. You need to propagate 
this dependency here, since Kconfig doesn't do that automatically. See 
http://nightly.buildroot.org/manual.html#depends-on-vs-select.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
