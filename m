From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 07:49:08 +0200
Subject: [Buildroot] [git commit] package/flite: bump to version 2.1
Message-ID: <20200407053609.8528D8A4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=604c858c22b4432f8958876e06b5b966c1471a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest version
- First patch is not needed since
  https://github.com/festvox/flite/commit/e7e4868ad7a65eb6ed2966dd5048c4bfeb14f23f
- Update second patch
- Drop third patch (not needed anymore)
- Update hash of COPYING:
  - BSD-2-Clause for Palm source code removed
  - Add SUN Microsystems license for g72x files
  - Add Apache-2.0 for lang/cmu_grapheme_lex/grapheme_unitran_tables.c
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...lsa-static.patch => 0001-fix-alsa-static.patch} |  4 +--
 .../flite/0001-now-honor-DESTDIR-env.-var.patch    | 30 ----------------------
 package/flite/0003-fix-alsa-version-check.patch    | 26 -------------------
 package/flite/Config.in                            |  2 +-
 package/flite/flite.hash                           |  4 +--
 package/flite/flite.mk                             | 23 +++--------------
 6 files changed, 8 insertions(+), 81 deletions(-)

diff --git a/package/flite/0002-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
similarity index 77%
rename from package/flite/0002-fix-alsa-static.patch
rename to package/flite/0001-fix-alsa-static.patch
index 12adb9e018..7ed4899cc4 100644
--- a/package/flite/0002-fix-alsa-static.patch
+++ b/package/flite/0001-fix-alsa-static.patch
@@ -3,8 +3,8 @@ Use pkg-config to determine alsa link flags. This fixes static linking.
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 
 diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
---- flite-1.4-release.orig/flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
-+++ flite-1.4-release/flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
+--- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
++++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
 @@ -275,7 +275,10 @@
                  #endif],
                [AUDIODRIVER="alsa"
diff --git a/package/flite/0001-now-honor-DESTDIR-env.-var.patch b/package/flite/0001-now-honor-DESTDIR-env.-var.patch
deleted file mode 100644
index 2d5fb68532..0000000000
--- a/package/flite/0001-now-honor-DESTDIR-env.-var.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 658f3243238efe951f6242fa384e990d77078afc Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 27 Dec 2013 17:42:39 +0100
-Subject: [PATCH] now honor DESTDIR env. var.
-
-Flite used a handwritten a Makefile which doesn't honor DESTDIR environment
-variable, though it uses autoconf.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- config/config.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/config/config.in b/config/config.in
-index 914d2bf..43f1a56 100644
---- a/flite-1.4-release/config/config.in
-+++ b/flite-1.4-release/config/config.in
-@@ -49,6 +49,6 @@ include $(TOP)/config/$(langvox).lv
- prefix        = @prefix@
- exec_prefix   = @exec_prefix@
- EXEEXT	      = @EXEEXT@
--INSTALLBINDIR = @bindir@
--INSTALLLIBDIR = @libdir@
--INSTALLINCDIR = @includedir@/flite
-+INSTALLBINDIR = $(DESTDIR)@bindir@
-+INSTALLLIBDIR = $(DESTDIR)@libdir@
-+INSTALLINCDIR = $(DESTDIR)@includedir@/flite
---
-1.8.5.2
-
diff --git a/package/flite/0003-fix-alsa-version-check.patch b/package/flite/0003-fix-alsa-version-check.patch
deleted file mode 100644
index 8832ac371c..0000000000
--- a/package/flite/0003-fix-alsa-version-check.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] fix alsa version check
-
-Check the entire alsa version, and not just the subminor - As this broke
-with the recent alsa 1.0.x -> 1.1.0 release.
-
-It is not clear what major/minor versions the check was supposed to be
-against (0.9 or 1.0).  I went with 1.0.11 to be on the safe side.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- flite-1.4-release/configure.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: flite-1.4/flite-1.4-release/configure.in
-===================================================================
---- flite-1.4.orig/flite-1.4-release/configure.in
-+++ flite-1.4/flite-1.4-release/configure.in
-@@ -270,7 +270,7 @@
- # the one I know -- you can still specific --with-audio=alsa
- AC_TRY_COMPILE([#include <alsa/version.h>],
-                [int j=
--                #if SND_LIB_SUBMINOR >= 11
-+                #if SND_LIB_VERSION >= 0x1000b
-                 3;
-                 #endif],
-               [AUDIODRIVER="alsa"
diff --git a/package/flite/Config.in b/package/flite/Config.in
index 2bbd256f21..0bb15511bc 100644
--- a/package/flite/Config.in
+++ b/package/flite/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FLITE
 	  an alternative synthesis engine to Festival for voices built
 	  using the FestVox suite of voice building tools.
 
-	  http://www.speech.cs.cmu.edu/flite
+	  http://www.festvox.org/flite
 
 comment "flite needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/flite/flite.hash b/package/flite/flite.hash
index 67d6941ea2..f21a21d186 100644
--- a/package/flite/flite.hash
+++ b/package/flite/flite.hash
@@ -1,4 +1,4 @@
 # locally computed hash
-sha256 45c662160aeca6560589f78daf42ab62c6111dd4d244afc28118c4e6f553cd0c flite-1.4-release.tar.bz2
+sha256  c73c3f6a2ea764977d6eaf0a287722d1e2066b4697088c552e342c790f3d2b85  flite-2.1-release.tar.bz2
 # License files, locally calculated
-sha256 4cbeaee8c9a8f23f251f0ce56e9212d244d9ea6b0dbe48601623d920054249a1 flite-1.4-release/COPYING
+sha256  d31bceaf2823d56a8c9400f7bde3b17140e739e991eb4f203bdcf9827754ab59  COPYING
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 72376e56c2..fd5f4ec172 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -4,28 +4,11 @@
 #
 ################################################################################
 
-FLITE_VERSION = 1.4
+FLITE_VERSION = 2.1
 FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
-FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
-# $ tar tf flite-1.4-release.tar.bz2
-# ...
-# flite-1.4-release//install-sh
-# flite-1.4-release//mkinstalldirs
-# flite-1.4-release//Exports.def
-# flite-1.4-release//flite.sln
-# flite-1.4-release//fliteDll.vcproj
-# flite-1.4-release/config/Makefile
-# flite-1.4-release/config/common_make_rules
-# flite-1.4-release/config/project.mak
-# flite-1.4-release/config/config.in
-# flite-1.4-release/config/system.mak.in
-#
-# So, we set FLITE_STRIP_COMPONENTS=0 to avoid writing to "/", and then
-# build in flite-1.4-release/
-FLITE_STRIP_COMPONENTS = 0
-FLITE_SUBDIR = flite-$(FLITE_VERSION)-release
+FLITE_SITE = http://www.festvox.org/flite/packed/flite-$(FLITE_VERSION)
 FLITE_LICENSE = BSD-4-Clause
-FLITE_LICENSE_FILES = $(FLITE_SUBDIR)/COPYING
+FLITE_LICENSE_FILES = COPYING
 
 FLITE_INSTALL_STAGING = YES
 # Patching configure.in
