From: antab at uclibc.org <antab@uclibc.org>
Date: Fri, 31 Oct 2008 10:17:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081031171723.6F149F8055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-10-31 10:17:23 -0700 (Fri, 31 Oct 2008)
New Revision: 23886

Log:
Add options to select what gfx and mouse drivers are compiled in.
Note to tslib users: You now have to select the tslib mouse driver to build it.


Added:
   trunk/buildroot/package/qtopia4/Config.gfx.in
   trunk/buildroot/package/qtopia4/Config.mouse.in

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/Config.sql.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Added: trunk/buildroot/package/qtopia4/Config.gfx.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.gfx.in	                        (rev 0)
+++ trunk/buildroot/package/qtopia4/Config.gfx.in	2008-10-31 17:17:23 UTC (rev 23886)
@@ -0,0 +1,23 @@
+menu "Graphics drivers"
+
+config BR2_PACKAGE_QTOPIA4_GFX_LINUXFB
+	bool "Linux Framebuffer"
+	default y
+
+config BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED
+	bool "Transformed"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_GFX_QVFB
+	bool "Qt Virtual Framebuffer"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_GFX_VNC
+	bool "VNC"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
+	bool "multiscreen"
+	default y
+
+endmenu

Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-10-31 16:37:01 UTC (rev 23885)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-10-31 17:17:23 UTC (rev 23886)
@@ -224,13 +224,9 @@
 	help
 	  The target platform.
 
-menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
-	bool "SQL Module"
-	help
-	  Compile Qtopia SQL Module
-if BR2_PACKAGE_QTOPIA4_SQL_MODULE
 source "package/qtopia4/Config.sql.in"
-endif
+source "package/qtopia4/Config.gfx.in"
+source "package/qtopia4/Config.mouse.in"
 
 config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
 	bool "XML Patterns Module"

Added: trunk/buildroot/package/qtopia4/Config.mouse.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.mouse.in	                        (rev 0)
+++ trunk/buildroot/package/qtopia4/Config.mouse.in	2008-10-31 17:17:23 UTC (rev 23886)
@@ -0,0 +1,31 @@
+menu "Mouse drivers"
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_PC
+	bool "pc"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
+	bool "bus"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
+	bool "linuxtp"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
+	bool "yopy"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
+	bool "vxr41xx"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB
+	bool "tslib"
+	default n
+
+config BR2_PACKAGE_QTOPIA4_MOUSE_QVFB
+	bool "qvfb"
+	default n
+
+endmenu

Modified: trunk/buildroot/package/qtopia4/Config.sql.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.sql.in	2008-10-31 16:37:01 UTC (rev 23885)
+++ trunk/buildroot/package/qtopia4/Config.sql.in	2008-10-31 17:17:23 UTC (rev 23886)
@@ -1,3 +1,9 @@
+menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
+    bool "SQL Module"
+    help
+      Compile Qtopia SQL Module
+
+if BR2_PACKAGE_QTOPIA4_SQL_MODULE
 config BR2_PACKAGE_QTOPIA4_MYSQL
 	bool "MySQL Driver"
 	help
@@ -33,4 +39,4 @@
 	help
 	  Build SQLite 2 driver
 	  If unsure, say n.
-
+endif

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-31 16:37:01 UTC (rev 23885)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-31 17:17:23 UTC (rev 23886)
@@ -65,12 +65,68 @@
 QTOPIA4_CONFIGURE+= -no-qt3support
 endif
 
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-QTOPIA4_CONFIGURE+= -qt-mouse-tslib
+
+### Display drivers
+ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_LINUXFB),y)
+QTOPIA4_CONFIGURE += -qt-gfx-linuxfb
+else
+QTOPIA4_CONFIGURE += -no-gfx-linuxfb
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED),y)
+QTOPIA4_CONFIGURE += -qt-gfx-transformed
+else
+QTOPIA4_CONFIGURE += -no-gfx-transformed
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_QVFB),y)
+QTOPIA4_CONFIGURE += -qt-gfx-qvfb
+else
+QTOPIA4_CONFIGURE += -no-gfx-qvfb
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_VNC),y)
+QTOPIA4_CONFIGURE += -qt-gfx-vnc
+else
+QTOPIA4_CONFIGURE += -no-gfx-vnc
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN),y)
+QTOPIA4_CONFIGURE += -qt-gfx-multiscreen
+else
+QTOPIA4_CONFIGURE += -no-gfx-multiscreen
+endif
+
+### Mouse drivers
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_PC),y)
+QTOPIA4_CONFIGURE += qt-mouse-pc
+else
+QTOPIA4_CONFIGURE += -no-mouse-pc
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_BUS),y)
+QTOPIA4_CONFIGURE += qt-mouse-bus
+else
+QTOPIA4_CONFIGURE += -no-mouse-bus
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP),y)
+QTOPIA4_CONFIGURE += qt-mouse-linuxtp
+else
+QTOPIA4_CONFIGURE += -no-mouse-linuxtp
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
+QTOPIA4_CONFIGURE += qt-mouse-yopy
+else
+QTOPIA4_CONFIGURE += -no-mouse-yopy
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX),y)
+QTOPIA4_CONFIGURE += qt-mouse-vr41xx
+else
+QTOPIA4_CONFIGURE += -no-mouse-vr41xx
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB),y)
+QTOPIA4_CONFIGURE += qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
 #"))
+else
+QTOPIA4_CONFIGURE += -no-mouse-tslib
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
