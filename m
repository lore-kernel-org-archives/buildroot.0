From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun,  7 Mar 2021 22:54:03 +0100
Subject: [Buildroot] [PATCH] package/wine: bump to version 6.0
Message-ID: <20210307215403.887067-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash |  4 ++--
 package/wine/wine.mk   | 47 +++++++++++-------------------------------
 2 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 08abccb4a8..083e3dd3eb 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  87f17254c6794ec6eeb7020b164c859983c9df0dacdd66d6449ff000498c842e  wine-5.12.tar.xz
+sha256  b493065f2f83ee429c62e2ec58698a3cf63ef78722e1b20765823152e8582c56  wine-6.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  f3ca909e68d38c972e8ded5248b4745958dbb26f2e581ad73cfbedb6b0408e58  LICENSE
+sha256  111398f1be25b1ae1f124512fe61569e6b4555408e2feb9bc82f9fe57d39b302  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 80c9d20d3d..f1b76736ad 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 5.12
+WINE_VERSION = 6.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/5.x
+WINE_SITE = https://dl.winehq.org/wine/source/6.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -26,6 +26,7 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
+	--without-mingw \
 	--without-opencl \
 	--without-oss \
 	--without-vkd3d \
@@ -118,13 +119,6 @@ else
 WINE_CONF_OPTS += --without-opengl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLU),y)
-WINE_CONF_OPTS += --with-glu
-WINE_DEPENDENCIES += libglu
-else
-WINE_CONF_OPTS += --without-glu
-endif
-
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 WINE_CONF_OPTS += --with-krb5
 WINE_DEPENDENCIES += libkrb5
@@ -183,13 +177,6 @@ else
 WINE_CONF_OPTS += --without-mpg123
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-WINE_CONF_OPTS += --with-curses
-WINE_DEPENDENCIES += ncurses
-else
-WINE_CONF_OPTS += --without-curses
-endif
-
 ifeq ($(BR2_PACKAGE_OPENAL),y)
 WINE_CONF_OPTS += --with-openal
 WINE_DEPENDENCIES += openal
@@ -317,13 +304,6 @@ else
 WINE_CONF_OPTS += --without-xxf86vm
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-WINE_CONF_OPTS += --with-zlib
-WINE_DEPENDENCIES += zlib
-else
-WINE_CONF_OPTS += --without-zlib
-endif
-
 # host-gettext is essential for .po file support in host-wine wrc
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 HOST_WINE_DEPENDENCIES += host-gettext
@@ -340,14 +320,13 @@ endif
 # Wine only needs the host tools to be built, so cut-down the
 # build time by building just what we need.
 define HOST_WINE_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
-	  tools \
-	  tools/sfnt2fon \
-	  tools/widl \
-	  tools/winebuild \
-	  tools/winegcc \
-	  tools/wmc \
-	  tools/wrc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/sfnt2fon
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/widl
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/winebuild
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/winegcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/wmc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/wrc
 endef
 
 # Wine only needs its host variant to be built, not that it is
@@ -368,11 +347,9 @@ HOST_WINE_CONF_OPTS += \
 	--without-coreaudio \
 	--without-faudio \
 	--without-cups \
-	--without-curses \
 	--without-dbus \
 	--without-fontconfig \
 	--without-gphoto \
-	--without-glu \
 	--without-gnutls \
 	--without-gsm \
 	--without-gssapi \
@@ -381,6 +358,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-jpeg \
 	--without-krb5 \
 	--without-ldap \
+	--without-mingw \
 	--without-mpg123 \
 	--without-netapi \
 	--without-openal \
@@ -410,8 +388,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-xshape \
 	--without-xshm \
 	--without-xslt \
-	--without-xxf86vm \
-	--without-zlib
+	--without-xxf86vm
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.1
