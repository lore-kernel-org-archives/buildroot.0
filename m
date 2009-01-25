From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 20:19:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20090125201907.17DC4768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-25 20:19:06 +0000 (Sun, 25 Jan 2009)
New Revision: 25017

Log:
qtopia4: fix and improve color/pixel depths config

Also fix whitespace and use an existing variable for qmake.conf, which
was forgotten in r23828, though it's only commented out.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-01-25 20:19:01 UTC (rev 25016)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-01-25 20:19:06 UTC (rev 25017)
@@ -86,13 +86,47 @@
 	  library with proxy code and increase the space required on target.
 	  If unsure say n.
 
-config BR2_PACKAGE_QTOPIA4_DEPTHS
-	string "color depths to support"
-	default "-depths 24,16,8"
-	help
-	  Which color depths to support for the library. Default is "-depths
-	  24,16,8". Different depths are specified by a comma separated list.
+menu "Pixel depths"
+comment "Deselecting each option leads to Qt's default (8,16,32)"
 
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL
+	bool "All supported depths"
+
+if !BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1
+	bool "1 bpp, black/white"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4
+	bool "4 bpp, grayscale"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8
+	bool "8 bpp, paletted"
+	default y
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12
+	bool "12 bpp, rgb 4-4-4"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15
+	bool "15 bpp, rgb 5-5-5"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16
+	bool "16 bpp, rgb 5-6-5"
+	default y
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18
+	bool "18 bpp, rgb 6-6-6"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24
+	bool "24 bpp, rgb 8-8-8"
+
+config BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32
+	bool "32 bpp, argb 8-8-8-8 and rgb 8-8-8"
+	default y
+
+endif
+endmenu
+
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
 	help

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-01-25 20:19:01 UTC (rev 25016)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-01-25 20:19:06 UTC (rev 25017)
@@ -66,6 +66,42 @@
 endif
 
 
+### Pixel depths
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL),y)
+QTOPIA4_PIXEL_DEPTHS = all
+else
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1),y)
+QTOPIA4_PIXEL_DEPTHS += 1
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4),y)
+QTOPIA4_PIXEL_DEPTHS += 4
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8),y)
+QTOPIA4_PIXEL_DEPTHS += 8
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12),y)
+QTOPIA4_PIXEL_DEPTHS += 12
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15),y)
+QTOPIA4_PIXEL_DEPTHS += 15
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16),y)
+QTOPIA4_PIXEL_DEPTHS += 16
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18),y)
+QTOPIA4_PIXEL_DEPTHS += 18
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24),y)
+QTOPIA4_PIXEL_DEPTHS += 24
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32),y)
+QTOPIA4_PIXEL_DEPTHS += 32
+endif
+endif
+ifneq ($(QTOPIA4_PIXEL_DEPTHS),)
+QTOPIA4_CONFIGURE += -depths $(subst $(space),$(comma),$(strip $(QTOPIA4_PIXEL_DEPTHS)))
+endif
+
 ### Display drivers
 ifeq ($(BR2_PACKAGE_QTOPIA4_GFX_LINUXFB),y)
 QTOPIA4_CONFIGURE += -qt-gfx-linuxfb
@@ -310,8 +346,8 @@
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-        # Fix compiler path
+	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_QMAKE_CONF)
+	# Fix compiler path
 	$(SED) '\,QMAKE_CC[ 	]*=, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_QMAKE_CONF)
 	$(SED) '\,QMAKE_CXX[ 	]*=, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
 	$(SED) '\,QMAKE_LINK[ 	]*=, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
