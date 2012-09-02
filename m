From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:55 +0200
Subject: [Buildroot] [PATCH 12/12] packages: use the new gettext mechanism
In-Reply-To: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346600635-30946-13-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/avahi/Config.in                     |    2 +-
 package/avahi/avahi.mk                      |    7 ++-----
 package/axel/Config.in                      |    2 +-
 package/axel/axel.mk                        |    6 +-----
 package/binutils/Config.in                  |    2 +-
 package/binutils/binutils.mk                |    1 -
 package/diffutils/diffutils.mk              |    2 --
 package/dnsmasq/Config.in                   |    2 +-
 package/dnsmasq/dnsmasq.mk                  |    4 ++--
 package/flex/flex.mk                        |    2 --
 package/gdk-pixbuf/Config.in                |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk            |    1 -
 package/glib-networking/Config.in           |    2 +-
 package/glib-networking/glib-networking.mk  |    1 -
 package/gmpc/Config.in                      |    2 +-
 package/gmpc/gmpc.mk                        |    3 +--
 package/grep/Config.in                      |    2 +-
 package/grep/grep.mk                        |    1 -
 package/kbd/Config.in                       |    2 +-
 package/kbd/kbd.mk                          |    2 --
 package/libglib2/Config.in                  |    2 +-
 package/libglib2/libglib2.mk                |    2 +-
 package/libidn/Config.in                    |    2 +-
 package/libidn/libidn.mk                    |    2 +-
 package/libsoup/Config.in                   |    2 +-
 package/libsoup/libsoup.mk                  |    2 +-
 package/lshw/Config.in                      |    2 +-
 package/lshw/lshw.mk                        |    3 +--
 package/make/Config.in                      |    2 +-
 package/make/make.mk                        |    2 --
 package/midori/Config.in                    |    2 +-
 package/midori/midori.mk                    |    1 -
 package/multimedia/pulseaudio/Config.in     |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    1 -
 package/ndisc6/ndisc6.mk                    |    5 +----
 package/pango/Config.in                     |    2 +-
 package/pango/pango.mk                      |    2 +-
 package/php/Config.ext                      |    2 +-
 package/php/php.mk                          |    1 -
 package/psmisc/Config.in                    |    2 +-
 package/psmisc/psmisc.mk                    |    2 +-
 package/quota/Config.in                     |    2 +-
 package/quota/quota.mk                      |    5 +----
 package/sshfs/Config.in                     |    2 +-
 package/sshfs/sshfs.mk                      |    1 -
 package/sysstat/Config.in                   |    2 +-
 package/sysstat/sysstat.mk                  |    5 +----
 package/ushare/Config.in                    |    2 +-
 package/ushare/ushare.mk                    |    5 +----
 package/util-linux/util-linux.mk            |    5 +----
 package/vala/Config.in                      |    2 +-
 package/vala/vala.mk                        |    3 +--
 52 files changed, 42 insertions(+), 83 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 982966d..ed585ff 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 67b357e..d370726 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -85,7 +85,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = host-intltool host-pkg-config
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
@@ -133,10 +133,7 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-AVAHI_DEPENDENCIES += gettext
-AVAHI_MAKE_OPT = LIBS=-lintl
-endif
+AVAHI_MAKE_OPT = LIBS="$(gettext-LDFLAGS-if-locale)"
 
 define AVAHI_REMOVE_INITSCRIPT
 	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
diff --git a/package/axel/Config.in b/package/axel/Config.in
index 4c22286..79b8d6b 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  HTTP/FTP download accelerator.
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index cfec43d..ea20430 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -8,11 +8,7 @@ AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
 AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 
 AXEL_LDFLAGS = -lpthread
-
-ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
-AXEL_DEPENDENCIES += gettext
-AXEL_LDFLAGS += -lintl
-endif
+AXEL_LDFLAGS += $(gettext-LDFLAGS-if-locale)
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 AXEL_DISABLE_I18N=--i18n=0
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 159bee1..d5203a2 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 27cdfd2..7db0987 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -23,7 +23,6 @@ BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 168d040..3cce65f 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -6,8 +6,6 @@
 
 DIFFUTILS_VERSION = 3.2
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
-DIFFUTILS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 7b55a20..3027256 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since it pulls in many libraries.
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 8ef4cd3..aae612e 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -24,8 +24,8 @@ endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
-	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),-lintl)"
+	DNSMASQ_DEPENDENCIES += libidn
+	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(gettext-LDFLAGS-if-locale)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2599cdc..c8aaabf 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,8 +11,6 @@ FLEX_PATCH = flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING = YES
-FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES =
 
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index e50ecbc..40bd3b4 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index f34ac36..886fe16 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,6 @@ GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 6ed312b..41e113a 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 9f74c35..0acf14a 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -13,7 +13,6 @@ GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 
 GLIB_NETWORKING_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	host-pkg-config \
 	host-intltool \
 	libglib2
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 45b08d4..95554b2 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GMPC
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBSOUP
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index bdc10c5..034ad20 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -10,7 +10,6 @@ GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys --disable-unique
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
-	xlib_libICE xlib_libSM xlib_libX11 \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
+	xlib_libICE xlib_libSM xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/grep/Config.in b/package/grep/Config.in
index fc4e5b9..0c8c7ba 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index f60babb..a8a91e9 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,7 +8,6 @@ GREP_VERSION = 2.13
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 939565f..8a69736 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 69a22c1..a3fc01f 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -2,6 +2,4 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
-
 $(eval $(autotools-package))
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 50e95d5..4b850eb 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 7df1cd0..3c99dc7 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,7 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index 9ef7a64..8c3d200 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Libidn's purpose is to encode and decode internationalized
 	  domain names.
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 3219dae..378db85 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -9,7 +9,7 @@ LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
-LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 5a4061a..bd81c45 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index c14771d..e959d9a 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 45ca2b2..37f4e22 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 5bdffc9..c9f897a 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -8,8 +8,7 @@ LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
 LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
-LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),-lintl)"
-LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
+LSHW_MAKE_ENV = LIBS="$(gettext-LDFLAGS)"
 
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
diff --git a/package/make/Config.in b/package/make/Config.in
index d650649..bc89986 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index b8fe323..937e019 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,8 +7,6 @@ MAKE_VERSION:=3.81
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
-
 MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
 		GLOBLIB=glob/libglob.a
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 5933699..b97e24f 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index f98bd91..6fa3683 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -14,7 +14,6 @@ MIDORI_DEPENDENCIES = \
 	libgtk2 \
 	libsexy \
 	webkit \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifneq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 927d347..7deb0f9 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 439cb17..40f6356 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,6 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index f58cc13..2e55510 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -10,10 +10,7 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-NDISC6_DEPENDENCIES += gettext
-NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
-endif
+NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(gettext-LDFLAGS)"
 
 NDISC6_BIN_ += dnssort # perl script
 NDISC6_BIN_$(BR2_PACKAGE_NDISC6_NAME2ADDR) += name2addr addr2name
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 07ca298..c8d4796 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index ed2e313..4a8bc55 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = host-pkg-config libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 33d64ec..47c9146 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -146,7 +146,7 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+	select BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
 	  Gettext support
diff --git a/package/php/php.mk b/package/php/php.mk
index 2d195d0..15753b8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -85,7 +85,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
 	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 4832956..886e2d4 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index aaf08d1..c0b64af 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -8,7 +8,7 @@ PSMISC_VERSION = 22.16
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
+PSMISC_DEPENDENCIES = ncurses
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 # Don't force -fstack-protector
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 17f2278..bcb6523 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Implementation of the disk quota system.
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 2be3fa4..12929c1 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -10,10 +10,7 @@ QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(Q
 
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
-QUOTA_DEPENDENCIES = gettext
-QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
-endif
+QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) $(gettext-LDFLAGS-if-locale)"
 
 # Package uses autoconf but not automake.
 QUOTA_INSTALL_TARGET_OPT = \
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 1416393..9024d53 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 23e62e0..7ea3c89 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -9,7 +9,6 @@ SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VE
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(autotools-package))
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 834e99b..8d899cf 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 794d70b..b92fa02 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -13,10 +13,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
 
-ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
-SYSSTAT_DEPENDENCIES += gettext
-SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
-endif
+SYSSTAT_MAKE_OPT += CFLAGS+=$(gettext-LDFLAGS-if-locale)
 
 # The isag tool is a post processing script that depends on tcl/tk
 # among other things. So we don't install it.
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index eb1d2b2..c5fb516 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index aa47618..efbcd38 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -9,10 +9,7 @@ USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkg-config libupnp
 
-ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
-USHARE_DEPENDENCIES += gettext
-USHARE_LDFLAGS += -lintl
-endif
+USHARE_LDFLAGS += $(gettext-LDFLAGS-if-locale)
 
 define USHARE_CONFIGURE_CMDS
 	(cd $(@D); \
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 71a6c53..a6d52de 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -29,10 +29,7 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-UTIL_LINUX_DEPENDENCIES += gettext
-UTIL_LINUX_MAKE_OPT += LIBS=-lintl
-endif
+UTIL_LINUX_MAKE_OPT += LIBS="$(gettext-LDFLAGS)"
 
 #############################################
 #
diff --git a/package/vala/Config.in b/package/vala/Config.in
index 0021895..4e542c4 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_VALA
 	bool "vala"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Compiler for the GObject type system.
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 8df3283..183b88d 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -9,8 +9,7 @@ VALA_VERSION_MINOR = 2
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
-VALA_DEPENDENCIES = host-flex libglib2 \
-		$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
+VALA_DEPENDENCIES = host-flex libglib2
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
 $(eval $(autotools-package))
-- 
1.7.2.5
