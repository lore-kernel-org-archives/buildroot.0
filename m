From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:37 +0200
Subject: [Buildroot] [PATCH v12 29/31] package/flite: bump version to 2.0.0
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-30-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Freeswitch contains mod_flite which needs flite >= 2.0.0 detected by
pkgconf, its support was added by the freeswitch project so we switch
to the freeswitch support deps repo:
https://freeswitch.org/stash/projects/SD

Removed 0001-now-honor-DESTDIR-env.-var.patch, not needed anymore.
Rebased and renumbered the remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...lsa-static.patch => 0001-fix-alsa-static.patch} |  4 +--
 .../flite/0001-now-honor-DESTDIR-env.-var.patch    | 30 ----------------------
 ...eck.patch => 0002-fix-alsa-version-check.patch} |  4 +--
 package/flite/flite.hash                           |  2 --
 package/flite/flite.mk                             | 24 +++--------------
 5 files changed, 8 insertions(+), 56 deletions(-)
 rename package/flite/{0002-fix-alsa-static.patch => 0001-fix-alsa-static.patch} (77%)
 delete mode 100644 package/flite/0001-now-honor-DESTDIR-env.-var.patch
 rename package/flite/{0003-fix-alsa-version-check.patch => 0002-fix-alsa-version-check.patch} (90%)
 delete mode 100644 package/flite/flite.hash

diff --git a/package/flite/0002-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
similarity index 77%
rename from package/flite/0002-fix-alsa-static.patch
rename to package/flite/0001-fix-alsa-static.patch
index 12adb9e..de088ad 100644
--- a/package/flite/0002-fix-alsa-static.patch
+++ b/package/flite/0001-fix-alsa-static.patch
@@ -3,8 +3,8 @@ Use pkg-config to determine alsa link flags. This fixes static linking.
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 
 diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
---- flite-1.4-release.orig/flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
-+++ flite-1.4-release/flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
+--- flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
++++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
 @@ -275,7 +275,10 @@
                  #endif],
                [AUDIODRIVER="alsa"
diff --git a/package/flite/0001-now-honor-DESTDIR-env.-var.patch b/package/flite/0001-now-honor-DESTDIR-env.-var.patch
deleted file mode 100644
index 2d5fb68..0000000
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
diff --git a/package/flite/0003-fix-alsa-version-check.patch b/package/flite/0002-fix-alsa-version-check.patch
similarity index 90%
rename from package/flite/0003-fix-alsa-version-check.patch
rename to package/flite/0002-fix-alsa-version-check.patch
index 8832ac3..6a38cc3 100644
--- a/package/flite/0003-fix-alsa-version-check.patch
+++ b/package/flite/0002-fix-alsa-version-check.patch
@@ -13,8 +13,8 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 
 Index: flite-1.4/flite-1.4-release/configure.in
 ===================================================================
---- flite-1.4.orig/flite-1.4-release/configure.in
-+++ flite-1.4/flite-1.4-release/configure.in
+--- flite-1.4-release/configure.in
++++ flite-1.4-release/configure.in
 @@ -270,7 +270,7 @@
  # the one I know -- you can still specific --with-audio=alsa
  AC_TRY_COMPILE([#include <alsa/version.h>],
diff --git a/package/flite/flite.hash b/package/flite/flite.hash
deleted file mode 100644
index e4dd0c6..0000000
--- a/package/flite/flite.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed hash
-sha256 45c662160aeca6560589f78daf42ab62c6111dd4d244afc28118c4e6f553cd0c flite-1.4-release.tar.bz2
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 611e334..557927d 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -4,26 +4,10 @@
 #
 ################################################################################
 
-FLITE_VERSION = 1.4
-FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
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
+FLITE_VERSION = 6260e4ca258715a35859397cdcf075bb4e7f386f
+# we use the FreeSwitch fork because it contains pkgconf support
+FLITE_SITE = https://freeswitch.org/stash/scm/sd/libflite.git
+FLITE_SITE_METHOD = git
 FLITE_LICENSE = BSD-4c
 FLITE_LICENSE_FILES = $(FLITE_SUBDIR)/COPYING
 
-- 
2.8.0.rc3
