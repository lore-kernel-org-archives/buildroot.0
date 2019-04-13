From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:43:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix static
 build with openssl and atomic
In-Reply-To: <20190413083452.6694-1-fontaine.fabrice@gmail.com>
References: <20190413083452.6694-1-fontaine.fabrice@gmail.com>
Message-ID: <6dd39457-332b-766e-7a97-c08635fe2dbf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 10:34, Fabrice Fontaine wrote:
> Use pkg-config to find openssl dependencies such as lz or latomic
> 
> Fix build on sparc v8 (even if there is no autobuilder failures yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index a60f097801..4c80cd2d03 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -105,8 +105,8 @@ endif
>  
>  # Try to use openssl if it's already available
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> -WPA_SUPPLICANT_DEPENDENCIES += libopenssl
> -WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
> +WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
> +WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>  WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
>  else
>  WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
> 
