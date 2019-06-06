From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:21:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/supertux: fix
 debug build on uclibc/musl
Message-ID: <20190606154047.CC4877FB93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c3753a617ca9cde23a643195c321c37dfd7a28f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c283f0216dff6a1bf6a3be51c25c361aaf633bb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
