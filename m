From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 23:23:08 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxshmfence: needs
	sync_4
Message-ID: <20170624212340.E176680E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b7af7fca9fb600b2e86834c2b48cb97725fcb27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also propagate reverse dependency to mesa3d and xserver_xorg-server.

Fixes xserver_xorg-server build
http://autobuild.buildroot.net/results/7da/7da8b46cda8786422e8293f26b79582b35a433d6/

For patch discussion refer to http://patchwork.ozlabs.org/patch/674595/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: only select BR2_PACKAGE_XPROTO_PRESENTPROTO if
BR2_TOOLCHAIN_HAS_SYNC_4 is available, add comment explaining why.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in                                 | 11 +++++++++--
 package/mesa3d/mesa3d.mk                                 |  2 +-
 package/x11r7/xlib_libxshmfence/Config.in                |  1 +
 package/x11r7/xserver_xorg-server/Config.in              |  3 ++-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  2 +-
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 36a0304..ad41b1c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -31,8 +31,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
-	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
+	# xlib-libxshmfence needs sync_4, so we cannot select it if
+	# BR2_TOOLCHAIN_HAS_SYNC_4 is false. xproto-presentproto
+	# doesn't need sync_4, but it is only needed in conjunction
+	# with xlib-libxshmfence and dri3proto to provide dri3
+	# support, so we also only select it if sync_4 is available.
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO if \
+		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a5ab84b..9f190ba 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -91,7 +91,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
 else
-ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
 MESA3D_CONF_OPTS += --enable-dri3
 else
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index d0595f6..d4e87b3 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  X.Org shmfence library
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index b04ccf4..5971e13 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -114,7 +114,8 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
 		BR2_PACKAGE_XPROTO_DRI2PROTO)
 	select BR2_PACKAGE_LIBPCIACCESS
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 306e9d0..12c3ed0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -220,7 +220,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2
 endif
-ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
