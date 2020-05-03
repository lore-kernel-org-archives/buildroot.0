From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 May 2020 19:12:25 +0200
Subject: [Buildroot] [PATCH 2/4] package/supertux: remove libglu dependency
In-Reply-To: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
References: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
Message-ID: <20200503171227.1411086-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"The inclusion of GLU is historical. [...] It's not needed for GLEW to
 build or run, but it's opt-out that reason. I'd recommend using
 -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
https://github.com/nigels-com/glew/issues/192#issuecomment-411641657

Each package using glew.h has to decide whether to use the opt-out for
glu or not. Since supertux does not need libglu we can safely remove
the dependency by adding -DGLEW_NO_GLU to TARGET_CXXFLAGS.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/supertux/Config.in   | 1 -
 package/supertux/supertux.mk | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index c77d1ae2bd..5cacdd658e 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLEW
-	select BR2_PACKAGE_LIBGLU # GL/glu.h
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBVORBIS
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index 5842b17ba4..e4a4630918 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -15,7 +15,7 @@ SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 
 # Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
 # the CMake build system.
-SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew libglu \
+SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew \
 	libogg libpng libvorbis openal physfs sdl2 sdl2_image
 
 # CMAKE_BUILD_TYPE=Release: disable profiling code (-pg)
@@ -30,6 +30,7 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew libglu
 # ENABLE_OPENGLES2=OFF: Disable opengles2 for now.
 SUPERTUX_CONF_OPTS += \
 	-DCMAKE_BUILD_TYPE=Release \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU" \
 	-DENABLE_BOOST_STATIC_LIBS=OFF \
 	-DBUILD_DOCUMENTATION=OFF \
 	-DENABLE_OPENGL=ON \
-- 
2.26.2
