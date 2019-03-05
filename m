From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:14 -0000
Subject: [Buildroot] [git commit] package/wine: bump to version 4.0
Message-ID: <20190305095735.54EE38E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9accc7f095901e62c06f2c366592b2dc0c5bac14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.hash |  2 +-
 package/wine/wine.mk   | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index ba007142e8..6993d6ecbc 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d45a88edbe7db363e297cacedc94e66df3464504a01c2eccf04f518066a6fb0c wine-3.0.4.tar.xz
+sha256 6736cdee95b2b8bb021ec0c19497ed8cad5ae2c8bfdb7ab5dc687ff92a480d4d wine-4.0.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 7e44e3c81d..78fa860ecf 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 3.0.4
+WINE_VERSION = 4.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/3.0
+WINE_SITE = https://dl.winehq.org/wine/source/4.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
@@ -25,7 +25,9 @@ WINE_CONF_OPTS = \
 	--without-gsm \
 	--without-hal \
 	--without-opencl \
-	--without-oss
+	--without-oss \
+	--without-vkd3d \
+	--without-vulkan
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
@@ -222,6 +224,13 @@ else
 WINE_CONF_OPTS += --without-sane
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2),y)
+WINE_CONF_OPTS += --with-sdl
+WINE_DEPENDENCIES += sdl2
+else
+WINE_CONF_OPTS += --without-sdl
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 WINE_CONF_OPTS += --with-tiff
 WINE_DEPENDENCIES += tiff
@@ -356,6 +365,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-glu \
 	--without-gnutls \
 	--without-gsm \
+	--without-gssapi \
 	--without-gstreamer \
 	--without-hal \
 	--without-jpeg \
@@ -372,8 +382,11 @@ HOST_WINE_CONF_OPTS += \
 	--without-pulse \
 	--without-png \
 	--without-sane \
+	--without-sdl \
 	--without-tiff \
 	--without-v4l \
+	--without-vkd3d \
+	--without-vulkan \
 	--without-x \
 	--without-xcomposite \
 	--without-xcursor \
