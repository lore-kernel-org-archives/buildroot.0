From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Sep 2018 19:33:42 +0200
Subject: [Buildroot] [PATCH 1/1] feh: xinemara is optional not mandatory
Message-ID: <20180912173342.14319-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/feh/Config.in | 1 -
 package/feh/feh.mk    | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/feh/Config.in b/package/feh/Config.in
index 277ec891b3..7a348a1507 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_FEH
 	bool "feh"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_PNG
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index a192bfbdb0..6cfa73b242 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -7,7 +7,7 @@
 FEH_VERSION = 2.27.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
-FEH_DEPENDENCIES = imlib2 libpng xlib_libXinerama xlib_libXt
+FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
@@ -18,6 +18,13 @@ else
 FEH_MAKE_OPTS += curl=0
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+FEH_DEPENDENCIES += xlib_libXinemara
+FEH_MAKE_OPTS += xinerama=1
+else
+FEH_MAKE_OPTS += xinerama=0
+endif
+
 define FEH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
 		$(MAKE) $(FEH_MAKE_OPTS) -C $(@D) all
-- 
2.17.1
