From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2015 00:35:12 +0200
Subject: [Buildroot] [PATCH 3/3] package/xserver_xorg-server: dri2 needs
	libdrm
In-Reply-To: <cover.1437950027.git.yann.morin.1998@free.fr>
References: <cover.1437950027.git.yann.morin.1998@free.fr>
Message-ID: <ed8d79ec52aec5a5724e4a93b65d6f54240a750c.1437950027.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build issues like:

      CC       dri2.lo
      CC       dri2ext.lo
    dri2.c: In function 'dri2_probe_driver_name':
    dri2.c:1434:9: error: unknown type name 'drmVersionPtr'
    dri2.c:1434:9: warning: implicit declaration of function 'drmGetVersion' [-Wimplicit-function-declaration]
    dri2.c:1434:9: warning: nested extern declaration of 'drmGetVersion' [-Wnested-externs]
    dri2.c:1444:40: error: invalid type argument of '->' (have 'int')
    dri2.c:1444:55: error: invalid type argument of '->' (have 'int')
    dri2.c:1445:9: warning: implicit declaration of function 'drmFreeVersion' [-Wimplicit-function-declaration]
    dri2.c:1445:9: warning: nested extern declaration of 'drmFreeVersion' [-Wnested-externs]
    make[7]: *** [dri2.lo] Error 1

with this defconfig:

    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XSERVER_XORG_SERVER=y
    BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
    BR2_PACKAGE_XPROTO_DRI2PROTO=y

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in              | 1 +
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index f0ec598..5a6814b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -93,6 +93,7 @@ choice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XPROTO_DRI2PROTO
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 374a9c3..7115e3f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -190,6 +190,7 @@ ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
+XSERVER_XORG_SERVER_NEEDS_LIBDRM = y
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2
 endif
-- 
1.9.1
