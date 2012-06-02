From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:07:41 +0200
Subject: [Buildroot] [PATCH v2 2/2] gettext: get rid of LIBINTL stuff
In-Reply-To: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
References: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674861-1716-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AUTOTARGET conversion of gettext introduces some changes:
- the target 'gettext' now builds and installs libintl if locale
  support is enabled. The target 'libintl' no longer exists, so the
  libintl dependency is no longer needed;
- the gettext binaries (usr/bin/gettext{,.sh,ize}), formerly installed
  together with 'libintl', are now installed together with 'gettext'.
  Because the gettext binaries have a rather small footprints, they
  are now alway installed together with 'gettext'.

This patch does:
- update the gettext package;
- warn about libintl availability depending on the locale support
  enabled in the toolchain;
- cleanup all remaining  gettext/libintl dependencies;
- fix/cleanup some BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE
  dependencies.

Changes since v1:
- remove BR2_PACKAGE_GETTEXT_NEEDS_BINARIES symbol stuff

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index eb3ccb6..8ba33d5 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..525791f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -83,7 +83,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default

-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = host-intltool host-pkg-config

 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
@@ -131,8 +131,8 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif

-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-AVAHI_DEPENDENCIES += libintl
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+AVAHI_DEPENDENCIES += gettext
 AVAHI_MAKE_OPT = LIBS=-lintl
 endif

diff --git a/package/axel/Config.in b/package/axel/Config.in
index cb9af32..b9c914b 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  HTTP/FTP download accelerator.

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 91f6d1e..26d8b92 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -10,7 +10,7 @@ AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 AXEL_LDFLAGS = -lpthread

 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-AXEL_DEPENDENCIES += gettext libintl
+AXEL_DEPENDENCIES += gettext
 AXEL_LDFLAGS += -lintl
 endif

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e068b20..6480370 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1c8a79d..a390de9 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -23,7 +23,7 @@ BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6d1896a..a877f2f 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -7,8 +7,7 @@
 DIFFUTILS_VERSION = 3.2
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext)

 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 041aba8..3617411 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -12,8 +12,7 @@ FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING = YES
 FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES =

diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 28a0f12..2ceafe5 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 8dc1c47..4bf71e4 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,7 @@ GDK_PIXBUF_DEPENDENCIES += tiff
 endif

 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0ee4065..cc48b98 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -12,12 +12,5 @@ config BR2_PACKAGE_GETTEXT
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR

-config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
-	help
-	  Selecting this package installs all of gettext in the staging
-	  directory and the shared library for it's use in the target.
-
-	  http://www.gnu.org/software/gettext/
+comment "libintl requires a toolchain with locale/i18n support"
+	depends on BR2_PACKAGE_GETTEXT && !BR2_ENABLE_LOCALE
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 7c7b26c..a9dac28 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -9,16 +9,6 @@ GETTEXT_INSTALL_STAGING = YES

 GETTEXT_CONF_OPT += \
 	--disable-libasprintf \
-	--disable-openmp \
-
-define GETTEXT_REMOVE_BINARIES
-	rm -f $(TARGET_DIR)/usr/bin/gettext
-	rm -f $(TARGET_DIR)/usr/bin/gettext.sh
-	rm -f $(TARGET_DIR)/usr/bin/gettextize
-endef
-
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-	GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
-endif
+	--disable-openmp

 $(eval $(call AUTOTARGETS))
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 16f0d4a..f1aa7ee 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Network-related GIO modules for glib.

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 9165835..272994c 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -13,7 +13,7 @@ GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES

 GLIB_NETWORKING_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkg-config \
 	host-intltool \
 	libglib2
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index f86945c..9b38d1a 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GMPC
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBSOUP
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 1db5346..f3c555a 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,6 +11,6 @@ GMPC_CONF_OPT = --disable-mmkeys --disable-unique
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 $(eval $(call AUTOTARGETS))
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 1b39922..5906e69 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GREP
 	bool "grep"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 389aa3b..556970b 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,7 +8,7 @@ GREP_VERSION = 2.12
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index a23b70a..44c3163 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index af30e8e..08a706b 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -2,6 +2,6 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd

-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 $(eval $(call AUTOTARGETS))
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index d1d7231..bdb63cb 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..be9aa22 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,12 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \

-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = \
+	host-pkg-config \
+	host-libglib2 \
+	libffi \
+	zlib \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 6d2bea6..bf7745d 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -9,7 +9,9 @@ LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
-LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)

 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index eee6ade..4703191 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6572585..2e52b98 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,12 @@ endif

 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome

-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = \
+	host-pkg-config \
+	host-libglib2 \
+	libglib2 \
+	libxml2 \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/make/Config.in b/package/make/Config.in
index 364bb1e..ea2ae1b 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index 2886032..8cc8799 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,7 +7,7 @@ MAKE_VERSION:=3.81
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make

-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6e6d64c..4845ffa 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 175adfa..915ef4c 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,7 @@ PULSEAUDIO_CONF_OPT = \

 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 923c3d4..60e9931 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f46bdc6..613b4bf 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,11 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \

 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug

-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = \
+	host-pkg-config \
+	libglib2 \
+	cairo \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index a138204..cc8420b 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 0b0e046..406be3a 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -6,7 +6,7 @@

 PSMISC_VERSION = 22.16
 PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 # Don't force -fstack-protector
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 73d552f..37188ba 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index e60cdeb..b7b531f 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -9,7 +9,7 @@ SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/ss
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)

 $(eval $(call AUTOTARGETS))
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 6e62ff1..ceba503 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 55991c4..7bd5278 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_CONF_OPT += --disable-documentation
 endif

 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-SYSSTAT_DEPENDENCIES += gettext libintl
+SYSSTAT_DEPENDENCIES += gettext
 SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
 endif

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a3ac9..3da4d90 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -29,8 +29,11 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif

-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-UTIL_LINUX_DEPENDENCIES += libintl
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+UTIL_LINUX_DEPENDENCIES += gettext
+endif
+
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif

diff --git a/package/vala/Config.in b/package/vala/Config.in
index 89b4459..e0d665c 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_VALA
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Compiler for the GObject type system.
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a3ad037..b579316 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,7 +10,7 @@ VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_DEPENDENCIES = host-flex libglib2 \
-		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2

 $(eval $(call AUTOTARGETS))
--
1.7.10.3
