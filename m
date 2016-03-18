From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 18 Mar 2016 11:33:56 +0100
Subject: [Buildroot] [PATCH] tekui: new package
Message-ID: <1458297236-21640-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in        |  1 +
 package/tekui/Config.in  | 19 ++++++++++++++
 package/tekui/tekui.hash |  2 ++
 package/tekui/tekui.mk   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/tekui/Config.in
 create mode 100644 package/tekui/tekui.hash
 create mode 100644 package/tekui/tekui.mk

diff --git a/package/Config.in b/package/Config.in
index 2401867..73edf1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -289,6 +289,7 @@ comment "QT libraries and helper libraries"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
+	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
 
diff --git a/package/tekui/Config.in b/package/tekui/Config.in
new file mode 100644
index 0000000..b426223
--- /dev/null
+++ b/package/tekui/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_TEKUI
+	bool "TekUI"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LUAFILESYSTEM	# runtime only
+	select BR2_PACKAGE_LUAEXPAT		# runtime only
+	select BR2_PACKAGE_LUASOCKET		# runtime only
+	select BR2_PACKAGE_LUAPOSIX		# runtime only
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  TekUI is a small, freestanding and portable graphical user interface
+	  (GUI) toolkit written in Lua and C. It was initially developed for
+	  the X Window System and has been ported to DirectFB, Windows, Nano-X
+	  and a raw framebuffer since
+
+	  http://tekui.neoscientists.org/
+
+comment "TekUI needs a Lua interpreter and a toolchain with threads"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tekui/tekui.hash b/package/tekui/tekui.hash
new file mode 100644
index 0000000..07de2ed
--- /dev/null
+++ b/package/tekui/tekui.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  28abfaacc0f2ddae962afbbca862a7fb619c33a99a497be9edd746091013dd7f  tekui-1.12.tgz
diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
new file mode 100644
index 0000000..60b48e0
--- /dev/null
+++ b/package/tekui/tekui.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# tekui
+#
+################################################################################
+
+TEKUI_VERSION = 1.12
+TEKUI_SOURCE = tekui-$(TEKUI_VERSION).tgz
+TEKUI_SITE = http://tekui.neoscientists.org/releases
+TEKUI_LICENSE = MIT
+TEKUI_LICENSE_FILES = COPYRIGHT
+TEKUI_DEPENDENCIES = freetype luainterpreter
+
+TEKUI_MAKE_OPTS = \
+	CC="$(TARGET_CC) -fPIC" \
+	AR="$(TARGET_AR) rcu" \
+	INSTALL_S="install" \
+	LUAVER=$(LUAINTERPRETER_ABIVER) \
+	LUA_DEFS=""
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+TEKUI_DEPENDENCIES += libpng
+TEKUI_MAKE_OPTS += TEKUI_DEFS="-DENABLE_GRADIENT -DENABLE_FILENO -DENABLE_PIXMAP_CACHE -DENABLE_PNG"
+TEKUI_MAKE_OPTS += TEKUI_LIBS=-lpng
+else
+TEKUI_MAKE_OPTS += TEKUI_DEFS="-DENABLE_GRADIENT -DENABLE_FILENO -DENABLE_PIXMAP_CACHE"
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU),y)
+TEKUI_FONTDIR=/usr/share/fonts/dejavu
+else
+TEKUI_FONTDIR=/usr/share/lua/$(LUAINTERPRETER_ABIVER)/tek/ui/font
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXXF86VM),yy)
+TEKUI_DEPENDENCIES += xlib_libXft xlib_libXxf86vm
+TEKUI_MAKE_OPTS += \
+	X11_LIBS="-lXext -lXxf86vm -lXft -lfreetype -lfontconfig" \
+	X11_DEFS="-D_XOPEN_SOURCE -DENABLE_XFT -DENABLE_XVID -I$(STAGING_DIR)/usr/include/freetype2 -I$(STAGING_DIR)/usr/include/fontconfig" \
+	DISPLAY_DRIVER=x11
+else
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+TEKUI_DEPENDENCIES += directfb
+TEKUI_MAKE_OPTS += \
+	DIRECTFB_LIBS="-lfreetype -ldirectfb -lpthread" \
+	DIRECTFB_DEFS="-D_REENTRANT -I$(STAGING_DIR)/usr/include/directfb -I$(STAGING_DIR)/usr/include/freetype2" \
+	DISPLAY_DRIVER=directfb
+else
+TEKUI_MAKE_OPTS += \
+	FREETYPE_LIBS=-lfreetype \
+	FREETYPE_DEFS="-I$(STAGING_DIR)/usr/include/freetype2" \
+	RAWFB_SUB_LIBS="" \
+	RAWFB_SUB_DEFS="-DDEF_FONTDIR=\\\"$(TEKUI_FONTDIR)\\\"" \
+	DISPLAY_DRIVER=rawfb
+endif
+endif
+
+define TEKUI_BUILD_CMDS
+	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
+endef
+
+define TEKUI_INSTALL_TARGET_CMDS
+	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
