From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 12 Jul 2016 08:53:03 -0600
Subject: [Buildroot] [PATCH 1/3] sdl2_gfx: new package
Message-ID: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdl2_gfx created from sdl_gfx with minor changes for sdl2

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/Config.in              |  1 +
 package/sdl2_gfx/Config.in     | 10 ++++++++++
 package/sdl2_gfx/sdl2_gfx.hash |  2 ++
 package/sdl2_gfx/sdl2_gfx.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/sdl2_gfx/Config.in
 create mode 100644 package/sdl2_gfx/sdl2_gfx.hash
 create mode 100644 package/sdl2_gfx/sdl2_gfx.mk

diff --git a/package/Config.in b/package/Config.in
index 1910251..5a75234 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ comment "Graphic libraries"
 	source "package/sdl_sound/Config.in"
 	source "package/sdl_ttf/Config.in"
 	source "package/sdl2/Config.in"
+	source "package/sdl2_gfx/Config.in"
 
 comment "Other GUIs"
 	source "package/qt/Config.in"
diff --git a/package/sdl2_gfx/Config.in b/package/sdl2_gfx/Config.in
new file mode 100644
index 0000000..09db436
--- /dev/null
+++ b/package/sdl2_gfx/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL2_GFX
+	bool "SDL2_gfx"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  The SDL2_gfx library is an extension to the SDL2 library which
+	  provides basic antialiased drawing routines such as lines,
+	  circles or polygons, an interpolating rotozoomer for SDL
+	  surfaces, framerate control and MMX image filters.
+
+	  http://www.ferzkopp.net/wordpress/2016/01/02/sdl_gfx-sdl2_gfx
diff --git a/package/sdl2_gfx/sdl2_gfx.hash b/package/sdl2_gfx/sdl2_gfx.hash
new file mode 100644
index 0000000..4cb07ee
--- /dev/null
+++ b/package/sdl2_gfx/sdl2_gfx.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d69bcbceb811b4e5712fbad3ede737166327f44b727f1388c32581dbbe8c599a  SDL2_gfx-1.0.1.tar.gz
diff --git a/package/sdl2_gfx/sdl2_gfx.mk b/package/sdl2_gfx/sdl2_gfx.mk
new file mode 100644
index 0000000..b409845
--- /dev/null
+++ b/package/sdl2_gfx/sdl2_gfx.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# sdl2_gfx
+#
+################################################################################
+
+SDL2_GFX_VERSION_MAJOR = 2.0
+SDL2_GFX_VERSION = 1.0.1
+SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
+SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
+SDL2_GFX_LICENSE = zlib
+SDL2_GFX_LICENSE_FILES = COPYING LICENSE
+SDL2_GFX_INSTALL_STAGING = YES
+SDL2_GFX_DEPENDENCIES = sdl2
+SDL2_GFX_CONF_OPTS = \
+	--with-sdl2-prefix=$(STAGING_DIR)/usr \
+	--disable-sdl2test \
+	--enable-static
+
+# Even though x86_64 processors support MMX, the MMX-specific assembly
+# code in sdl2_gfx is IA32 specific, and does not build for x86_64.
+ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),yy)
+SDL2_GFX_CONF_OPTS += --enable-mmx
+else
+SDL2_GFX_CONF_OPTS += --disable-mmx
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
