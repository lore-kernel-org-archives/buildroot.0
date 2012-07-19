From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:21:03 +0200
Subject: [Buildroot] [PATCH 4/5] Remove all references to libintl
In-Reply-To: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5098f296a0cb699068c95384ee5b06fa95c9f7e2.1342732829.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From now on, packages only need to select the BR2_PACKAGE_GETTEXT
option and depend on the 'gettext' package to get the necessary i18n
libraries installed on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/Config.in                     |    1 -
 package/avahi/avahi.mk                      |    6 +++---
 package/axel/Config.in                      |    1 -
 package/axel/axel.mk                        |    2 +-
 package/binutils/Config.in                  |    1 -
 package/binutils/binutils.mk                |    2 +-
 package/diffutils/diffutils.mk              |    3 +--
 package/dnsmasq/Config.in                   |    1 -
 package/dnsmasq/dnsmasq.mk                  |    2 +-
 package/flex/flex.mk                        |    3 +--
 package/gdk-pixbuf/Config.in                |    1 -
 package/gdk-pixbuf/gdk-pixbuf.mk            |    2 +-
 package/glib-networking/Config.in           |    1 -
 package/glib-networking/glib-networking.mk  |    2 +-
 package/gmpc/Config.in                      |    1 -
 package/gmpc/gmpc.mk                        |    2 +-
 package/grep/Config.in                      |    1 -
 package/grep/grep.mk                        |    2 +-
 package/kbd/Config.in                       |    1 -
 package/kbd/kbd.mk                          |    2 +-
 package/libglib2/Config.in                  |    1 -
 package/libglib2/libglib2.mk                |    2 +-
 package/libsoup/Config.in                   |    1 -
 package/libsoup/libsoup.mk                  |    2 +-
 package/lshw/lshw.mk                        |    2 +-
 package/make/Config.in                      |    1 -
 package/make/make.mk                        |    2 +-
 package/midori/Config.in                    |    1 -
 package/midori/midori.mk                    |    2 +-
 package/multimedia/pulseaudio/Config.in     |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 package/ndisc6/ndisc6.mk                    |    4 ++--
 package/pango/Config.in                     |    1 -
 package/pango/pango.mk                      |    2 +-
 package/psmisc/Config.in                    |    1 -
 package/psmisc/psmisc.mk                    |    2 +-
 package/quota/Config.in                     |    1 -
 package/quota/quota.mk                      |    2 +-
 package/sshfs/Config.in                     |    1 -
 package/sshfs/sshfs.mk                      |    2 +-
 package/sysstat/Config.in                   |    1 -
 package/sysstat/sysstat.mk                  |    2 +-
 package/ushare/Config.in                    |    1 -
 package/ushare/ushare.mk                    |    2 +-
 package/util-linux/util-linux.mk            |    4 ++--
 package/vala/Config.in                      |    1 -
 package/vala/vala.mk                        |    2 +-
 47 files changed, 31 insertions(+), 53 deletions(-)

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
index d9c0d1d..d7caa57 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -83,7 +83,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
@@ -131,8 +131,8 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif
 
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-AVAHI_DEPENDENCIES += libintl
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+AVAHI_DEPENDENCIES += gettext
 AVAHI_MAKE_OPT = LIBS=-lintl
 endif
 
diff --git a/package/axel/Config.in b/package/axel/Config.in
index 98f4941..d823272 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  HTTP/FTP download accelerator.
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 893caf1..0ed8ad2 100644
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
index a91879a..d41cac4 100644
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
index d6029a4..168d040 100644
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
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index e67aa46..b76ddb2 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_DNSMASQ_IDN
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since it pulls in many libraries.
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 1f714bf..e92a554 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -24,7 +24,7 @@ endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 16f6801..2599cdc 100644
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
index 28a0f12..33b5f7c 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 751f499..f92101f 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,7 @@ GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 16f0d4a..dab35ea 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 385ad47..823ba39 100644
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
index 51d0cd9..a136cf4 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,6 +11,6 @@ GMPC_CONF_OPT = --disable-mmkeys --disable-unique
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(autotools-package))
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
index 4ed5fea..0ce747b 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,7 +8,7 @@ GREP_VERSION = 2.13
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
index a52ad5a..325978e 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -2,6 +2,6 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(autotools-package))
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index d1d7231..5282885 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2b2bd32..030cecb 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,7 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
 
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index eee6ade..c3b4ceb 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index fe1a41c..30655ba 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index a53c107..68daa0d 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -9,7 +9,7 @@ LSHW_SITE = http://ezix.org/software/files
 LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
 LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT),-lintl)"
-LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),libintl)
+LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
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
index a0981c7..02b2741 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,7 +7,7 @@ MAKE_VERSION:=3.81
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 49867e4..41f4515 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 87559bb..33f94cf 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -14,7 +14,7 @@ MIDORI_DEPENDENCIES = \
 	libgtk2 \
 	libsexy \
 	webkit \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifneq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6e6d64c..6c767bb 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 13d8770..6f7d7d2 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,7 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl) \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index eb30e11..f58cc13 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -10,8 +10,8 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-NDISC6_DEPENDENCIES += libintl
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+NDISC6_DEPENDENCIES += gettext
 NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
 
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
index efb722d..86ab474 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
 
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
index a70f071..e162716 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -6,7 +6,7 @@
 
 PSMISC_VERSION = 22.16
 PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 # Don't force -fstack-protector
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 6c2beff..3ad0b8c 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_QUOTA
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Implementation of the disk quota system.
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 44a5073..bd7c6aa 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -11,7 +11,7 @@ QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxqu
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-QUOTA_DEPENDENCIES = gettext libintl
+QUOTA_DEPENDENCIES = gettext
 QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
 
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
index 80d3a45..f04db8e 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -9,7 +9,7 @@ SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/ss
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(autotools-package))
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
index 9d91a42..83609a0 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_CONF_OPT += --disable-documentation
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-SYSSTAT_DEPENDENCIES += gettext libintl
+SYSSTAT_DEPENDENCIES += gettext
 SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
 endif
 
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index acf025f..f7b2124 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_USHARE
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 2d8bca5..78cbcda 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -10,7 +10,7 @@ USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkg-config libupnp
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-USHARE_DEPENDENCIES += gettext libintl
+USHARE_DEPENDENCIES += gettext
 USHARE_LDFLAGS += -lintl
 endif
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ddc9c12..71a6c53 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -29,8 +29,8 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-UTIL_LINUX_DEPENDENCIES += libintl
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+UTIL_LINUX_DEPENDENCIES += gettext
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
index 7c0ea9f..4cb89dc 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,7 +10,7 @@ VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_DEPENDENCIES = host-flex libglib2 \
-		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
 $(eval $(autotools-package))
-- 
1.7.9.5
