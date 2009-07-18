From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 18 Jul 2009 11:29:26 +0200
Subject: [Buildroot] [git commit] sdl_gfx: new package
Message-ID: <20090718093107.CC54377827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10e9b7ed08fb8a69796d0e486e74a343b24bb78d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #369.

[Peter: Minor tweaks]

Signed-off-by: Evan Zelkowitz <evan.zelkowitz@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/Config.in          |    1 +
 package/sdl_gfx/Config.in  |   10 ++++++++++
 package/sdl_gfx/sdl_gfx.mk |   26 ++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/sdl_gfx/Config.in
 create mode 100644 package/sdl_gfx/sdl_gfx.mk

diff --git a/CHANGES b/CHANGES
index 61a79b9..781f5cf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	#349: update libsoup to version 2.26.2
 	#359,#413: Upgrade openvpn to Makefile.autotools.in
 	#367: linux kernel compile error for arm926t
+	#369: Add SDL_gfx package
 	#373: Support for building gstreamer without libxml
 	#379: update DirectFB to version 1.4.0
 	#383: gst-plugins-good: Allow soup plugin to be configured
diff --git a/package/Config.in b/package/Config.in
index cb83563..4a943a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -306,6 +306,7 @@ source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
+source "package/sdl_gfx/Config.in"
 source "package/tiff/Config.in"
 
 comment "busybox graphic applications"
diff --git a/package/sdl_gfx/Config.in b/package/sdl_gfx/Config.in
new file mode 100644
index 0000000..4910b2d
--- /dev/null
+++ b/package/sdl_gfx/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL_GFX
+	bool "SDL_gfx"
+	depends on BR2_PACKAGE_SDL
+	help
+	  The SDL_gfx library is an extension to the SDL library which
+	  provides basic antialiased drawing routines such as lines,
+	  circles or polygons, an interpolating rotozoomer for SDL
+	  surfaces, framerate control and MMX image filters.
+
+	  http://www.ferzkopp.net/joomla/content/view/19/14/
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
new file mode 100644
index 0000000..bd4e3f1
--- /dev/null
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# SDL_gfx addon for SDL
+#
+#############################################################
+SDL_GFX_VERSION:=2.0.19
+SDL_GFX_SOURCE:=SDL_gfx-$(SDL_GFX_VERSION).tar.gz
+SDL_GFX_SITE:=http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_LIBTOOL_PATCH:=NO
+SDL_GFX_INSTALL_STAGING:=YES
+SDL_GFX_INSTALL_TARGET:=YES
+
+SDL_GFX_DEPENDENCIES:=sdl
+
+SDL_GFX_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--disable-sdltest \
+		--enable-static
+
+# enable mmx for newer x86's
+ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+SDL_GFX_CONF_OPT += --enable-mmx
+else
+SDL_GFX_CONF_OPT += --disable-mmx
+endif
+
+$(eval $(call AUTOTARGETS,package,sdl_gfx))
-- 
1.6.3.3
