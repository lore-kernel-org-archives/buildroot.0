From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:16:26 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: drop post patch
 hooks
Message-ID: <20190703222502.702238905B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43e6f70f9cc570ca53a39048b66ed6fa31867b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

X11_CFLAGS no longer exists in version 1.6.8 of libX11, making the
XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS post patch hook useless.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
