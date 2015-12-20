From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Dec 2015 10:40:34 -0300
Subject: [Buildroot] [PATCH 2/4] libgtk3: bump to version 3.18.6
In-Reply-To: <1450618836-3845-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450618836-3845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450618836-3845-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also mark wayland backend as good again since the bump fixes it.

extract-strings is gone so drop 0005-do-not-build-extract-strings.patch
0004-Fix-undefined-reference-to-get_xkb.patch is already upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0004-Fix-undefined-reference-to-get_xkb.patch  | 33 ---------------
 .../0005-do-not-build-extract-strings.patch        | 47 ----------------------
 package/libgtk3/Config.in                          | 25 +++++++-----
 package/libgtk3/libgtk3.hash                       |  4 +-
 package/libgtk3/libgtk3.mk                         | 15 ++-----
 5 files changed, 22 insertions(+), 102 deletions(-)
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
index 02c7aaf..e29e7d0 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,3 +1,12 @@
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libgtk3 needs an OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	select BR2_PACKAGE_ATK
@@ -5,10 +14,11 @@ config BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
-	# atleast 1 backend must be enabled
+	# at least one backend must be enabled
 	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
 		!(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
 	depends on BR2_USE_WCHAR # glib2
@@ -16,6 +26,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	help
 	  The GTK+ version 3 graphical user interface library
 
@@ -25,10 +36,14 @@ if BR2_PACKAGE_LIBGTK3
 
 comment "GDK backend"
 
+comment "X11 backend needs an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
 config BR2_PACKAGE_LIBGTK3_X11
 	bool "GDK X11 backend"
 	default y
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
@@ -40,8 +55,6 @@ config BR2_PACKAGE_LIBGTK3_X11
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "GDK Wayland backend"
 	default y
-	# Needs a libgtk3 bump to match API level
-	depends on BROKEN
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
@@ -81,9 +94,3 @@ config BR2_PACKAGE_LIBGTK3_TESTS
 	  allows to install them to the target.
 
 endif
-
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index b310aec..42bddb2 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.15.sha256sum
-sha256	3ac87659112ced9e5ee5bd55d055faa881aafd040f26ca40b0d8ba0fa6509c83	gtk+-3.14.15.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.18/gtk+-3.18.6.sha256sum
+sha256	78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef	gtk+-3.18.6.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d268b56..be10ca1 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).15
+LIBGTK3_VERSION_MAJOR = 3.18
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).6
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
