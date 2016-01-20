From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 13:53:40 -0300
Subject: [Buildroot] [PATCH 2/2] libungif: remove deprecated
In-Reply-To: <1453308820-16940-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453308820-16940-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1453308820-16940-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated for a year now, so remove it.
While at it also remove the BR2_DEPRECATED_SINCE_2015_02 since it's now
unused.
And change the efl gif text to refer to giflib rather than libungif
which is what's used since it was deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in                      |  4 ----
 package/Config.in              |  1 -
 package/efl/Config.in          |  2 +-
 package/libungif/Config.in     |  8 --------
 package/libungif/libungif.hash |  2 --
 package/libungif/libungif.mk   | 28 ----------------------------
 6 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 package/libungif/Config.in
 delete mode 100644 package/libungif/libungif.hash
 delete mode 100644 package/libungif/libungif.mk

diff --git a/Config.in b/Config.in
index 63feef8..30e88e3 100644
--- a/Config.in
+++ b/Config.in
@@ -349,10 +349,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2015_02
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2015_05
 	bool
 	default y
diff --git a/package/Config.in b/package/Config.in
index ae80e59..956be56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -891,7 +891,6 @@ menu "Graphics"
 	source "package/libsvg/Config.in"
 	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
-	source "package/libungif/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvips/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index fd3498e..85e46b1 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -164,7 +164,7 @@ config BR2_PACKAGE_EFL_GIF
 	select BR2_PACKAGE_GIFLIB
 	help
 	  This enables the loader code that loads gif files using
-	  libungif.
+	  giflib.
 
 config BR2_PACKAGE_EFL_TIFF
 	bool "libevas tiff loader"
diff --git a/package/libungif/Config.in b/package/libungif/Config.in
deleted file mode 100644
index 012ef76..0000000
--- a/package/libungif/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LIBUNGIF
-	bool "libungif"
-	depends on !BR2_PACKAGE_GIFLIB
-	depends on BR2_DEPRECATED_SINCE_2015_02 # giflib
-	help
-	  libungif is a library for handling the uncompressed GIF image format.
-
-	  http://sourceforge.net/projects/libungif
diff --git a/package/libungif/libungif.hash b/package/libungif/libungif.hash
deleted file mode 100644
index 979b045..0000000
--- a/package/libungif/libungif.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d6ecfca5a6bd4d332  libungif-4.1.4.tar.bz2
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
deleted file mode 100644
index be9f646..0000000
--- a/package/libungif/libungif.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# libungif
-#
-################################################################################
-
-LIBUNGIF_VERSION = 4.1.4
-LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
-LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
-LIBUNGIF_INSTALL_STAGING = YES
-LIBUNGIF_CONF_OPTS = --without-x
-LIBUNGIF_LICENSE = MIT
-LIBUNGIF_LICENSE_FILES = COPYING
-
-LIBUNGIF_BINS = \
-	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
-	gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
-	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
-	gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
-	text2gif
-
-define LIBUNGIF_BINS_CLEANUP
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBUNGIF_BINS))
-endef
-
-LIBUNGIF_POST_INSTALL_TARGET_HOOKS += LIBUNGIF_BINS_CLEANUP
-
-$(eval $(autotools-package))
-- 
2.4.10
