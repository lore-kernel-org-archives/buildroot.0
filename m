From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:34:20 +0200
Subject: [Buildroot] [git commit] sdl2_ttf: new package
Message-ID: <20160715143825.1A6CB82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0abce838bd3167e44c79b2e235125b9c7aa5f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
[Thomas:
 - point <pkg>_LICENSE_FILES to a file that actually exists
 - add host-pkgconf to the dependencies
 - remove unneeded CONF_OPTS options
 - pass FREETYPE_CONFIG in the environment to point to freetype-config]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/sdl2_ttf/Config.in     |  9 +++++++++
 package/sdl2_ttf/sdl2_ttf.hash |  2 ++
 package/sdl2_ttf/sdl2_ttf.mk   | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5be2053..da7b855 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ comment "Graphic libraries"
 	source "package/sdl2/Config.in"
 	source "package/sdl2_gfx/Config.in"
 	source "package/sdl2_image/Config.in"
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
diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
new file mode 100644
index 0000000..515189a
--- /dev/null
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276  SDL2_ttf-2.0.14.tar.gz
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
new file mode 100644
index 0000000..71c5bc7
--- /dev/null
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -0,0 +1,17 @@
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
+SDL2_TTF_LICENSE_FILES = COPYING.txt
+SDL2_TTF_INSTALL_STAGING = YES
+SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
+SDL2_TTF_CONF_ENV = \
+	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+
+$(eval $(autotools-package))
