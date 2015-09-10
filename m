From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:57:01 +0200
Subject: [Buildroot] [git commit] sawman: remove package
Message-ID: <20150910122136.D8012807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11573f5a14d1c2726ce9623de3a5f118085a420f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit removes the sawman package, since the corresponding
functionality has been merged in DirectFB itself since 1.7.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   10 ++++++++++
 package/Config.in                                  |    1 -
 .../sawman/0001-link-using-gcc-instead-of-ld.patch |   19 -------------------
 package/sawman/Config.in                           |   11 -----------
 package/sawman/sawman.mk                           |   16 ----------------
 5 files changed, 10 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d4551c..d0e2c81 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_SAWMAN
+	bool "sawman package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DIRECTFB_SAWMAN
+	help
+	  This option has been removed because the sawman package no
+	  longer exists: it was merged inside DirectFB itself. This
+	  feature can now be enabled using the
+	  BR2_PACKAGE_DIRECTFB_SAWMAN option.
+
 config BR2_PACKAGE_DIVINE
 	bool "divine package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f7ed07a..030477a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,7 +245,6 @@ endif
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/psplash/Config.in"
-	source "package/sawman/Config.in"
 	source "package/sdl/Config.in"
 	source "package/sdl_gfx/Config.in"
 	source "package/sdl_image/Config.in"
diff --git a/package/sawman/0001-link-using-gcc-instead-of-ld.patch b/package/sawman/0001-link-using-gcc-instead-of-ld.patch
deleted file mode 100644
index 02e8029..0000000
--- a/package/sawman/0001-link-using-gcc-instead-of-ld.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-sawman: Link using gcc instead of ld
-
-Using ld may cause a link failure due to using the default emulation
-linker which is configured when building the linker in binutils.  Using
-gcc instead will pass the appropriate -m value because the compiler 
-knows the ABI you are using.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---- SaWMan-1.6.3/rules/libobject.make.orig	2013-12-17 15:54:22.137856874 +0000
-+++ SaWMan-1.6.3/rules/libobject.make	2013-12-17 15:54:44.233201909 +0000
-@@ -3,7 +3,7 @@
- 	if test -d $<.tmp; then rmdir $<.tmp; fi
- 	mkdir $<.tmp
- 	(cd $<.tmp && $(AR) x ../../$<)
--	$(LD) -o $@ -r $<.tmp/*.o
-+	$(CC) -nostdlib -o $@ -r $<.tmp/*.o
- 	rm -f $<.tmp/*.o && rmdir $<.tmp
- 
- .PHONY: $(LTLIBRARIES:%.la=.libs/%.a)
diff --git a/package/sawman/Config.in b/package/sawman/Config.in
deleted file mode 100644
index 2f847db..0000000
--- a/package/sawman/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_SAWMAN
-	bool "SawMan (Window Manager)"
-	depends on BR2_PACKAGE_DIRECTFB
-	help
-	  SaWMan is a new window manager module for use with DirectFB.
-	  Its main difference to the default module is that it allows
-	  one process to be an application and window manager,
-	  implementing all kinds of diversity, while SaWMan is only the
-	  working horse.
-
-	  See http://www.directfb.org/downloads/Extras/README.SaWMan
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
deleted file mode 100644
index 559235f..0000000
--- a/package/sawman/sawman.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# sawman
-#
-################################################################################
-
-SAWMAN_VERSION = 1.6.3
-SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
-SAWMAN_SITE = http://www.directfb.org/downloads/Extras
-SAWMAN_INSTALL_STAGING = YES
-SAWMAN_AUTORECONF = YES
-SAWMAN_DEPENDENCIES = directfb
-SAWMAN_LICENSE = LGPLv2.1+
-SAWMAN_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
