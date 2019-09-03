From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] package/libvips: bump version to 8.8.1
Message-ID: <20190903133619.A18C48A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3bdaf008dddf9a0f5ed2420af6f4b79d63a5019
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch, as gtk-doc disabling now works correctly.
- The XML library in use is now expat, instead of libxml2

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/0001-fix-no-gtk-doc.patch | 35 -------------------------------
 package/libvips/Config.in                 |  2 +-
 package/libvips/libvips.hash              |  2 +-
 package/libvips/libvips.mk                | 11 ++++------
 4 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/package/libvips/0001-fix-no-gtk-doc.patch b/package/libvips/0001-fix-no-gtk-doc.patch
deleted file mode 100644
index bfaf7c345b..0000000000
--- a/package/libvips/0001-fix-no-gtk-doc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a3d47be3b6bed845af5e1aa87ca2da2b1e840cbb Mon Sep 17 00:00:00 2001
-From: Pieter De Gendt <pieter.degendt@basalte.be>
-Date: Thu, 29 Jan 2015 12:25:35 +0100
-Subject: [PATCH] Same patch as for systemd in commit
- http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
-
-Fix deactivation of gtk-doc
-
-The tarball contains the Makefile for building documentation with gtk-doc,
-Unfortunately the AM_CONDITIONAL variable is not the correct one, which
-results in an error when running autoreconf.
-
-This patch fixes this issue.
-
-Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
----
- doc/reference/gtk-doc.make | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/reference/gtk-doc.make b/doc/reference/gtk-doc.make
-index e791656..786803e 100644
---- a/doc/reference/gtk-doc.make
-+++ b/doc/reference/gtk-doc.make
-@@ -267,7 +267,7 @@ uninstall-local:
- #
- # Require gtk-doc when making dist
- #
--if HAVE_GTK_DOC
-+if ENABLE_GTK_DOC
- dist-check-gtkdoc: docs
- else
- dist-check-gtkdoc:
--- 
-2.2.2
-
diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index e16e5277c0..70d01f0e35 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_LIBVIPS
 	# C++ support is required to build libvips
 	# https://github.com/jcupitt/libvips/issues/231
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBXML2
 	help
 	  libvips is a 2D image processing library. Compared to
 	  similar libraries, libvips runs quickly and uses little
diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index 18c1ae80f9..54d838bb9b 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  45961855e21c8d5f0983d05bb79a6f3c2427dc6eed8e3ac68c0f62759b8612c6  vips-7.42.2.tar.gz
+sha256  a0ee255a2a1ebfea5b2dff2a780824d7157a78c010d7ddd531279aacefbf2539  vips-8.8.1.tar.gz
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 72fcf6003e..269b0866c8 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION_MAJOR = 7.42
-LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).2
+LIBVIPS_VERSION = 8.8.1
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
-LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
+LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
 LIBVIPS_LICENSE_FILES = COPYING
-# We're patching gtk-doc.make, so need to autoreconf
-LIBVIPS_AUTORECONF = YES
 
 # Sparc64 compile fails, for all optimization levels except -O0. To
 # fix the problem, use -O0 with no optimization instead. Bug reported
@@ -41,8 +38,8 @@ LIBVIPS_CONF_OPTS = \
 	--without-python
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
-	host-pkgconf libglib2 \
-	libxml2 $(TARGET_NLS_DEPENDENCIES)
+	host-pkgconf expat libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
 
 # --disable-cxx is broken upstream
 # https://github.com/jcupitt/libvips/issues/231
