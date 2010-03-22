From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] package: remove redundant
	DISABLE_{IPV6, NLS, LARGEFILE} configure args
Message-ID: <20100322145739.234B977716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a96be19bc390e43502ea6dbc4f673665bbc2a318
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Makefile.autotools.in automatically adds these to the configure invocation,
so there's no need to explicitly list them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk                               |    2 +-
 package/e2fsprogs/e2fsprogs.mk                     |    4 +---
 package/games/lxdoom/lxdoom.mk                     |    3 +--
 package/grep/grep.mk                               |    3 +--
 package/libcurl/libcurl.mk                         |    3 +--
 package/libxml2/libxml2.mk                         |    4 ++--
 package/libxslt/libxslt.mk                         |    1 -
 package/lighttpd/lighttpd.mk                       |    7 +------
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 --
 .../gst-plugins-base/gst-plugins-base.mk           |    2 --
 .../gst-plugins-good/gst-plugins-good.mk           |    1 -
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    1 -
 package/php/php.mk                                 |    3 +--
 package/wget/wget.mk                               |    1 -
 14 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e1baef7..e57f267 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -16,7 +16,7 @@ BIND_TARGET_BINS = dig host nslookup nsupdate
 BIND_TARGET_LIBS = libbind9.* libdns.* libisccc.* libisccfg.* libisc.* liblwres.*
 BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
-BIND_CONF_OPT =	$(DISABLE_IPV6) \
+BIND_CONF_OPT =	\
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--with-randomdev=/dev/urandom \
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5aa3261..21915ec 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -21,9 +21,7 @@ E2FSPROGS_CONF_OPT = \
 	--disable-resizer \
 	--enable-fsck \
 	--disable-e2initrd-helper \
-	--disable-testio-debug \
-	$(DISABLE_NLS) \
-	$(DISABLE_LARGEFILE)
+	--disable-testio-debug
 
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
diff --git a/package/games/lxdoom/lxdoom.mk b/package/games/lxdoom/lxdoom.mk
index dd29cb9..b9584b1 100644
--- a/package/games/lxdoom/lxdoom.mk
+++ b/package/games/lxdoom/lxdoom.mk
@@ -12,8 +12,7 @@ LXDOOM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 LXDOOM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--includedir=/usr/include --enable-shared \
-		$(DISABLE_NLS)
+		--includedir=/usr/include --enable-shared
 
 LXDOOM_DEPENDENCIES = xserver_xorg-server
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 868e460..acef6e9 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -6,8 +6,7 @@
 GREP_VERSION:=2.5.3
 GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
 GREP_SITE:=$(BR2_GNU_MIRROR)/grep
-GREP_CONF_OPT = --disable-perl-regexp --without-included-regex \
-	$(DISABLE_NLS) $(DISABLE_LARGEFILE)
+GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
 GREP_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
 
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index cec6e74..863c301 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -7,8 +7,7 @@ LIBCURL_VERSION = 7.19.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download/
 LIBCURL_INSTALL_STAGING = YES
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
-		   $(DISABLE_IPV6)
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 31fdabf..16f83a9 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -18,9 +18,9 @@ LIBXML2_USE_CONFIG_CACHE = NO
 endif
 
 LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
-		--enable-static $(DISABLE_IPV6) \
+		--enable-static \
 		--without-debugging --without-python \
-		--without-threads 
+		--without-threads
 
 HOST_LIBXML2_DEPENDENCIES = host-pkg-config
 
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 4bf61b5..407924d 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -18,7 +18,6 @@ endif
 
 LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
 		--enable-static $(LIBXSLT_XTRA_CONF_OPT) \
-		$(DISABLE_NLS) $(DISABLE_IPV6) \
 		--without-debugging --without-python \
 		--without-threads \
 		--with-libxml-prefix=$(STAGING_DIR)/usr/
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b17f72c..1a2562c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -8,17 +8,12 @@ LIGHTTPD_VERSION = 1.4.26
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LIBTOOL_PATCH = NO
 
-ifneq ($(BR2_LARGEFILE),y)
-LIGHTTPD_LFS:=$(DISABLE_LARGEFILE) --disable-lfs
-endif
-
 LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
 	--localstatedir=/var \
 	--program-prefix="" \
-	$(DISABLE_IPV6) \
-	$(LIGHTTPD_LFS)
+	$(if $(BR2_LARGEFILE),,--disable-lfs)
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index b651247..7a059c1 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -9,8 +9,6 @@ GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_BAD_CONF_OPT = \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
 		--disable-examples
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer liboil
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index bd422be..4d7f6db 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -15,8 +15,6 @@ GST_PLUGINS_BASE_LIBTOOL_PATCH = NO
 GST_PLUGINS_BASE_CONF_ENV = FT2_CONFIG=/bin/false
 
 GST_PLUGINS_BASE_CONF_OPT = \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
 		--disable-examples \
 		--disable-x \
 		--disable-xvideo \
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 19a53e6..c44bdff 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -9,7 +9,6 @@ GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_GOOD_CONF_OPT = \
-		$(DISABLE_NLS) \
 		--disable-debug \
 		--disable-examples \
 		--disable-directsound \
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 9440d24..c87451f 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -9,7 +9,6 @@ GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_UGLY_CONF_OPT = \
-		$(DISABLE_NLS) \
 		--disable-examples
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
diff --git a/package/php/php.mk b/package/php/php.mk
index 0747498..74fb4d9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -12,8 +12,7 @@ PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_LIBTOOL_PATCH = NO
 PHP_DEPENDENCIES =
-PHP_CONF_OPT =	$(DISABLE_IPV6) \
-		--mandir=/usr/share/man \
+PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
 		--without-pear \
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index cb0c60a..23c82af 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -6,7 +6,6 @@
 
 WGET_VERSION = 1.12
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
-WGET_CONF_OPT = $(DISABLE_IPV6)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WGET_CONF_OPT += --with-ssl --with-libssl-prefix=$(STAGING_DIR)
-- 
1.6.3.3
