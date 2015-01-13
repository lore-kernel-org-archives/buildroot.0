From: Steve Kenton <skenton@ou.edu>
Date: Mon, 12 Jan 2015 19:55:56 -0600
Subject: [Buildroot] [PATCH V2] dvdauthor : new package
Message-ID: <54B47B2C.1010504@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DVDAuthor is a set of tools to help you author the file and directory
structure of a DVD-Video disc, including programmatic commands for
implementing interactive behaviour. It is driven by command lines and
XML control files, though there are other programs that provide
GUI-based front ends if you prefer
	
Note - Despite lack of a version bump the two line gentoo
patch to src/spuunmux.c against "stock" dvdauthor-0.7.1
    if (setjmp(png_ptr->jmpbuf))
    if (setjmp(png_jmpbuf(png_ptr)))
# to allow use of libpng15/16 is already applied to downloadable
# dvdauthor-0.7.1.tar.gz

http://dvdauthor.sourceforge.net

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
Build tested with both uClibc and glibc against last nights snapshot

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-11 13:44:52.000000000 -0600
+++ buildroot/package/Config.in	2015-01-12 19:36:00.405767956 -0600
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/dvdauthor/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff -pruN buildroot.ori/package/dvdauthor/Config.in buildroot/package/dvdauthor/Config.in
--- buildroot.ori/package/dvdauthor/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdauthor/Config.in	2015-01-12 19:34:42.705766466 -0600
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_DVDAUTHOR
+	bool "dvdauthor"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBDVDREAD
+	depends on BR2_LARGEFILE && !BR2_PREFER_STATIC_LIBS # libdvdread
+	help
+	  DVDAuthor is a set of tools to help you author the file and directory
+	  structure of a DVD-Video disc, including programmatic commands for
+	  implementing interactive behaviour. It is driven by command lines and
+	  XML control files, though there are other programs that provide
+	  GUI-based front ends if you prefer
+	
+	  http://dvdauthor.sourceforge.net
+
+comment "dvdauthor needs a toolchain w/ dynamic library, largefile"
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIBS
+
diff -pruN buildroot.ori/package/dvdauthor/dvdauthor.mk buildroot/package/dvdauthor/dvdauthor.mk
--- buildroot.ori/package/dvdauthor/dvdauthor.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdauthor/dvdauthor.mk	2015-01-12 19:35:08.689766964 -0600
@@ -0,0 +1,16 @@
+###############################################################################
+#
+# dvdauthor
+#
+###############################################################################
+
+DVDAUTHOR_VERSION = 0.7.1
+DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
+DVDAUTHOR_DEPENDENCIES = host-pkgconf libxml2 freetype libpng libdvdread
+DVDAUTHOR_LICENSE = GPLv2
+DVDAUTHOR_LICENSE_FILES = COPYING
+DVDAUTHOR_CONF_ENV = \
+	ac_cv_prog_FREETYPECONFIG=$(STAGING_DIR)/usr/bin/freetype-config \
+	ac_cv_path_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+
+$(eval $(autotools-package))
