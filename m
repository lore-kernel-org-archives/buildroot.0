From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 13:27:15 +0200
Subject: [Buildroot] [PATCH 07/14] gst1-plugins-bad: enable webrtc plugin
In-Reply-To: <1478167120-3285-7-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
 <1478167120-3285-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161103112715.lv2scrwvsyksqlcz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Nov 03, 2016 at 06:58:33AM -0300, Gustavo Zacarias wrote:
> It's new for 1.10.0, add an explicit option for the webrtc plugin.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in      | 28 ++++++++++++++++++++++
>  .../gst1-plugins-bad/gst1-plugins-bad.mk           |  7 ++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 37731cf..1d28a66 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -522,10 +522,21 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK
>  	bool "fdkaac"
> +	# Dependencies from fdk-aac
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
> +		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_powerpc || BR2_sh
>  	select BR2_PACKAGE_FDK_AAC
>  	help
>  	  MPEG AAC encoder/decoder
>  
> +comment "fdkaac needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
> +		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_powerpc || BR2_sh
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
>  	bool "gl"
>  	default y

This hunk belongs to the previous patch.

> @@ -676,6 +687,23 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
>  	help
>  	  Webp image format plugin
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
> +	bool "webrtc"
> +	# All depends from webrtc-audio-processing
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
> +	select BR2_PACKAGE_WEBRTC
> +	help
> +	  WebRTC echo-cancellation, gain control and noise suppression
> +
> +comment "webrtc needs a toolchain w/ C++, NPTL, gcc >= 4.8"
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
>  	bool "x265"
>  	depends on BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 77f64e4..3352f1a 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -794,6 +794,13 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
> +GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
> +else
> +GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
>  GST1_PLUGINS_BAD_DEPENDENCIES += x265

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
