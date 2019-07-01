From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 15:47:58 -0400
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xlib_libX11: drop post patch
 hooks
Message-ID: <20190701194800.67133-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

X11_CFLAGS no longer exists in version 1.6.8 of libX11, making the
XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS post patch hook useless.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index f0e52e0877..352d07dfde 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -37,17 +37,5 @@ HOST_XLIB_LIBX11_CONF_OPTS = \
 	--disable-specs \
 	--without-perl
 
-# src/util/makekeys is executed at build time to generate ks_tables.h, so
-# it should get compiled for the host. The libX11 makefile unfortunately
-# doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
-# we know the X11 includes are in $(HOST_DIR)/include, which are already
-# in the CFLAGS_FOR_BUILD, so we can just remove the X11_CFLAGS
-define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
-	$(SED) '/X11_CFLAGS/d' $(@D)/src/util/Makefile*
-endef
-
-XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
-HOST_XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.21.0
