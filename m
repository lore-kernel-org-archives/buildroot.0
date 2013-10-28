From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 17:02:49 +0100
Subject: [Buildroot] [git commit] fltk: bump to version 1.3.2
Message-ID: <20131028162845.7DD6D82DBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56497f708ebb60abbd5b4d641fe1edf0d4f97701
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/519/5195f7a8a38a5ba3ce5a0bf2a7649d390e461ee9/

The failure is related to bundled libpng conflicting with system libpng.
Which was a problem even before the libpng bump because the bundled
version for the previous fltk version has several security
vulnerabilities.
So disable bundled libraries and use global ones.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fltk/Config.in                          |    3 +
 package/fltk/fltk-01-disable-tests.patch        |   16 +++
 package/fltk/fltk-1.1.7-bail-out-on-error.patch |   54 ---------
 package/fltk/fltk-1.1.7-disable-test.patch      |   17 ---
 package/fltk/fltk-1.1.7-makefiles.patch         |  132 -----------------------
 package/fltk/fltk-1.1.7-scandir-fix.patch       |   20 ----
 package/fltk/fltk.mk                            |   31 +++++-
 7 files changed, 45 insertions(+), 228 deletions(-)

diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index 1c440f2..587fcc1 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_FLTK
 	bool "fltk"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
diff --git a/package/fltk/fltk-01-disable-tests.patch b/package/fltk/fltk-01-disable-tests.patch
new file mode 100644
index 0000000..9571453
--- /dev/null
+++ b/package/fltk/fltk-01-disable-tests.patch
@@ -0,0 +1,16 @@
+Disable tests, slower to build and would need host-fltk.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura fltk-1.3.2.orig/Makefile fltk-1.3.2/Makefile
+--- fltk-1.3.2.orig/Makefile	2013-10-27 18:19:39.693208127 -0300
++++ fltk-1.3.2/Makefile	2013-10-27 18:20:08.032136885 -0300
+@@ -18,7 +18,7 @@
+ 
+ include makeinclude
+ 
+-DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid test documentation
++DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid documentation
+ 
+ all: makeinclude fltk-config
+ 	for dir in $(DIRS); do\
diff --git a/package/fltk/fltk-1.1.7-bail-out-on-error.patch b/package/fltk/fltk-1.1.7-bail-out-on-error.patch
deleted file mode 100644
index 644a056..0000000
--- a/package/fltk/fltk-1.1.7-bail-out-on-error.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-When a submake fails, the build of FLTK was stopping, but the main
-make was returning 0. Therefore, Buildroot was going on with the build
-of the other components, even though the build of FLTK failed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: fltk-1.1.7/Makefile
-===================================================================
---- fltk-1.1.7.orig/Makefile	2010-05-21 15:52:20.000000000 +0200
-+++ fltk-1.1.7/Makefile	2010-05-21 15:52:43.000000000 +0200
-@@ -32,7 +32,7 @@
- all: makeinclude
- 	for dir in $(DIRS); do\
- 		echo "=== making $$dir ===";\
--		(cd $$dir; $(MAKE) $(MFLAGS)) || break;\
-+		(cd $$dir; $(MAKE) $(MFLAGS)) || exit 1;\
- 	done
- 
- install: makeinclude
-@@ -42,7 +42,7 @@
- 	-chmod 755 $(DESTDIR)$(bindir)/fltk-config
- 	for dir in FL $(DIRS); do\
- 		echo "=== installing $$dir ===";\
--		(cd $$dir; $(MAKE) $(MFLAGS) install) || break;\
-+		(cd $$dir; $(MAKE) $(MFLAGS) install) || exit 1;\
- 	done
- 
- install-desktop: makeinclude
-@@ -54,7 +54,7 @@
- 	$(RM) $(DESTDIR)$(bindir)/fltk-config
- 	for dir in FL $(DIRS); do\
- 		echo "=== uninstalling $$dir ===";\
--		(cd $$dir; $(MAKE) $(MFLAGS) uninstall) || break;\
-+		(cd $$dir; $(MAKE) $(MFLAGS) uninstall) || exit 1;\
- 	done
- 
- uninstall-desktop: makeinclude
-@@ -65,14 +65,14 @@
- depend: makeinclude
- 	for dir in $(DIRS); do\
- 		echo "=== making dependencies in $$dir ===";\
--		(cd $$dir; $(MAKE) $(MFLAGS) depend) || break;\
-+		(cd $$dir; $(MAKE) $(MFLAGS) depend) || exit 1;\
- 	done
- 
- clean:
- 	-$(RM) core *.o
- 	for dir in $(DIRS); do\
- 		echo "=== cleaning $$dir ===";\
--		(cd $$dir; $(MAKE) $(MFLAGS) clean) || break;\
-+		(cd $$dir; $(MAKE) $(MFLAGS) clean) || exit 1;\
- 	done
- 
- distclean: clean
diff --git a/package/fltk/fltk-1.1.7-disable-test.patch b/package/fltk/fltk-1.1.7-disable-test.patch
deleted file mode 100644
index c83e1da..0000000
--- a/package/fltk/fltk-1.1.7-disable-test.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable tests in FLTK because they use the fluid tool on the host.
-
-Patch borrowed from OpenEmbedded.
-
-Index: fltk-1.1.9/Makefile
-===================================================================
---- fltk-1.1.9.orig/Makefile	2008-06-06 16:14:11.936736201 +0200
-+++ fltk-1.1.9/Makefile	2008-06-06 16:14:22.526357637 +0200
-@@ -27,7 +27,7 @@
- 
- include makeinclude
- 
--DIRS	=	$(IMAGEDIRS) src fluid test documentation
-+DIRS	=	$(IMAGEDIRS) src fluid documentation
- 
- all: makeinclude fltk-config
- 	for dir in $(DIRS); do\
diff --git a/package/fltk/fltk-1.1.7-makefiles.patch b/package/fltk/fltk-1.1.7-makefiles.patch
deleted file mode 100644
index 0a6a8d4..0000000
--- a/package/fltk/fltk-1.1.7-makefiles.patch
+++ /dev/null
@@ -1,132 +0,0 @@
---- a/jpeg/Makefile	2005-02-27 19:11:07.000000000 -0500
-+++ b/jpeg/Makefile	2008-03-19 13:17:46.000000000 -0400
-@@ -65,14 +65,14 @@ clean:
- #
- 
- install:
--	echo "Installing libfltk_jpeg$(LIBEXT) in $(libdir)..."
--	-$(MKDIR) $(libdir)
--	$(RM) $(libdir)/libfltk_jpeg$(LIBEXT)
--	$(CP) $(LIBJPEG) $(libdir)
--	$(RANLIB) $(libdir)/libfltk_jpeg$(LIBEXT)
--	echo "Installing jpeg headers in $(includedir)/FL/images..."
--	-$(MKDIR) $(includedir)/FL/images
--	$(CP) jconfig.h jerror.h jmorecfg.h jpeglib.h $(includedir)/FL/images
-+	echo "Installing libfltk_jpeg$(LIBEXT) in $(DESTDIR)$(libdir)..."
-+	-$(MKDIR) $(DESTDIR)$(libdir)
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
-+	$(CP) $(LIBJPEG) $(DESTDIR)$(libdir)
-+	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
-+	echo "Installing jpeg headers in $(DESTDIR)$(includedir)/FL/images..."
-+	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
-+	$(CP) jconfig.h jerror.h jmorecfg.h jpeglib.h $(DESTDIR)$(includedir)/FL/images
- 
- 
- #
-@@ -81,12 +81,12 @@ install:
- 
- uninstall:
- 	echo "Uninstalling libfltk_jpeg$(LIBEXT) in $(libdir)..."
--	$(RM) $(libdir)/libfltk_jpeg$(LIBEXT)
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_jpeg$(LIBEXT)
- 	echo "Uninstalling jpeg headers in $(includedir)/FL/images..."
--	$(RM) $(includedir)/FL/images/jconfig.h
--	$(RM) $(includedir)/FL/images/jerror.h
--	$(RM) $(includedir)/FL/images/jmorecfg.h
--	$(RM) $(includedir)/FL/images/jpeglib.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/jconfig.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/jerror.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/jmorecfg.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/jpeglib.h
- 
- 
- #
-
---- a/png/Makefile	2005-02-24 16:55:12.000000000 -0500
-+++ b/png/Makefile	2008-03-19 13:18:38.000000000 -0400
-@@ -57,14 +57,14 @@ clean:
- #
- 
- install: $(LIBPNG)
--	echo "Installing libfltk_png$(LIBEXT) in $(libdir)..."
--	-$(MKDIR) $(libdir)
--	$(RM) $(libdir)/libfltk_png$(LIBEXT)
--	$(CP) $(LIBPNG) $(libdir)
--	$(RANLIB) $(libdir)/libfltk_png$(LIBEXT)
--	echo "Installing png headers in $(includedir)/FL/images..."
--	-$(MKDIR) $(includedir)/FL/images
--	$(CP) png.h pngconf.h $(includedir)/FL/images
-+	echo "Installing libfltk_png$(LIBEXT) in $(DESTDIR)$(libdir)..."
-+	-$(MKDIR) $(DESTDIR)$(libdir)
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
-+	$(CP) $(LIBPNG) $(DESTDIR)$(libdir)
-+	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
-+	echo "Installing png headers in $(DESTDIR)$(includedir)/FL/images..."
-+	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
-+	$(CP) png.h pngconf.h $(DESTDIR)$(includedir)/FL/images
- 
- 
- #
-@@ -72,11 +72,11 @@ install: $(LIBPNG)
- #
- 
- uninstall:
--	echo "Uninstalling libfltk_png$(LIBEXT) in $(libdir)..."
--	$(RM) $(libdir)/libfltk_png$(LIBEXT)
--	echo "Uninstalling png headers in $(includedir)/FL/images..."
--	$(RM) $(includedir)/FL/images/png.h
--	$(RM) $(includedir)/FL/images/pngconf.h
-+	echo "Uninstalling libfltk_png$(LIBEXT) in $(DESTDIR)$(libdir)..."
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_png$(LIBEXT)
-+	echo "Uninstalling png headers in $(DESTDIR)$(includedir)/FL/images..."
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/png.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/pngconf.h
- 
- 
- #
-
---- a/zlib/Makefile	2005-02-24 16:55:12.000000000 -0500
-+++ b/zlib/Makefile	2008-03-19 13:20:34.000000000 -0400
-@@ -57,14 +57,14 @@ clean:
- #
- 
- install: $(LIBZ)
--	echo "Installing libfltk_z$(LIBEXT) in $(libdir)..."
--	-$(MKDIR) $(libdir)
--	$(RM) $(libdir)/libfltk_z$(LIBEXT)
--	$(CP) $(LIBZ) $(libdir)
--	$(RANLIB) $(libdir)/libfltk_z$(LIBEXT)
--	echo "Installing zlib headers in $(includedir)/FL/images..."
--	-$(MKDIR) $(includedir)/FL/images
--	$(CP) zconf.h zlib.h zutil.h $(includedir)/FL/images
-+	echo "Installing libfltk_z$(LIBEXT) in $(DESTDIR)$(libdir)..."
-+	-$(MKDIR) $(DESTDIR)$(libdir)
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
-+	$(CP) $(LIBZ) $(DESTDIR)$(libdir)
-+	$(RANLIB) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
-+	echo "Installing zlib headers in $(DESTDIR)$(includedir)/FL/images..."
-+	-$(MKDIR) $(DESTDIR)$(includedir)/FL/images
-+	$(CP) zconf.h zlib.h zutil.h $(DESTDIR)$(includedir)/FL/images
- 
- 
- #
-@@ -72,12 +72,12 @@ install: $(LIBZ)
- #
- 
- uninstall:
--	echo "Uninstalling libfltk_z$(LIBEXT) in $(libdir)..."
--	$(RM) $(libdir)/libfltk_z$(LIBEXT)
--	echo "Uninstalling zlib headers in $(includedir)/FL/images..."
--	$(RM) $(includedir)/FL/images/zconf.h
--	$(RM) $(includedir)/FL/images/zlib.h
--	$(RM) $(includedir)/FL/images/zutil.h
-+	echo "Uninstalling libfltk_z$(LIBEXT) in $(DESTDIR)$(libdir)..."
-+	$(RM) $(DESTDIR)$(libdir)/libfltk_z$(LIBEXT)
-+	echo "Uninstalling zlib headers in $(DESTDIR)$(includedir)/FL/images..."
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/zconf.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/zlib.h
-+	$(RM) $(DESTDIR)$(includedir)/FL/images/zutil.h
- 
- 
- #
-
diff --git a/package/fltk/fltk-1.1.7-scandir-fix.patch b/package/fltk/fltk-1.1.7-scandir-fix.patch
deleted file mode 100644
index ba2b560..0000000
--- a/package/fltk/fltk-1.1.7-scandir-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use the correct scandir() call.
-
-See http://www.fltk.org/str.php?L2205. This patch is a simplified
-version of http://www.fltk.org/strfiles/2205/scandir_posix.patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: fltk-1.1.7/src/filename_list.cxx
-===================================================================
---- fltk-1.1.7.orig/src/filename_list.cxx	2010-05-21 15:58:09.000000000 +0200
-+++ fltk-1.1.7/src/filename_list.cxx	2010-05-21 16:00:21.000000000 +0200
-@@ -54,7 +54,7 @@
-                      Fl_File_Sort_F *sort) {
- #ifndef HAVE_SCANDIR
-   int n = scandir(d, list, 0, sort);
--#elif defined(__hpux) || defined(__CYGWIN__)
-+#elif defined(__hpux) || defined(__CYGWIN__) || defined(__USE_POSIX)
-   // HP-UX, Cygwin define the comparison function like this:
-   int n = scandir(d, list, 0, (int(*)(const dirent **, const dirent **))sort);
- #elif defined(__osf__)
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 08781fb..cbcec7b 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,14 +4,35 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.1.7
-FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
-FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7/
+FLTK_VERSION = 1.3.2
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
+FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
-FLTK_CONF_OPT = --enable-threads --with-x
-FLTK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt
+FLTK_CONF_OPT = --enable-threads --with-x --disable-gl \
+	--disable-localjpeg --disable-localpng --disable-localzlib
+FLTK_DEPENDENCIES = jpeg libpng xlib_libX11 xlib_libXext xlib_libXt
 FLTK_CONFIG_SCRIPTS = fltk-config
+FLTK_LICENSE = LGPLv2 with exceptions
+FLTK_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+FLTK_CONF_OPT += --enable-cairo
+FLTK_DEPENDENCIES += cairo
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+FLTK_CONF_ENV += ac_cv_path_FTCONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+FLTK_DEPENDENCIES += xlib_libXft
+else
+FLTK_CONF_OPT += --disable-xft
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+FLTK_DEPENDENCIES += xlib_libXinerama
+else
+FLTK_CONF_OPT += --disable-xinerama
+endif
 
 $(eval $(autotools-package))
