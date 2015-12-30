From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 12:21:59 +0100
Subject: [Buildroot] [git commit] minidlna,
	libsvg: do not use libjpeg directly, use jpeg
Message-ID: <20151230132307.11FAA8274A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3bc78b13bdb32f28c76d8fb9f9acd5197ed3bb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libjpeg should not be selected directly, as it is one implementation
of the virtual jpeg package. Consequently, this commit moves minidlna
and libsvg to use the jpeg virtual package instead.

The build has been tested with both libjpeg and jpeg-turbo variants.

Fixes:

  http://autobuild.buildroot.org/results/a12/a12760dea9e9d7ca62d14d0821539cc4b0c76835/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvg/Config.in     | 2 +-
 package/libsvg/libsvg.mk     | 2 +-
 package/minidlna/Config.in   | 2 +-
 package/minidlna/minidlna.mk | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsvg/Config.in b/package/libsvg/Config.in
index e3a5e72..741ef10 100644
--- a/package/libsvg/Config.in
+++ b/package/libsvg/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBSVG
 	bool "libsvg"
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBJPEG
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
 	help
 	  Libsvg provides a parser for SVG content in files or buffers.
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
index a876c4e..8b85d5a 100644
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -6,7 +6,7 @@
 
 LIBSVG_VERSION = 0.1.4
 LIBSVG_SITE = http://cairographics.org/snapshots
-LIBSVG_DEPENDENCIES = host-pkgconf libpng libjpeg
+LIBSVG_DEPENDENCIES = host-pkgconf libpng jpeg
 LIBSVG_INSTALL_STAGING = YES
 LIBSVG_LICENSE = LGPLv2+
 LIBSVG_LICENSE_FILES = COPYING
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 0a475f7..6925e01 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBID3TAG # selects zlib
 	select BR2_PACKAGE_LIBEXIF
-	select BR2_PACKAGE_LIBJPEG
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_nios2 # ffmpeg
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 6902aa8..729680c 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -11,7 +11,7 @@ MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext \
-	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
+	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
 	host-xutil_makedepend
 
 ifeq ($(BR2_STATIC_LIBS),y)
