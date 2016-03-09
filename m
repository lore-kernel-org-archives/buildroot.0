From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:58:40 -0300
Subject: [Buildroot] [PATCH v3 2/7] libgtk3: bump to version 3.18.8
In-Reply-To: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457517525-7716-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark the wayland backend as good again since the bump and consequent
protocol version mtach fixes it.

Switch backend selection to choice so that only one can be selected.

Drop upstream 0004-Fix-undefined-reference-to-get_xkb.patch

Drop unnecessary 0005-do-not-build-extract-strings.patch
(extract-strings doesn't exist any more).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0004-Fix-undefined-reference-to-get_xkb.patch  | 33 --------
 .../0005-do-not-build-extract-strings.patch        | 47 ------------
 package/libgtk3/Config.in                          | 88 +++++++++++++---------
 package/libgtk3/libgtk3.hash                       |  4 +-
 package/libgtk3/libgtk3.mk                         | 15 +---
 5 files changed, 57 insertions(+), 130 deletions(-)
 delete mode 100644 package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
 delete mode 100644 package/libgtk3/0005-do-not-build-extract-strings.patch

diff --git a/package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch b/package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
deleted file mode 100644
index c2f4b4f..0000000
--- a/package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b64a04250b1f35923434158beb6ddb5726b41eac Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 27 Oct 2014 10:34:38 +0100
-Subject: [PATCH 1/1] Fix undefined reference to get_xkb()
-
-When configuring Gtk+ with --disable-xkb, the build fails because of an
-undefined reference to get_xkb().
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- gdk/x11/gdkkeys-x11.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gdk/x11/gdkkeys-x11.c b/gdk/x11/gdkkeys-x11.c
-index c45a971..6a5481b 100644
---- a/gdk/x11/gdkkeys-x11.c
-+++ b/gdk/x11/gdkkeys-x11.c
-@@ -1498,8 +1498,10 @@ gdk_x11_keymap_map_virtual_modifiers (GdkKeymap       *keymap,
-   int i, j;
-   gboolean retval;
- 
-+#ifdef HAVE_XKB
-   if (KEYMAP_USE_XKB (keymap))
-     get_xkb (keymap_x11);
-+#endif
- 
-   retval = TRUE;
- 
--- 
-1.9.1
-
diff --git a/package/libgtk3/0005-do-not-build-extract-strings.patch b/package/libgtk3/0005-do-not-build-extract-strings.patch
deleted file mode 100644
index f1fbaaa..0000000
--- a/package/libgtk3/0005-do-not-build-extract-strings.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Do not build util/extract-strings
-
-Do not build util/extract-strings, as it will be built by host-libgtk3
-and installed in $(HOST_DIR)/usr/bin (thus avoiding the -lint linking
-issue with uClibc).
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-
-Index: gtk+-3.14.0/Makefile.am
-===================================================================
---- gtk+-3.14.0.orig/Makefile.am	2014-09-22 05:17:44.000000000 +0200
-+++ gtk+-3.14.0/Makefile.am	2014-09-25 16:08:32.000000000 +0200
-@@ -1,7 +1,7 @@
- ## Makefile.am for GTK+
- include $(top_srcdir)/Makefile.decl
- 
--SRC_SUBDIRS = util gdk gtk libgail-util modules demos tests testsuite examples
-+SRC_SUBDIRS = gdk gtk libgail-util modules demos tests testsuite examples
- SUBDIRS = po po-properties $(SRC_SUBDIRS) docs m4macros build
- 
- ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
-Index: gtk+-3.14.0/gtk/Makefile.am
-===================================================================
---- gtk+-3.14.0.orig/gtk/Makefile.am	2014-09-22 05:09:39.000000000 +0200
-+++ gtk+-3.14.0/gtk/Makefile.am	2014-09-25 16:09:10.000000000 +0200
-@@ -1330,7 +1330,7 @@
- 
- %.ui.h: %.ui
- 	$(AM_V_GEN) mkdir -p $(dir $@) \
--	&& $(top_builddir)/util/extract-strings$(EXEEXT) $< > $@
-+	&& extract-strings$(EXEEXT) $< > $@
- 
- #
- # rules to generate built sources
-Index: gtk+-3.14.0/gtk/inspector/Makefile.am
-===================================================================
---- gtk+-3.14.0.orig/gtk/inspector/Makefile.am	2014-09-04 20:11:33.000000000 +0200
-+++ gtk+-3.14.0/gtk/inspector/Makefile.am	2014-09-25 16:09:48.000000000 +0200
-@@ -114,7 +114,7 @@
- template_headers = $(templates:.ui=.ui.h)
- 
- %.ui.h : %.ui 
--	$(AM_V_GEN) $(top_builddir)/util/extract-strings$(EXEEXT) $< > $@
-+	$(AM_V_GEN) extract-strings$(EXEEXT) $< > $@
- 
- EXTRA_DIST += 				\
- 	inspector.gresource.xml 	\
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index ac56b85..cf35f84 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,3 +1,15 @@
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libgtk3 needs an OpenGL or OpenGL EGL backend provided by mesa3d"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && \
+		!BR2_PACKAGE_HAS_LIBGL
+
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	select BR2_PACKAGE_ATK
@@ -5,10 +17,11 @@ config BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
-	# atleast 1 backend must be enabled
+	# At least one backend is required
 	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
 		!(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
 	depends on BR2_USE_WCHAR # glib2
@@ -16,6 +29,8 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		BR2_PACKAGE_HAS_LIBGL
 	help
 	  The GTK+ version 3 graphical user interface library
 
@@ -23,33 +38,10 @@ config BR2_PACKAGE_LIBGTK3
 
 if BR2_PACKAGE_LIBGTK3
 
-comment "GDK backend"
-
-config BR2_PACKAGE_LIBGTK3_X11
-	bool "GDK X11 backend"
-	default y
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXI
-	help
-	  This enables the X11 backend for GDK.
-
-config BR2_PACKAGE_LIBGTK3_WAYLAND
-	bool "GDK Wayland backend"
-	default y
-	# Needs a libgtk3 bump to match API level
-	depends on BROKEN
-	depends on BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_LIBXKBCOMMON
-	help
-	  This enables the Wayland backend for GDK.
-
 config BR2_PACKAGE_LIBGTK3_BROADWAY
-	bool "GDK Broadway backend"
-	help
+	bool "Broadway GDK backend"
+	default y
+	  help
 	  This enables the Broadway backend for GDK, which provides support
 	  for displaying GTK+ applications in a web browser, using HTML5 and
 	  web sockets.
@@ -58,14 +50,42 @@ config BR2_PACKAGE_LIBGTK3_BROADWAY
 	  192.168.0.1 and use it from a web browser, execute the following
 	  commands:
 
-	    $ broadwayd -a 192.168.0.1 -p 8080 :2 &
-	    $ export GDK_BACKEND=broadway
-	    $ export BROADWAY_DISPLAY=:2
-	    $ gtk3-demo
+	  $ broadwayd -a 192.168.0.1 -p 8080 :2 &
+	  $ export GDK_BACKEND=broadway
+	  $ export BROADWAY_DISPLAY=:2
+	  $ gtk3-demo
 
 	  Then open a web browser at address http://192.168.0.1:8080.
 	  Javascript and web sockets should be enabled.
 
+comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
+config BR2_PACKAGE_LIBGTK3_WAYLAND
+	bool "Wayland GDK backend"
+	default y
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This enables the Wayland backend for GDK.
+
+comment "X11 GDK backend needs an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGTK3_X11
+	bool "X11 GDK backend"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  This enables the X11 backend for GDK.
+
 config BR2_PACKAGE_LIBGTK3_DEMO
 	bool "Install libgtk3 demo program"
 	select BR2_PACKAGE_SHARED_MIME_INFO
@@ -81,9 +101,3 @@ config BR2_PACKAGE_LIBGTK3_TESTS
 	  allows to install them to the target.
 
 endif
-
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index b310aec..6415aa1 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.15.sha256sum
-sha256	3ac87659112ced9e5ee5bd55d055faa881aafd040f26ca40b0d8ba0fa6509c83	gtk+-3.14.15.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.18/gtk+-3.18.8.sha256sum
+sha256	1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8	gtk+-3.18.8.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d268b56..c2148d1 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).15
+LIBGTK3_VERSION_MAJOR = 3.18
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).8
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
@@ -24,7 +24,7 @@ LIBGTK3_CONF_OPTS = \
 	--enable-gtk2-dependency \
 	--disable-introspection
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf libepoxy
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
@@ -136,8 +136,7 @@ LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
 # for both native and target builds).
 #
 # But no native version of libintl is available (the functions are
-# provided by glibc). So gtk-update-icon-cache will not build, and
-# extract-strings neither.
+# provided by glibc). So gtk-update-icon-cache will not build.
 #
 # As a workaround, we build gtk-update-icon-cache on our own, set
 # --enable-gtk2-dependency=yes and force './configure' to use our version.
@@ -162,17 +161,11 @@ define HOST_LIBGTK3_BUILD_CMDS
 		$(@D)/gtk/updateiconcache.c \
 		$(HOST_LIBGTK3_CFLAGS) \
 		-o $(@D)/gtk/gtk-update-icon-cache
-	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		$(@D)/util/extract-strings.c \
-		$(HOST_LIBGTK3_CFLAGS) \
-		-o $(@D)/util/extract-strings
 endef
 
 define HOST_LIBGTK3_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
 		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
-	$(INSTALL) -D -m 0755 $(@D)/util/extract-strings \
-		$(HOST_DIR)/usr/bin/extract-strings
 endef
 
 $(eval $(autotools-package))
-- 
2.4.10
