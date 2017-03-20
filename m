From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:54:43 +0100
Subject: [Buildroot] [git commit] package/ghostscript: new package
Message-ID: <20170320225510.1BEA3821F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a83dda003cc25999589ec392c0b6c81afe7528d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - switch to version 9.21 now that it has been released
 - add a hash file
 - switch to Git formatted patches
 - use $(HOSTCC) instead of hardcoding "gcc", and use $(HOST_CFLAGS) and
   $(HOST_LDFLAGS) instead of hardcoding -L$(HOST_DIR)/usr/lib
   -I$(HOST_DIR)/usr/include
 - add entry to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-cross-compilation-issue.patch         | 32 +++++++++++
 .../0002-Host-tool-mkromfs_1-needs-libz.patch      | 48 +++++++++++++++++
 package/ghostscript/Config.in                      | 14 +++++
 package/ghostscript/ghostscript.hash               |  4 ++
 package/ghostscript/ghostscript.mk                 | 62 ++++++++++++++++++++++
 7 files changed, 162 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ddd9b6a..e77bbd6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -162,6 +162,7 @@ F:	package/exim/
 F:	package/fetchmail/
 F:	package/freeswitch/
 F:	package/ffmpeg/
+F:	package/ghostscript/
 F:	package/giflib/
 F:	package/glmark2/
 F:	package/jsoncpp/
diff --git a/package/Config.in b/package/Config.in
index cd9d06d..5ec3e8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -237,6 +237,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
+	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
diff --git a/package/ghostscript/0001-Fix-cross-compilation-issue.patch b/package/ghostscript/0001-Fix-cross-compilation-issue.patch
new file mode 100644
index 0000000..57e1be6
--- /dev/null
+++ b/package/ghostscript/0001-Fix-cross-compilation-issue.patch
@@ -0,0 +1,32 @@
+From 5fed765abb8ff07c381cc3ebb9367e9560f7a658 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 20 Mar 2017 23:43:03 +0100
+Subject: [PATCH] Fix cross compilation issue
+
+Without this patch unsafe paths are used:
+x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/libtiff'
+
+Downloaded from
+http://bugs.ghostscript.com/show_bug.cgi?id=696508#c3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d0f62d7..0d49344 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1173,7 +1173,7 @@ XPSWRITEDEVICE=''
+ 
+ 
+ LIBTIFFDIR='src'
+-LIBTIFFCONFDIR=''
++LIBTIFFCONFDIR='src'
+ 
+ TIFFDEVS_ALL='tiffs tiff12nc tiff24nc tiff48nc tiff32nc tiff64nc tiffcrle tifflzw tiffpack tiffgray tiffsep tiffsep1 tiffscaled tiffscaled4 tiffscaled8 tiffscaled24 tiffscaled32'
+ FAX_DEVS_ALL='cfax dfaxlow dfaxhigh fax faxg3 faxg32d faxg4 tiffg3 tiffg32d tiffg4 tfax'
+-- 
+2.7.4
+
diff --git a/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch b/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch
new file mode 100644
index 0000000..341a836
--- /dev/null
+++ b/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch
@@ -0,0 +1,48 @@
+From c9e370d7cdf1bb5fbbd5c1e7e9c5431f6112b074 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 20 Mar 2017 23:43:29 +0100
+Subject: [PATCH] Host tool mkromfs_1 needs libz
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
+---
+ Makefile.in       | 1 +
+ base/unix-aux.mak | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3a3cae5..600ce3e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -461,6 +461,7 @@ XPS_LDFLAGS_SO=@XPS_DYNAMIC_LDFLAGS@
+ 
+ EXTRALIBS=$(XTRALIBS) @LIBS@ @DYNAMIC_LIBS@ @FONTCONFIG_LIBS@ @FT_LIBS@ @JPX_AUTOCONF_LIBS@ @EXPAT_LIBS@
+ AUXEXTRALIBS=@AUXEXTRALIBS@
++AUX_SHARED_ZLIB=@AUX_SHARED_ZLIB@
+ 
+ # Define the standard libraries to search at the end of linking.
+ # Most platforms require -lpthread for the POSIX threads library;
+diff --git a/base/unix-aux.mak b/base/unix-aux.mak
+index c5fa2a4..4ed8369 100644
+--- a/base/unix-aux.mak
++++ b/base/unix-aux.mak
+@@ -100,7 +100,7 @@ MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
+  $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
+ 
+ $(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
+-	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
++	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS) $(AUX_SHARED_ZLIB)
+ 
+ $(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
+ 	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
+-- 
+2.7.4
+
diff --git a/package/ghostscript/Config.in b/package/ghostscript/Config.in
new file mode 100644
index 0000000..023ef5f
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
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
new file mode 100644
index 0000000..ade17f9
--- /dev/null
+++ b/package/ghostscript/ghostscript.hash
@@ -0,0 +1,4 @@
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/MD5SUMS
+md5 631beea7aa1f70f2cdca14e0308b8801  ghostscript-9.21.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/SHA1SUMS
+sha1 a93b456a0e18d5c925d26b0b13e961c8e8140f62  ghostscript-9.21.tar.xz
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
new file mode 100644
index 0000000..d563e77
--- /dev/null
+++ b/package/ghostscript/ghostscript.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# ghostscript
+#
+################################################################################
+
+GHOSTSCRIPT_VERSION = 9.21
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921
+GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
+GHOSTSCRIPT_LICENSE = AGPLv3
+GHOSTSCRIPT_LICENSE_FILES = LICENSE
+# 0001-Fix-cross-compilation-issue.patch
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
+	CCAUX=$(HOSTCC) \
+	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
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
