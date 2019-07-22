From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Jul 2019 07:17:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsurf: fix build of host tool
 convert_image
Message-ID: <20190722051715.18053-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
http://source.netsurf-browser.org/netsurf.git/commit/frontends/framebuffer/Makefile?id=40cdf498b9153685b4cefe576e59f6b41090912b

renamed the variable HOST_*FLAGS to BUILD_*FLAGS.

This breaks the build of the host tool convert_image when png.h is not
provided by the host system itself.

Fixes:
http://autobuild.buildroot.net/results/6ac/6ac71c7a41dd92a5fb924af9da7cedc40e745cfa/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/netsurf/netsurf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 30e8dc8b4f..b510a69649 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -36,8 +36,8 @@ ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
 NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
 NETSURF_CONFIG = \
-	HOST_CFLAGS='$(HOST_CFLAGS)' \
-	HOST_LDFLAGS='$(HOST_LDFLAGS) -lpng'
+	BUILD_CFLAGS='$(HOST_CFLAGS)' \
+	BUILD_LDFLAGS='$(HOST_LDFLAGS) -lpng'
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 NETSURF_DEPENDENCIES += freetype
 define NETSURF_FONTLIB_CONFIGURE_CMDS
-- 
2.20.1
