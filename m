From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 May 2020 19:12:24 +0200
Subject: [Buildroot] [PATCH 1/4] package/ogre: remove libglu dependency
Message-ID: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"The inclusion of GLU is historical. [...] I'd recommend using
 -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
https://github.com/nigels-com/glew/issues/192#issuecomment-411641657

Add -DGLEW_NO_GLU to get rid of the libglu dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ogre/Config.in | 1 -
 package/ogre/ogre.mk   | 9 ++++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ogre/Config.in b/package/ogre/Config.in
index b5475a7cb6..1d7784714d 100644
--- a/package/ogre/Config.in
+++ b/package/ogre/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_OGRE
 	depends on BR2_USE_WCHAR # use wchar_t
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBFREEIMAGE
-	select BR2_PACKAGE_LIBGLU # GL/glu.h
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_OPENGL
 	select BR2_PACKAGE_SDL2_X11 # use wmInfo.info.x11
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 253e022a73..3387230445 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -15,7 +15,6 @@ OGRE_DEPENDENCIES = host-pkgconf \
 	freetype \
 	libfreeimage \
 	libgl \
-	libglu \
 	sdl2 \
 	xlib_libX11 \
 	xlib_libXaw \
@@ -23,12 +22,16 @@ OGRE_DEPENDENCIES = host-pkgconf \
 	xlib_libXrandr \
 	zziplib
 
+OGRE_CXX_FLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
+
 # Unbundle freetype and zziplib.
 # Disable java and nvidia cg support.
 OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
 	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
 	-DOGRE_BUILD_PLUGIN_CG=OFF \
-	-DOGRE_INSTALL_DOCS=OFF
+	-DOGRE_INSTALL_DOCS=OFF \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGLEW_NO_GLU" \
+	-DCMAKE_CXX_FLAGS="$(OGRE_CXX_FLAGS)"
 
 # Enable optional python component if python interpreter is present on the target.
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
@@ -41,7 +44,7 @@ endif
 
 # Uses __atomic_fetch_add_8
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-OGRE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+OGRE_CXXFLAGS += -latomic
 endif
 
 $(eval $(cmake-package))
-- 
2.26.2
