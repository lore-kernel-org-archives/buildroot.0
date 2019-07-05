From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 5 Jul 2019 17:18:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good:
 add option to enable/disable shout2 plugin
In-Reply-To: <20190705065015.29773-1-abloemert@gmail.com>
References: <20190705065015.29773-1-abloemert@gmail.com>
Message-ID: <20190705171809.36c29b5c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnould,

a little shorter subject line as the following should be enough:

   package/gst1-plugins-good: add shout2 plugin option


On Fri,  5 Jul 2019 08:50:15 +0200, Arnold Bloemert <abloemert@gmail.com> wrote:

> Currently there is no way to turn the shout2 plugin on.
> Create a menu entry allowing users to disable or enable the plugin,
> like we have for other features (for example the Pulseaudio plugin).

Given text is more suitable for a cover letter ;-), no special justification
for adding a missing option needed....

>
> Signed-off-by: Arnold Bloemert <abloemert@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in           | 6 ++++++
>  .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk    | 9 +++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index 433084fd6b..ce85388eb0 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -300,6 +300,12 @@ comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
>
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
> +        bool "shout2"
> +        select BR2_PACKAGE_LIBSHOUT
> +        help
> +          Elements to send data to an icecast server using libshout2
> +
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
>  	bool "v4l2"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index 829d27a2da..0a6cc77208 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -25,8 +25,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_GOOD_CONF_OPTS += \
>  	--disable-libdv \
> -	--disable-dv1394 \
> -	--disable-shout2
> +	--disable-dv1394
>
>  GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
>
> @@ -343,6 +342,12 @@ else
>  GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
>  endif
>
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2),y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += --enable-shout2

...missing:

    GST1_PLUGINS_GOOD_DEPENDENCIES += libshout

Otherwise looks good!

Regards,
Peter

> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += --disable-shout2
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
>  else
