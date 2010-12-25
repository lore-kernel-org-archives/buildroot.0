From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Dec 2010 20:47:12 +0100
Subject: [Buildroot] [git commit master 1/1] package/games: remove
	magiccube4d
Message-ID: <20101225195006.3B2058E299@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd72e95b2909da23e2d919a550716b00c656138e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It hasn't seen any updates since it was added early 2008, upstream seems
dead and it doesn't build with modern GCC versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 -
 package/games/magiccube4d/Config.in                |   11 -----------
 .../magiccube4d-2_2-add-installer.patch            |   13 -------------
 .../magiccube4d/magiccube4d-2_2-no-warn-err.patch  |   11 -----------
 package/games/magiccube4d/magiccube4d.mk           |   15 ---------------
 5 files changed, 0 insertions(+), 51 deletions(-)
 delete mode 100644 package/games/magiccube4d/Config.in
 delete mode 100644 package/games/magiccube4d/magiccube4d-2_2-add-installer.patch
 delete mode 100644 package/games/magiccube4d/magiccube4d-2_2-no-warn-err.patch
 delete mode 100644 package/games/magiccube4d/magiccube4d.mk

diff --git a/package/Config.in b/package/Config.in
index d3ae75e..225d873 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -80,7 +80,6 @@ endmenu
 menu "Games"
 source "package/games/ace_of_penguins/Config.in"
 source "package/games/gnuchess/Config.in"
-source "package/games/magiccube4d/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/doom-wad/Config.in"
 source "package/games/rubix/Config.in"
diff --git a/package/games/magiccube4d/Config.in b/package/games/magiccube4d/Config.in
deleted file mode 100644
index 871c3c7..0000000
--- a/package/games/magiccube4d/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_MAGICCUBE4D
-	bool "magiccube4d"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_XORG7
-	help
-	  Another rubiks cube-like game in 4D
-
-	  http://avr32linux.org/twiki/bin/viewfile/Main
-
-comment "magiccube4d requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
diff --git a/package/games/magiccube4d/magiccube4d-2_2-add-installer.patch b/package/games/magiccube4d/magiccube4d-2_2-add-installer.patch
deleted file mode 100644
index afe543b..0000000
--- a/package/games/magiccube4d/magiccube4d-2_2-add-installer.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/Makefile.in	2000-04-01 22:45:36.000000000 -0500
-+++ b/Makefile.in	2008-02-29 13:18:24.000000000 -0500
-@@ -126,6 +126,10 @@ tgz: $(SRCTGZ)
- 
- bindist: $(BINTGZ)
- 
-+install :
-+	mkdir -p $(GAMESDIR)
-+	install -c magiccube4d $(GAMESDIR)
-+
- rpm: $(SRCTGZ)
- 	rpm -ta $(SRCTGZ)
- 
diff --git a/package/games/magiccube4d/magiccube4d-2_2-no-warn-err.patch b/package/games/magiccube4d/magiccube4d-2_2-no-warn-err.patch
deleted file mode 100644
index 8bbc483..0000000
--- a/package/games/magiccube4d/magiccube4d-2_2-no-warn-err.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure	2000-02-10 23:19:34.000000000 -0500
-+++ b/configure	2008-02-29 13:12:33.000000000 -0500
-@@ -686,7 +686,7 @@ fi
- 
- 
- if test "$GXX" = "yes" ; then
--   WFLAGS="$WFLAGS -pedantic -Wall -W -Wunused -Werror"
-+   WFLAGS="$WFLAGS -pedantic -Wall -W -Wunused"
- fi
- echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
- echo "configure:693: checking how to run the C preprocessor" >&5
diff --git a/package/games/magiccube4d/magiccube4d.mk b/package/games/magiccube4d/magiccube4d.mk
deleted file mode 100644
index 20b4231..0000000
--- a/package/games/magiccube4d/magiccube4d.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-#############################################################
-#
-# magiccube4d
-#
-#############################################################
-MAGICCUBE4D_VERSION = 2_2
-MAGICCUBE4D_SOURCE = magiccube4d-src-$(MAGICCUBE4D_VERSION).tar.gz
-MAGICCUBE4D_SITE = http://avr32linux.org/twiki/pub/Main/MagicCube4D
-MAGICCUBE4D_INSTALL_STAGING = NO
-MAGICCUBE4D_INSTALL_TARGET = YES
-MAGICCUBE4D_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
-MAGICCUBE4D_DEPENDENCIES = xserver_xorg-server
-
-$(eval $(call AUTOTARGETS,package/games,magiccube4d))
-
-- 
1.7.2.2
