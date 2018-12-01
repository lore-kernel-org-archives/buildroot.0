From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Dec 2018 16:23:47 +0100
Subject: [Buildroot] [PATCH v4] netsurf: new package
Message-ID: <20181201152347.6646-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-avoid-system-perl-dependencies.patch | 29 +++++++++
 package/netsurf/Config.in                     | 16 +++++
 package/netsurf/netsurf.hash                  |  3 +
 package/netsurf/netsurf.mk                    | 65 +++++++++++++++++++
 6 files changed, 115 insertions(+)
 create mode 100644 package/netsurf/0001-avoid-system-perl-dependencies.patch
 create mode 100644 package/netsurf/Config.in
 create mode 100644 package/netsurf/netsurf.hash
 create mode 100644 package/netsurf/netsurf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da48..4c43f2b15 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -821,6 +821,7 @@ F:	package/lua*
 F:	package/lunit/
 F:	package/lzlib/
 F:	package/moarvm/
+F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
diff --git a/package/Config.in b/package/Config.in
index b60e7700a..487699cbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -267,6 +267,7 @@ comment "Graphic applications"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
+	source "package/netsurf/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
diff --git a/package/netsurf/0001-avoid-system-perl-dependencies.patch b/package/netsurf/0001-avoid-system-perl-dependencies.patch
new file mode 100644
index 000000000..979ddafc8
--- /dev/null
+++ b/package/netsurf/0001-avoid-system-perl-dependencies.patch
@@ -0,0 +1,29 @@
+From b42e4b5bfca030965dcfca993a47a6ddaa941287 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 25 Nov 2018 18:27:54 +0100
+Subject: [PATCH] avoid system perl dependencies
+
+this subroutine format is used for android target.
+with eval the load of HTML::Entities is deferred.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ netsurf/utils/split-messages.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/netsurf/utils/split-messages.pl b/netsurf/utils/split-messages.pl
+index 4b50dde..e47dded 100644
+--- a/netsurf/utils/split-messages.pl
++++ b/netsurf/utils/split-messages.pl
+@@ -311,7 +311,7 @@ TXT
+     sub footer { qq|</resources>| }
+     sub format
+     {
+-	use HTML::Entities qw(encode_entities);
++	eval q|use HTML::Entities qw(encode_entities);|;
+ 	my $escaped = encode_entities( $_[1], '<>&"' );
+ 	qq|  <string name="$_[0]">$escaped</string>\n|;
+     }
+-- 
+2.17.1
+
diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
new file mode 100644
index 000000000..7bd3dee41
--- /dev/null
+++ b/package/netsurf/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NETSURF
+	bool "netsurf"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGTK2 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SDL if !BR2_PACKAGE_XORG7
+	help
+	  NetSurf is a compact graphical web browser which aims for
+	  HTML5, CSS and JavaScript support.
+	  Frontends: GTK+ 2 (X11), SDL 1.2 (framebuffer)
+
+	  http://www.netsurf-browser.org/
diff --git a/package/netsurf/netsurf.hash b/package/netsurf/netsurf.hash
new file mode 100644
index 000000000..26e8c76f3
--- /dev/null
+++ b/package/netsurf/netsurf.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 eb4864d4459d6f9958dd10a3301c272ea7f5df72667a7db0aad5bc5ae06c0e10  netsurf-all-3.8.tar.gz
+sha256 55c4a7ae3953d720a462e69d1f128a20004933d12538be5314a33f8821675378  netsurf/COPYING
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
new file mode 100644
index 000000000..07c23562b
--- /dev/null
+++ b/package/netsurf/netsurf.mk
@@ -0,0 +1,65 @@
+################################################################################
+#
+# netsurf
+#
+################################################################################
+
+NETSURF_VERSION = 3.8
+NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
+NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
+NETSURF_LICENSE = GPL-2.0
+NETSURF_LICENSE_FILES = netsurf/COPYING
+NETSURF_DEPENDENCIES = expat jpeg libcurl libpng openssl \
+	host-bison host-flex host-gperf host-pkgconf
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+NETSURF_DEPENDENCIES += libgtk2
+NETSURF_FRONTEND = gtk
+ifeq ($(BR2_PACKAGE_LIBRSVG),y)
+NETSURF_DEPENDENCIES += librsvg
+define NETSURF_SVG_CONFIGURE_CMDS
+	echo "override NETSURF_USE_RSVG := YES"         >> $(@D)/netsurf/Makefile.config
+	echo "override NETSURF_USE_NSSVG := NO"         >> $(@D)/netsurf/Makefile.config
+endef
+endif
+else
+NETSURF_DEPENDENCIES += sdl
+NETSURF_FRONTEND = framebuffer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+NETSURF_DEPENDENCIES += libiconv
+define NETSURF_ICONV_CONFIGURE_CMDS
+	echo "CFLAGS += -DWITH_ICONV_FILTER"            >> $(@D)/libparserutils/Makefile.config.override
+	echo "override NETSURF_USE_LIBICONV_PLUG := NO" >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
+define NETSURF_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := NO"       >  $(@D)/netsurf/Makefile.config
+	$(NETSURF_ICONV_CONFIGURE_CMDS)
+	$(NETSURF_SVG_CONFIGURE_CMDS)
+endef
+
+NETSURF_MAKE_OPTS = \
+	TARGET=$(NETSURF_FRONTEND) \
+	BISON="$(HOST_DIR)/bin/bison" \
+	FLEX="$(HOST_DIR)/bin/flex" \
+	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
+	BUILD_CC="$(HOSTCC)" \
+	CC="$(TARGET_CC)" \
+	AR="$(TARGET_AR)" \
+	TMP_PREFIX=$(STAGING_DIR)/usr \
+	PREFIX=/usr
+
+define NETSURF_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
+		build
+endef
+
+define NETSURF_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
