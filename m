From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 28 Sep 2018 23:18:40 +0000
Subject: [Buildroot] [PATCH] gnupg: Package only needs ncurses with readline
Message-ID: <20180928231709.13395-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package only needs ncurses when readline support is enabled, as
it's the autoconf macro file for readline that checks for and pulls in
ncurses.

For the target package, only depend on ncurses when readline support is
enabled.

The host package always forces readline support off, so the host-ncurses
dependency can be removed entirely.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/gnupg/Config.in | 2 +-
 package/gnupg/gnupg.mk  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 7c31612298..b13d4d6935 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GNUPG
 	bool "gnupg"
 	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES if BR2_PACKAGE_READLINE
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index ac9047894d..8af68fd589 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -9,7 +9,7 @@ GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
-GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
 	--disable-rpath \
@@ -18,7 +18,7 @@ GNUPG_CONF_OPTS = \
 	--enable-sha256 \
 	--enable-sha512
 
-HOST_GNUPG_DEPENDENCIES = host-zlib host-ncurses
+HOST_GNUPG_DEPENDENCIES = host-zlib
 HOST_GNUPG_CONF_OPTS = \
 	--disable-rpath \
 	--enable-minimal \
@@ -48,7 +48,7 @@ GNUPG_CONF_OPTS += --without-libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-GNUPG_DEPENDENCIES += readline
+GNUPG_DEPENDENCIES += readline ncurses
 else
 GNUPG_CONF_OPTS += --without-readline
 endif
-- 
2.14.4
