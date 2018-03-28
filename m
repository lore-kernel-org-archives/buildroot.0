From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 28 Mar 2018 16:22:33 +0200
Subject: [Buildroot] RFC: gst1-plugins-good 1.14: enable-qt config option
In-Reply-To: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
References: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
Message-ID: <f148b224-5d1d-de86-91fe-13379549cd6a@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TL;DR so far: How to configure in gstreamer-gl-1.0 ? see below.

On 2018-03-27 10:57, Martin Kepplinger wrote:
> So the goal here is to optionally get gst1-plugins-good's qt module to
> be built (and have the qmlglsink gstreamer element) with Qt and eglfs
> platform.
> 
> (Keep in mind that the qt-module moved from plugins-bad to plugins-good
> during the 1.12 to 1.14 update):
> 
> First, a config option for plugin-good's "qt" would be needed. here's
> some pseudo-code of what I mean, to make it clea:
> 
> config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QT
>        bool "qt"
>        help
>          Qt plugin
> 
> (...)
> 
> ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QT),y)
> GST1_PLUGINS_GOOD_CONF_OPTS += --enable-qt
> GST1_PLUGINS_GOOD_DEPENDENCIES += qt5
> else
> GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
> endif
> 
> ------------------
> ok. let's ignore that for a second. instead I simply remove --disable-qt
> (or say --enable-qt) and build it *after* Qt for now. Then I get:
> 
> configure: *** checking feature: Qt elements ***
> 
> configure: *** for plug-ins: qt ***
> 
> checking for QT... yes
> 
> checking for moc-qt5... no
> 
> checking for moc... /home/martin/dev/buildroot-2018.02/output/host/bin/moc
> checking for rcc-qt5... no
> 
> checking for rcc... /home/martin/dev/buildroot-2018.02/output/host/bin/rcc
> checking for uic-qt5... no
> 
> checking for uic... /home/martin/dev/buildroot-2018.02/output/host/bin/uic
> configure: Cannot find QPA
> 
> configure: *** These plugins will not be built: qt
> 
> 
> 

Alright. For --enable-qt we need, additionally to Qt (circa, not the
definitive answer):

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL=y

BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11=y

We then additionally get from configure (along with "Cannot find QPA"
which doesnt matter now):

 configure: WARNING: Could not find any Qt Windowing integration

So HAVE_QT_WINDOWING is never set to yes, which means
GST_GL_HAVE_PLATFORM_EGL is not set to 1 :(

Well, this is set to 1, if the following string contains "egl":
 GST_GL_PLATFORMS=`$PKG_CONFIG --variable=gl_platforms gstreamer-gl-1.0`

So I indeed also find:

checking for GST_GL... no

configure: Package gstreamer-gl-1.0 was not found in the pkg-config
search path.
Perhaps you should add the directory containing `gstreamer-gl-1.0.pc'

to the PKG_CONFIG_PATH environment variable

Package 'gstreamer-gl-1.0', required by 'world', not found


So: How can I build this gstreamer-gl-1.0 library?
https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-base-libs/html/gl.html


thanks for any hints,

                                 martin
