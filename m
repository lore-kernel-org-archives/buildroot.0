From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 10:19:56 +0200
Subject: [Buildroot] [PATCH] package/netsurf: remove package
Message-ID: <20190531081957.12781-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package causes a large amount of build failures, E.G.:

http://autobuild.buildroot.net/results/eaf/eafc3e4be571d5ecee549a11530ac4e508f31782/

Caused by the custom build system mixing up host and target compiler flags.
The original submitter seems no longer active in fixing the package, so lets
drop it rather than releasing with a known broken package.

If these issues gets fixed upstream then the package can be re-added.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 .../0001-avoid-system-perl-dependencies.patch      |  29 ------
 package/netsurf/0002-fix-freetype-detection.patch  |  32 -------
 .../0003-do-not-cross-compile-nsgenbind.patch      |  30 ------
 .../0004-fix-compilation-without-curl.patch        |  27 ------
 package/netsurf/Config.in                          |  46 ----------
 package/netsurf/netsurf.hash                       |   3 -
 package/netsurf/netsurf.mk                         | 101 ---------------------
 9 files changed, 270 deletions(-)
 delete mode 100644 package/netsurf/0001-avoid-system-perl-dependencies.patch
 delete mode 100644 package/netsurf/0002-fix-freetype-detection.patch
 delete mode 100644 package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
 delete mode 100644 package/netsurf/0004-fix-compilation-without-curl.patch
 delete mode 100644 package/netsurf/Config.in
 delete mode 100644 package/netsurf/netsurf.hash
 delete mode 100644 package/netsurf/netsurf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1149fcb508..c7e09b2749 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -878,7 +878,6 @@ F:	package/lsqlite3/
 F:	package/lua*
 F:	package/lzlib/
 F:	package/moarvm/
-F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..54bbb16240 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -276,7 +276,6 @@ comment "Graphic applications"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
 	source "package/mesa3d-demos/Config.in"
-	source "package/netsurf/Config.in"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
diff --git a/package/netsurf/0001-avoid-system-perl-dependencies.patch b/package/netsurf/0001-avoid-system-perl-dependencies.patch
deleted file mode 100644
index 979ddafc89..0000000000
--- a/package/netsurf/0001-avoid-system-perl-dependencies.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b42e4b5bfca030965dcfca993a47a6ddaa941287 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 25 Nov 2018 18:27:54 +0100
-Subject: [PATCH] avoid system perl dependencies
-
-this subroutine format is used for android target.
-with eval the load of HTML::Entities is deferred.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- netsurf/utils/split-messages.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/netsurf/utils/split-messages.pl b/netsurf/utils/split-messages.pl
-index 4b50dde..e47dded 100644
---- a/netsurf/utils/split-messages.pl
-+++ b/netsurf/utils/split-messages.pl
-@@ -311,7 +311,7 @@ TXT
-     sub footer { qq|</resources>| }
-     sub format
-     {
--	use HTML::Entities qw(encode_entities);
-+	eval q|use HTML::Entities qw(encode_entities);|;
- 	my $escaped = encode_entities( $_[1], '<>&"' );
- 	qq|  <string name="$_[0]">$escaped</string>\n|;
-     }
--- 
-2.17.1
-
diff --git a/package/netsurf/0002-fix-freetype-detection.patch b/package/netsurf/0002-fix-freetype-detection.patch
deleted file mode 100644
index 27e3a6a1d5..0000000000
--- a/package/netsurf/0002-fix-freetype-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 85336f2404b9583267019650ea0112ebf1bb571a Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Wed, 28 Nov 2018 17:59:44 +0100
-Subject: [PATCH] fix freetype detection
-
-Using freetype-config doesn't work well, because it's going to use the
-system freetype-config instead of the one installed in the
-cross-compilation sysroot. So, let's use pkg-config instead.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- netsurf/frontends/framebuffer/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/netsurf/frontends/framebuffer/Makefile b/netsurf/frontends/framebuffer/Makefile
-index bdedd90..249c7c4 100644
---- a/netsurf/frontends/framebuffer/Makefile
-+++ b/netsurf/frontends/framebuffer/Makefile
-@@ -35,8 +35,8 @@ LDFLAGS += -Wl,--no-whole-archive
- 
- # freetype is optional but does not use pkg-config
- ifeq ($(NETSURF_FB_FONTLIB),freetype)
--  CFLAGS += -DFB_USE_FREETYPE $(shell freetype-config --cflags)
--  LDFLAGS += $(shell freetype-config --libs)
-+  CFLAGS += -DFB_USE_FREETYPE $(shell $(PKG_CONFIG) --cflags freetype2)
-+  LDFLAGS += $(shell $(PKG_CONFIG) --libs freetype2)
- endif
- 
- 
--- 
-2.17.1
-
diff --git a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
deleted file mode 100644
index 01e77e9774..0000000000
--- a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2419ad79b25fcc1746178aba609fddbb0aa8c9e0 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sat, 1 Dec 2018 16:10:13 +0100
-Subject: [PATCH] build nsgenbind for the build machine
-
-The nsgenbind tool is meant to be executed on the build machine during
-the build, so it should not be built with the cross-compiler, but with
-the native compiler.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index f279f01..5698c87 100644
---- a/Makefile
-+++ b/Makefile
-@@ -109,7 +109,7 @@ endef
- 
- # prefixed install macro for each host sub target
- define do_build_prefix_install
--	$(MAKE) install --directory=$1 HOST=$(BUILD) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
-+	$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
- 
- endef
- 
--- 
-2.17.1
-
diff --git a/package/netsurf/0004-fix-compilation-without-curl.patch b/package/netsurf/0004-fix-compilation-without-curl.patch
deleted file mode 100644
index 2300ae5f4e..0000000000
--- a/package/netsurf/0004-fix-compilation-without-curl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7d7c59dbfc92fcbcd0eac2c84e0fb98662c4bd71 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sat, 8 Dec 2018 09:43:40 +0100
-Subject: [PATCH] fix compilation without curl
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- netsurf/content/fetch.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/netsurf/content/fetch.c b/netsurf/content/fetch.c
-index 7665029..0f41c49 100644
---- a/netsurf/content/fetch.c
-+++ b/netsurf/content/fetch.c
-@@ -54,7 +54,9 @@
- #include "content/fetchers.h"
- #include "content/fetchers/resource.h"
- #include "content/fetchers/about.h"
-+#ifdef WITH_CURL
- #include "content/fetchers/curl.h"
-+#endif
- #include "content/fetchers/data.h"
- #include "content/fetchers/file.h"
- #include "javascript/fetcher.h"
--- 
-2.17.1
-
diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
deleted file mode 100644
index 30b2695309..0000000000
--- a/package/netsurf/Config.in
+++ /dev/null
@@ -1,46 +0,0 @@
-comment "netsurf needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
-config BR2_PACKAGE_NETSURF
-	bool "netsurf"
-	# static linking support is broken beyond repair
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_LIBCURL
-	help
-	  NetSurf is a compact graphical web browser which aims for
-	  HTML5, CSS and JavaScript support.
-	  Frontends: GTK (X11), SDL 1.2 (framebuffer)
-
-	  http://www.netsurf-browser.org/
-
-if BR2_PACKAGE_NETSURF
-
-choice
-	prompt "Netsurf frontend"
-	default BR2_PACKAGE_NETSURF_SDL
-
-config BR2_PACKAGE_NETSURF_SDL
-	bool "sdl frontend"
-	select BR2_PACKAGE_SDL
-	help
-	  Select SDL 1.2 frontend.
-
-config BR2_PACKAGE_NETSURF_GTK
-	bool "gtk2 frontend"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  Select GTK+ 2 frontend.
-
-config BR2_PACKAGE_NETSURF_GTK3
-	bool "gtk3 frontend"
-	depends on BR2_PACKAGE_LIBGTK3
-	help
-	  Select GTK+ 3 frontend.
-
-endchoice
-
-endif
diff --git a/package/netsurf/netsurf.hash b/package/netsurf/netsurf.hash
deleted file mode 100644
index 26e8c76f34..0000000000
--- a/package/netsurf/netsurf.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256 eb4864d4459d6f9958dd10a3301c272ea7f5df72667a7db0aad5bc5ae06c0e10  netsurf-all-3.8.tar.gz
-sha256 55c4a7ae3953d720a462e69d1f128a20004933d12538be5314a33f8821675378  netsurf/COPYING
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
deleted file mode 100644
index 31cf9e62b8..0000000000
--- a/package/netsurf/netsurf.mk
+++ /dev/null
@@ -1,101 +0,0 @@
-################################################################################
-#
-# netsurf
-#
-################################################################################
-
-NETSURF_VERSION = 3.8
-NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
-NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
-NETSURF_LICENSE = GPL-2.0
-NETSURF_LICENSE_FILES = netsurf/COPYING
-NETSURF_DEPENDENCIES = expat jpeg libpng \
-	host-bison host-flex host-gperf host-pkgconf
-
-ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
-NETSURF_DEPENDENCIES += libgtk2
-NETSURF_FRONTEND = gtk
-endif
-
-ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
-NETSURF_DEPENDENCIES += libgtk3
-NETSURF_FRONTEND = gtk3
-endif
-
-ifeq ($(BR2_PACKAGE_NETSURF_GTK)$(BR2_PACKAGE_NETSURF_GTK3),y)
-ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-NETSURF_DEPENDENCIES += librsvg
-define NETSURF_SVG_CONFIGURE_CMDS
-	echo "override NETSURF_USE_RSVG := YES"         >> $(@D)/netsurf/Makefile.config
-	echo "override NETSURF_USE_NSSVG := NO"         >> $(@D)/netsurf/Makefile.config
-endef
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
-NETSURF_DEPENDENCIES += sdl host-libpng
-NETSURF_FRONTEND = framebuffer
-NETSURF_CONFIG = \
-	HOST_CFLAGS='$(HOST_CFLAGS)' \
-	HOST_LDFLAGS='$(HOST_LDFLAGS) -lpng'
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-NETSURF_DEPENDENCIES += freetype
-define NETSURF_FONTLIB_CONFIGURE_CMDS
-	echo "override NETSURF_FB_FONTLIB := freetype"  >> $(@D)/netsurf/Makefile.config
-endef
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-NETSURF_DEPENDENCIES += libiconv
-define NETSURF_ICONV_CONFIGURE_CMDS
-	echo "CFLAGS += -DWITH_ICONV_FILTER"            >> $(@D)/libparserutils/Makefile.config.override
-	echo "override NETSURF_USE_LIBICONV_PLUG := NO" >> $(@D)/netsurf/Makefile.config
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-NETSURF_DEPENDENCIES += libcurl openssl
-else
-define NETSURF_CURL_CONFIGURE_CMDS
-	echo "override NETSURF_USE_CURL := NO"          >> $(@D)/netsurf/Makefile.config
-	echo "override NETSURF_USE_OPENSSL := NO"       >> $(@D)/netsurf/Makefile.config
-endef
-endif
-
-define NETSURF_CONFIGURE_CMDS
-	$(NETSURF_ICONV_CONFIGURE_CMDS)
-	$(NETSURF_SVG_CONFIGURE_CMDS)
-	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
-	$(NETSURF_CURL_CONFIGURE_CMDS)
-endef
-
-NETSURF_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(@D)/tmpusr/include" \
-	LDFLAGS="$(TARGET_LDFLAGS) -L$(@D)/tmpusr/lib"
-
-NETSURF_MAKE_OPTS = \
-	TARGET=$(NETSURF_FRONTEND) \
-	BISON="$(HOST_DIR)/bin/bison" \
-	FLEX="$(HOST_DIR)/bin/flex" \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	BUILD_CC="$(HOSTCC)" \
-	CC="$(TARGET_CC)" \
-	AR="$(TARGET_AR)" \
-	TMP_PREFIX=$(@D)/tmpusr \
-	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
-	PREFIX=/usr
-
-define NETSURF_BUILD_CMDS
-	mkdir -p $(@D)/tmpusr
-	$(NETSURF_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
-		build
-endef
-
-define NETSURF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
-		DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
2.11.0
