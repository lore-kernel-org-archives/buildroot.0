From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Jun 2017 18:36:26 +0200
Subject: [Buildroot] [PATCH] package/lcdproc: remove freetype installation
	prefixes
Message-ID: <20170603163626.8552-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since [1] (freetype 2.8), freetype-config is now a wrapper of
pkg-config. So we don't need  to pass the freetype installation
prefixes on the configure command line anymore.

Setting freetype prefixes on the command line append the result
returned by pkg-config and the one provided on the command line.

FT2_CFLAGS='-I[...]/sysroot/usr/[...]/sysroot/usr/include/freetype2 -I[...]/usr/include'

This revert commit 3bdbe9abb90de0262832d5d545f239fa41fb0e91.

Fixes:
http://autobuild.buildroot.net/results/9c3/9c3f77e18ae244a2abb9ea70b6adebe215f143a6

[1] http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=1c513fbb8872bfac5631964963b6a751169a1ce6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lcdproc/lcdproc.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index bd37b7a..d86eb33 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -10,9 +10,7 @@ LCDPROC_LICENSE = GPL-2.0+
 LCDPROC_LICENSE_FILES = COPYING
 LCDPROC_MAKE = $(MAKE1)
 
-LCDPROC_CONF_OPTS = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS) \
-	--with-ft-prefix="$(STAGING_DIR)/usr" \
-	--with-ft-exec-prefix="$(STAGING_DIR)/usr"
+LCDPROC_CONF_OPTS = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
 ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
 LCDPROC_CONF_OPTS += --enable-lcdproc-menus
-- 
2.9.4
