From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:28:29 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Fix
	libdrm dependency handling
Message-ID: <20150825102853.229DE7FC2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d23c4d4f4d6148e7f33c73af86611020a61b8cbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/2e1/2e12f1a91812f027d89fcceeb41d6c88ef7b9d32/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 566d93a..c88614b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -86,6 +86,12 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-libdrm
+endif
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
@@ -125,10 +131,10 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-libdrm --disable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
@@ -148,8 +154,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm and dri2
 ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
