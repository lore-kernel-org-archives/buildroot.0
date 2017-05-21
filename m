From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 13:30:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libxshmfence: needs
	sync_4
Message-ID: <20170521113056.15378-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also propagate reverse dependency to mesa3d and xserver_xorg-server.

Fixes xserver_xorg-server build
http://autobuild.buildroot.net/results/7da/7da8b46cda8786422e8293f26b79582b35a433d6/

For patch discussion refer to http://patchwork.ozlabs.org/patch/674595/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in                                 | 3 ++-
 package/mesa3d/mesa3d.mk                                 | 2 +-
 package/x11r7/xlib_libxshmfence/Config.in                | 1 +
 package/x11r7/xserver_xorg-server/Config.in              | 3 ++-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e5ff7d73d..2e19817a6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -30,7 +30,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b26d67747..5173e680b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -90,7 +90,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
 else
-ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
 MESA3D_CONF_OPTS += --enable-dri3
 else
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index d0595f6d6..d4e87b3e8 100644
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
index b04ccf4d7..5971e13f5 100644
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
index 306e9d03e..12c3ed06c 100644
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
-- 
2.11.0
