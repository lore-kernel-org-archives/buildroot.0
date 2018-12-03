From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Dec 2018 15:51:52 +0100
Subject: [Buildroot] [PATCH] package/lynx: add dependency on host-pkgconf
Message-ID: <20181203145152.7945-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Lynx configure script uses pkg-config when available:

checking for nios2-buildroot-linux-gnu-pkg-config... /home/thomas/projets/buildroot/output/host/bin/pkg-config
checking pkg-config for openssl... yes
[...]
checking pkg-config for ncurses... yes

Using pkg-config avoids build failures such as:

checking for _nc_freeall... no
configure: error: Configuration does not support color-styles
make: *** [/home/test/autobuild/run/instance-1/output/build/lynx-2.8.9rel.1/.stamp_configured] Error 1

When building with "make lynx", so that pkg-config is not built
before. The issue is that in this case, lynx configure script picks up
the ncurses6-config script for the host ncurses instead of the one in
staging. Using pkg-config solves that nicely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lynx/lynx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 735d5b317f..174d741dd9 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -10,7 +10,7 @@ LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 
-LYNX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LYNX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LYNX_DEPENDENCIES += ncurses
-- 
2.19.2
