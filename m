From: Steve Kenton <skenton@ou.edu>
Date: Sun, 11 Jan 2015 18:39:58 -0600
Subject: [Buildroot] [PATCH] dvdauthor : new package
Message-ID: <54B317DE.9090105@ou.edu>
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
	
http://dvdauthor.sourceforge.net

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
Build tested with both uClibc and glibc.
There may be a missing dependency in libxml2. If I comment out these lines:

#	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE # libxml2 may be missing a dependency
#DVDAUTHOR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) # libxml2 may be missing a dependency

then building with uClibc gets the error below:

/data/bcdist/test/buildroot-2014.11/output/host/usr/include/libxml2/libxml/encoding.h:28:19: fatal error: iconv.h: No such file or directory
 #include <iconv.h>
                   ^
compilation terminated.
make[3]: *** [readxml.o] Error 1


diff -pruN buildroot-2014.11.ori/package/Config.in buildroot-2014.11/package/Config.in
--- buildroot-2014.11.ori/package/Config.in	2014-12-01 03:19:00.000000000 -0600
+++ buildroot-2014.11/package/Config.in	2015-01-11 17:44:27.920155192 -0600
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/dvdauthor/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff -pruN buildroot-2014.11.ori/package/dvdauthor/Config.in buildroot-2014.11/package/dvdauthor/Config.in
--- buildroot-2014.11.ori/package/dvdauthor/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot-2014.11/package/dvdauthor/Config.in	2015-01-11 18:07:40.892181913 -0600
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_DVDAUTHOR
+	bool "dvdauthor"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE # libxml2 may be missing a dependency
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBDVDREAD
+	depends on BR2_LARGEFILE && !BR2_PREFER_STATIC_LIB # libdvdread
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
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+
+# Note - Despite lack of a version bump the two line gentoo
+# patch to src/spuunmux.c against "stock" dvdauthor-0.7.1
+# -    if (setjmp(png_ptr->jmpbuf))
+# +    if (setjmp(png_jmpbuf(png_ptr)))
+# to allow use of libpng15/16 is already applied to downloadable
+# dvdauthor-0.7.1.tar.gz
+
diff -pruN buildroot-2014.11.ori/package/dvdauthor/dvdauthor.mk buildroot-2014.11/package/dvdauthor/dvdauthor.mk
--- buildroot-2014.11.ori/package/dvdauthor/dvdauthor.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot-2014.11/package/dvdauthor/dvdauthor.mk	2015-01-11 18:07:40.892181913 -0600
@@ -0,0 +1,14 @@
+###############################################################################
+#
+# dvdauthor
+#
+###############################################################################
+
+DVDAUTHOR_VERSION = 0.7.1
+DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
+DVDAUTHOR_DEPENDENCIES = host-pkgconf host-libxml2 host-freetype libxml2 freetype libpng libdvdread
+DVDAUTHOR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) # libxml2 may be missing a dependency
+DVDAUTHOR_LICENSE = GPLv2
+DVDAUTHOR_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
