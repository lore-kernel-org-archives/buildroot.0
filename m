From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 5 Jun 2019 11:51:48 +0300
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 add wpe plugin option
In-Reply-To: <20190605055125.38900-1-james.hilliard1@gmail.com>
References: <20190605055125.38900-1-james.hilliard1@gmail.com>
Message-ID: <20190605115148.GB20297@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jun 2019 23:51:25 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> Removed gst1-plugins-bad dependency from wpewebkit gstreamer-gl option
> so that there isn't a circular dependency with gst1-plugins-bad.
> 
> It appears that wpewebkit gstreamer-gl only has a runtime dependency on
> gst1-plugins-bad.

That's correct.

By the way, thanks for submitting a patch for enabling the WPE GStreamer
element ? I completely forgot about it when making the update to WPE
WebKit 2.24.x  :-)

(Note to self: have an option to enable the WPEQt API when the needed
Qt dependencies are enabled.)

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in          | 10 ++++++++++
>  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk    |  7 +++++++
>  package/wpewebkit/wpewebkit.mk                         |  1 -
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index e1e7b05a59..3d19012e95 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -583,6 +583,16 @@ comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
> +	bool "wpe"
> +	default y
> +	depends on BR2_PACKAGE_WPEWEBKIT
> +	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +
> +comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
> +	depends on !BR2_PACKAGE_WPEWEBKIT \
> +		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
>  	bool "x265"
>  	depends on BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 32edde4901..c6e2877dde 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -698,6 +698,13 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-wpe
> +GST1_PLUGINS_BAD_DEPENDENCIES += wpewebkit
> +else
> +GST1_PLUGINS_BAD_CONF_OPTS += --disable-wpe
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
>  GST1_PLUGINS_BAD_DEPENDENCIES += x265
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index b59a1f793a..4dc4a29064 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -34,7 +34,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
>  WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
> -WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
>  else
>  WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
>  endif
> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190605/1b0db9a8/attachment.asc>
