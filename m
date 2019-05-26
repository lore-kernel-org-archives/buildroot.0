From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 May 2019 21:18:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix debug build on
 uclibc/musl
Message-ID: <20190526191814.3942-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always set CMAKE_BUILD_TYPE to Release otherwise supertux will be built
with -pg since:
https://github.com/SuperTux/supertux/commit/afd5f1b33c110104a7f286d6d7854157919a0a52

This will result in the following build failure on uclibc or musl:
[ 77%] Linking C executable sq_static
CMakeFiles/sq_static.dir/sq.c.o: In function `quit':
/home/buildroot/autobuild/instance-3/output/build/supertux-0.6.0/external/squirrel/sq/sq.c:42: undefined reference to `__gnu_mcount_nc'

Fixes:
 - http://autobuild.buildroot.org/results/b0b2e25af198d01713d1e2bcf38c77ae8ffbd7de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supertux/supertux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index af25509da8..5842b17ba4 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -18,6 +18,7 @@ SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew libglu \
 	libogg libpng libvorbis openal physfs sdl2 sdl2_image
 
+# CMAKE_BUILD_TYPE=Release: disable profiling code (-pg)
 # ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
 # depends on !BR2_STATIC_LIBS and boost provide only shared libraries with
 # BR2_SHARED_LIBS.
@@ -28,6 +29,7 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew libglu
 # in physfs.h (CHECK_SYMBOL_EXISTS) doesn't work.
 # ENABLE_OPENGLES2=OFF: Disable opengles2 for now.
 SUPERTUX_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DENABLE_BOOST_STATIC_LIBS=OFF \
 	-DBUILD_DOCUMENTATION=OFF \
 	-DENABLE_OPENGL=ON \
-- 
2.20.1
