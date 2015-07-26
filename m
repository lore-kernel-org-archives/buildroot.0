From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:20 +0200
Subject: [Buildroot] [RFC 10/37] package/efl: new package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the efl package which contains an updated version of the following
libraries:
libecore, libedje, libeet, libfreet, libeina, libeio, libembryo, libthumb, libevas.
It also contains eldbus, ephysics, and escape, see [1].

For now, the bump to efl 1.14.x is not complete.
This allows to build at least a default configuration whithout X11 support or
graphics acceleration.
This support can be added by a follow up patches series.

Also, add BR2_PACKAGE_EFL_RECOMMENDED_CONFIG config option in order to select
all recommanded packages that allows to build efl-core whithout the extra-long
--enable-i-really-know-what-i-am-doing...

At the end of the configure script, the summary tab will show that
alsa support is allways disabled even if alsa-utils has been build
before efl-core package.

"Ecore_Audio.....: yes (-alsa +pulseaudio +sndfile)"
This is intentional.

Add a dependency on glibc based toolchains since Eina library use mkstemps()
in eina_file_common.c which is not available with uClibc/uClibc-ng.

Untested with musl toolchains.

[1] See https://phab.enlightenment.org/phame/live/3/post/efl_1_8/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---

I tried to build with a musl toolchain but the build stopped during
pulsaudio build. So efl is not build tested with musl.
---
 package/Config.in     |   1 +
 package/efl/Config.in |  69 ++++++++++++++++++++++
 package/efl/efl.mk    | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 package/efl/Config.in

diff --git a/package/Config.in b/package/Config.in
index c5729f1..0acce45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -231,6 +231,7 @@ comment "Graphic libraries"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
 	source "package/divine/Config.in"
+	source "package/efl/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/efl/Config.in b/package/efl/Config.in
new file mode 100644
index 0000000..546bc61
--- /dev/null
+++ b/package/efl/Config.in
@@ -0,0 +1,69 @@
+config BR2_PACKAGE_EFL
+	bool "efl"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	# Eina library use mkstemps() in eina_file_common.c
+	# mkstemps() is not available in uClibc/uClibc-ng
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG # Emile needs libjpeg
+	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
+	help
+	  Enlightenment Foundation Libraries
+
+	  https://enlightenment.org
+
+if BR2_PACKAGE_EFL
+
+config BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
+	bool "Use recommanded and tested configurations"
+	select BR2_PACKAGE_BULLET
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_PULSEAUDIO
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	default y
+	help
+	  Avoid to use untested or not recommanded configurations,
+	  otherwise we need to add a very long and obscure option
+	  to start the build.
+
+comment "libevas loaders"
+
+config BR2_PACKAGE_EFL_PNG
+	bool "libevas png loader"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This enables the loader code that loads png files using
+	  libpng.
+
+config BR2_PACKAGE_EFL_JPEG
+	bool "libevas jpeg loader"
+	help
+	  This enables the loader code that loads jpeg files using
+	  libjpeg.
+
+config BR2_PACKAGE_EFL_GIF
+	bool "libevas gif loader"
+	select BR2_PACKAGE_GIFLIB
+	help
+	  This enables the loader code that loads gif files using
+	  libungif.
+
+config BR2_PACKAGE_EFL_TIFF
+	bool "libevas tiff loader"
+	select BR2_PACKAGE_TIFF
+	help
+	  This enables the loader code that loads tiff files.
+
+endif # BR2_PACKAGE_EFL
+
+comment "efl needs udev /dev management and a (e)glibc toolchain w/ C++"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 9e6ea2a..b3627b5 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -10,6 +10,166 @@ EFL_SITE = http://download.enlightenment.org/rel/libs/efl/
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
 EFL_LICENSE_FILES = COPYING
 
+EFL_INSTALL_STAGING = YES
+
+EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev zlib
+
+# Configure options:
+# --disable-cxx-bindings: disable C++11 bindings.
+# --enable-lua-old: disable Elua and remove luajit dependency.
+# --with-x11=none: remove dependency on X.org.
+EFL_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--disable-cxx-bindings \
+	--enable-lua-old \
+	--with-x11=none
+
+# Disable untested configuration warning.
+ifeq ($(BR2_PACKAGE_EFL_RECOMMENDED_CONFIG),)
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+endif
+
+# Libmount is used heavily inside Eeze for support of removable devices etc.
+# and disabling this will hurt support for Enlightenment and its filemanager.
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+EFL_DEPENDENCIES += util-linux
+EFL_CONF_OPTS += --enable-libmount
+else
+EFL_CONF_OPTS += --disable-libmount
+endif
+
+# If fontconfig is disabled, this is going to make general font
+# searching not work, and only some very direct 'load /path/file.ttf'
+# will work alongside some old-school ttf file path searching. This
+# is very likely not what you want, so highly reconsider turning
+# fontconfig off. Having it off will lead to visual problems like
+# missing text in many UI areas etc.
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+EFL_CONF_OPTS += --enable-fontconfig
+EFL_DEPENDENCIES += fontconfig
+else
+EFL_CONF_OPTS += --disable-fontconfig
+endif
+
+# Fribidi is used for handling right-to-left text (like Arabic,
+# Hebrew, Farsi, Persian etc.) and is very likely not a feature
+# you want to disable unless you know for absolute certain you
+# will never encounter and have to display such scripts. Also
+# note that we don't test with fribidi disabled so you may also
+# trigger code paths with bugs that are never normally used.
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+EFL_CONF_OPTS += --enable-fribidi
+EFL_DEPENDENCIES += libfribidi
+else
+EFL_CONF_OPTS += --disable-fribidi
+endif
+
+# If Gstreamer 1.x support is disabled, it will heavily limit your media
+# support options and render some functionality as useless, leading to
+# visible application bugs.
+ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+EFL_CONF_OPTS += --enable-gstreamer1
+EFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+EFL_CONF_OPTS += --disable-gstreamer1
+endif
+
+# You have chosen to disable physics support. This disables lots of
+# core functionality and is effectively never tested. You are going
+# to find features that suddenly don't work and as a result cause
+# a series of breakages. This is simply not tested so you are on
+# your own in terms of ensuring everything works if you do this
+ifeq ($(BR2_PACKAGE_BULLET),y)
+EFL_CONF_OPTS += --enable-physics
+EFL_DEPENDENCIES += bullet
+else
+EFL_CONF_OPTS += --disable-physics
+endif
+
+# You disabled audio support in Ecore. This is not tested and may
+# Create bugs for you due to it creating untested code paths.
+# Reconsider disabling audio.
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+EFL_CONF_OPTS += --enable-audio
+EFL_DEPENDENCIES += libsndfile
+else
+EFL_CONF_OPTS += --disable-audio
+endif
+
+# The only audio output method supported by Ecore right now is via
+# Pulseaudio. You have disabled that and likely have broken a whole
+# bunch of things in the process. Reconsider your configure options.
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+EFL_CONF_OPTS += --enable-pulseaudio
+EFL_DEPENDENCIES += pulseaudio
+else
+EFL_CONF_OPTS += --disable-pulseaudio
+endif
+
+# There is no alsa support yet in Ecore_Audio.
+# configure will disable alsa support even if alsa-lib is selected.
+
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+EFL_DEPENDENCIES += tslib
+EFL_CONF_OPTS += --enable-tslib
+else
+EFL_CONF_OPTS += --disable-tslib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+EFL_DEPENDENCIES += libglib2
+# we can also say "always"
+EFL_CONF_OPTS += --with-glib=yes
+else
+EFL_CONF_OPTS += --with-glib=no
+endif
+
+# Prefer openssl (the default) over gnutls.
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+EFL_DEPENDENCIES += openssl
+EFL_CONF_OPTS += --with-crypto=openssl
+else
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
+EFL_DEPENDENCIES += gnutls libgcrypt
+EFL_CONF_OPTS += --with-crypto=gnutls \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+EFL_CONF_OPTS += --with-crypto=none
+endif
+endif # BR2_PACKAGE_OPENSSL
+
+# image loader: handle only loaders that requires dependencies.
+# All other loaders are builded by default statically.
+ifeq ($(BR2_PACKAGE_EFL_PNG),y)
+EFL_CONF_OPTS += --enable-image-loader-png=yes
+EFL_DEPENDENCIES += libpng
+else
+EFL_CONF_OPTS += --enable-image-loader-png=no
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
+EFL_CONF_OPTS += --enable-image-loader-jpeg=yes
+else
+EFL_CONF_OPTS += --enable-image-loader-jpeg=no
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_GIF),y)
+EFL_CONF_OPTS += --enable-image-loader-gif=yes
+EFL_DEPENDENCIES += giflib
+else
+EFL_CONF_OPTS += --enable-image-loader-gif=no
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_TIFF),y)
+EFL_CONF_OPTS += --enable-image-loader-tiff=yes
+EFL_DEPENDENCIES += tiff
+else
+EFL_CONF_OPTS += --enable-image-loader-tiff=no
+endif
+
+$(eval $(autotools-package))
+
 ################################################################################
 #
 # host-efl
-- 
2.4.3
