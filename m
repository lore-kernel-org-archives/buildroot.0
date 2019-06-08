From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 20:49:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 bluez-plugin depends on bluez5_utils
In-Reply-To: <20190529035647.1782-1-aduskett@gmail.com>
References: <20190529035647.1782-1-aduskett@gmail.com>
Message-ID: <b9a737dd-ff0e-87d3-e699-f59877e1ba1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 05:56, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> autotools doesn't throw an error if bluez_utils is found and is older than
> version 5, but meson does. As such, select and depend on bluez5_utils instead.

 I didn't really understand this, so I asked on IRC and updated the commit message.

> 
> Also:
>   Add all the dependencies of bluez5_utils for the bluez plugin just in case
>   dependencies change in the future as suggested by Thomas.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 22 +++++++++++++------
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      |  2 +-
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index b1232af16e..ac77836312 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -310,17 +310,25 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
>  	bool "bluez"
> -	depends on !BR2_STATIC_LIBS # bluez_utils
> -	depends on BR2_USE_WCHAR # bluez_utils
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
> -	depends on BR2_USE_MMU # bluez_utils
> -	select BR2_PACKAGE_BLUEZ_UTILS
> +	depends on BR2_USE_WCHAR # libglib2

 This should refer to bluez5_utils, so we remember why this dependency was
added. So:

	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2


 Applied to master with those changes, thanks.

 Regards,
 Arnout

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> +	depends on BR2_USE_MMU # dbus
> +	depends on !BR2_STATIC_LIBS # uses dlfcn
> +	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	select BR2_PACKAGE_BLUEZ5_UTILS
>  	help
>  	  Bluetooth audio A2DP/AVDTP sink, AVDTP source plugin
>  
> -comment "bluez plugin needs a toolchain w/ wchar, threads, dynamic library"
> +comment "bluez plugin needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +comment "bluez plugin conflicts with older bluez-utils version"
> +	depends on BR2_PACKAGE_BLUEZ_UTILS
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
>  	bool "bz2"
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 32edde4901..e21ffae3d9 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -84,7 +84,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
> -GST1_PLUGINS_BAD_DEPENDENCIES += bluez_utils
> +GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-bluez
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-bluez
> 
