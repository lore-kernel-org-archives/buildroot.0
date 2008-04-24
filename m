From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:22:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7: xapp_xclock
	xkeyboard-config xserver_xor etc...
Message-ID: <20080424132214.B024D3C858@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:22:14 -0700 (Thu, 24 Apr 2008)
New Revision: 21836

Log:
some fixes for X

Modified:
   trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk
   trunk/buildroot/package/x11r7/xkeyboard-config/xkeyboard-config.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk
===================================================================
--- trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk	2008-04-24 13:18:50 UTC (rev 21835)
+++ trunk/buildroot/package/x11r7/xapp_xclock/xapp_xclock.mk	2008-04-24 13:22:14 UTC (rev 21836)
@@ -10,4 +10,6 @@
 XAPP_XCLOCK_AUTORECONF = NO
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
+XAPP_XCLOCK_CONF_OPT = LDFLAGS="-liconv"
+
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xclock))

Modified: trunk/buildroot/package/x11r7/xkeyboard-config/xkeyboard-config.mk
===================================================================
--- trunk/buildroot/package/x11r7/xkeyboard-config/xkeyboard-config.mk	2008-04-24 13:18:50 UTC (rev 21835)
+++ trunk/buildroot/package/x11r7/xkeyboard-config/xkeyboard-config.mk	2008-04-24 13:22:14 UTC (rev 21836)
@@ -11,7 +11,7 @@
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XKEYBOARD_CONFIG_CONF_OPT = 
+XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
 XKEYBOARD_CONFIG_DEPENDENCIES = uclibc 
 

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-04-24 13:18:50 UTC (rev 21835)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-04-24 13:22:14 UTC (rev 21836)
@@ -28,4 +28,10 @@
 
 XSERVER_XORG_SERVER_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
+# Optional packages
+ifeq ($(strip $(BR2_PACKAGE_TSLIB)),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += tslib
+XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
+endif
+
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
