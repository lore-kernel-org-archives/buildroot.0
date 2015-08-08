From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Aug 2015 13:59:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xserver_xorg-server: Fix
	compilation of modesetting driver
In-Reply-To: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439035146-26080-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel modesettings support also depends on dri2, see
http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46

Fixes
http://autobuild.buildroot.net/results/f26/f26018d5ad62bc7b61623dd173dc1e92e2c958a4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-modesettings-needs-dri2.patch                | 19 +++++++++++++++++++
 .../x11r7/xserver_xorg-server/xserver_xorg-server.mk  |  7 +++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch

diff --git a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
new file mode 100644
index 0000000..4ef95ef
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
@@ -0,0 +1,19 @@
+Kernel modesettings support also depends on dri2, see
+http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
+
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
+--- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
++++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
+@@ -2036,7 +2036,7 @@
+ 	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
+ 	fi
+ 
+-	if test "x$DRM" = xyes; then
++	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
+ 		dnl 2.4.46 is required for cursor hotspot support.
+ 		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
+ 		XORG_DRIVER_MODESETTING=yes
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 79d663c..566d93a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -10,7 +10,10 @@ XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserv
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
+# xfont_font-util is needed only for autoreconf
+XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
+	xfont_font-util			\
 	xutil_util-macros 		\
 	xlib_libXfont 			\
 	xlib_libX11 			\
@@ -143,8 +146,8 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
-# udev kms support depends on libdrm
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
+# udev kms support depends on libdrm and dri2
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
 else
-- 
2.1.4
