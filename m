From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 15:34:22 +0200
Subject: [Buildroot] [git commit master] qt: bump version
Message-ID: <20100402133459.B02AD8D7AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5a3fa6867b75971b8d713653e0665ce0ef9f267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt 4.6.x has a number of new configure options, and needs a patch to
work on uClibc.

Signed-off-by: Frederik Vannoote <frederik.vannoote@barco.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    2 +-
 package/qt/Config.gfx.in                      |    7 ++
 package/qt/Config.in                          |   35 +++++++++
 package/qt/Config.keyboard.in                 |   13 +---
 package/qt/Config.mouse.in                    |   10 +--
 package/qt/qt-4.5.3-fix-qt-zlib-build.patch   |   20 -----
 package/qt/qt-4.6.2-fix-qt-uclibc-build.patch |   27 +++++++
 package/qt/qt.mk                              |   99 ++++++++++++++++---------
 8 files changed, 138 insertions(+), 75 deletions(-)
 delete mode 100644 package/qt/qt-4.5.3-fix-qt-zlib-build.patch
 create mode 100644 package/qt/qt-4.6.2-fix-qt-uclibc-build.patch

diff --git a/CHANGES b/CHANGES
index 174c73f..c6ab12b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 	Updated/fixed packages: busybox, dnsmasq, dosfstools, e2fsprogs,
 	freetype, iperf, iptables, iw, less, libgcrypt, libglib2, libpng,
 	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
-	radvd, setserial, squashfs, wget, xlib_libX11, xlib_libXfont
+	qt, radvd, setserial, squashfs, wget, xlib_libX11, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
index 0e222dd..dc70665 100644
--- a/package/qt/Config.gfx.in
+++ b/package/qt/Config.gfx.in
@@ -16,4 +16,11 @@ config BR2_PACKAGE_QT_GFX_VNC
 config BR2_PACKAGE_QT_GFX_MULTISCREEN
 	bool "multiscreen"
 
+comment "directfb Qt driver not available (need directfb)"
+	depends on !BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_QT_GFX_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB
+	bool "directFB"
+
 endmenu
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 9ff904e..4371fc3 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -270,6 +270,22 @@ config BR2_PACKAGE_QT_PHONON
 	  formats can be configured at the GStreamer package.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT_PHONON_BACKEND
+	bool "Phonon Module Backend"
+	depends on BR2_PACKAGE_QT_PHONON
+	help
+	  Build the platform Phonon plugin.
+	  If unsure, say n.
+
+comment "Qt DBbus module not available (need dbus)"
+	depends on !BR2_PACKAGE_DBUS
+
+config BR2_PACKAGE_QT_DBUS
+	bool "DBus Module"
+	depends on BR2_PACKAGE_DBUS
+	help
+	  Build the Qt DBus module.
+
 config BR2_PACKAGE_QT_XML
 	bool "XML Module"
 	default y
@@ -283,6 +299,17 @@ config BR2_PACKAGE_QT_XMLPATTERNS
 	  Build QtXmlPatterns module.
 	  If unsure, say n
 
+config BR2_PACKAGE_QT_MULTIMEDIA
+	bool "Multimedia Module"
+	help
+	  Build QtMultimedia module.
+
+config BR2_PACKAGE_QT_AUDIO_BACKEND
+	bool "QtMultimedia Audio backend"
+	depends on BR2_PACKAGE_QT_MULTIMEDIA
+	help
+	  Build the platform audio backend into QtMultimedia if available
+
 config BR2_PACKAGE_QT_SVG
 	bool "SVG Module"
 	help
@@ -299,10 +326,17 @@ config BR2_PACKAGE_QT_NETWORK
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
 	depends on BR2_PACKAGE_QT_NETWORK
+	select BR2_PACKAGE_QT_JAVASCRIPTCORE
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT_JAVASCRIPTCORE
+	bool "JavaScriptCore JIT compiler"
+	help
+	  Build the JavaScriptCore JIT compiler
+	  If unsure, say y
+
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
 	help
@@ -322,6 +356,7 @@ config BR2_PACKAGE_QT_OPENSSL
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
 	default y
+	select BR2_PACKAGE_QT_JAVASCRIPTCORE
 	help
 	  Build the Qt Script module.
 	  if unsure, say y.
diff --git a/package/qt/Config.keyboard.in b/package/qt/Config.keyboard.in
index 7d169a1..b042547 100644
--- a/package/qt/Config.keyboard.in
+++ b/package/qt/Config.keyboard.in
@@ -3,17 +3,8 @@ menu "Keyboard drivers"
 config BR2_PACKAGE_QT_KEYBOARD_TTY
 	bool "tty"
 
-config BR2_PACKAGE_QT_KEYBOARD_USB
-	bool "usb"
-
-config BR2_PACKAGE_QT_KEYBOARD_SL5000
-	bool "sl5000"
-
-config BR2_PACKAGE_QT_KEYBOARD_YOPY
-	bool "yopy"
-
-config BR2_PACKAGE_QT_KEYBOARD_VR41XX
-	bool "vr41xx"
+config BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT
+	bool "linux input"
 
 config BR2_PACKAGE_QT_KEYBOARD_QVFB
 	bool "qvfb"
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 7085974..87973d2 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -3,17 +3,11 @@ menu "Mouse drivers"
 config BR2_PACKAGE_QT_MOUSE_PC
 	bool "pc"
 
-config BR2_PACKAGE_QT_MOUSE_BUS
-	bool "bus"
-
 config BR2_PACKAGE_QT_MOUSE_LINUXTP
 	bool "linuxtp"
 
-config BR2_PACKAGE_QT_MOUSE_YOPY
-	bool "yopy"
-
-config BR2_PACKAGE_QT_MOUSE_VR41XX
-	bool "vr41xx"
+config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
+	bool "linux input"
 
 config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
diff --git a/package/qt/qt-4.5.3-fix-qt-zlib-build.patch b/package/qt/qt-4.5.3-fix-qt-zlib-build.patch
deleted file mode 100644
index 47fc92f..0000000
--- a/package/qt/qt-4.5.3-fix-qt-zlib-build.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-When QT is compiled in qt-zlib mode, compilation of
-src/gui/painting/qprintengine_pdf.cpp fails because zlib.h is not
-found. The following patch adds the internal QT zlib directory to the
-include path to fix this issue.
-
----
- src/gui/painting/painting.pri |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: qt-embedded-linux-opensource-src-4.5.3/src/gui/painting/painting.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.3.orig/src/gui/painting/painting.pri
-+++ qt-embedded-linux-opensource-src-4.5.3/src/gui/painting/painting.pri
-@@ -367,3 +367,6 @@
-         SOURCES += painting/qwindowsurface_d3d.cpp
- }
- 
-+contains(QT_CONFIG, zlib) {
-+   INCLUDEPATH += ../3rdparty/zlib
-+}
diff --git a/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch b/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch
new file mode 100644
index 0000000..a76774b
--- /dev/null
+++ b/package/qt/qt-4.6.2-fix-qt-uclibc-build.patch
@@ -0,0 +1,27 @@
+From http://bugreports.qt.nokia.com/browse/QTBUG-8365
+
+Starting a QtEmbedded-4.6.2 application linked against uClibc 0.9.30.1 results
+in an immediate segmentation fault.
+This is due to an incompatibility of the uClibc with the standard libc about
+the "realpath" function. The man of the function clearly specifies that
+"if resolved path (the second argument) is NULL, then realpath uses malloc to
+allocate a buffer ...". However, uClibc doesn't support this functionality and
+issues a warning at compile-time when the function is called with a NULL
+argument. 
+---
+diff -aurp -x '*.o' qt-everywhere-opensource-src-4.6.2-old/src/corelib/io/qfsfileengine.cpp qt-everywhere-opensource-src-4.6.2/src/corelib/io/qfsfileengine.cpp
+--- qt-everywhere-opensource-src-4.6.2-old/src/corelib/io/qfsfileengine.cpp	2010-02-11 16:55:23.000000000 +0100
++++ qt-everywhere-opensource-src-4.6.2/src/corelib/io/qfsfileengine.cpp	2010-02-19 14:57:06.000000000 +0100
+@@ -145,10 +145,9 @@ QString QFSFileEnginePrivate::canonicali
+ #endif
+     // Mac OS X 10.5.x doesn't support the realpath(X,0) extenstion we use here.
+ #if defined(Q_OS_LINUX) || defined(Q_OS_SYMBIAN)
+-    char *ret = realpath(path.toLocal8Bit().constData(), (char*)0);
+-    if (ret) {
++    char ret[PATH_MAX];
++    if (realpath(path.toLocal8Bit().constData(), ret)) {
+         QString canonicalPath = QDir::cleanPath(QString::fromLocal8Bit(ret));
+-        free(ret);
+         return canonicalPath;
+     }
+ #endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 78b2eec..9167349 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,6 +1,6 @@
 ######################################################################
 #
-# Qt Embedded for Linux 4.5
+# Qt Embedded for Linux 4.6
 # http://www.qtsoftware.com/
 #
 # This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
@@ -12,11 +12,11 @@
 #
 ######################################################################
 
-QT_VERSION:=4.5.3
-QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.gz
+QT_VERSION:=4.6.2
+QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
-QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
+QT_TARGET_DIR:=$(BUILD_DIR)/qt-everywhere-opensource-src-$(QT_VERSION)
 
 QT_CONFIGURE:=#empty
 
@@ -113,6 +113,12 @@ QT_CONFIGURE += -qt-gfx-multiscreen
 else
 QT_CONFIGURE += -no-gfx-multiscreen
 endif
+ifeq ($(BR2_PACKAGE_QT_GFX_DIRECTFB),y)
+QT_CONFIGURE += -qt-gfx-directfb
+else
+QT_CONFIGURE += -no-gfx-directfb
+endif
+
 
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QT_MOUSE_PC),y)
@@ -120,25 +126,15 @@ QT_CONFIGURE += -qt-mouse-pc
 else
 QT_CONFIGURE += -no-mouse-pc
 endif
-ifeq ($(BR2_PACKAGE_QT_MOUSE_BUS),y)
-QT_CONFIGURE += -qt-mouse-bus
-else
-QT_CONFIGURE += -no-mouse-bus
-endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXTP),y)
 QT_CONFIGURE += -qt-mouse-linuxtp
 else
 QT_CONFIGURE += -no-mouse-linuxtp
 endif
-ifeq ($(BR2_PACKAGE_QT_MOUSE_YOPY),y)
-QT_CONFIGURE += -qt-mouse-yopy
+ifeq ($(BR2_PACKAGE_QT_MOUSE_LINUXINPUT),y)
+QT_CONFIGURE += -qt-mouse-linuxinput
 else
-QT_CONFIGURE += -no-mouse-yopy
-endif
-ifeq ($(BR2_PACKAGE_QT_MOUSE_VR41XX),y)
-QT_CONFIGURE += -qt-mouse-vr41xx
-else
-QT_CONFIGURE += -no-mouse-vr41xx
+QT_CONFIGURE += -no-mouse-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
 QT_CONFIGURE += -qt-mouse-tslib
@@ -158,25 +154,10 @@ QT_CONFIGURE += -qt-kbd-tty
 else
 QT_CONFIGURE += -no-kbd-tty
 endif
-ifeq ($(BR2_PACKAGE_QT_KEYBOARD_USB),y)
-QT_CONFIGURE += -qt-kbd-usb
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT),y)
+QT_CONFIGURE += -qt-kbd-linuxinput
 else
-QT_CONFIGURE += -no-kbd-usb
-endif
-ifeq ($(BR2_PACKAGE_QT_KEYBOARD_SL5000),y)
-QT_CONFIGURE += -qt-kbd-sl5000
-else
-QT_CONFIGURE += -no-kbd-sl5000
-endif
-ifeq ($(BR2_PACKAGE_QT_KEYBOARD_YOPY),y)
-QT_CONFIGURE += -qt-kbd-yopy
-else
-QT_CONFIGURE += -no-kbd-yopy
-endif
-ifeq ($(BR2_PACKAGE_QT_KEYBOARD_VR41XX),y)
-QT_CONFIGURE += -qt-kbd-vr41xx
-else
-QT_CONFIGURE += -no-kbd-vr41xx
+QT_CONFIGURE += -no-kbd-linuxinput
 endif
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_QVFB),y)
 QT_CONFIGURE += -qt-kbd-qvfb
@@ -320,6 +301,18 @@ else
 QT_CONFIGURE+= -no-xmlpatterns
 endif
 
+ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
+QT_CONFIGURE+= -multimedia
+else
+QT_CONFIGURE+= -no-multimedia
+endif
+
+ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
+QT_CONFIGURE+= -audio-backend
+else
+QT_CONFIGURE+= -no-audio-backend
+endif
+
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_CONFIGURE+= -phonon
 QT_DEP_LIBS+=gstreamer gst-plugins-base
@@ -327,6 +320,12 @@ else
 QT_CONFIGURE+= -no-phonon
 endif
 
+ifeq ($(BR2_PACKAGE_QT_PHONON_BACKEND),y)
+QT_CONFIGURE+= -phonon-backend
+else
+QT_CONFIGURE+= -no-phonon-backend
+endif
+
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
 QT_CONFIGURE+= -svg
 else
@@ -339,6 +338,24 @@ else
 QT_CONFIGURE+= -no-webkit
 endif
 
+ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
+QT_CONFIGURE+= -script
+else
+QT_CONFIGURE+= -no-script
+endif
+
+ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
+QT_CONFIGURE+= -scripttools
+else
+QT_CONFIGURE+= -no-scripttools
+endif
+
+ifeq ($(BR2_PACKAGE_QT_JAVASCRIPTCORE),y)
+QT_CONFIGURE+= -javascript-jit
+else
+QT_CONFIGURE+= -no-javascript-jit
+endif
+
 ifeq ($(BR2_PACKAGE_QT_STL),y)
 QT_CONFIGURE+= -stl
 else
@@ -385,6 +402,10 @@ endif
 ifeq ($(BR2_PACKAGE_QT_XML),y)
 QT_LIBS+= qt-xml
 endif
+ifeq ($(BR2_PACKAGE_QT_DBUS),y)
+QT_LIBS+= qt-dbus
+QT_DEP_LIBS+= dbus
+endif
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
 QT_LIBS+= qt-xmlpatterns
 endif
@@ -477,6 +498,9 @@ endif
 		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
 		$(QT_QCONFIG_COMMAND) \
 		$(QT_CONFIGURE) \
+		-no-gfx-qnx \
+		-no-kbd-qnx \
+		-no-mouse-qnx \
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
@@ -550,6 +574,11 @@ ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
 endif
 
+qt-dbus: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtDBus.so.* $(TARGET_DIR)/usr/lib/
+endif
+
 qt-script: $(STAGING_DIR)/usr/lib/libQtCore.la
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
-- 
1.6.3.3
