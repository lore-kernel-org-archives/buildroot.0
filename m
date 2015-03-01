From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Mar 2015 13:07:44 +0100
Subject: [Buildroot] [git commit] wine: New package
Message-ID: <20150302222724.0E4FE8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6803b9f91357773154daed13d6e83712d49476c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wine is a compatibility layer capable of running Windows applications
on Linux.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Only build-tested, not run-time tested y lack of Windows apps]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: fix a few typos in one comment in the .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/wine/Config.in |   21 ++++
 package/wine/wine.hash |    3 +
 package/wine/wine.mk   |  292 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 317 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1d8ec1a..3aa664a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "Miscellaneous"
 	source "package/snowball-init/Config.in"
 	source "package/sound-theme-borealis/Config.in"
 	source "package/sound-theme-freedesktop/Config.in"
+	source "package/wine/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/wine/Config.in b/package/wine/Config.in
new file mode 100644
index 0000000..26de143
--- /dev/null
+++ b/package/wine/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_WINE
+	bool "wine"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Wine only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Wine has much CPU specific code and mostly makes sense on x86
+	depends on BR2_i386
+	help
+	  Wine is a compatibility layer capable of running Windows
+	  applications on Linux. Instead of simulating internal
+	  Windows logic like a virtual machine or emulator, Wine
+	  translates Windows API calls into POSIX calls on-the-fly,
+	  eliminating the performance and memory penalties of other
+	  methods.
+
+	  http://www.winehq.org
+
+comment "wine needs a (e)glibc toolchain"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_i386
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wine/wine.hash b/package/wine/wine.hash
new file mode 100644
index 0000000..71d633c
--- /dev/null
+++ b/package/wine/wine.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/wine/files/Source/
+md5	0f6c56f86befe38e219090915f81f48a	wine-1.6.2.tar.bz2
+sha1	574b9ccedbf213622b7ee55f715764673fc27692	wine-1.6.2.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
new file mode 100644
index 0000000..926ac99
--- /dev/null
+++ b/package/wine/wine.mk
@@ -0,0 +1,292 @@
+################################################################################
+#
+# wine
+#
+################################################################################
+
+WINE_VERSION = 1.6.2
+WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
+WINE_SITE = http://downloads.sourceforge.net/project/wine/Source/
+WINE_LICENSE = LGPLv2.1+
+WINE_LICENSE_FILES = COPYING.LIB LICENSE
+WINE_DEPENDENCIES = host-bison host-flex host-wine
+
+# Wine needs its own directory structure and tools for cross compiling
+WINE_CONF_OPTS = \
+	--with-wine-tools=../host-wine-$(WINE_VERSION) \
+	--disable-tests \
+	--disable-win64 \
+	--without-opengl
+
+# Wine uses a wrapper around gcc, and uses the value of --host to
+# construct the filename of the gcc to call.  But for external
+# toolchains, the GNU_TARGET_NAME tuple that we construct from our
+# internal variables may differ from the actual gcc prefix for the
+# external toolchains. So, we have to override whatever the gcc
+# wrapper believes what the real gcc is named, and force the tuple of
+# the external toolchain, not the one we compute in GNU_TARGET_NAME.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+WINE_CONF_OPTS += --with-cups
+WINE_DEPENDENCIES += cups
+else
+WINE_CONF_OPTS += --without-cups
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WINE_CONF_OPTS += --with-dbus
+WINE_DEPENDENCIES += dbus
+else
+WINE_CONF_OPTS += --without-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+WINE_CONF_OPTS += --with-fontconfig
+WINE_DEPENDENCIES += fontconfig
+else
+WINE_CONF_OPTS += --without-fontconfig
+endif
+
+# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+WINE_CONF_OPTS += --with-freetype
+HOST_WINE_CONF_OPTS += --with-freetype
+WINE_DEPENDENCIES += freetype
+HOST_WINE_DEPENDENCIES += host-freetype
+else
+WINE_CONF_OPTS += --without-freetype
+HOST_WINE_CONF_OPTS += --without-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+WINE_CONF_OPTS += --with-gnutls
+WINE_DEPENDENCIES += gnutls
+else
+WINE_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+WINE_CONF_OPTS += --with-gstreamer
+WINE_DEPENDENCIES += gst-plugins-base
+else
+WINE_CONF_OPTS += --without-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+WINE_CONF_OPTS += --with-jpeg
+WINE_DEPENDENCIES += jpeg
+else
+WINE_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WINE_CONF_OPTS += --with-cms
+WINE_DEPENDENCIES += lcms2
+else
+WINE_CONF_OPTS += --without-cms
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLU),y)
+WINE_CONF_OPTS += --with-glu
+WINE_DEPENDENCIES += libglu
+else
+WINE_CONF_OPTS += --without-glu
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+WINE_CONF_OPTS += --with-png
+WINE_DEPENDENCIES += libpng
+else
+WINE_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+WINE_CONF_OPTS += --with-v4l
+WINE_DEPENDENCIES += libv4l
+else
+WINE_CONF_OPTS += --without-v4l
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+WINE_CONF_OPTS += --with-xml
+WINE_DEPENDENCIES += libxml2
+else
+WINE_CONF_OPTS += --without-xml
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+WINE_CONF_OPTS += --with-xslt
+WINE_DEPENDENCIES += libxslt
+else
+WINE_CONF_OPTS += --without-xslt
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+WINE_CONF_OPTS += --with-mpg123
+WINE_DEPENDENCIES += mpg123
+else
+WINE_CONF_OPTS += --without-mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+WINE_CONF_OPTS += --with-curses
+WINE_DEPENDENCIES += ncurses
+else
+WINE_CONF_OPTS += --without-curses
+endif
+
+ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
+WINE_CONF_OPTS += --with-sane
+WINE_DEPENDENCIES += sane-backends
+else
+WINE_CONF_OPTS += --without-sane
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+WINE_CONF_OPTS += --with-tiff
+WINE_DEPENDENCIES += tiff
+else
+WINE_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+WINE_CONF_OPTS += --with-x
+WINE_DEPENDENCIES += xlib_libX11
+else
+WINE_CONF_OPTS += --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+WINE_CONF_OPTS += --with-xcomposite
+WINE_DEPENDENCIES += xlib_libXcomposite
+else
+WINE_CONF_OPTS += --without-xcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+WINE_CONF_OPTS += --with-xcursor
+WINE_DEPENDENCIES += xlib_libXcursor
+else
+WINE_CONF_OPTS += --without-xcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+WINE_CONF_OPTS += --with-xinput --with-xinput2
+WINE_DEPENDENCIES += xlib_libXi
+else
+WINE_CONF_OPTS += --without-xinput --without-xinput2
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+WINE_CONF_OPTS += --with-xinerama
+WINE_DEPENDENCIES += xlib_libXinerama
+else
+WINE_CONF_OPTS += --without-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+WINE_CONF_OPTS += --with-xrandr
+WINE_DEPENDENCIES += xlib_libXrandr
+else
+WINE_CONF_OPTS += --without-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+WINE_CONF_OPTS += --with-xrender
+WINE_DEPENDENCIES += xlib_libXrender
+else
+WINE_CONF_OPTS += --without-xrender
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+WINE_CONF_OPTS += --with-xxf86vm
+WINE_DEPENDENCIES += xlib_libXxf86vm
+else
+WINE_CONF_OPTS += --without-xxf86vm
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WINE_CONF_OPTS += --with-zlib
+WINE_DEPENDENCIES += zlib
+else
+WINE_CONF_OPTS += --without-zlib
+endif
+
+# Wine needs to enable 64-bit build tools on 64-bit host
+ifeq ($(HOSTARCH),x86_64)
+HOST_WINE_CONF_OPTS += --enable-win64
+endif
+
+# Wine only needs the host tools to be built, so cut-down the
+# build time by building just what we need.
+define HOST_WINE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+	  tools \
+	  tools/widl \
+	  tools/winebuild \
+	  tools/winegcc \
+	  tools/wmc \
+	  tools/wrc
+endef
+
+# Wine only needs its host variant to be built, not that it is
+# installed, as it uses the tools from the build directory. But
+# we have no way in Buildroot to state that a host package should
+# not be installed. So, just provide an noop install command.
+define HOST_WINE_INSTALL_CMDS
+	:
+endef
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
