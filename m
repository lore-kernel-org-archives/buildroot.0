From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 12:23:28 +0100
Subject: [Buildroot] [RFC 4/4] xorg-server: Depends on libgl to enable
	DRI/GLX
In-Reply-To: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
Message-ID: <1421839408-15839-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xorg-server should be able to compile DRI/GLX interface using any libGL
provider (not only mesa3d). If a libGL provider break xorg-server DRI/GLX
interface, it should be fixed.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 5baa515..3240284 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -105,9 +105,12 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+# Note: --enable-glx use DRI interface (provided by GL/internal/dri_interface.h)
+# in any case. So enable GLX without DRI just fail.
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_DEPENDENCIES += libgl xproto_xf86driproto
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
-- 
1.9.1
