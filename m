From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Fri, 23 Jan 2015 23:11:26 +0100
Subject: [Buildroot] [PATCH try 5] wine: New package
Message-ID: <54C2C70E.3020700@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds new package: wine

  Wine is a compatibility layer capable of running Windows applications on Linux.

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
I hope i addressed all the comments in the correct manner
try 2: Fix issue spotted by baruch
try 3: Added comments, added hash file, fixed X11 check, depend on internal toolchain, added bison and flex to host dependencies
try 4: instead of depending on internal toolchains add the expected tuple via --host
try 5: Added 64-bit check for host-wine and restricted wine build to x86 for now. Also added more comments

 package/Config.in      |   1 +
 package/wine/Config.in |  23 ++++
 package/wine/wine.hash |   2 +
 package/wine/wine.mk   | 278 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 304 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5f6ebc2..db2c75a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "Miscellaneous"
 	source "package/snowball-init/Config.in"
 	source "package/sound-theme-borealis/Config.in"
 	source "package/sound-theme-freedesktop/Config.in"
+	source "package/wine/Config.in"
 endmenu

 menu "Networking applications"
diff --git a/package/wine/Config.in b/package/wine/Config.in
new file mode 100644
index 0000000..38036d4
--- /dev/null
+++ b/package/wine/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_WINE
+	bool "wine"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Wine only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Wine has much CPU specific code and mostly makes sense on x86
+	depends on BR2_i386
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
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_i386
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
new file mode 100644
index 0000000..7ffc45e
--- /dev/null
+++ b/package/wine/wine.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0f46dd29b278a3352206b49680f0ac3bfa107e65cb40cb4af51c137f0ebeb271 wine-1.6.2.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
new file mode 100644
index 0000000..983c886
--- /dev/null
+++ b/package/wine/wine.mk
@@ -0,0 +1,278 @@
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
+HOST_WINE_DEPENDENCIES = host-bison host-flex
+
+# Wine needs to enable 64-bit build tools on 64-bit host
+ifeq ($(HOSTARCH),x86_64)
+	HOST_WINE_CONF_OPTS += --enable-win64
+endif
+
+# Wine needs its own directory structure and tools for cross compiling
+WINE_CONF_OPTS = \
+	--with-wine-tools=../host-wine-$(WINE_VERSION) \
+	--disable-tests \
+	--disable-win64 \
+	--without-opengl
+
+# Wine needs the host tuple of the external toolchain for cross compiling,
+# otherwise it calls e.g. non-existing i586-buildroot-linux-gnu-gcc while
+# actually it should look for e.g. i686-pc-linux-gnu-gcc
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),)
+	WINE_CONF_OPTS += --host=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+endif
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
+# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
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
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
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
+# We are focused on the cross compiling tools, disable everything else
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
