From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 14:35:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x]
	package/x11r7/xserver_xorg-server: glamor support needs egl
Message-ID: <20171014150059.BEFC281002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccdc2c08916807c233415089ee500d7f5d18078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Glamor support in xserver_xorg-server depends on gbm:
https://cgit.freedesktop.org/xorg/xserver/tree/configure.ac#n2100

Gbm is provided by mesa3d only if egl is enabled:
https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n167

This patch adds libegl as additional prerequisite for enabling glamor
support in xserver_xorg-server.

Fixes
http://autobuild.buildroot.net/results/04d/04d93745d63fcfbea070c0126862b49f1b6f473e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5b4bcbdafbe8e7b42d4e085a0524d70665cdbaf5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f32383f..4404de8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -223,7 +223,7 @@ endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
-ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
 else
