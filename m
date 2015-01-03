From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sat, 03 Jan 2015 17:38:22 +0100
Subject: [Buildroot] [RFC] Wine package
In-Reply-To: <20150102202921.32005f37@free-electrons.com>
References: <54A6CF2D.1090706@dawncrow.de>	<20150102191347.229139f2@free-electrons.com>	<54A6E9C0.7060109@dawncrow.de>
 <20150102202921.32005f37@free-electrons.com>
Message-ID: <54A81AFE.3030509@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I did a lot of tests, could i please have such good comments again on my current state?
First i'll respond to some comments inline (removed comments are simply done):

Am 02.01.2015 um 20:29 schrieb Thomas Petazzoni:
> Indentation is not correct for this line. Also, just for curiosity,
> could you give some details on the issues you've seen when building
> wine against uclibc?
> 
> Does it work with the musl C library? In other words, do you need:
> 
> 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> 
> or:
> 
> 	depends on BR2_TOOLCHAIN_USES_GLIBC
> 
>  ?

See https://bugs.winehq.org/show_bug.cgi?id=37809 for the uclibc problem (bessel functions).
With musl it is version dependent on the Wine side, newer versions support it, but not the stable one.
I choosed to start with the stable version (1.6.2), so i'll depend on glibc.

>> +WINE_DEPENDENCIES = host-wine
>> +WINE_CONF_OPTS += --disable-tests --with-wine-tools=../host-wine-$(WINE_VERSION)
> 
> Having the target wine poke directly inside the source directory of
> host-wine isn't that great. Ideally, we should be able to remove the
> source directory of a package immediately after it has been built. The
> host wine package gets installed to $(HOST_DIR). Aren't the tools you
> need also installed there? If not, then please add a comment above this
> line that explains what is going on.

As i explain now in a comment, Wine expects e.g. winebuild to be at tools/winebuild/winebuild
which is true in the Wine source tree (or out of tree build of wine), but not in the installed bin/ folder

> Other than that, looks good. Do you have a pointer to a simple
> command-line only Windows program that we could potentially use to test
> this wine package?

maybe http://sourceforge.net/projects/win32svn/


NOW to the new patch:

diff --git a/package/Config.in b/package/Config.in
index a4f5d8b..e59b458 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -997,6 +997,7 @@ menu "Miscellaneous"
 	source "package/snowball-init/Config.in"
 	source "package/sound-theme-borealis/Config.in"
 	source "package/sound-theme-freedesktop/Config.in"
+	source "package/wine/Config.in"
 endmenu

 menu "Networking applications"
diff --git a/package/wine/Config.in b/package/wine/Config.in
new file mode 100644
index 0000000..e7329e4
--- /dev/null
+++ b/package/wine/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_WINE
+	bool "wine"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Wine has much CPU specific code
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Wine is a compatibility layer capable of running
+	  Windows applications on Linux. Instead of simulating internal
+	  Windows logic like a virtual machine or emulator,
+	  Wine translates Windows API calls into POSIX calls on-the-fly,
+	  eliminating the performance and memory penalties of other methods.
+
+	  http://www.winehq.org
+
+comment "wine needs a (e)glibc toolchain w/ IPv6, threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
new file mode 100644
index 0000000..13329f3
--- /dev/null
+++ b/package/wine/wine.mk
@@ -0,0 +1,264 @@
+################################################################################
+#
+# wine
+#
+################################################################################
+
+WINE_VERSION = 1.6.2
+WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
+WINE_SITE = http://source.winehq.org/git/wine.git/snapshot/
+WINE_LICENSE = LGPLv2.1+
+WINE_LICENSE_FILES = COPYING.LIB
+WINE_INSTALL_TARGET = YES
+WINE_DEPENDENCIES = host-wine
+
+#Wine needs its own directory structure and tools for cross compiling
+WINE_CONF_OPTS += --with-wine-tools=../host-wine-$(WINE_VERSION)
+WINE_CONF_OPTS += --disable-tests
+WINE_CONF_OPTS += --without-opengl
+WINE_CONF_OPTS += $(if $(BR2_ARCH_IS_64),--enable-win64)
+
+HOST_WINE_DEPENDENCIES =
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+	WINE_CONF_OPTS += --with-cups
+	WINE_DEPENDENCIES += cups
+else
+	WINE_CONF_OPTS += --without-cups
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	WINE_CONF_OPTS += --with-dbus
+	WINE_DEPENDENCIES += dbus
+else
+	WINE_CONF_OPTS += --without-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+	WINE_CONF_OPTS += --with-fontconfig
+	WINE_DEPENDENCIES += fontconfig
+else
+	WINE_CONF_OPTS += --without-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+	WINE_CONF_OPTS += --with-freetype
+	HOST_WINE_CONF_OPTS += --with-freetype
+	WINE_DEPENDENCIES += freetype
+	HOST_WINE_DEPENDENCIES += host-freetype
+else
+	WINE_CONF_OPTS += --without-freetype
+	HOST_WINE_CONF_OPTS += --without-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+	WINE_CONF_OPTS += --with-gnutls
+	WINE_DEPENDENCIES += gnutls
+else
+	WINE_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+	WINE_CONF_OPTS += --with-gstreamer
+	WINE_DEPENDENCIES += gst-plugins-base
+else
+	WINE_CONF_OPTS += --without-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	WINE_CONF_OPTS += --with-jpeg
+	WINE_DEPENDENCIES += jpeg
+else
+	WINE_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+	WINE_CONF_OPTS += --with-cms
+	WINE_DEPENDENCIES += lcms2
+else
+	WINE_CONF_OPTS += --without-cms
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLU),y)
+	WINE_CONF_OPTS += --with-glu
+	WINE_DEPENDENCIES += libglu
+else
+	WINE_CONF_OPTS += --without-glu
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+	WINE_CONF_OPTS += --with-pcap
+	WINE_DEPENDENCIES += libpcap
+else
+	WINE_CONF_OPTS += --without-pcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	WINE_CONF_OPTS += --with-png
+	WINE_DEPENDENCIES += libpng
+else
+	WINE_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+	WINE_CONF_OPTS += --with-v4l
+	WINE_DEPENDENCIES += libv4l
+else
+	WINE_CONF_OPTS += --without-v4l
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+	WINE_CONF_OPTS += --with-xml
+	WINE_DEPENDENCIES += libxml2
+else
+	WINE_CONF_OPTS += --without-xml
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+	WINE_CONF_OPTS += --with-xslt
+	WINE_DEPENDENCIES += libxslt
+else
+	WINE_CONF_OPTS += --without-xslt
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+	WINE_CONF_OPTS += --with-mpg123
+	WINE_DEPENDENCIES += mpg123
+else
+	WINE_CONF_OPTS += --without-mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	WINE_CONF_OPTS += --with-curses
+	WINE_DEPENDENCIES += ncurses
+else
+	WINE_CONF_OPTS += --without-curses
+endif
+
+ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
+	WINE_CONF_OPTS += --with-sane
+	WINE_DEPENDENCIES += sane-backends
+else
+	WINE_CONF_OPTS += --without-sane
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+	WINE_CONF_OPTS += --with-tiff
+	WINE_DEPENDENCIES += tiff
+else
+	WINE_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+	WINE_CONF_OPTS += --with-x
+	WINE_DEPENDENCIES += xlib_libX11
+else
+	WINE_CONF_OPTS += --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+	WINE_CONF_OPTS += --with-xcomposite
+	WINE_DEPENDENCIES += xlib_libXcomposite
+else
+	WINE_CONF_OPTS += --without-xcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+	WINE_CONF_OPTS += --with-xcursor
+	WINE_DEPENDENCIES += xlib_libXcursor
+else
+	WINE_CONF_OPTS += --without-xcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+	WINE_CONF_OPTS += --with-xinput --with-xinput2
+	WINE_DEPENDENCIES += xlib_libXi
+else
+	WINE_CONF_OPTS += --without-xinput --without-xinput2
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+	WINE_CONF_OPTS += --with-xinerama
+	WINE_DEPENDENCIES += xlib_libXinerama
+else
+	WINE_CONF_OPTS += --without-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+	WINE_CONF_OPTS += --with-xrandr
+	WINE_DEPENDENCIES += xlib_libXrandr
+else
+	WINE_CONF_OPTS += --without-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+	WINE_CONF_OPTS += --with-xrender
+	WINE_DEPENDENCIES += xlib_libXrender
+else
+	WINE_CONF_OPTS += --without-xrender
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+	WINE_CONF_OPTS += --with-xxf86vm
+	WINE_DEPENDENCIES += xlib_libXxf86vm
+else
+	WINE_CONF_OPTS += --without-xxf86vm
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	WINE_CONF_OPTS += --with-zlib
+	WINE_DEPENDENCIES += zlib
+else
+	WINE_CONF_OPTS += --without-zlib
+endif
+
+HOST_WINE_CONF_OPTS += \
+	--disable-tests \
+	--disable-win16 \
+	--without-alsa \
+	--without-capi \
+	--without-cms \
+	--without-coreaudio \
+	--without-cups \
+	--without-curses \
+	--without-dbus \
+	--without-fontconfig \
+	--without-gettext \
+	--without-gettextpo \
+	--without-gphoto \
+	--without-glu \
+	--without-gnutls \
+	--without-gsm \
+	--without-gstreamer \
+	--without-hal \
+	--without-jpeg \
+	--without-ldap \
+	--without-mpg123 \
+	--without-netapi \
+	--without-openal \
+	--without-opencl \
+	--without-opengl \
+	--without-osmesa \
+	--without-oss \
+	--without-pcap \
+	--without-png \
+	--without-sane \
+	--without-tiff \
+	--without-v4l \
+	--without-x \
+	--without-xcomposite \
+	--without-xcursor \
+	--without-xinerama \
+	--without-xinput \
+	--without-xinput2 \
+	--without-xml \
+	--without-xrandr \
+	--without-xrender \
+	--without-xshape \
+	--without-xshm \
+	--without-xslt \
+	--without-xxf86vm \
+	--without-zlib
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
