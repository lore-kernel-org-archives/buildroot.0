From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Feb 2021 13:21:28 +0100
Subject: [Buildroot] [PATCH 2/3] package/wpa_supplicant: Add options to
 disable more features.
In-Reply-To: <20210210185017.6133-2-nicolas.cavallari@green-communications.fr>
References: <20210210185017.6133-1-nicolas.cavallari@green-communications.fr>
 <20210210185017.6133-2-nicolas.cavallari@green-communications.fr>
Message-ID: <c6237102-2340-0536-8fba-424b3d832401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/02/2021 19:50, Nicolas Cavallari wrote:
[snip]
> +config BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
> +	bool "Enable the Unix-socket control interface"
> +	help
> +	  Enable support for the Unix-socket-based API.
> +

 I'm surprised that the control interface makes that much of a difference...
AFAIK it's just a single file, no?

[snip]
> +ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_WIRED \

 This should be written as:

WPA_SUPPLICANT_CONFIG_DISABLE += \
	CONFIG_DRIVER_WIRED \

 The file contains both styles, but I think we prefer the one-option-per-line
style for new code.

 Regards,
 Arnout


> +	CONFIG_MACSEC \
> +	CONFIG_DRIVER_MACSEC
> +endif
> +
>  ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
>  WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_HS20 \
>  	CONFIG_INTERWORKING
> @@ -117,6 +131,10 @@ WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
>  WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>  endif
>  
> +ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
>  WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
>  WPA_SUPPLICANT_MAKE_ENV = \
> 
