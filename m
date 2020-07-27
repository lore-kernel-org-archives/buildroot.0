From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:19:04 +0200
Subject: [Buildroot] [git commit] package/cegui: fix selecting the default
 OpenGL renderer
Message-ID: <20200727151517.88CE78845C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44b14947938c813e023db77ce06b8c0d4cdb0558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the cegui requirements select explicitly the default
OpenGL renderer based on available dependencies.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/Config.in |  1 +
 package/cegui/cegui.mk  | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/cegui/Config.in b/package/cegui/Config.in
index f917be0cc5..1bd0ee1cc3 100644
--- a/package/cegui/Config.in
+++ b/package/cegui/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_CEGUI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GLM
+	select BR2_PACKAGE_LIBGLFW if BR2_PACKAGE_HAS_LIBGL # SampleBrowser dependency
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Crazy Eddie's GUI System is a free library providing windowing
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 6158ef129c..12b2712f33 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -16,15 +16,24 @@ CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
 		$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
-		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
 		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 # libepoxy support cannot be enabled together with libglew
-ifeq ($(BR2_PACKAGE_LIBEPOXY):$(BR2_PACKAGE_LIBGLEW),y:)
+ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
+CEGUI_DEPENDENCIES += libglew libglu
+CEGUI_CONF_OPTS += -DCEGUI_USE_GLEW=ON -DCEGUI_USE_EPOXY=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGL=ON \
+	-DCEGUI_BUILD_RENDERER_OPENGL3=ON
+else ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 CEGUI_DEPENDENCIES += libepoxy
-CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON
+# old OpenGL renderer module is only supported using GLEW
+CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON -DCEGUI_USE_GLEW=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGL3=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF
+CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF -DCEGUI_USE_GLEW=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
+	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
