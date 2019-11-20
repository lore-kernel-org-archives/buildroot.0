From: Koen Martens <gmc@sonologic.nl>
Date: Wed, 20 Nov 2019 17:14:09 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/linuxconsoletools: bump version
 to 1.7.0
Message-ID: <20191120161408.GA28902@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version changed the (optional) dependency from sdl and
sdl-config to sdl2 and pkg-config. Therefore, the patch
0002-sdl-config.patch has been dropped and the dependency
has been changed to BR2_PACKAGE_SDL2.

Since SDL2 (required to build force-feedback utilities)
requires shared library support to compile, a dependency
on !BR2_STATIC_LIBS was added to the configuration option
that enables force-feedback utilities.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 .../linuxconsoletools/0002-sdl-config.patch   | 20 -------------------
 package/linuxconsoletools/Config.in           |  6 +++++-
 .../linuxconsoletools/linuxconsoletools.hash  |  2 +-
 .../linuxconsoletools/linuxconsoletools.mk    |  6 +++---
 4 files changed, 9 insertions(+), 25 deletions(-)
 delete mode 100644 package/linuxconsoletools/0002-sdl-config.patch

diff --git a/package/linuxconsoletools/0002-sdl-config.patch b/package/linuxconsoletools/0002-sdl-config.patch
deleted file mode 100644
index c19c274a83..0000000000
--- a/package/linuxconsoletools/0002-sdl-config.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Specify sdl-config to use instead of using host sdl-config.
-
-Signed-off-by: Koen Martens <gmc@sonologic.nl>
-
-diff -Naur a/utils/Makefile b/utils/Makefile
---- a/utils/Makefile	2017-06-16 18:48:28.402824790 +0200
-+++ b/utils/Makefile	2017-06-16 18:48:53.898696647 +0200
-@@ -69,10 +69,10 @@
- 	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) -lm -o $@
- 
- ffmvforce.o: ffmvforce.c
--	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `sdl-config --cflags`
-+	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `${SDL_CONFIG} --cflags`
- 
- ffmvforce: ffmvforce.o
--	$(CC) $^ -o $@ $(LDFLAGS) -g -lm `sdl-config --libs`
-+	$(CC) $^ -o $@ $(LDFLAGS) -g -lm `${SDL_CONFIG} --libs`
- 
- axbtnmap.o: axbtnmap.c axbtnmap.h
- 
diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
index 76150278ae..614099fdee 100644
--- a/package/linuxconsoletools/Config.in
+++ b/package/linuxconsoletools/Config.in
@@ -28,9 +28,13 @@ config BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
 
 config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
 	bool "force-feedback utilities"
-	select BR2_PACKAGE_SDL
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SDL2
 	help
 	  Build force-feedback driver utilities (fftest,
 	  ffmvforce, ffset, ffcfstress).
 
+comment "force-feedback utilities need a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
index d1bb5a39ef..caacf70e45 100644
--- a/package/linuxconsoletools/linuxconsoletools.hash
+++ b/package/linuxconsoletools/linuxconsoletools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e9d6b05a6c57c7eb3ec7f9f017f46b20e4b55d5a02f930eff1823a13921c5934	linuxconsoletools-1.6.1.tar.bz2
+sha256	95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34	linuxconsoletools-1.7.0.tar.bz2
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
index b22e136d33..f26d874d96 100644
--- a/package/linuxconsoletools/linuxconsoletools.mk
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXCONSOLETOOLS_VERSION = 1.6.1
+LINUXCONSOLETOOLS_VERSION = 1.7.0
 LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
 LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
 LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
@@ -21,8 +21,8 @@ endif
 ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
 LINUXCONSOLETOOLS_MAKE_OPTS += \
 	ENABLE_FORCEFEEDBACK=1 \
-	SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-LINUXCONSOLETOOLS_DEPENDENCIES += sdl
+	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+LINUXCONSOLETOOLS_DEPENDENCIES += sdl2 host-pkgconf
 endif
 
 define LINUXCONSOLETOOLS_BUILD_CMDS
-- 
2.17.1
