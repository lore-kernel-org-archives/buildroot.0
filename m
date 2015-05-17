From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 23:20:08 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: add support for opengl
In-Reply-To: <1431010700-3356-2-git-send-email-benoit@wsystem.com>
 (=?utf-8?Q?=22Beno=C3=AEt=09Th=C3=A9baudeau=22's?= message of "Thu, 7 May
 2015 16:58:20 +0200")
References: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
 <1431010700-3356-2-git-send-email-benoit@wsystem.com>
Message-ID: <87k2w67vg7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:

 > Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
 > version" (from 1.2.4 to 1.4.1) removed the configuration option for the
 > eglglessink plugin as a consequence of its removal in 1.3.1. However,
 > that commit did not add support for glimagesink, the plugin element to
 > be used as a replacement, which broke support for the EGL/GLES video
 > sink feature in Buildroot.

 > This new commit adds support for the OpenGL library and the
 > corresponding gl plugin, including the glimagesink element among others.

 > The plugin needs the library, but the library can also be used
 > separately in order to link custom plugins or applications against it.

 > The library needs at least one OpenGL API, one OpenGL platform and one
 > compatible window system. The implementations of these requirements that
 > Buildroot can currently provide are:
 >  - APIs: OpenGL, OpenGL ES 2.X,
 >  - platforms: GLX, EGL,
 >  - window systems: X11, Wayland, Dispmanx.

 > The wayland configure feature switch is shared between the corresponding
 > OpenGL library window system and the waylandsink plugin.

 > This has been tested with videotestsrc/omxmpeg4videodec/omxh264dec and
 > glimagesink on the Raspberry Pi, using OpenGL ES 2.X, EGL and Dispmanx.

First of all, thanks! Sorry, I haven't had time to review and test this
completely, but here's a bit of feedback already.


 > +comment "libraries with external dependencies"
 > +
 > +menu "OpenGL"

Perhaps this should depend on BR2_PACKAGE_HAS_LIBGL ||
BR2_PACKAGE_HAS_LIBGLES to not clutter the screen when it cannot do
anything anyway?

Perhaps it should be a menuconfig instead so that there's a
corresponding kconfig symbol to easily enable/disable it?


> +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
 > +	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
 > +
 > +menu "APIs"

There is a lot of cascading menus which makes it hard to get an
overview. Perhaps they should be replaced by comments instead
(E.G. comment "APIs")?


> +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
 > +	bool
 > +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
 > +	bool "opengl"
 > +	depends on BR2_PACKAGE_HAS_LIBGL
 > +	select BR2_PACKAGE_LIBGLU
 > +	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
 > +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
 > +	bool "gles2"
 > +	depends on BR2_PACKAGE_HAS_LIBGLES
 > +	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API

Probably these should be default y so they get enabled if the
dependencies are present, as that is most likely what the user wants.

Same comments for platforms and window systems.


 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 > +	bool "gl"
 > +	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL

Likewise this should probably be default y.


 > +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL),y)
 > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-opengl
 > +GST1_PLUGINS_BAD_DEPENDENCIES += libgl

I think you are missing libglu here.


> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
 > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
 > +GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
 > +					xlib_libXext libeet

libeet? What does that have to do with opengl?


> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11),y)
 > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-x11
 > +GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
 > +					xlib_libXext libeet

As GLX implies X11 and the dependencies are the same, perhaps we should
just handle them together? (E.G. move the enable-x11 / disable-x11 up
to the glx option).

-- 
Bye, Peter Korsgaard
