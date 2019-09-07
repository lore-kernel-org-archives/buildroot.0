From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Sep 2019 22:53:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-06
In-Reply-To: <20190907113739.GA25893@curiosity>
References: <20190907061322.CC0778821B@hemlock.osuosl.org>
 <20190907113739.GA25893@curiosity>
Message-ID: <7f70309f-f4f5-1957-9f2b-c1a8f3aba5d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 13:37, Sergey Matyukevich wrote:
[snip]
> It turns out that wpa_supplicant v2.9 requires OpenSSL support for building
> WPA3 features such as DPP and SAE. Those features are now enabled by default.
> That was not the case for wpa_supplicant v2.7.
> 
> One option is to force the use of WPA3 enabling it by default. This
> requires adding openssl as unconditional dependency for wpa_supplicant.
> 
> Alternatively, WPA3 features can be enabled only when openssl support is
> included:

 To be honest, I think that WPA3 is a big enough feature that it warrants a
Config.in option (which would select libopenssl). Since libopenssl is selected,
the fragment you modify below can remain unchanged, and the enable/disable of
DPP/SAE/OWE can be done in a separate condition.

 Note that for consistency, the same should be done in the hostapd package.

 Regards,
 Arnout

> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 0a7a5072dc..ef455a47bb 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -92,9 +92,15 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
>  WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DPP
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SAE
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_OWE
>  WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
>  else
>  WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DPP
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_SAE
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_OWE
>  WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>  endif
>  
> 
> Thoughts ? Comments ?
> 
> Regards,
> Sergey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
