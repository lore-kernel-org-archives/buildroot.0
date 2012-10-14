From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 16:05:47 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121014160547.09c493d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 10 Sep 2012 01:40:45 +0200, Yann E. MORIN wrote:

> To be noted, the changes in patch 4 to 6 are purely mechanical, and will need
> more review and manual tweaks before that series can be applied. Most notably,
> having the gettext rework series [0] applied first would eliminate a large
> class of corner-cases (eg. cases like: "select PKG_FOO if BLA"). Also, some
> packages have 'select' on other package's options, and that needs to be
> manually reviewed, as it's not easy to distinguish a package's option symbol
> from a package symbol (eg. BR2_PACKAGE_UTIL_LINUX_MOUNT: is it a package named
> 'util-linux-mount', or is it the option 'mount' of a package named
> 'util-linux'?)

Ok, I noted three "problems", that I think will have to fixed manually.

Problem 1: recursive dependencies introduced
============================================

Running 'make menuconfig', I get:

package/python/Config.in:6:error: recursive dependency detected!
package/python/Config.in:6:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_PYTHON_DPKT
package/python-dpkt/Config.in:5:	symbol BR2_PACKAGE_PYTHON_DPKT depends on BR2_PACKAGE_PYTHON
package/x11r7/Config.in:1:error: recursive dependency detected!
package/x11r7/Config.in:1:	symbol BR2_PACKAGE_XORG7 is selected by BR2_PACKAGE_MATCHBOX
package/matchbox/Config.in:10:	symbol BR2_PACKAGE_MATCHBOX depends on BR2_PACKAGE_MATCHBOX_AVAILABLE
package/matchbox/Config.in:1:	symbol BR2_PACKAGE_MATCHBOX_AVAILABLE depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
package/x11r7/xlib_libXext/Config.in:1:	symbol BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE depends on BR2_PACKAGE_XORG7
package/x11r7/Config.in:16:error: recursive dependency detected!
package/x11r7/Config.in:16:	choice <choice> contains symbol BR2_PACKAGE_XSERVER_xorg
package/x11r7/Config.in:22:	symbol BR2_PACKAGE_XSERVER_xorg is part of choice BR2_PACKAGE_MESA3D
package/x11r7/mesa3d/Config.in:13:	symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
package/efl/libevas/Config.in:144:	symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
package/efl/libevas/Config.in:139:	choice <choice> contains symbol <choice>
package/efl/libevas/Config.in:139:	choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
package/efl/libevas/Config.in:86:	symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_XSERVER_xorg
package/x11r7/Config.in:22:	symbol BR2_PACKAGE_XSERVER_xorg is part of choice <choice>
package/libgtk2/Config.in:15:error: recursive dependency detected!
package/libgtk2/Config.in:15:	symbol BR2_PACKAGE_LIBGTK2 is selected by BR2_PACKAGE_LIBGLADE
package/libglade/Config.in:9:	symbol BR2_PACKAGE_LIBGLADE is selected by BR2_PACKAGE_SYSPROF_GUI
package/sysprof/Config.in:19:	symbol BR2_PACKAGE_SYSPROF_GUI depends on BR2_PACKAGE_LIBGTK2
package/multimedia/gst-plugins-base/Config.in:5:error: recursive dependency detected!
package/multimedia/gst-plugins-base/Config.in:5:	symbol BR2_PACKAGE_GST_PLUGINS_BASE is selected by BR2_PACKAGE_QT_PHONON
package/qt/Config.in:268:	symbol BR2_PACKAGE_QT_PHONON depends on BR2_PACKAGE_GSTREAMER
package/multimedia/gstreamer/Config.in:6:	symbol BR2_PACKAGE_GSTREAMER is selected by BR2_PACKAGE_GST_PLUGINS_BASE

Looking at the first one, it seems to be caused by the fact that all
Python external packages are enclosed inside a "if BR2_PACKAGE_PYTHON"
in package/Config.in, so this Python dependency is already available.

I think this problem can only be solved with manual intervention.

Problem 2: incorrect addition of dependencies on package sub-options
====================================================================

In package/python-dpkt/Config.in, your script generates:

 config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
        def_bool y
        depends on BR2_PACKAGE_PYTHON_AVAILABLE
        depends on BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE

But the last line shouldn't be there. BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
doesn't exist: BR2_PACKAGE_PYTHON_ZLIB is a sub-option of the python
package.

On the other hand, the sub-option are lacking the addition of "depends
on ..._AVAILABLE", for example in package/python/Config.in:

 config BR2_PACKAGE_PYTHON_ZLIB
        bool "zlib module"
        select BR2_PACKAGE_ZLIB
        help
          zlib support in Python

this should become:

 config BR2_PACKAGE_PYTHON_ZLIB
        bool "zlib module"
        select BR2_PACKAGE_ZLIB
+       depends on BR2_PACKAGE_ZLIB_AVAILABLE
        help
          zlib support in Python

But then in that case, we should also have a
BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE symbol, so that python-dpkt can
depend on it instead of forcefully selecting BR2_PACKAGE_PYTHON_ZLIB,
without knowing if zlib is available or not.

This problem however is going to be present in many many places, so I
don't know if manual intervention is reasonable for it. But on the
other hand, I am not sure it is possible to write an automated script
to solve this problem.

Problem 3: removing legacy
==========================

Due to the absence of such a _AVAILABLE mechanism, we have added a lot
of "depends on" in many packages that would now become useless. Take
for example libgtk2:

config BR2_PACKAGE_LIBGTK2_AVAILABLE
        def_bool y
        depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
        depends on BR2_USE_WCHAR # glib2
        depends on BR2_INSTALL_LIBSTDCPP # pango
	[...]

Those last two "depends on" are now useless, because those dependencies
are automatically provided by the depends on CAIRO_AVAILABLE and
LIBGLIB2_AVAILABLE.

So those legacy dependencies should be removed.

Here, I don't think an automated process is possible, a human
intervention will be needed to find out if those legacy dependencies
can be removed or not, on a case by case basis.

So all in all, the problem I'm most worried about is problem (2). Have
you thought about it already?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
