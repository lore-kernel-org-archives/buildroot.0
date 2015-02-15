From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Feb 2015 14:19:32 +0100
Subject: [Buildroot] [PATCH next 1/1] package/x11r7/xserver_xorg-server:
	Relax dependency on libdrm
Message-ID: <1424006372-4230-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xserver_xorg-server needs libdrm only when DRI is enabled, see configure.ac,
line 1280. But since version 1.16.99.901 configure searches for optional libdrm
support in configure.ac, line 2041,

http://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?id=2feda3b6b58f46cef91ea41312aac9021a703777

as well due to libdrm support being enabled by default, but the macro
PKG_CHECK_EXISTS used in line 2041 does not add libdrm-specific CFLAGS to
Makefile causing the build to fail:

In file included from dumb_bo.c:36:0:
/home/br/br7/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/xf86drm.h:40:17: fatal error: drm.h: No such file or directory
 #include <drm.h>

This patch enables libdrm support only when dri support is enabled, which in
turn depends on mesa3d. Since mesa3d selects libdrm already remove that line
from Config.in as well.

Tested using this defconfig

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in              |    1 -
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 7918495..db8a54d 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
-	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index b5a0df0..472c0bc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -66,7 +66,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
-XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess libdrm
+XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
@@ -106,10 +106,10 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-libdrm --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
-- 
1.7.10.4
