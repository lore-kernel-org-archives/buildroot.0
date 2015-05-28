From: =?UTF-8?B?QmVub8OudCBUaMOpYmF1ZGVhdQ==?= <benoit@wsystem.com>
Date: Thu, 28 May 2015 16:45:18 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: add support for opengl
In-Reply-To: <87k2w67vg7.fsf@dell.be.48ers.dk>
References: <1431010700-3356-1-git-send-email-benoit@wsystem.com>	<1431010700-3356-2-git-send-email-benoit@wsystem.com>
 <87k2w67vg7.fsf@dell.be.48ers.dk>
Message-ID: <556729FE.9040603@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 2015/05/17 23:20, Peter Korsgaard wrote:
>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:
> 
>  > Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
>  > version" (from 1.2.4 to 1.4.1) removed the configuration option for the
>  > eglglessink plugin as a consequence of its removal in 1.3.1. However,
>  > that commit did not add support for glimagesink, the plugin element to
>  > be used as a replacement, which broke support for the EGL/GLES video
>  > sink feature in Buildroot.
> 
>  > This new commit adds support for the OpenGL library and the
>  > corresponding gl plugin, including the glimagesink element among others.
> 
>  > The plugin needs the library, but the library can also be used
>  > separately in order to link custom plugins or applications against it.
> 
>  > The library needs at least one OpenGL API, one OpenGL platform and one
>  > compatible window system. The implementations of these requirements that
>  > Buildroot can currently provide are:
>  >  - APIs: OpenGL, OpenGL ES 2.X,
>  >  - platforms: GLX, EGL,
>  >  - window systems: X11, Wayland, Dispmanx.
> 
>  > The wayland configure feature switch is shared between the corresponding
>  > OpenGL library window system and the waylandsink plugin.
> 
>  > This has been tested with videotestsrc/omxmpeg4videodec/omxh264dec and
>  > glimagesink on the Raspberry Pi, using OpenGL ES 2.X, EGL and Dispmanx.
> 
> First of all, thanks! Sorry, I haven't had time to review and test this
> completely, but here's a bit of feedback already.

You're welcome. Don't worry. Sorry for the late reply.

>  > +comment "libraries with external dependencies"
>  > +
>  > +menu "OpenGL"
> 
> Perhaps this should depend on BR2_PACKAGE_HAS_LIBGL ||
> BR2_PACKAGE_HAS_LIBGLES to not clutter the screen when it cannot do
> anything anyway?

Yes, changed in v2.

> Perhaps it should be a menuconfig instead so that there's a
> corresponding kconfig symbol to easily enable/disable it?

Yes, changed in v2.

>> +
>  > +config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
>  > +	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
>  > +
>  > +menu "APIs"
> 
> There is a lot of cascading menus which makes it hard to get an
> overview. Perhaps they should be replaced by comments instead
> (E.G. comment "APIs")?

Yes, changed in v2. In order to keep the overview idea, I've also added comments
for hidden options rather than hiding all platforms / window systems under a
single comment if unavailable. This is also more helpful for users to know what
is doable with this library.

>> +
>  > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
>  > +	bool
>  > +
>  > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
>  > +	bool "opengl"
>  > +	depends on BR2_PACKAGE_HAS_LIBGL
>  > +	select BR2_PACKAGE_LIBGLU
>  > +	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
>  > +
>  > +config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
>  > +	bool "gles2"
>  > +	depends on BR2_PACKAGE_HAS_LIBGLES
>  > +	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
> 
> Probably these should be default y so they get enabled if the
> dependencies are present, as that is most likely what the user wants.
> 
> Same comments for platforms and window systems.

Yes, changed in v2. For consistency of the OpenGL options, I've also changed
wayland into a dependency for the window system, rather than selecting it.
Otherwise, this would have been confusing, and making it "default y" would have
been too much.

>  > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
>  > +	bool "gl"
>  > +	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
> 
> Likewise this should probably be default y.

Yes, changed in v2.

>  > +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL),y)
>  > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-opengl
>  > +GST1_PLUGINS_BAD_DEPENDENCIES += libgl
> 
> I think you are missing libglu here.

Yes, changed in v2.

>> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
>  > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
>  > +GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
>  > +					xlib_libXext libeet
> 
> libeet? What does that have to do with opengl?

Nothing, removed in v2. It was a leftover of a copy from libevas.

>> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11),y)
>  > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-x11
>  > +GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
>  > +					xlib_libXext libeet
> 
> As GLX implies X11 and the dependencies are the same, perhaps we should
> just handle them together? (E.G. move the enable-x11 / disable-x11 up
> to the glx option).

I've reworked the GLX/X11 options and dependencies in v2. The dependencies for
X11 are now lighter, and GLX selects X11.

Note that I have not tested the X11 and Wayland paths other than in menuconfig
(i.e. not built, not run). I didn't know how the sub-packages of X.org are
organized, so I've tried to figure out the requirements from the
gst1-plugins-bad configure script and other packages using X11 with OpenGL. I've
not found real-world defconfigs to test these cases, but if you give me
pointers, I can launch some builds.

Best regards,
Beno?t
