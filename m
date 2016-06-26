From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Sat, 25 Jun 2016 21:02:24 -0600
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: PeterThompson
	<peter.macleod.thompson@gmail.com>
Message-ID: <1466910144-17919-1-git-send-email-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: PeterThompson <peter.macleod.thompson@gmail.com>

sdl2_ttf created from sdl_ttf with minor changes for sdl2

Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>
---
 package/Config.in            |  1 +
 package/sdl2_ttf/Config.in   |  9 +++++++++
 package/sdl2_ttf/sdl2_ttf.mk | 21 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/sdl2_ttf/Config.in
 create mode 100644 package/sdl2_ttf/sdl2_ttf.mk

diff --git a/package/Config.in b/package/Config.in
index a2a02a8..648e848 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ endif
 	source "package/sdl_sound/Config.in"
 	source "package/sdl_ttf/Config.in"
 	source "package/sdl2/Config.in"
+	source "package/sdl2_ttf/Config.in"
 
 comment "Other GUIs"
 	source "package/qt/Config.in"
diff --git a/package/sdl2_ttf/Config.in b/package/sdl2_ttf/Config.in
new file mode 100644
index 0000000..cb77059
--- /dev/null
+++ b/package/sdl2_ttf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL2_TTF
+	bool "SDL2_TTF"
+	depends on BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_FREETYPE
+	help
+	  SDL2_ttf is a sample TrueType font library. It allows you to
+	  use TrueType fonts in your SDL2 applications.
+
+	  http://www.libsdl.org/projects/SDL_ttf/
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
new file mode 100644
index 0000000..8eb480f
--- /dev/null
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sdl2_ttf
+#
+################################################################################
+
+SDL2_TTF_VERSION = 2.0.14
+SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
+SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
+SDL2_TTF_LICENSE = zlib
+SDL2_TTF_LICENSE_FILES = COPYING
+
+SDL2_TTF_INSTALL_STAGING = YES
+SDL2_TTF_DEPENDENCIES = sdl2 freetype
+SDL2_TTF_CONF_OPTS = \
+	--without-x \
+	--with-freetype-prefix=$(STAGING_DIR)/usr \
+	--with-sdl2-prefix=$(STAGING_DIR)/usr
+
+SDL2_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL2"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+$(eval $(autotools-package))
-- 
1.9.1
