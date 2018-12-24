From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 24 Dec 2018 12:34:01 +0100
Subject: [Buildroot] [PATCH] package/supertux: bump to version 0.6.0
Message-ID: <20181224113401.13309-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump the minimum version of gcc since supertux require the C++14
  standard.
* Add boost locale dependency since it's now checked by the build
  system.
* Add libpng dependency for savepng feature.
* Add freetype dependency for the support for right-to-left languages.
* Disable ENABLE_OPENGLES2 for now, it can be enabled by a follow up
  patch.
* We don't add SDL_ttf dependency since it's included in the supertux
  source code.
* There is curently no libraqm package in Buildroot.
* Remove the two sed command from SUPERTUX_FIX_ALTIVEC_ISSUE since the
  CMake code has changed. Keep the one for tinygettext.

See:
https://www.supertux.org/news/2018/12/23/0.6.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/supertux/Config.in     |  9 ++++++---
 package/supertux/supertux.hash |  2 +-
 package/supertux/supertux.mk   | 12 ++++++------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index 684c2cc940..50bea58610 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_PACKAGE_HAS_LIBGL # libglew
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11 gcc attributes noreturn
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -12,11 +12,14 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_LOCALE
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBGLU # GL/glu.h
 	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_PHYSFS
@@ -30,10 +33,10 @@ config BR2_PACKAGE_SUPERTUX
 
 	  http://supertux.github.io/
 
-comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library, wchar"
+comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 5, NPTL, dynamic library, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/supertux/supertux.hash b/package/supertux/supertux.hash
index c56f608ed7..23e2645da6 100644
--- a/package/supertux/supertux.hash
+++ b/package/supertux/supertux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c9dc3b42991ce5c5d0d0cb94e44c4ec2373ad09029940f0e92331e7e9ada0ac5 SuperTux-v0.5.1-Source.tar.gz
+sha256 c4c3e5fa6f90e87b8c5ad6b22a179e9a9839bf997e7f219e22bbcd1c97223ac0 SuperTux-v0.6.0-Source.tar.gz
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index e397441861..af25509da8 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUX_VERSION = 0.5.1
+SUPERTUX_VERSION = 0.6.0
 SUPERTUX_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX_VERSION)
 SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
 
@@ -15,8 +15,8 @@ SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 
 # Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
 # the CMake build system.
-SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
-	libogg libvorbis openal physfs sdl2 sdl2_image
+SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew libglu \
+	libogg libpng libvorbis openal physfs sdl2 sdl2_image
 
 # ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
 # depends on !BR2_STATIC_LIBS and boost provide only shared libraries with
@@ -26,6 +26,7 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
 # Install the game directly in /usr/bin and game data in /usr/share/supertux2.
 # Force using physfs.so from staging since the check on PHYSFS_getPrefDir symbol
 # in physfs.h (CHECK_SYMBOL_EXISTS) doesn't work.
+# ENABLE_OPENGLES2=OFF: Disable opengles2 for now.
 SUPERTUX_CONF_OPTS += \
 	-DENABLE_BOOST_STATIC_LIBS=OFF \
 	-DBUILD_DOCUMENTATION=OFF \
@@ -33,7 +34,8 @@ SUPERTUX_CONF_OPTS += \
 	-DGLBINDING_ENABLED=OFF \
 	-DINSTALL_SUBDIR_BIN="bin" \
 	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
-	-DUSE_SYSTEM_PHYSFS=ON
+	-DUSE_SYSTEM_PHYSFS=ON \
+	-DENABLE_OPENGLES2=OFF
 
 # Avoid incompatible posix_memalign declaration on x86 and x86_64 with
 # musl.
@@ -60,8 +62,6 @@ endif
 # [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 define SUPERTUX_FIX_ALTIVEC_ISSUE
-	$(SED) 's%std=c++0x%std=gnu++0x%' $(@D)/CMakeLists.txt
-	$(SED) 's%std=c++11%std=gnu++11%' $(@D)/CMakeLists.txt
 	$(SED) 's%std=c++0x%std=gnu++0x%' $(@D)/external/tinygettext/CMakeLists.txt
 endef
 SUPERTUX_POST_PATCH_HOOKS += SUPERTUX_FIX_ALTIVEC_ISSUE
-- 
2.14.5
