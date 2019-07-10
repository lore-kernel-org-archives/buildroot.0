From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Jul 2019 23:13:18 +0200
Subject: [Buildroot] [PATCH v2 5/6]
 package/gstreamer1/gst1-plugins-ugly: convert package type to meson
In-Reply-To: <20190710153634.25235-6-aduskett@gmail.com>
References: <20190710153634.25235-1-aduskett@gmail.com>
 <20190710153634.25235-6-aduskett@gmail.com>
Message-ID: <20190710231318.7fea1fb6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed, 10 Jul 2019 11:36:33 -0400, aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
>
> GStreamer 1.16.0 is the last version to support autotools, and will be removed
> in the next version.

See previous patch...

>
> Other changes:
>   - Valgrind is no longer an option and is checked via headers, so the option
>     has been removed entirely, because the Valgrind package check is now in
>     the base gstreamer1 package.

See previous patch...

>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add -Dexamples=disabled as a default config value. (Peter)
>
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    | 55 ++++++++++---------
>  1 file changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> index f3ac2f79d3..588729b7d7 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> @@ -11,79 +11,82 @@ GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
>  # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
>  GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+
>
> -GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
> +GST1_PLUGINS_UGLY_CONF_OPTS += \
> +	-Dtests=disabled \
> +	-Dexamples=disabled

Keep the order:

  -Dexamples=disabled \
  -Dtests=disabled

Missing:

+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled \

>
>  GST1_PLUGINS_UGLY_CONF_OPTS += \
> -	--disable-a52dec \
> -	--disable-amrnb \
> -	--disable-amrwb \
> -	--disable-cdio \
> -	--disable-sidplay \
> -	--disable-twolame

What happend to --disable-twolame?

> +	-Da52dec=disabled \
> +	-Damrnb=disabled \
> +	-Damrwbdec=disabled \
> +	-Dcdio=disabled \
> +	-Dsidplay=disabled
>
>  GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
>
>  ifeq ($(BR2_PACKAGE_ORC),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-orc
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=enabled
>  GST1_PLUGINS_UGLY_DEPENDENCIES += orc
> +else
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=enabled
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=enabled
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=enabled
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-xingmux
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=enabled
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-xingmux
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=enabled
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
>  # configure does not use pkg-config to detect libdvdread
>  ifeq ($(BR2_PACKAGE_LIBDVDCSS)$(BR2_STATIC_LIBS),yy)
> -GST1_PLUGINS_UGLY_CONF_ENV += LIBS="-ldvdcss"
> +GST1_PLUGINS_UGLY_LDFLAGS +="-ldvdcss"

Missing space (GST1_PLUGINS_UGLY_LDFLAGS += "-ldvdcss")?

Regards,
Peter

>  endif
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdread
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=enabled
>  GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
>  GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=enabled
>  GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
>  GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=disabled
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264),y)
> -GST1_PLUGINS_UGLY_CONF_OPTS += --enable-x264
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=enabled
>  GST1_PLUGINS_UGLY_DEPENDENCIES += x264
>  GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
>  else
> -GST1_PLUGINS_UGLY_CONF_OPTS += --disable-x264
> +GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=disabled
>  endif
>
>  # Add GPL license if GPL plugins enabled.
> @@ -94,4 +97,4 @@ endif
>  # Use the following command to extract license info for plugins.
>  # # find . -name 'plugin-*.xml' | xargs grep license
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
