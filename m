From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 22:36:25 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] gnupg: drop mandatory
 dependency on ncurses
Message-ID: <20181005203529.9DB548D6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c8e78cdb75c11079761762895801d90572ee99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

This package only needs ncurses when readline support is enabled, as
it's the autoconf macro file for readline (used by autoconf to create
the gnupg configure script) that checks for and pulls in ncurses.

Since readline already depends on ncurses, gnupg need only depend on
readline (when enabled).

The host package always forces readline support off, so the
host-ncurses dependency can be removed entirely.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51e17496cc403c49bc20d3a81f9c71a8a20edd0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/Config.in | 1 -
 package/gnupg/gnupg.mk  | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 7c31612298..2db46318f1 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GNUPG
 	bool "gnupg"
 	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_NCURSES
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index ac9047894d..bedcf6c985 100644
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
