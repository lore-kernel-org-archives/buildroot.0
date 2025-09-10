Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76367CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C5F614C9;
	Wed, 10 Sep 2025 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNPtThAwy0GH; Wed, 10 Sep 2025 21:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BF8614E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8BF8614E4;
	Wed, 10 Sep 2025 21:34:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA8262BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0CB0843B9
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0TkiEQn3oYj for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50475843B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50475843B4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50475843B4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 856201A0D9B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5DD24606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA030102F28D9; 
 Wed, 10 Sep 2025 23:33:56 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:31 +0200
Message-ID: <20250910213241.1529448-24-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540037; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=adqN2NgzbmHW6bxJZdB3EwRux5AZkAWW0BW22t1sYUU=;
 b=WJ+rQOx3SxY4JeB3kzmI8+yYPMKsGAtzmQEMOUf0bCjGwNJebkg3U87aZnftOOLTjW7rLo
 o0UGoC53Ia+nHiB0A6eBOlaZ4jaG9M3fCH6eLmwj1PjkDyxKVMVqm7XaGUTOl24MrM3xCy
 i8Oc6Q32suwNVx/0JcjcjZsbDlbwruMk9y3Zs9c50zMrW8LJYPSL0zK/1j2vik9a2dGWXd
 8PaQtxEepuYKUUKhKIhPyG2QC36k29x2il/qnGTjb92aadoszkhWzfEeRfM46/W1+jkhNj
 IB9bJ2Wr5BmlrbxClnTbJRor2vY9IEPzC1XIPzRfTeI1bvVrsVoeS3pSlngEJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WJ+rQOx3
Subject: [Buildroot] [PATCH 23/23] package/libgtk2: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The final upstream release of libgtk2 was published in December
2020. libgtk2 no longer builds with GCC 14.x, even less so with GCC
15.x. While Debian has some fixes to make it build with GCC 14.x,
those are not sufficient to allow building libgtk2 with GCC 15.x.

libgtk2 is anyway very old, largely superseded by libgtk3 and then
libgtk4. It is therefore time to remove it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   1 -
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 .../libgtk2/0001-reduce-dependencies.patch    | 117 ---------------
 package/libgtk2/Config.in                     |  42 ------
 package/libgtk2/libgtk2.hash                  |   5 -
 package/libgtk2/libgtk2.mk                    | 139 ------------------
 7 files changed, 306 deletions(-)
 delete mode 100644 package/libgtk2/0001-reduce-dependencies.patch
 delete mode 100644 package/libgtk2/Config.in
 delete mode 100644 package/libgtk2/libgtk2.hash
 delete mode 100644 package/libgtk2/libgtk2.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 10c3810c41..edab4aab9e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -591,7 +591,6 @@ package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-g
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
-package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
 package/libiio/S99iiod Shellcheck lib_sysv.Variables
diff --git a/DEVELOPERS b/DEVELOPERS
index 3c038f9ce9..7b50bb927e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1047,7 +1047,6 @@ F:	package/libcue/
 F:	package/libebml/
 F:	package/libgee/
 F:	package/libglib2/
-F:	package/libgtk2/
 F:	package/libgtk3/
 F:	package/libhtp/
 F:	package/libidn/
diff --git a/package/Config.in b/package/Config.in
index 9fc4ac7f02..0268acf230 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1761,7 +1761,6 @@ menu "Graphics"
 	source "package/libglfw/Config.in"
 	source "package/libglu/Config.in"
 	source "package/libgta/Config.in"
-	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
 	source "package/libgtk4/Config.in"
 	source "package/libjxl/Config.in"
diff --git a/package/libgtk2/0001-reduce-dependencies.patch b/package/libgtk2/0001-reduce-dependencies.patch
deleted file mode 100644
index 3250cae4b0..0000000000
--- a/package/libgtk2/0001-reduce-dependencies.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Hack the configure.in file to add a "none" gdktarget which removes
-dependencies on graphic backends such as X.org or DirectFB. Gtk does
-not fully build in this mode, but it builds sufficiently to build the
-host tools that are needed to build the target Gtk.
-
-Changes:
-	Ported to 2.24.18
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
----
-Index: libgtk2-2.24.18/configure.ac
-===================================================================
---- libgtk2-2.24.18.orig/configure.ac	2013-05-13 07:02:44.000000000 -0500
-+++ libgtk2-2.24.18/configure.ac	2013-05-27 02:12:09.947030335 -0500
-@@ -258,12 +258,12 @@
-   gdktarget=x11
- fi
- 
--AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb]] select non-default GDK target],
-+AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
- 	gdktarget=$with_gdktarget)
- 
- AC_SUBST(gdktarget)
- case $gdktarget in
--  x11|win32|quartz|directfb) ;;
-+  x11|win32|quartz|directfb|none) ;;
-   *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
- esac
- 
-@@ -372,11 +373,15 @@
- ## annoying to construct
- PKG_CHECK_MODULES(BASE_DEPENDENCIES,
-   [glib-2.0 >= glib_required_version dnl
--   atk >= atk_required_version dnl
--   pango >= pango_required_version dnl
--   cairo >= cairo_required_version dnl
-    gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
- 
-+if test "x$gdktarget" != "xnone"; then
-+   PKG_CHECK_MODULES(BASE_DEPENDENCIES,
-+	[atk >= atk_required_version dnl
-+	 pango >= pango_required_version dnl
-+	 cairo >= cairo_required_version])
-+fi
-+
- ## In addition to checking that cairo is present, we also need to
- ## check that the correct cairo backend is there. E.g. if the GDK
- ## target is win32 we need the cairo-win32 backend and so on.
-@@ -387,8 +392,11 @@
- if test "x$cairo_backend" = "xx11"; then
-    cairo_backend=xlib
- fi
--PKG_CHECK_MODULES(CAIRO_BACKEND,
--  [cairo-$cairo_backend >= cairo_required_version])
-+
-+if test "x$gdktarget" != "xnone"; then
-+   PKG_CHECK_MODULES(CAIRO_BACKEND,
-+	[cairo-$cairo_backend >= cairo_required_version])
-+fi
- 
- PKG_CHECK_MODULES(GMODULE, [gmodule-2.0])
- 
-@@ -1279,6 +1287,7 @@
-   AM_CONDITIONAL(USE_DIRECTFB, false)
- fi
- 
-+if test "x$gdktarget" != "xnone"; then
- 
- # Check for Pango flags
- 
-@@ -1324,6 +1333,8 @@
-   GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
- fi
- 
-+fi # gdktarget != none
-+
- GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES` $MATH_LIB"
- GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
- #
-@@ -1341,6 +1352,7 @@
- AC_SUBST(GDK_DEP_LIBS)
- AC_SUBST(GDK_DEP_CFLAGS)
- 
-+if test "x$gdktarget" != "xnone"; then
- 
- ########################################
- # Check for Accessibility Toolkit flags
-@@ -1372,6 +1384,10 @@
- fi
- 
- GTK_PACKAGES="atk cairo gdk-pixbuf-2.0 gio-2.0"
-+else # gdktarget != none
-+GTK_PACKAGES="gdk-pixbuf-2.0"
-+fi # gdktarget != none
-+
- if test "x$gdktarget" = "xx11"; then
-   GTK_PACKAGES="$GTK_PACKAGES pangoft2"
- fi
-@@ -1533,6 +1549,8 @@
- gtk_save_cppflags="$CPPFLAGS"
- CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
- 
-+if test "x$gdktarget" != "xnone"; then
-+
- AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
- *** Can't find cairo-pdf.h. You must build Cairo with the pdf
- *** backend enabled.]))
-@@ -1547,6 +1565,8 @@
- *** svg backend enabled.]))
- fi   
- 
-+fi # gdktarget != none
-+
- CPPFLAGS="$gtk_save_cppflags"
-      
- 			  	
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
deleted file mode 100644
index f8821ba246..0000000000
--- a/package/libgtk2/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-config BR2_PACKAGE_LIBGTK2
-	bool "libgtk2"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_CAIRO_ZLIB
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_GDK_PIXBUF
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	help
-	  The GTK+ version 2 graphical user interface library
-
-	  http://www.gtk.org/
-
-if BR2_PACKAGE_LIBGTK2
-
-config BR2_PACKAGE_LIBGTK2_DEMO
-	bool "Install libgtk2 demo program"
-	help
-	  The GTK+ source base contains a gtk-demo program. This
-	  option allows to install this program to the target.
-
-endif
-
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
deleted file mode 100644
index 7b9a46b697..0000000000
--- a/package/libgtk2/libgtk2.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://download.gnome.org/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
-sha256  ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da  gtk+-2.24.33.tar.xz
-
-# Hash for license file:
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
deleted file mode 100644
index 608c263e4d..0000000000
--- a/package/libgtk2/libgtk2.mk
+++ /dev/null
@@ -1,139 +0,0 @@
-################################################################################
-#
-# libgtk2
-#
-################################################################################
-
-LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).33
-LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
-LIBGTK2_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
-LIBGTK2_INSTALL_STAGING = YES
-LIBGTK2_LICENSE = LGPL-2.0+
-LIBGTK2_LICENSE_FILES = COPYING
-LIBGTK2_CPE_ID_VENDOR = gnome
-LIBGTK2_CPE_ID_PRODUCT = gtk
-# For 0001-reduce-dependencies.patch
-LIBGTK2_AUTORECONF = YES
-
-LIBGTK2_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
-	DB2HTML=false
-
-LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
-
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango at-spi2-core \
-	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
-
-LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
-
-# Xorg dependencies
-LIBGTK2_CONF_OPTS += \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--with-gdktarget=x11
-LIBGTK2_DEPENDENCIES += \
-	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBGTK2_CONF_OPTS += --enable-introspection
-LIBGTK2_DEPENDENCIES += gobject-introspection
-else
-LIBGTK2_CONF_OPTS += --disable-introspection
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-LIBGTK2_CONF_OPTS += --enable-xinerama
-LIBGTK2_DEPENDENCIES += xlib_libXinerama
-else
-LIBGTK2_CONF_OPTS += --disable-xinerama
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-LIBGTK2_CONF_OPTS += --with-xinput=yes
-LIBGTK2_DEPENDENCIES += xlib_libXi
-else
-LIBGTK2_CONF_OPTS += --with-xinput=no
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-LIBGTK2_DEPENDENCIES += xlib_libXrandr
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
-LIBGTK2_DEPENDENCIES += xlib_libXcursor
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
-LIBGTK2_DEPENDENCIES += xlib_libXfixes
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
-LIBGTK2_DEPENDENCIES += xlib_libXcomposite
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
-LIBGTK2_DEPENDENCIES += xlib_libXdamage
-endif
-
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-LIBGTK2_DEPENDENCIES += libpng
-else
-LIBGTK2_CONF_OPTS += --without-libpng
-endif
-
-ifeq ($(BR2_PACKAGE_JPEG),y)
-LIBGTK2_DEPENDENCIES += jpeg
-else
-LIBGTK2_CONF_OPTS += --without-libjpeg
-endif
-
-ifeq ($(BR2_PACKAGE_TIFF),y)
-LIBGTK2_DEPENDENCIES += tiff
-else
-LIBGTK2_CONF_OPTS += --without-libtiff
-endif
-
-ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK2_CONF_OPTS += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
-LIBGTK2_DEPENDENCIES += cups
-else
-LIBGTK2_CONF_OPTS += --disable-cups
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGTK2_DEMO),)
-define LIBGTK2_POST_INSTALL_TWEAKS
-	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
-endef
-
-LIBGTK2_POST_INSTALL_TARGET_HOOKS += LIBGTK2_POST_INSTALL_TWEAKS
-endif
-
-# We do not build a full version of libgtk2 for the host, because that
-# requires compiling Cairo, Pango, ATK and X.org for the
-# host. Therefore, we patch it to remove dependencies, and we hack the
-# build to only build gdk-pixbuf-from-source and
-# gtk-update-icon-cache, which are the host tools needed to build Gtk
-# for the target.
-
-HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
-HOST_LIBGTK2_CONF_OPTS = \
-	--disable-static \
-	--disable-glibtest \
-	--without-libtiff \
-	--without-libjpeg \
-	--with-gdktarget=none \
-	--disable-cups
-
-define HOST_LIBGTK2_BUILD_CMDS
-	$(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
-endef
-
-define HOST_LIBGTK2_INSTALL_CMDS
-	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/bin
-endef
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
