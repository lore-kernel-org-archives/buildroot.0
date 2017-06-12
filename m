From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Jun 2017 22:54:00 +0200
Subject: [Buildroot] [PATCH v2 03/13] package/minetest: new package
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170612205410.20230-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: add package dependencies comments
    add hash file (Bernd)
    bump to 0.4.16 (Bernd)
    version 0.4.15 Tested-by Bernd
    Add a new patch fixing linking with libintl when necessary
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-CMake-link-with-Intl-when-necessary.patch | 55 +++++++++++++++++
 package/minetest/Config.in                         | 70 ++++++++++++++++++++++
 package/minetest/minetest.hash                     |  2 +
 package/minetest/minetest.mk                       | 44 ++++++++++++++
 6 files changed, 173 insertions(+)
 create mode 100644 package/minetest/0001-CMake-link-with-Intl-when-necessary.patch
 create mode 100644 package/minetest/Config.in
 create mode 100644 package/minetest/minetest.hash
 create mode 100644 package/minetest/minetest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dd12cfe..6ef7b23 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1389,6 +1389,7 @@ F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
+F:	package/minetest/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 75b2436..4d59a68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -226,6 +226,7 @@ menu "Games"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
+	source "package/minetest/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest/0001-CMake-link-with-Intl-when-necessary.patch b/package/minetest/0001-CMake-link-with-Intl-when-necessary.patch
new file mode 100644
index 0000000..61083f9
--- /dev/null
+++ b/package/minetest/0001-CMake-link-with-Intl-when-necessary.patch
@@ -0,0 +1,55 @@
+From 45ed3aa6be6d70cf76a4f10c81684ab86cb5017f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 12 Jun 2017 21:57:05 +0200
+Subject: [PATCH] CMake: link with Intl when necessary
+
+On non Glibc system linking with Intl library may be needed when
+Gettext support is enabled.
+
+Fixes:
+clientlauncher.cpp:(.text+0xcac): undefined reference to `libintl_gettext'
+clientlauncher.cpp:(.text+0xdf0): undefined reference to `libintl_gettext'
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/CMakeLists.txt | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 7c1a4ee..3f6b3f0 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -70,6 +70,14 @@ if(ENABLE_GETTEXT)
+ 		endif()
+ 		set(USE_GETTEXT TRUE)
+ 		message(STATUS "GetText enabled; locales found: ${GETTEXT_AVAILABLE_LOCALES}")
++		# On some platforms, such as Linux with GNU libc, the gettext
++		# functions are present in the C standard library and libintl
++		# is not required. For other libc (uClibc-ng or musl) libintl
++		# may be required.
++		find_package(Intl)
++		if(NOT Intl_LIBRARIES STREQUAL "")
++			message(STATUS "GetText Intl : ${Intl_LIBRARIES}")
++		endif()
+ 	endif(GETTEXT_FOUND)
+ else()
+ 	mark_as_advanced(GETTEXT_ICONV_DLL GETTEXT_INCLUDE_DIR GETTEXT_LIBRARY GETTEXT_MSGFMT)
+@@ -585,6 +593,7 @@ if(BUILD_CLIENT)
+ 		${PNG_LIBRARIES}
+ 		${X11_LIBRARIES}
+ 		${GETTEXT_LIBRARY}
++		${Intl_LIBRARIES}
+ 		${SOUND_LIBRARIES}
+ 		${SQLITE3_LIBRARY}
+ 		${LUA_LIBRARY}
+@@ -650,6 +659,7 @@ if(BUILD_SERVER)
+ 		${SQLITE3_LIBRARY}
+ 		${JSON_LIBRARY}
+ 		${GETTEXT_LIBRARY}
++		${Intl_LIBRARIES}
+ 		${LUA_LIBRARY}
+ 		${GMP_LIBRARY}
+ 		${PLATFORM_LIBS}
+-- 
+2.9.4
+
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
new file mode 100644
index 0000000..d0613a2
--- /dev/null
+++ b/package/minetest/Config.in
@@ -0,0 +1,70 @@
+config BR2_PACKAGE_MINETEST
+	bool "minetest"
+	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XORG7 # irrlicht
+	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	select BR2_PACKAGE_IRRLICHT
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	help
+	  Minetest is a near-infinite-world block sandbox game and a
+	  game engine, inspired by InfiniMiner, Minecraft, and the
+	  like.
+
+	  http://www.minetest.net
+
+if BR2_PACKAGE_MINETEST
+
+config BR2_PACKAGE_MINETEST_CLIENT
+	bool
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+
+config BR2_PACKAGE_MINETEST_SERVER
+	bool
+
+choice
+	prompt "minetest build"
+
+config BR2_PACKAGE_MINETEST_CLIENT_ONLY
+	bool "client only"
+	select BR2_PACKAGE_MINETEST_CLIENT
+	help
+	  Build Minetest client only.
+
+config BR2_PACKAGE_MINETEST_SERVER_ONLY
+	bool "server only"
+	select BR2_PACKAGE_MINETEST_SERVER
+	help
+	  Build Minetest server only.
+
+config BR2_PACKAGE_MINETEST_CLIENT_SERVER
+	bool "client and server"
+	select BR2_PACKAGE_MINETEST_CLIENT
+	select BR2_PACKAGE_MINETEST_SERVER
+	help
+	  Build Minetest client and server.
+
+endchoice
+
+endif
+
+comment "minetest needs a toolchain w/ C++, gcc >= 4.7, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "minetest needs X11, an OpenGL provider, luajit"
+	depends on (BR2_INSTALL_LIBSTDCPP \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		&& BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7 \
+		|| !BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
new file mode 100644
index 0000000..e4276c6
--- /dev/null
+++ b/package/minetest/minetest.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0ef3793de9f569746ea78af7a66fe96ef65400019e5e64a04a5c3fa26a707655  minetest-0.4.16.tar.gz
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
new file mode 100644
index 0000000..929016a
--- /dev/null
+++ b/package/minetest/minetest.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# minetest
+#
+################################################################################
+
+MINETEST_VERSION = 0.4.16
+MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
+MINETEST_LICENSE = LGPL-2.1+, CC-BY-SA-3.0
+MINETEST_LICENSE_FILES = README.txt
+
+MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
+
+MINETEST_CONF_OPTS = \
+	-DDEFAULT_RUN_IN_PLACE=OFF \
+	-DENABLE_CURL=OFF \
+	-DENABLE_GETTEXT=OFF \
+	-DENABLE_SOUND=OFF \
+	-DENABLE_GLES=OFF \
+	-DENABLE_FREETYPE=OFF \
+	-DENABLE_LUAJIT=ON \
+	-DENABLE_CURSES=OFF \
+	-DENABLE_POSTGRESQL=OFF \
+	-DENABLE_LEVELDB=OFF \
+	-DENABLE_REDIS=OFF \
+	-DENABLE_SPATIAL=OFF \
+	-DAPPLY_LOCALE_BLACKLIST=OFF \
+	-DENABLE_SYSTEM_GMP=ON \
+	-DENABLE_SYSTEM_JSONCPP=ON
+
+ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
+MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm
+MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
+else
+MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MINETEST_SERVER),y)
+MINETEST_CONF_OPTS += -DBUILD_SERVER=ON
+else
+MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.9.4
