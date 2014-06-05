From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 14:53:28 +0300
Subject: [Buildroot] [PATCH] wpa_supplicant: bump to version 2.2
In-Reply-To: <1401968217-32326-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401968217-32326-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140605115328.GN4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jun 05, 2014 at 08:36:57AM -0300, Gustavo Zacarias wrote:
> Patches are now upstream.
> Enable epoll support since any modern kernel/toolchain supports it.
> Interworking now requires some EAP support so make it conditional on it.

Correct.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---

[..]

> diff --git a/package/wpa_supplicant/wpa_supplicant.mk 
> b/package/wpa_supplicant/wpa_supplicant.mk
> index 9321f08..8483e44 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPA_SUPPLICANT_VERSION = 2.1
> +WPA_SUPPLICANT_VERSION = 2.2
>  WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
>  WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
>  WPA_SUPPLICANT_LICENSE_FILES = README
> @@ -23,8 +23,8 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
>  	CONFIG_IEEE80211AC	\
>  	CONFIG_IEEE80211N	\
>  	CONFIG_IEEE80211R	\
> -	CONFIG_INTERWORKING	\
> -	CONFIG_INTERNAL_LIBTOMMATH
> +	CONFIG_INTERNAL_LIBTOMMATH \
> +	CONFIG_ELOOP_EPOLL
>  
>  WPA_SUPPLICANT_CONFIG_DISABLE = \
>  	CONFIG_SMARTCARD
> @@ -46,7 +46,7 @@ endif
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
>  	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
>  else
> -	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
> +	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP CONFIG_INTERWORKING

But now CONFIG_INTERWORKING is never enabled. Am I missing something?

>  endif
>  
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
