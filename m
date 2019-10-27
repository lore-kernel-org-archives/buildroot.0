From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:35:15 +0100
Subject: [Buildroot] [git commit] package/ogre: new package
Message-ID: <20191027153053.A5D8E8A2F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb91fa730c5d92202c38514345e86315e138944c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ogre needs host-swig with pcre support when python interpreter is
present on the target.
Otherwise the build stop with the following message:
"SWIG:7: Error: PCRE regex matching is not available in this SWIG build."

Ogre has been tested using the SampleBrowser binary but some demos
are not working due to missing optional dependencies (nvidia Cg plugin).

See: https://www.ogre3d.org/2019/05/01/ogre3d-1-12-released

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/ogre/Config.in | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/ogre/ogre.hash |  3 +++
 package/ogre/ogre.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 39f238751e..f41ac5f096 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2038,6 +2038,7 @@ F:	package/mcelog/
 F:	package/mesa3d/
 F:	package/minetest/
 F:	package/minetest-game/
+F:	package/ogre/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
diff --git a/package/Config.in b/package/Config.in
index f779c28c7a..a1ac5069aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -308,6 +308,7 @@ comment "Graphic libraries"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
+	source "package/ogre/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
 	source "package/sdl_gfx/Config.in"
diff --git a/package/ogre/Config.in b/package/ogre/Config.in
new file mode 100644
index 0000000000..b5475a7cb6
--- /dev/null
+++ b/package/ogre/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_OGRE
+	bool "ogre"
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # use wchar_t
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBFREEIMAGE
+	select BR2_PACKAGE_LIBGLU # GL/glu.h
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_OPENGL
+	select BR2_PACKAGE_SDL2_X11 # use wmInfo.info.x11
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_ZZIPLIB
+	help
+	  OGRE is a scene-oriented, flexible 3D engine written in C++
+	  designed to make it easier and more intuitive for developers
+	  to produce games and demos utilising 3D hardware. The class
+	  library abstracts all the details of using the underlying
+	  system libraries like Direct3D and OpenGL and provides an
+	  interface based on world objects and other intuitive classes.
+
+	  https://ogrecave.github.io/ogre
+
+comment "ogre needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		&& BR2_INSTALL_LIBSTDCPP && !BR2_STATIC_LIBS && BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
+comment "ogre needs a toolchain w/ C++, dynamic library, gcc >= 4.8, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
new file mode 100644
index 0000000000..8bb4ae96a1
--- /dev/null
+++ b/package/ogre/ogre.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256 163e7700e319532d4389ecba91e3ab88551f78610886fa36f8f262f9a5080988  ogre-1.12.0.tar.gz
+sha256 82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
new file mode 100644
index 0000000000..f7711e41f1
--- /dev/null
+++ b/package/ogre/ogre.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# ogre
+#
+################################################################################
+
+OGRE_VERSION = 1.12.0
+OGRE_SITE = $(call github,OGRECave,ogre,v$(OGRE_VERSION))
+OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)
+OGRE_LICENSE_FILES = LICENSE
+OGRE_INSTALL_STAGING = YES
+
+# Ogre use a bundled version of tinyxml
+OGRE_DEPENDENCIES = host-pkgconf \
+	freetype \
+	libfreeimage \
+	libgl \
+	libglu \
+	sdl2 \
+	xlib_libX11 \
+	xlib_libXaw \
+	xlib_libXext \
+	xlib_libXrandr \
+	zziplib
+
+# Unbundle freetype and zziplib.
+# Disable java and nvidia cg support.
+OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
+	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
+	-DOGRE_BUILD_PLUGIN_CG=OFF \
+	-DOGRE_INSTALL_DOCS=OFF
+
+# Enable optional python component if python interpreter is present on the target.
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+OGRE_DEPENDENCIES += host-swig \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+OGRE_CONF_OPTS += -DOGRE_BUILD_COMPONENT_PYTHON=ON
+else
+OGRE_CONF_OPTS += -DOGRE_BUILD_COMPONENT_PYTHON=OFF
+endif
+
+$(eval $(cmake-package))
