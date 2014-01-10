From: H Hartley Sweeten <hsweeten@visionengravers.com>
Date: Fri, 10 Jan 2014 09:35:39 -0700
Subject: [Buildroot] [PATCH 2/2] package: add paragui package
In-Reply-To: <1389371739-4632-1-git-send-email-hsweeten@visionengravers.com>
References: <1389371739-4632-1-git-send-email-hsweeten@visionengravers.com>
Message-ID: <1389371739-4632-2-git-send-email-hsweeten@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for ParaGUI, a cross-platform application framework and GUI
library.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
---
 package/Config.in                                  |  1 +
 ...n-use-correct-sdl-config-when-cross-compi.patch | 35 ++++++++++++++
 package/paragui/0002-ychar.h-include-ostream.patch | 27 +++++++++++
 package/paragui/Config.in                          | 21 +++++++++
 package/paragui/paragui.mk                         | 55 ++++++++++++++++++++++
 5 files changed, 139 insertions(+)
 create mode 100644 package/paragui/0001-configure.in-use-correct-sdl-config-when-cross-compi.patch
 create mode 100644 package/paragui/0002-ychar.h-include-ostream.patch
 create mode 100644 package/paragui/Config.in
 create mode 100644 package/paragui/paragui.mk

diff --git a/package/Config.in b/package/Config.in
index f904a56..4bf0ff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ source "package/sdl_mixer/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_sound/Config.in"
 source "package/sdl_ttf/Config.in"
+source "package/paragui/Config.in"
 
 comment "Other GUIs"
 source "package/efl/Config.in"
diff --git a/package/paragui/0001-configure.in-use-correct-sdl-config-when-cross-compi.patch b/package/paragui/0001-configure.in-use-correct-sdl-config-when-cross-compi.patch
new file mode 100644
index 0000000..929d20c
--- /dev/null
+++ b/package/paragui/0001-configure.in-use-correct-sdl-config-when-cross-compi.patch
@@ -0,0 +1,35 @@
+From 6761492d6864d515baab43973f8512e0f131a20d Mon Sep 17 00:00:00 2001
+From: H Hartley Sweeten <hsweeten@visionengravers.com>
+Date: Wed, 8 Jan 2014 12:14:13 -0700
+Subject: [PATCH] configure.in: use correct sdl-config when cross compiling
+
+Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
+---
+ configure.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index c203061..8e155cb 100644
+--- a/configure.in
++++ b/configure.in
+@@ -256,13 +256,13 @@ AM_PATH_SDL($SDL_VERSION,
+ 	    AC_MSG_ERROR([*** SDL version $SDL_VERSION not found!])
+ )
+ 
+-SDL_LIBS=`sdl-config --libs`
++SDL_LIBS=`$SDL_CONFIG --libs`
+ AC_SUBST(SDL_LIBS)
+ 
+-dnl set default prefix to `sdl-config --prefix`
++dnl set default prefix to `$SDL_CONFIG --prefix`
+ 
+-ac_default_prefix=`sdl-config --prefix`
+-SDL_PREFIX=`sdl-config --prefix`
++ac_default_prefix=`$SDL_CONFIG --prefix`
++SDL_PREFIX=`$SDL_CONFIG --prefix`
+ 
+ AC_SUBST(SDL_PREFIX)
+ 
+-- 
+1.8.5.2
+
diff --git a/package/paragui/0002-ychar.h-include-ostream.patch b/package/paragui/0002-ychar.h-include-ostream.patch
new file mode 100644
index 0000000..a15a17e
--- /dev/null
+++ b/package/paragui/0002-ychar.h-include-ostream.patch
@@ -0,0 +1,27 @@
+From 96f34f59599df3d9346aeff89be27239a7777cdd Mon Sep 17 00:00:00 2001
+From: H Hartley Sweeten <hsweeten@visionengravers.com>
+Date: Wed, 8 Jan 2014 17:38:37 -0700
+Subject: [PATCH] ychar.h: #include <ostream>
+
+Include <ostream> to fix the compile with older gcc versions.
+
+Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
+---
+ include/ychar.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/ychar.h b/include/ychar.h
+index 8a31852..3006850 100644
+--- a/include/ychar.h
++++ b/include/ychar.h
+@@ -31,6 +31,7 @@
+ 
+ #include <stdexcept>
+ #include <string>
++#include <ostream>
+ 
+ typedef unsigned int uint32;
+ typedef unsigned char byte;
+-- 
+1.8.5.2
+
diff --git a/package/paragui/Config.in b/package/paragui/Config.in
new file mode 100644
index 0000000..03c6781
--- /dev/null
+++ b/package/paragui/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PARAGUI
+	bool "ParaGUI"
+	depends on BR2_PACKAGE_SDL
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBSIGC1
+	help
+	  ParaGUI is a cross-platform high-level application framework
+	  and GUI (graphical user interface) library.
+
+	  https://github.com/pipelka/paragui
+
+if BR2_PACKAGE_PARAGUI
+
+menu "ParaGUI options"
+
+config BR2_PACKAGE_PARAGUI_UNICODE
+	bool "enable unicode support"
+
+endmenu
+
+endif
diff --git a/package/paragui/paragui.mk b/package/paragui/paragui.mk
new file mode 100644
index 0000000..1c5f9e4
--- /dev/null
+++ b/package/paragui/paragui.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# paragui
+#
+################################################################################
+
+PARAGUI_VERSION = 26365b27d184ec118057bbd9bc5ef65bc6b6f5b7
+PARAGUI_SITE = $(call github,pipelka,paragui,$(PARAGUI_VERSION))
+PARAGUI_LICENSE = GPLv2+
+PARAGUI_LICENSE_FILES = COPYING
+PARAGUI_INSTALL_STAGING = YES
+
+# This package has a autogen.sh that is needed to bootstrap the internal physfs
+# package. Since Buildroot does not currently have a physfs package, and we are
+# patching configure.in, we need to use this autogen.sh instead of setting
+# PARAGUI_AUTORECONF = YES
+define PARAGUI_RUN_AUTOGEN
+	cd $(@D) && ./autogen.sh
+endef
+
+PARAGUI_POST_PATCH_HOOKS += PARAGUI_RUN_AUTOGEN
+PARAGUI_DEPENDENCIES = host-automake host-autoconf host-libtool sdl
+
+PARAGUI_CONF_OPT = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--enable-internalphysfs \
+	--disable-debug
+
+PARAGUI_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+
+PARAGUI_DEPENDENCIES += freetype
+PARAGUI_CONF_ENV += \
+	ac_cv_path_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
+PARAGUI_CONF_OPT += --enable-sdl_image
+PARAGUI_DEPENDENCIES += sdl_image
+else
+PARAGUI_CONF_OPT += --disable-sdl_image
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+PARAGUI_CONF_OPT += --disable-internalexpat
+PARAGUI_DEPENDENCIES += expat
+else
+PARAGUI_CONF_OPT += --enable-internalexpat
+endif
+
+ifeq ($(BR2_PACKAGE_PARAGUI_UNICODE),y)
+PARAGUI_CONF_OPT += --enable-unicode
+else
+PARAGUI_CONF_OPT += --disable-unicode
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.2
