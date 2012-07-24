From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 09:26:42 +0200
Subject: [Buildroot] [git commit] mediastreamer: fix build with libX11 and
	sdl without x11 support
Message-ID: <20120724072703.DEFF496D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f66236e0a9e18045cb1566bc368368de5a5cc499
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a8f2db4a40c0f53c0d25b2632fe87c2ce136f770

Mediastreamer assumes SDL has X11 support if SDL and libX11 are found,
which is not necessarily true in BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/mediastreamer.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
