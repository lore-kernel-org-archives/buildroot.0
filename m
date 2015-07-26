From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 18:33:11 +0200
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: dri2 needs libdrm
Message-ID: <1437928391-4032-1-git-send-email-yann.morin.1998@free.fr>
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
Note that I'm not too happy about the way we handle libdrm in this
package: even before this patch, there are already two locations where
we may endup with --enable/disable-libdrm, and I don't know how they
play together: the last one would win, and we may end up disabling
libdrm when we would want it enabled...

I think we might want to add something like:
    XSERVER_XORG_SERVER_NEEDS_LIBDRM = y

when needed, and then:
    ifeq ($(XSERVER_XORG_SERVER_NEEDS_LIBDRM),y)
    XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
    XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
    else
    XSERVER_XORG_SERVER_CONF_OPTS += --disable-libdrm
    endif

Thoughts?
---
 package/x11r7/xserver_xorg-server/Config.in              | 2 ++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index dc0b70c..0066b4f 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	depends on BR2_USE_MMU # fork()
@@ -94,6 +95,7 @@ choice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XPROTO_DRI2PROTO
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 79d663c..b0f3eb6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -187,8 +187,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm xproto_dri2proto
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2 --enable-libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2
 endif
-- 
1.9.1
