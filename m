From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sun, 14 Jan 2007 15:25:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo xorg
Message-ID: <20070114232505.0394C485D0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-14 15:25:05 -0800 (Sun, 14 Jan 2007)
New Revision: 17308

Log:
some pkgconfig hacks to make things somewhat work


Added:
   trunk/buildroot/package/xorg/kbproto.pc
   trunk/buildroot/package/xorg/x11.pc
   trunk/buildroot/package/xorg/xau.pc
   trunk/buildroot/package/xorg/xdmcp.pc
   trunk/buildroot/package/xorg/xext.pc
   trunk/buildroot/package/xorg/xextproto.pc
   trunk/buildroot/package/xorg/xinerama.pc
   trunk/buildroot/package/xorg/xproto.pc
   trunk/buildroot/package/xorg/xrandr.pc

Modified:
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-01-14 23:21:36 UTC (rev 17307)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-01-14 23:25:05 UTC (rev 17308)
@@ -126,8 +126,6 @@
 $(STAGING_DIR)/lib/$(CAIRO_BINARY): $(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(CAIRO_DIR) install;
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libcairo.la
-	$(SED) "s, x11 ,,g" $(STAGING_DIR)/lib/pkgconfig/cairo.pc
-	$(SED) "s, x11 ,,g" $(STAGING_DIR)/lib/pkgconfig/cairo-xlib.pc
 	touch -c $(STAGING_DIR)/lib/$(CAIRO_BINARY)
 
 $(TARGET_DIR)/lib/libcairo.so.2.9.3: $(STAGING_DIR)/lib/$(CAIRO_BINARY)

Added: trunk/buildroot/package/xorg/kbproto.pc
===================================================================
--- trunk/buildroot/package/xorg/kbproto.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/kbproto.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,9 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+ 
+Name: KBProto
+Description: KB extension headers
+Version: 1.0.3
+Cflags: -I${includedir}

Added: trunk/buildroot/package/xorg/x11.pc
===================================================================
--- trunk/buildroot/package/xorg/x11.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/x11.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,15 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+xthreadlib=-lpthread
+
+Name: X11
+Description: X Library
+Version: 1.0.3
+Requires: xproto kbproto
+Requires.private: xau xdmcp
+Cflags: -I${includedir} 
+Libs: -L${libdir} -lX11
+Libs.private: -lpthread

Added: trunk/buildroot/package/xorg/xau.pc
===================================================================
--- trunk/buildroot/package/xorg/xau.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xau.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Xau
+Description: X authorization file management libary
+Version: 1.0.1
+Requires: xproto
+Cflags: -I${includedir}
+Libs: -L${libdir} -lXau

Added: trunk/buildroot/package/xorg/xdmcp.pc
===================================================================
--- trunk/buildroot/package/xorg/xdmcp.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xdmcp.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Xdmcp
+Description: X Display Manager Control Protocol library
+Version: 1.0.1
+Requires: xproto
+Cflags: -I${includedir}
+Libs: -L${libdir} -lXdmcp

Added: trunk/buildroot/package/xorg/xext.pc
===================================================================
--- trunk/buildroot/package/xorg/xext.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xext.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Xext
+Description: Misc X Extension Library
+Version: 1.0.1
+Requires: xextproto
+Requires.private: x11 xau
+Cflags: -I${includedir}
+Libs: -L${libdir} -lXext

Added: trunk/buildroot/package/xorg/xextproto.pc
===================================================================
--- trunk/buildroot/package/xorg/xextproto.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xextproto.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,9 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+ 
+Name: XExtProto
+Description: XExt extension headers
+Version: 7.0.2
+Cflags: -I${includedir}

Added: trunk/buildroot/package/xorg/xinerama.pc
===================================================================
--- trunk/buildroot/package/xorg/xinerama.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xinerama.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Xinerama
+Description: The Xinerama Library
+Version: 1.0.1
+Requires: xineramaproto
+Requires.private: x11 xext
+Cflags: -I${includedir}
+Libs: -L${libdir} -lXinerama

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-01-14 23:21:36 UTC (rev 17307)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-01-14 23:25:05 UTC (rev 17308)
@@ -105,6 +105,11 @@
 	ln -fs ../../lib $(STAGING_DIR)$(TARGET_LIBX)
 	( cd $(XORG_DIR); $(MAKE) \
 		DESTDIR=$(STAGING_DIR) install XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
+	cp package/xorg/x11.pc package/xorg/xext.pc \
+		package/xorg/xproto.pc package/xorg/kbproto.pc \
+		package/xorg/xau.pc package/xorg/xdmcp.pc \
+		package/xorg/xextproto.pc package/xorg/xrandr.pc \
+		package/xorg/xinerama.pc $(STAGING_DIR)/lib/pkgconfig
 	touch -c $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
 
 $(TARGET_XSERVER): $(XORG_XSERVER)

Added: trunk/buildroot/package/xorg/xproto.pc
===================================================================
--- trunk/buildroot/package/xorg/xproto.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xproto.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+includex11dir=${prefix}/include/X11
+ 
+Name: Xproto
+Description: Xproto headers
+Version: 7.0.7
+Cflags: -I${includedir}

Added: trunk/buildroot/package/xorg/xrandr.pc
===================================================================
--- trunk/buildroot/package/xorg/xrandr.pc	                        (rev 0)
+++ trunk/buildroot/package/xorg/xrandr.pc	2007-01-14 23:25:05 UTC (rev 17308)
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Xrandr
+Description: X RandR Library
+Version: 1.1.1
+Requires: xproto randrproto >= 1.1
+Requires.private: x11 xext xrender
+Cflags: -I${includedir}
+Libs: -L${libdir} -lXrandr
