From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 23 Jun 2009 13:47:14 +0200
Subject: [Buildroot] [git commit] directfb: bump version
Message-ID: <20090623115600.6459E7756E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b26520ba9055f7101e01206f114c387d0ab157e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #379

update DirectFB to version 1.4.0

A new stable version of DirectFB has been released upstream,
http://directfb.org/index.php?path=Main%2FNews&entry=2009-06-04-1.niels

Attached patch updates the DirectFB package and introduces a BR2
configuration option for the RGB16 dithering feature that is new in
DirectFB 1.4.0.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |   20 ++++++++++++++------
 package/directfb/directfb.mk |   15 ++++++++++-----
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 5a5db46..f24b7a1 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -66,12 +66,6 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
 
-config BR2_PACKAGE_DIRECTFB_PNG
-	bool "enable PNG support"
-	default y
-	depends on BR2_PACKAGE_DIRECTFB
-	select BR2_PACKAGE_LIBPNG
-
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	default y
@@ -89,3 +83,17 @@ config BR2_PACKAGE_DIRECTFB_JPEG
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_DIRECTFB_PNG
+	bool "enable PNG support"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_DIRECTB_DITHER_RGB16
+	bool "enable advanced dithering of RGB16 surfaces"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
+	help
+	  Enable dithering when loading images to RGB16 surfaces.
+	  This increases the data section by 64 KBytes.
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a85564b..2826615 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -3,11 +3,9 @@
 # directfb
 #
 #############################################################
-DIRECTFB_VERSION_MAJOR:=1.2
-DIRECTFB_VERSION:=1.2.8
-#DIRECTFB_VERSION:=1.3.0	is a development version
-#DIRECTFB_VERSION_MAJOR:=1.3
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
+DIRECTFB_VERSION_MAJOR:=1.4
+DIRECTFB_VERSION:=1.4.0
+DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
 DIRECTFB_LIBTOOL_PATCH = NO
@@ -99,6 +97,12 @@ else
 DIRECTFB_JPEG:=--disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTB_DITHER_RGB16),y)
+DIRECTFB_DITHER_RGB16:=--with-dither-rgb16=advanced
+else
+DIRECTFB_DITHER_RGB16:=--with-dither-rgb16=none
+endif
+
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--with-gfxdrivers=$(DIRECTFB_GFX) \
@@ -112,6 +116,7 @@ DIRECTFB_CONF_OPT = \
 	$(DIRECTFB_PNG) \
 	$(DIRECTFB_GIF) \
 	$(DIRECTFB_UNIQUE) \
+	$(DIRECTFB_DITHER_RGB16) \
 	--enable-linux-input \
 	--enable-zlib \
 	--enable-freetype \
-- 
1.6.0.6
