From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 22 Jun 2017 00:47:01 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/supertux: use the bundled
	version of physfs
Message-ID: <20170621224704.23279-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to add supertux package, a physfs package was introduced
using the same version (2.1.x) than the one bundled in supertux
sources. However this version is not released yet and it's still under
development.

The 2.1.x version introduce API changes that may break other packages
using the latest stable version of physfs (2.0.x).

Also, there is an issue (segfault) with physfs 2.1.x while extracting
a zip archive. This issue is fixed in 2.0.x branch but not in 2.1.x
branch since physfs 2.1.x now use minizip which doesn't provide
inflateCopy() used by the bugfix [1].

This doesn't affect supertux itself, so we can safely
use the bundled version.

[1] https://hg.icculus.org/icculus/physfs/rev/090cb9c74b87

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/supertux/Config.in   |  1 -
 package/supertux/supertux.mk | 12 +++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index 684c2cc..38e4a98 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_OPENAL
-	select BR2_PACKAGE_PHYSFS
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_OPENGL
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index e397441..0caceb1 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -10,13 +10,14 @@ SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
 
 # Supertux itself is GPL-3.0+, but it bundles a few libraries with different
 # licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
-SUPERTUX_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, GPL-2.0+ (images music sounds)
+SUPERTUX_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, GPL-2.0+ (images music sounds) \
+	Zlib (physfs)
 SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 
 # Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
 # the CMake build system.
 SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
-	libogg libvorbis openal physfs sdl2 sdl2_image
+	libogg libvorbis openal sdl2 sdl2_image
 
 # ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
 # depends on !BR2_STATIC_LIBS and boost provide only shared libraries with
@@ -24,8 +25,9 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
 # ENABLE_OPENGL=ON: Can be disabled but will make SuperTux unplayable slow.
 # GLBINDING_ENABLED=OFF: use GLEW (default) instead of glbinding.
 # Install the game directly in /usr/bin and game data in /usr/share/supertux2.
-# Force using physfs.so from staging since the check on PHYSFS_getPrefDir symbol
-# in physfs.h (CHECK_SYMBOL_EXISTS) doesn't work.
+# Force using the bundled version of physfs since it use a non released version
+# of physfs (2.1.x) which is incompatible with the latest released version (2.0.x)
+# due to API changes.
 SUPERTUX_CONF_OPTS += \
 	-DENABLE_BOOST_STATIC_LIBS=OFF \
 	-DBUILD_DOCUMENTATION=OFF \
@@ -33,7 +35,7 @@ SUPERTUX_CONF_OPTS += \
 	-DGLBINDING_ENABLED=OFF \
 	-DINSTALL_SUBDIR_BIN="bin" \
 	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
-	-DUSE_SYSTEM_PHYSFS=ON
+	-DUSE_SYSTEM_PHYSFS=OFF
 
 # Avoid incompatible posix_memalign declaration on x86 and x86_64 with
 # musl.
-- 
2.9.4
