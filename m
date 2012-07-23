From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Jul 2012 11:49:19 +0200
Subject: [Buildroot] [PATCH] mediastreamer: fix build with libX11 and sdl
	without x11 support
Message-ID: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/a8f2db4a40c0f53c0d25b2632fe87c2ce136f770

Mediastreamer assumes SDL has X11 support if SDL and libX11 are found,
which is not necessarily true in BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 9e67ed4..1f4e1d4 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -48,9 +48,10 @@ else
 MEDIASTREAMER_CONF_OPT += --disable-sdl
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+# mediastreamer assumes SDL has X11 support if --enable-x11 (and X11 support
+# is only used for SDL output)
+ifeq ($(BR2_PACKAGE_SDL_X11),y)
 MEDIASTREAMER_CONF_OPT += --enable-x11
-MEDIASTREAMER_DEPENDENCIES += xlib_libX11
 else
 MEDIASTREAMER_CONF_OPT += --disable-x11
 endif
-- 
1.7.10
