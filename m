From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2021 18:56:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: bump version to 5.45
Message-ID: <20210110175641.2538245-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.jwz.org/xscreensaver/changelog.html

Remove dependency to libglade in favour of gdk-pixbuf.
Add dependency to libxml2 which is needed for gtk support.

Add various optional dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xscreensaver/Config.in         | 10 ++--
 package/xscreensaver/xscreensaver.hash |  2 +-
 package/xscreensaver/xscreensaver.mk   | 69 ++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 8 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index c1d6a03f5d..d773c69913 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -2,13 +2,15 @@ config BR2_PACKAGE_XSCREENSAVER
 	bool "xscreensaver"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> glib2
-	depends on BR2_USE_WCHAR # libgtk2 -> glib2
-	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
+	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
+	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBGLADE
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 51f418a891..26ecd8bbbf 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  73d8089cfc7d7363b5dac99b5b01dffb3429d0a855e6af16ce9a4b7777017b95  xscreensaver-5.44.tar.gz
+sha256  7016df6736ba0126a68c1f35abcf411a695fe93bc01a18ebd9df46c9a9f4d50d  xscreensaver-5.45.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 8f61dd1e13..7893e49d08 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,15 +4,22 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.44
+XSCREENSAVER_VERSION = 5.45
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
-XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
-	$(TARGET_NLS_DEPENDENCIES) host-intltool
+XSCREENSAVER_DEPENDENCIES = \
+	gdk-pixbuf \
+	jpeg \
+	libgtk2 \
+	libxml2 \
+	xlib_libX11 \
+	xlib_libXt \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-intltool
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
@@ -20,6 +27,62 @@ XSCREENSAVER_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--libdir=$(STAGING_DIR)/usr/lib
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+XSCREENSAVER_CONF_OPTS += --with-gl=yes
+XSCREENSAVER_DEPENDENCIES += libgl libglu
+else
+XSCREENSAVER_CONF_OPTS += --with-gl=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+XSCREENSAVER_CONF_OPTS += --with-png=yes
+XSCREENSAVER_DEPENDENCIES += libpng
+else
+XSCREENSAVER_CONF_OPTS += --with-png=no
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+XSCREENSAVER_CONF_OPTS += --with-systemd=yes
+XSCREENSAVER_DEPENDENCIES += systemd
+else
+XSCREENSAVER_CONF_OPTS += --with-systemd=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+XSCREENSAVER_CONF_OPTS += --with-xft=yes
+XSCREENSAVER_DEPENDENCIES += xlib_libXft
+else
+XSCREENSAVER_CONF_OPTS += --with-xft=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+XSCREENSAVER_CONF_OPTS += --with-xinput-ext=yes
+XSCREENSAVER_DEPENDENCIES += xlib_libXi
+else
+XSCREENSAVER_CONF_OPTS += --with-xinput-ext=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=yes
+XSCREENSAVER_DEPENDENCIES += xlib_libXinerama
+else
+XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+XSCREENSAVER_CONF_OPTS += --with-randr-ext=yes
+XSCREENSAVER_DEPENDENCIES += xlib_libXrandr
+else
+XSCREENSAVER_CONF_OPTS += --with-randr-ext=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=yes
+XSCREENSAVER_DEPENDENCIES += xlib_libXxf86vm
+else
+XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=no
+endif
+
 XSCREENSAVER_INSTALL_TARGET_OPTS = install_prefix="$(TARGET_DIR)" install
 
 $(eval $(autotools-package))
-- 
2.29.2
