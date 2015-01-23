From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 23:32:23 +0100
Subject: [Buildroot] [git commit] qt: add X11 support
Message-ID: <20150123223239.CD19680E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfdf173a4c7ca1c8584833a7286df37cb008fdb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two possible configurations for Qt4 installation: standard
(with X11) and embedded (for framebuffer). Both configurations cannot be
used together for one installation and some options are specific to one
configuration or the other.

Add a choice to select the standard or the embedded installation to add
X11 support.

The integration is done in order to make maximum use of the current
configuration logic, for example by using the same mkspecs files.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 package/qt/qt.mk     |   15 +++++++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 44710f5..ba71e12 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -17,6 +17,40 @@ menuconfig BR2_PACKAGE_QT
 
 if BR2_PACKAGE_QT
 
+choice
+	prompt "Qt installation"
+	help
+	  Selects the type of installation: standard or embedded
+
+config BR2_PACKAGE_QT_EMBEDDED
+	bool "Qt embedded"
+	help
+	  The embedded Qt installation targets embedded systems without X.org.
+	  Provides backends for framebuffer.
+	  If unsure, say Y.
+
+comment "Qt standard (X11) not available (need X.org)"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_QT_X11
+	bool "Qt standard (X11)"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXV
+	select BR2_PACKAGE_QT_SYSTEMFREETYPE
+	select BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  The standard Qt installation provides X.org backend. If you don't want to
+	  use X.org, say N.
+
+endchoice
+
 config BR2_PACKAGE_QT_DEBUG
 	bool "Compile with debug support"
 	help
@@ -105,6 +139,9 @@ config BR2_PACKAGE_QT_GUI_MODULE
 	  video output, or you don't require Qt GUI, say n.
 
 if BR2_PACKAGE_QT_GUI_MODULE
+
+if BR2_PACKAGE_QT_EMBEDDED
+
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
@@ -162,6 +199,8 @@ config BR2_PACKAGE_QT_FONT_UNIFONT
 
 endmenu
 
+endif # BR2_PACKAGE_QT_EMBEDDED
+
 choice
 	prompt "freetype2 support"
 	default BR2_PACKAGE_QT_NOFREETYPE
@@ -170,11 +209,16 @@ choice
 
 config BR2_PACKAGE_QT_NOFREETYPE
 	bool "no freetype2 support"
+	depends on BR2_PACKAGE_QT_EMBEDDED
 	help
 	  Do not compile in Freetype2 support.
 
+comment "Qt freetype2 needs Qt embedded"
+	depends on BR2_PACKAGE_QT_X11
+
 config BR2_PACKAGE_QT_QTFREETYPE
 	bool "Qt freetype2"
+	depends on BR2_PACKAGE_QT_EMBEDDED
 	help
 	  Use the libfreetype bundled with Qt.
 
@@ -275,9 +319,11 @@ endchoice
 
 source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
+if BR2_PACKAGE_QT_EMBEDDED
 source "package/qt/Config.gfx.in"
 source "package/qt/Config.mouse.in"
 source "package/qt/Config.keyboard.in"
+endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 255d6d2..36afaad 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -231,7 +231,20 @@ else
 QT_EMB_PLATFORM = generic
 endif
 
+ifeq ($(BR2_PACKAGE_QT_X11),y)
+QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
+                xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
+# Using pkg-config avoids us some logic to redefine and sed again mkspecs files
+# to add X11 include path and link options
+QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
+QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
+QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs x11 xext)
+QT_CONFIGURE_OPTS += -arch $(QT_EMB_PLATFORM) \
+		-xplatform qws/linux-$(QT_EMB_PLATFORM)-g++ -x11 -no-gtkstyle -no-sm \
+		-no-openvg
+else # if BR2_PACKAGE_QT_EMBEDDED
 QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
+endif
 
 ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_CONFIGURE_OPTS += -no-gui
@@ -650,6 +663,7 @@ define QT_INSTALL_TARGET_IMPORTS
 endef
 
 # Fonts installation
+ifeq ($(BR2_PACKAGE_QT_EMBEDDED),y)
 ifneq ($(QT_FONTS),)
 define QT_INSTALL_TARGET_FONTS
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
@@ -663,6 +677,7 @@ define QT_INSTALL_TARGET_FONTS_TTF
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endef
 endif
+endif # BR2_PACKAGE_QT_EMBEDDED
 
 ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
 define QT_INSTALL_TARGET_POWERVR
