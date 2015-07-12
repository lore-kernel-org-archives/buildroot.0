From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 12 Jul 2015 16:23:14 +0200
Subject: [Buildroot] [PATCH] flite: use FLITE_STRIP_COMPONENTS and
	FLITE_SUBDIR
Message-ID: <1436710994-5056-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, to overcome the buggy way the flite tarball is made, we had to
override the extract commands in a rather ugly way.

The newly introduced <PKG>_STRIP_COMPONENTS, along with <PKG>_SUBDIR and a
little edit to the patches, allow to remove the custom FLITE_EXTRACT_CMDS,
slightly simplifying the flite.mk code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---

I'm not sure this is really an improvement, because the change to the patch
files is not nice.

But I'm not even sure this is a bad patch. After all, it removes more lines
than it adds.

So, here it is... let you voice be heard, whatever you think!
---
 .../flite/0001-now-honor-DESTDIR-env.-var.patch    |  4 +--
 package/flite/0002-fix-alsa-static.patch           |  4 +--
 package/flite/flite.mk                             | 35 ++++++++++------------
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/package/flite/0001-now-honor-DESTDIR-env.-var.patch b/package/flite/0001-now-honor-DESTDIR-env.-var.patch
index 5972f34066a7..2d5fb68532e4 100644
--- a/package/flite/0001-now-honor-DESTDIR-env.-var.patch
+++ b/package/flite/0001-now-honor-DESTDIR-env.-var.patch
@@ -13,8 +13,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 diff --git a/config/config.in b/config/config.in
 index 914d2bf..43f1a56 100644
---- a/config/config.in
-+++ b/config/config.in
+--- a/flite-1.4-release/config/config.in
++++ b/flite-1.4-release/config/config.in
 @@ -49,6 +49,6 @@ include $(TOP)/config/$(langvox).lv
  prefix        = @prefix@
  exec_prefix   = @exec_prefix@
diff --git a/package/flite/0002-fix-alsa-static.patch b/package/flite/0002-fix-alsa-static.patch
index 7ed4899cc4f7..12adb9e01881 100644
--- a/package/flite/0002-fix-alsa-static.patch
+++ b/package/flite/0002-fix-alsa-static.patch
@@ -3,8 +3,8 @@ Use pkg-config to determine alsa link flags. This fixes static linking.
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 
 diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
---- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
-+++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
+--- flite-1.4-release.orig/flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
++++ flite-1.4-release/flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
 @@ -275,7 +275,10 @@
                  #endif],
                [AUDIODRIVER="alsa"
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index ead73fe3dbf8..07ec47377e0f 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -7,18 +7,6 @@
 FLITE_VERSION = 1.4
 FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
 FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
-FLITE_LICENSE = BSD-4c
-FLITE_LICENSE_FILES = COPYING
-
-FLITE_INSTALL_STAGING = YES
-# Patching configure.in
-FLITE_AUTORECONF = YES
-FLITE_DEPENDENCIES = host-pkgconf
-
-# Sadly, Flite does not support parallel build, especially when building its
-# shared libraries.
-FLITE_MAKE = $(MAKE1)
-
 # $ tar tf flite-1.4-release.tar.bz2
 # ...
 # flite-1.4-release//install-sh
@@ -32,14 +20,21 @@ FLITE_MAKE = $(MAKE1)
 # flite-1.4-release/config/config.in
 # flite-1.4-release/config/system.mak.in
 #
-# So, the strip-component trick does not work at all.
-# Let's redefine the extract command.
-define FLITE_EXTRACT_CMDS
-	$(INFLATE$(suffix $(FLITE_SOURCE))) $(DL_DIR)/$(FLITE_SOURCE) | \
-		$(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rsync -ar $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE))/* $(FLITE_DIR)/
-	$(RM) -rf $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE))
-endef
+# So, we set FLITE_STRIP_COMPONENTS=0 to avoid writing to "/", and then
+# build in flite-1.4-release/
+FLITE_STRIP_COMPONENTS = 0
+FLITE_SUBDIR = flite-$(FLITE_VERSION)-release
+FLITE_LICENSE = BSD-4c
+FLITE_LICENSE_FILES = COPYING
+
+FLITE_INSTALL_STAGING = YES
+# Patching configure.in
+FLITE_AUTORECONF = YES
+FLITE_DEPENDENCIES = host-pkgconf
+
+# Sadly, Flite does not support parallel build, especially when building its
+# shared libraries.
+FLITE_MAKE = $(MAKE1)
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 FLITE_DEPENDENCIES += alsa-lib
-- 
1.9.1
