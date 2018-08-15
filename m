From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 15 Aug 2018 21:02:49 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <1533208261-13853-1-git-send-email-inigohuguet@fanamoel.com>
References: <4a3746f6-f635-e3a2-0d09-deff9c106b70@mind.be>
 <1533208261-13853-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <20180815210249.5e11df4d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello I?igo,

thanks for the updated patch, most of the points from the first version
reviews ([1]) seem to be fixed, but...

On Thu,  2 Aug 2018 13:11:01 +0200, I?igo Huguet <inigohuguet@fanamoel.com> wrote:

> gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
> is disabled. Added option to enable it, allowing to use elements
> qmlglsrc and qmlglsink.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in           | 16 ++++++++++++++++
>  .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk    | 13 +++++++++++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index afb9a41..62ac07b 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -283,6 +283,22 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
>  	help
>  	  Open Sound System (OSS) version 4 support for GStreamer
> 
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
> +	bool "qmlgl (qt5)"
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative-quick
> +	select BR2_PACKAGE_QT5DECLARATIVE
> +	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> +	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB

Needs to select BR2_PACKAGE_QT5BASE_WIDGETS to enable the host uic command
(otherwise gst1-plugins-good configure disables qt support with the message
'One of the required qt build programs was not found')...

Next failure was because the search for qplatformnativeinterface.h failed, fixed
by the following patch:

	$ cat package/gstreamer1/gst1-plugins-good/0001-configure-fix-qt-qpa-detection.patch 
--- gst1-plugins-good-1.14.2/configure_orig	2018-08-15 19:42:48.065311007 +0200
+++ gst1-plugins-good-1.14.2/configure	2018-08-15 19:42:58.665528543 +0200
@@ -35924,7 +35924,7 @@
       else
         HAVE_QT="yes"
         HAVE_QT_WINDOWING="no"
-        QT_VERSION="`$PKG_CONFIG --define-prefix --modversion Qt5Core`"
+        QT_VERSION="`$PKG_CONFIG --modversion Qt5Core`"
         QPA_INCLUDE_PATH=`$PKG_CONFIG --variable=includedir Qt5Core`/QtGui/${QT_VERSION}/QtGui
         if test -f "$PKG_CONFIG_SYSROOT_DIR/$QPA_INCLUDE_PATH/qpa/qplatformnativeinterface.h"; then :
 
According to [2] the '--define-prefix' option is introduced with pkgconf-1.2.0 (buildroot is
still using 0.9.12)...

The last failure ('Could not find any Qt Windowing integration') is fixed by
selecting BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL...

> +	help
> +	  QT5 plugin which includes elements qmlglsrc and qmlglsink
> +	

Spurious tab in the line above (checkout check-package to avoid this one [3])...

Patch iteration version and changelog (see [4]) would be nice for the next patch
iteration ;-)

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/792000/
[2] https://github.com/pkgconf/pkgconf/blob/master/NEWS
[3] http://nightly.buildroot.org/manual.html#_tips_and_tric
[4] http://nightly.buildroot.org/manual.html#submitting-patches

> +comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
> +
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
>  	bool "v4l2"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index c1ed039..ef28f2d 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -20,8 +20,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
>  	--disable-osx_video \
>  	--disable-aalib \
>  	--disable-aalibtest \
> -	--disable-libcaca \
> -	--disable-qt
> +	--disable-libcaca
>  
>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_GOOD_CONF_OPTS += \
> @@ -328,6 +327,16 @@ else
>  GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL),y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += --enable-qt
> +GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative
> +ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> +GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
> +endif
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
>  else
