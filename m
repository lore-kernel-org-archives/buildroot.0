From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xorg-server to 1.7.1
Message-ID: <20100308133613.6E482776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a43dcbbccdb4218d99d714012a7bab47fe850ac5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    3 +--
 ...server_xorg-server-1.5-servermd-add-avr32.patch |   19 -------------------
 .../xserver_xorg-server-1.5-tslib-fix.patch        |   11 -----------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    8 ++++++--
 4 files changed, 7 insertions(+), 34 deletions(-)
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-servermd-add-avr32.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-tslib-fix.patch

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 105c790..86909d1 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -22,7 +22,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXRES
 	select BR2_PACKAGE_XLIB_LIBXXF86MISC
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XLIB_LIBLBXUTIL
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XDATA_XBITMAPS
@@ -47,7 +46,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
 	depends on !BR2_avr32
 	help
-	  xorg-server 1.4
+	  xorg-server 1.7.1
 	  No description available
 
 comment "xorg-xserver is BROKEN on AVR32"
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-servermd-add-avr32.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-servermd-add-avr32.patch
deleted file mode 100644
index 6fbea60..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-servermd-add-avr32.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/include/servermd.h.orig	2007-08-23 15:04:54.000000000 -0400
-+++ b/include/servermd.h	2007-10-03 12:08:40.000000000 -0400
-@@ -151,6 +151,16 @@ SOFTWARE.
- 
- #endif /* __arm32__ */
- 
-+#ifdef __avr32__
-+
-+#define IMAGE_BYTE_ORDER        MSBFirst
-+#define BITMAP_BIT_ORDER        MSBFirst
-+#define GLYPHPADBYTES           4
-+#define GETLEFTBITS_ALIGNMENT   1
-+#define AVOID_MEMORY_READ
-+
-+#endif /* __avr32__ */ 
-+
- #if defined (hpux) || defined __hppa__
- 
- #define IMAGE_BYTE_ORDER	MSBFirst
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-tslib-fix.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-tslib-fix.patch
deleted file mode 100644
index 7f2855f..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-tslib-fix.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xserver_xorg-server-1.5.2.old/configure	2009-03-02 19:44:53.000000000 -0800
-+++ xserver_xorg-server-1.5.2/configure	2009-03-02 19:39:55.000000000 -0800
-@@ -38770,7 +38770,7 @@
- 	    ;;
-     esac
-     KDRIVE_STUB_LIB='$(top_builddir)/hw/kdrive/src/libkdrivestubs.a'
--    KDRIVE_LOCAL_LIBS="$TSLIB_LIBS $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
-+    KDRIVE_LOCAL_LIBS="$DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
-     KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS"
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e9d5f36..950c2ca 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.5.3
+XSERVER_XORG_SERVER_VERSION = 1.7.1
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
+XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
@@ -31,7 +32,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xlib_libXdamage 		\
 	xlib_libXxf86misc 		\
 	xlib_libXxf86vm 		\
-	xlib_liblbxutil 		\
 	xlib_libxkbfile 		\
 	xlib_xtrans 			\
 	xdata_xbitmaps 			\
@@ -124,5 +124,9 @@ XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-record
 endif
 
+ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
+XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
+endif
 
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
-- 
1.6.3.3
