From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 21:56:29 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/ghostscript: new package
In-Reply-To: <20161218205630.17019-1-bernd.kuhls@t-online.de>
References: <20161218205630.17019-1-bernd.kuhls@t-online.de>
Message-ID: <20161218205630.17019-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Current git HEAD contains patches to simplify cross compiling,
    committed after the release of ghostscript 9.20. Therefore this
    commit now uses current git HEAD and shall be bumped to 9.21 once
    it is released. (Thomas)
    Currently I am unable to register on bugs.ghostscript.com to send
    0002-configaux.patch upstream but I will do so later.

 package/Config.in                             |  1 +
 package/ghostscript/0001-libtiffconfdir.patch | 26 ++++++++++++
 package/ghostscript/0002-configaux.patch      | 36 ++++++++++++++++
 package/ghostscript/Config.in                 | 14 ++++++
 package/ghostscript/ghostscript.mk            | 61 +++++++++++++++++++++++++++
 5 files changed, 138 insertions(+)
 create mode 100644 package/ghostscript/0001-libtiffconfdir.patch
 create mode 100644 package/ghostscript/0002-configaux.patch
 create mode 100644 package/ghostscript/Config.in
 create mode 100644 package/ghostscript/ghostscript.mk

diff --git a/package/Config.in b/package/Config.in
index be0d1506f..df3692c65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -234,6 +234,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
+	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
diff --git a/package/ghostscript/0001-libtiffconfdir.patch b/package/ghostscript/0001-libtiffconfdir.patch
new file mode 100644
index 000000000..19b34e424
--- /dev/null
+++ b/package/ghostscript/0001-libtiffconfdir.patch
@@ -0,0 +1,26 @@
+Fix cross compile bug
+
+Without this patch unsafe paths are used:
+x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/libtiff'
+
+Downloaded from
+http://bugs.ghostscript.com/show_bug.cgi?id=696508#c3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+@@ -, +, @@ 
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+--- a/configure.ac	
++++ a/configure.ac	
+@@ -989,7 +989,7 @@ XPSWRITEDEVICE=''
+ 
+ 
+ LIBTIFFDIR='src'
+-LIBTIFFCONFDIR=''
++LIBTIFFCONFDIR='src'
+ 
+ TIFFDEVS_ALL='tiffs tiff12nc tiff24nc tiff48nc tiff32nc tiff64nc tiffcrle tifflzw tiffpack tiffgray tiffsep tiffsep1 tiffscaled tiffscaled4 tiffscaled8 tiffscaled24 tiffscaled32'
+ FAX_DEVS_ALL='cfax dfaxlow dfaxhigh fax faxg3 faxg32d faxg4 tiffg3 tiffg32d tiffg4 tfax'
+-- 
diff --git a/package/ghostscript/0002-configaux.patch b/package/ghostscript/0002-configaux.patch
new file mode 100644
index 000000000..de1b1503b
--- /dev/null
+++ b/package/ghostscript/0002-configaux.patch
@@ -0,0 +1,36 @@
+Host tool mkromfs_1 needs libz
+
+Fixes build error
+
+/tmp/ccckTW0s.o: In function `process_path':
+mkromfs.c:(.text+0x2390): undefined reference to `compress'
+/tmp/ccckTW0s.o: In function `process_initfile':
+mkromfs.c:(.text+0x3616): undefined reference to `compress'
+collect2: error: ld returned 1 exit status
+base/unix-aux.mak:103: recipe for target 'obj/aux/mkromfs_1' failed
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4.org/base/unix-aux.mak ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4/base/unix-aux.mak
+--- ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4.org/base/unix-aux.mak	2016-12-17 11:33:18.000000000 +0100
++++ ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4/base/unix-aux.mak	2016-12-18 14:44:57.325394211 +0100
+@@ -100,7 +100,7 @@
+  $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
+ 
+ $(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
++	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS) $(AUX_SHARED_ZLIB)
+ 
+ $(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
+ 	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
+diff -uNr ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4.org/Makefile.in ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4/Makefile.in
+--- ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4.org/Makefile.in	2016-12-17 11:33:18.000000000 +0100
++++ ghostscript-2d46dd9e83edc813f2047a89cd260ab4de48fdf4/Makefile.in	2016-12-18 14:42:05.068156557 +0100
+@@ -461,6 +461,7 @@
+ 
+ EXTRALIBS=$(XTRALIBS) @LIBS@ @DYNAMIC_LIBS@ @FONTCONFIG_LIBS@ @FT_LIBS@ @JPX_AUTOCONF_LIBS@ @EXPAT_LIBS@
+ AUXEXTRALIBS=@AUXEXTRALIBS@
++AUX_SHARED_ZLIB=@AUX_SHARED_ZLIB@
+ 
+ # Define the standard libraries to search at the end of linking.
+ # Most platforms require -lpthread for the POSIX threads library;
diff --git a/package/ghostscript/Config.in b/package/ghostscript/Config.in
new file mode 100644
index 000000000..023ef5f2b
--- /dev/null
+++ b/package/ghostscript/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GHOSTSCRIPT
+	bool "ghostscript"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_GHOSTSCRIPT_FONTS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	help
+	  Ghostscript is an interpreter for PostScript and Portable
+	  Document Format (PDF) files.
+
+	  http://ghostscript.com
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
new file mode 100644
index 000000000..167055f3e
--- /dev/null
+++ b/package/ghostscript/ghostscript.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# ghostscript
+#
+################################################################################
+
+GHOSTSCRIPT_VERSION = 2d46dd9e83edc813f2047a89cd260ab4de48fdf4
+GHOSTSCRIPT_SITE = git://git.ghostscript.com/ghostpdl.git
+GHOSTSCRIPT_LICENSE = AGPLv3
+GHOSTSCRIPT_LICENSE_FILES = LICENSE
+# 0001-libtiffconfdir.patch
+GHOSTSCRIPT_AUTORECONF = YES
+GHOSTSCRIPT_DEPENDENCIES = \
+	host-lcms2 \
+	host-libjpeg \
+	host-pkgconf \
+	fontconfig \
+	ghostscript-fonts \
+	jpeg \
+	lcms2 \
+	libpng \
+	tiff
+
+# Ghostscript includes (old) copies of several libraries, delete them.
+# Inspired by linuxfromscratch:
+# http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
+define GHOSTSCRIPT_REMOVE_LIBS
+	rm -rf $(@D)/freetype $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
+endef
+GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
+
+GHOSTSCRIPT_CONF_ENV = \
+	CCAUX=gcc \
+	CFLAGSAUX="-L$(HOST_DIR)/usr/lib -I$(HOST_DIR)/usr/include"
+
+GHOSTSCRIPT_CONF_OPTS = \
+	--disable-compile-inits \
+	--disable-cups \
+	--enable-fontconfig \
+	--with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
+	--enable-freetype \
+	--disable-gtk \
+	--without-jbig2dec \
+	--without-libpaper \
+	--with-system-libtiff
+
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+GHOSTSCRIPT_DEPENDENCIES += libidn
+GHOSTSCRIPT_CONF_OPTS += --with-libidn
+else
+GHOSTSCRIPT_CONF_OPTS += --without-libidn
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
+GHOSTSCRIPT_CONF_OPTS += --with-x
+else
+GHOSTSCRIPT_CONF_OPTS += --without-x
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0
