From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jul 2018 00:22:08 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <1532336135-10609-1-git-send-email-inigohuguet@fanamoel.com>
References: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
 <1532336135-10609-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <4a3746f6-f635-e3a2-0d09-deff9c106b70@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi I?igo,

On 23-07-18 10:55, I?igo Huguet wrote:
> gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
> is disabled. Added option to enable it, allowing to use elements
> qmlglsrc and qmlglsink.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in            | 10 ++++++++++
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 13 +++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index 3bb98a4..d55b445 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -283,6 +283,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
>  	help
>  	  Open Sound System (OSS) version 4 support for GStreamer
>  
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
> +	bool "qmlgl (qt5)"
> +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK

 We try to use select as much as possible. Selecting qt5 itself is a bit over
the top, but declarative and quick could be selected. So something like

	depends on BR2_PACKAGE_QT5
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST #
qt5declarative-quick
	select BR2_PACKAGE_QT5DECLARATIVE
	select BR2_PACKAGE_QT5DECLARATIVE_QUICK

> +	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB
> +	help
> +	  QT5 plugin which includes elements qmlglsrc and qmlglsink
> +	
> +comment "qmlgl (qt5) plugin depends on QT5 declarative with Quick module"
> +	depends on !BR2_PACKAGE_QT5DECLARATIVE_QUICK

 No comment would be needed for the qt5 (obvious that you need qt5 for qt5
support in GStreamer), no comment would be needed for JSCORE_AVAILABLE (it's an
arch dependency), but a comment is needed for GL_AVAILABLE. So:

comment "qmlgl (qt5) plugin needs an OpenGL-capable Qt5 backend"
	depends on BR2_PACKAGE_QT5
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST

> +
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
>  	bool "v4l2"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index 6fa989d..bc8242d 100644
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
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
> +endif
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL)$(BR2_PACKAGE_QT5BASE_XCB),yy)
> +GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras

 Better put this inside the condition above, so you don't need the ugly yy.

 Regards,
 Arnout

> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
