From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:15:20 +0100
Subject: [Buildroot] [git commit] package/solatus: new package
Message-ID: <20171201205339.EFD838027E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd983d5d17547cf8bcdb6d94a9b8632fddbe9b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sample quest and testing quest are not included in SOLARUS_LICENSE
since it's notinstalled by default.

Remove Werror when building with debugging symbols.

Add libpng runtime dependency since solarus games require png image
support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/solarus/0001-cmake-remove-Werror.patch | 27 ++++++++++++++++++++++
 package/solarus/Config.in                      | 31 ++++++++++++++++++++++++++
 package/solarus/solarus.hash                   |  5 +++++
 package/solarus/solarus.mk                     | 23 +++++++++++++++++++
 6 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 40123bc..4057438 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ F:	package/minetest/
 F:	package/minetest-game/
 F:	package/openpowerlink/
 F:	package/physfs/
+F:	package/solarus/
 F:	package/stress-ng/
 F:	package/supertux/
 F:	package/terminology/
diff --git a/package/Config.in b/package/Config.in
index fa6bc19..e2f71b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ menu "Games"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
+	source "package/solarus/Config.in"
 	source "package/stella/Config.in"
 	source "package/supertux/Config.in"
 	source "package/supertuxkart/Config.in"
diff --git a/package/solarus/0001-cmake-remove-Werror.patch b/package/solarus/0001-cmake-remove-Werror.patch
new file mode 100644
index 0000000..b27908c
--- /dev/null
+++ b/package/solarus/0001-cmake-remove-Werror.patch
@@ -0,0 +1,27 @@
+From 4d315359d15e1221f3463b77a960a60093aac893 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 22 Jun 2017 00:19:56 +0200
+Subject: [PATCH] cmake: remove Werror
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ cmake/AddCompilationFlags.cmake | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/cmake/AddCompilationFlags.cmake b/cmake/AddCompilationFlags.cmake
+index 5159ff9..a506033 100644
+--- a/cmake/AddCompilationFlags.cmake
++++ b/cmake/AddCompilationFlags.cmake
+@@ -24,9 +24,6 @@ endif()
+ # Be less pedantic in release builds for users.
+ set(CMAKE_CXX_FLAGS_RELEASE "-Wno-error -Wall -Wextra -Wno-unknown-pragmas -Wno-fatal-errors ${CMAKE_CXX_FLAGS_RELEASE}")
+ 
+-# Be more pedantic in debug mode for developers.
+-set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Wall -Wextra -pedantic ${CMAKE_CXX_FLAGS_DEBUG}")
+-
+ # Platform-specific flags.
+ if(WIN32)
+   # MinGW: disable the console by default.
+-- 
+2.9.4
+
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
new file mode 100644
index 0000000..30c7aa2
--- /dev/null
+++ b/package/solarus/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_SOLARUS
+	bool "solarus"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on !BR2_STATIC_LIBS # SDL2
+	select BR2_PACKAGE_LIBMODPLUG
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBPNG # runtime
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_PHYSFS
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_IMAGE
+	select BR2_PACKAGE_SDL2_TTF
+	help
+	  Solarus is an open-source Zelda-like 2D game engine written
+	  in C++. It can run games scripted in Lua. This engine is used
+	  by our Zelda fangames. Solarus is licensed under GPL v3.
+
+	  http://www.solarus-games.org
+	  https://github.com/solarus-games/solarus
+
+comment "solarus needs a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
new file mode 100644
index 0000000..8ed5caf
--- /dev/null
+++ b/package/solarus/solarus.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 5930584e7c333089a2c1bf372ccc25ad3fb5c1d973189d2bf67f2308189af94d  solarus-v1.5.3.tar.gz
+
+sha256 09cb24006b6a3f2698d8851dc5df4f413c1a98e20d4008bffd76ec236f14244d  license.txt
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  license_gpl.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
new file mode 100644
index 0000000..af37f81
--- /dev/null
+++ b/package/solarus/solarus.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# solarus
+#
+################################################################################
+
+SOLARUS_VERSION = v1.5.3
+SOLARUS_SITE = $(call github,solarus-games,solarus,$(SOLARUS_VERSION))
+
+SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
+	CC-BY-SA-3.0 (GUI icons)
+SOLARUS_LICENSE_FILES = license.txt license_gpl.txt
+
+# Install libsolarus.so
+SOLARUS_INSTALL_STAGING = YES
+
+SOLARUS_DEPENDENCIES = libmodplug libogg libvorbis luajit openal physfs sdl2 \
+	sdl2_image sdl2_ttf
+
+# Disable launcher GUI (requires Qt5)
+SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
+
+$(eval $(cmake-package))
