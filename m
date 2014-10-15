From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Oct 2014 14:48:47 +0200
Subject: [Buildroot] [Patch v2 2/2] libgtk3: new package
In-Reply-To: <1413204863-15372-3-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 13 Oct 2014 14:54:23 +0200")
References: <1413204863-15372-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1413204863-15372-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87ppdtpkgg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 > This package provides Gtk+ 3.0, a graphical toolkit.

 > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > [Eric: added backend support, use of pkgconf for host-libgtk3]
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > +++ b/package/libgtk3/Config.in
 > @@ -0,0 +1,87 @@
 > +config BR2_PACKAGE_LIBGTK3
 > +	bool "libgtk3"
 > +	select BR2_PACKAGE_ATK
 > +	select BR2_PACKAGE_CAIRO
 > +	select BR2_PACKAGE_CAIRO_PS
 > +	select BR2_PACKAGE_CAIRO_PDF
 > +	select BR2_PACKAGE_CAIRO_SVG
 > +	select BR2_PACKAGE_LIBGLIB2
 > +	select BR2_PACKAGE_PANGO
 > +	select BR2_PACKAGE_GDK_PIXBUF
 > +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND

That's not true, as you can build the HTML5 backend without any of
these. What we do need to do is to ensure atleast one backend is
enabled. As the HTML5 doesn't have any extra dependencies, that is the
one we should force enable if needed like this:

	# atleast 1 backend must be enabled
	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
	       !(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)

 > +	depends on BR2_USE_WCHAR # glib2
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 > +	depends on BR2_USE_MMU # glib2
 > +	depends on BR2_INSTALL_LIBSTDCPP # pango
 > +	depends on BR2_ARCH_HAS_ATOMICS # cairo
 > +	help
 > +	  The GTK+ version 3 graphical user interface library
 > +
 > +	  http://www.gtk.org/
 > +
 > +if BR2_PACKAGE_LIBGTK3
 > +
 > +comment "GDK backend"
 > +
 > +config BR2_PACKAGE_LIBGTK3_X11
 > +	bool "GDK X11 backend"
 > +	default y
 > +	depends on BR2_PACKAGE_XORG7
 > +	select BR2_PACKAGE_FONTCONFIG
 > +	select BR2_PACKAGE_XLIB_LIBX11
 > +	select BR2_PACKAGE_XLIB_LIBXEXT
 > +	select BR2_PACKAGE_XLIB_LIBXRENDER
 > +	select BR2_PACKAGE_XLIB_LIBXI
 > +	help
 > +	  This enables the X11 backend for GDK.
 > +
 > +config BR2_PACKAGE_LIBGTK3_WAYLAND
 > +	bool "GDK Wayland backend"
 > +	default y
 > +	depends on BR2_PACKAGE_WAYLAND
 > +	select BR2_PACKAGE_LIBXKBCOMMON
 > +	help
 > +	  This enables the Wayland backend for GDK.
 > +
 > +config BR2_PACKAGE_LIBGTK3_BROADWAY
 > +	bool "GDK Broadway backend"
 > +	default n

'n' is the default value, so this can get dropped.

 > +	help
 > +	  This enables the Broadway backend for GDK, which provides support
 > +	  for displaying GTK+ applications in a web browser, using HTML5 and
 > +	  web sockets.
 > +
 > +	  For example, to run gtk3-demo on a target which IP address is
 > +	  192.168.0.1 and use it from a web browser, execute the following
 > +	  commands:
 > +
 > +	    $ broadwayd -a 192.168.0.1 -p 8080 :2 &
 > +	    $ export GDK_BACKEND=broadway
 > +	    $ export BROADWAY_DISPLAY=:2
 > +	    $ gtk3-demo

Thanks, that's very nice. For a "normal" (E.G. single network interface)
I believe we can drop the -a 192.168.0.1 part.


 > +++ b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 > @@ -0,0 +1,25 @@
 > +Same patch as for systemd in commit
 > +7144f2f04b705538a893e538a6b851f536f433b6:

It might not be clear to people what repository this commit id refers to
so I've added a link to cgit.


 > +++ b/package/libgtk3/libgtk3-0002-fix-introspection-check.patch
 > @@ -0,0 +1,28 @@
 > +Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
 > +
 > +During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolve because we

s/resolve/resolved/


 > +++ b/package/libgtk3/libgtk3.mk
 > @@ -0,0 +1,174 @@
 > +################################################################################
 > +#
 > +# libgtk3
 > +#
 > +################################################################################
 > +
 > +LIBGTK3_VERSION_MAJOR = 3.12
 > +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
 > +LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 > +LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 > +LIBGTK3_LICENSE = LGPLv2+
 > +LIBGTK3_LICENSE_FILES = COPYING
 > +LIBGTK3_INSTALL_STAGING = YES
 > +LIBGTK3_AUTORECONF = YES
 > +
 > +LIBGTK3_CONF_ENV = \
 > +	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
 > +	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
 > +
 > +LIBGTK3_CONF_ENV  = ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
 > +		    ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
 > +		    PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/usr/bin/pkgconf
 > +

_ENV is defined twice. We already pass the correct pkg-config to
configure, so I've dropped the 2nd part.


 > +LIBGTK3_CONF_OPTS = --disable-glibtest \
 > +	--enable-explicit-deps=no \
 > +	--enable-gtk2-dependency \

Why? What does this do?


 > +	--disable-debug \

Debugging is disabled by default (for stable gtk3 releases), and
pkg-autotools.mk already pass --enable-debug if needed so this can get
dropped.

Committed with these fixes, thanks!

-- 
Bye, Peter Korsgaard
