From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:48:12 +0100
Subject: [Buildroot] [git commit] package/solarus: bump to version 1.6.0
Message-ID: <20181230155130.B6B7B838B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ab3f51827afcfa71869a97f10450173e5d3cd75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Here are the big features in Solarus 1.6:

    * OpenGL backend and support for GLSL shaders (by Stdgregwar and Vlag)
    * Support for external script editor of your choice.
        Zerobrane integration: autocompletion, debug breakpoints,
        stack inspection (by Stdgregwar)
    * Multiple improvements in map editor, including the much-requested
        contour generator, tile replacement and support for multiple
        tilesets
    * Multiple improvements in tileset editor, including multiple selection,
        custom frame count for animated tile patterns
    * Multiple improvements in sprite editor
    * Data import from other quests
    * Beautiful new free tilesets (Zoria by DragonDePlatino,
        Ocean???s Heart by Max Mraz)
    * Free pixel fonts (by Wekhter)
    * Custom hero states in Lua to allow advanced customization of the hero
    * Tons of new features in the Lua API

Last but not least: Solarus 1.6 is fully compatible with Solarus 1.5 quests.
You have no work to do to upgrade your project to Solarus 1.6.

Starting with version 1.6, the Solarus engine now require OpenGL (GLX) support.
The OpenGL ES support doesn't build, this issue has been reported upstream [1].

Update the download url since solarus no longer use github.
Rebase patch.

See:
http://www.solarus-games.org/2018/12/22/solarus-1-6-released

[1] https://gitlab.com/solarus-games/solarus/issues/1324

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/solarus/0001-cmake-remove-Werror.patch | 27 +++++++++++++-------------
 package/solarus/Config.in                      |  6 ++++--
 package/solarus/solarus.hash                   |  2 +-
 package/solarus/solarus.mk                     |  7 ++++---
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/package/solarus/0001-cmake-remove-Werror.patch b/package/solarus/0001-cmake-remove-Werror.patch
index b27908c829..533ac91c7d 100644
--- a/package/solarus/0001-cmake-remove-Werror.patch
+++ b/package/solarus/0001-cmake-remove-Werror.patch
@@ -1,27 +1,26 @@
-From 4d315359d15e1221f3463b77a960a60093aac893 Mon Sep 17 00:00:00 2001
+From 5f372ba3502369c6501c77650a761300d26f64c0 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 22 Jun 2017 00:19:56 +0200
 Subject: [PATCH] cmake: remove Werror
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- cmake/AddCompilationFlags.cmake | 3 ---
- 1 file changed, 3 deletions(-)
+ cmake/AddCompilationFlags.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cmake/AddCompilationFlags.cmake b/cmake/AddCompilationFlags.cmake
-index 5159ff9..a506033 100644
+index 2c105db7f..cb5c5719a 100644
 --- a/cmake/AddCompilationFlags.cmake
 +++ b/cmake/AddCompilationFlags.cmake
-@@ -24,9 +24,6 @@ endif()
- # Be less pedantic in release builds for users.
- set(CMAKE_CXX_FLAGS_RELEASE "-Wno-error -Wall -Wextra -Wno-unknown-pragmas -Wno-fatal-errors ${CMAKE_CXX_FLAGS_RELEASE}")
+@@ -25,7 +25,7 @@ endif()
+ set(CMAKE_CXX_FLAGS_RELEASE "-Wno-error -Wall -Wextra -Wno-unknown-pragmas -Wno-fatal-errors ${CMAKE_CXX_FLAGS_RELEASE} -O3")
  
--# Be more pedantic in debug mode for developers.
--set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Wall -Wextra -pedantic ${CMAKE_CXX_FLAGS_DEBUG}")
--
- # Platform-specific flags.
- if(WIN32)
-   # MinGW: disable the console by default.
+ # Be more pedantic in debug mode for developers.
+-set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Wall -Wextra -Wno-error=deprecated-declarations -pedantic ${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
++set(CMAKE_CXX_FLAGS_DEBUG "-Wno-error -Wall -Wextra -Wno-error=deprecated-declarations -pedantic ${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
+ if(CMAKE_COMPILER_IS_GNUCXX)
+     set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wsuggest-override")
+ endif()
 -- 
-2.9.4
+2.14.5
 
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 30c7aa28b5..359ad15e02 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG # runtime
@@ -24,8 +25,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
+comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index 8ed5cafa4b..e4a7a3a6b6 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 5930584e7c333089a2c1bf372ccc25ad3fb5c1d973189d2bf67f2308189af94d  solarus-v1.5.3.tar.gz
+sha256 d800fdf388f860732f2d40c8dd635c34fd1c452857f75bf9b3a421e3ef5ee751  solarus-1.6.0-src.tar.gz
 
 sha256 09cb24006b6a3f2698d8851dc5df4f413c1a98e20d4008bffd76ec236f14244d  license.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  license_gpl.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index af37f81a0b..d43527691e 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SOLARUS_VERSION = v1.5.3
-SOLARUS_SITE = $(call github,solarus-games,solarus,$(SOLARUS_VERSION))
+SOLARUS_VERSION = 1.6.0
+SOLARUS_SITE = http://www.solarus-games.org/downloads/solarus
+SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
 
 SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
 	CC-BY-SA-3.0 (GUI icons)
@@ -14,7 +15,7 @@ SOLARUS_LICENSE_FILES = license.txt license_gpl.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = libmodplug libogg libvorbis luajit openal physfs sdl2 \
+SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis luajit openal physfs sdl2 \
 	sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
