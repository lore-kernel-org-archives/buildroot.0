From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:44:37 +0200
Subject: [Buildroot] [git commit] sdl2_gfx: new package
Message-ID: <20160715134613.5F2AE82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72fb754f4c7e4112262ca9e232f7e96e7fa714da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
[Thomas:
 - Rewrap Config.in help text.
 - Remove unused SDL2_GFX_VERSION_MAJOR variable
 - Add host-pkgconf to the dependencies, since pkg-config is used to
   find sdl2. This fixes the build, otherwise -I/usr/include/sdl2 was
   added to the CFLAGS when sdl2-config was found on the host machine.
 - Remove --with-sdl2-prefix, since this option doesn't exist, and
   using pkg-config is a better solution (--with-sdl-prefix exists,
   but is not useful when pkg-config is available).
 - Remove --enable-static, packages are not supposed to pass such an
   option, it's not automatically by the autotools package
   infrastructure.
 - Pass --disable-sdltest instead of --disable-sdl2test since the
   latter doesn't exist, while the former does.
 - Pass SDL2_GFX_AUTORECONF = YES since the configure/Makefile.in are
   not up-to-date and therefore it tries to use aclocal at build time.
 - Adjust _LICENSE_FILES, since there is no file named 'LICENSE', use
   the smallest source file instead, since it contains the license
   text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/sdl2_gfx/Config.in     | 10 ++++++++++
 package/sdl2_gfx/sdl2_gfx.hash |  2 ++
 package/sdl2_gfx/sdl2_gfx.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 32c3e1c..0ec9ba4 100644
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
index 0000000..357647f
--- /dev/null
+++ b/package/sdl2_gfx/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL2_GFX
+	bool "SDL2_gfx"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  The SDL2_gfx library is an extension to the SDL2 library
+	  which provides basic antialiased drawing routines such as
+	  lines, circles or polygons, an interpolating rotozoomer for
+	  SDL surfaces, framerate control and MMX image filters.
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
index 0000000..975bca7
--- /dev/null
+++ b/package/sdl2_gfx/sdl2_gfx.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# sdl2_gfx
+#
+################################################################################
+
+SDL2_GFX_VERSION = 1.0.1
+SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
+SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
+SDL2_GFX_LICENSE = zlib
+SDL2_GFX_LICENSE_FILES = COPYING SDL2_framerate.h
+SDL2_GFX_INSTALL_STAGING = YES
+SDL2_GFX_DEPENDENCIES = sdl2 host-pkgconf
+SDL2_GFX_CONF_OPTS = --disable-sdltest
+# configure/Makefile.in not up-to-date, causing aclocal to be used at
+# build time if we don't autoreconf.
+SDL2_GFX_AUTORECONF = YES
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
