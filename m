From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 May 2021 16:45:08 +0200
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.4
Message-ID: <20210524144508.1983266-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...eson.build-link-with-lintl-if-needed.patch | 45 -------------------
 ...ixbuf-io.c-fix-build-without-gmodule.patch | 41 -----------------
 package/gdk-pixbuf/Config.in                  |  2 +-
 package/gdk-pixbuf/gdk-pixbuf.hash            |  5 +--
 package/gdk-pixbuf/gdk-pixbuf.mk              |  2 +-
 5 files changed, 4 insertions(+), 91 deletions(-)
 delete mode 100644 package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch
 delete mode 100644 package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch

diff --git a/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch b/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch
deleted file mode 100644
index 08a3a681c..000000000
--- a/package/gdk-pixbuf/0001-meson.build-link-with-lintl-if-needed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 65c8bc8ec4ae8dd140b0205a61d0d216fa45d819 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 28 Jan 2021 07:50:44 +0100
-Subject: [PATCH] meson.build: link with lintl if needed
-
-Link with -lintl to avoid the following build failure:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: gdk-pixbuf/libgdk_pixbuf-2.0.so.0.4200.2.p/gdk-pixbuf-util.c.o: in function `_gdk_pixbuf_init_gettext':
-gdk-pixbuf-util.c:(.text+0xbc0): undefined reference to `libintl_bindtextdomain'
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: gdk-pixbuf-util.c:(.text+0xbc8): undefined reference to `libintl_bindtextdomain'
-
-Fixes:
- - http://autobuild.buildroot.org/results/894359558100ea9637feba16deaf99923805d0f2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/101]
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1cef125a3..973948108 100644
---- a/meson.build
-+++ b/meson.build
-@@ -93,6 +93,7 @@ if cc.has_function('lrint', dependencies: mathlib_dep)
-   gdk_pixbuf_conf.set('HAVE_LRINT', 1)
- endif
- 
-+intl_dep = cc.find_library('intl', required: false)
- if cc.has_function('bind_textdomain_codeset', prefix: '#include <libintl.h>')
-   gdk_pixbuf_conf.set('HAVE_BIND_TEXTDOMAIN_CODESET', 1)
- endif
-@@ -212,7 +213,7 @@ if medialib_dep.found()
- endif
- 
- gdk_pixbuf_deps = [ mathlib_dep, glib_dep, gobject_dep, gmodule_dep, gio_dep,
--                    shared_mime_dep, medialib_dep ]
-+                    shared_mime_dep, medialib_dep, intl_dep ]
- 
- # Check if we can build shared modules
- if gmodule_dep.type_name() == 'pkgconfig'
--- 
-2.29.2
-
diff --git a/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch b/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
deleted file mode 100644
index 74bc967a6..000000000
--- a/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 46c7fe11bd0ed8595c3f920d42a9914fa864d893 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Feb 2021 18:51:14 +0100
-Subject: [PATCH] gdk-pixbuf/gdk-pixbuf-io.c: fix build without gmodule
-
-Fix the following build failure:
-
-../gdk-pixbuf/gdk-pixbuf-io.c: In function 'gdk_pixbuf_io_init':
-../gdk-pixbuf/gdk-pixbuf-io.c:681:16: error: implicit declaration of function 'gdk_pixbuf_get_module_file'; did you mean '_gdk_pixbuf_get_module'? [-Werror=implicit-function-declaration]
-  681 |  module_file = gdk_pixbuf_get_module_file ();
-      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
-      |                _gdk_pixbuf_get_module
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cd54c497f5d19342ec94ece713547b887e4c02d
-
-Upstream status: Accepted
-https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/103
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gdk-pixbuf/gdk-pixbuf-io.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gdk-pixbuf/gdk-pixbuf-io.c b/gdk-pixbuf/gdk-pixbuf-io.c
-index 40eb920c8..2dc2ea6da 100644
---- a/gdk-pixbuf/gdk-pixbuf-io.c
-+++ b/gdk-pixbuf/gdk-pixbuf-io.c
-@@ -678,7 +678,9 @@ gdk_pixbuf_io_init (void)
- 	gboolean ret;
- 
- 	gdk_pixbuf_io_init_builtin ();
-+#ifdef USE_GMODULE
- 	module_file = gdk_pixbuf_get_module_file ();
-+#endif
- 	ret = gdk_pixbuf_io_init_modules (module_file, NULL);
- 	g_free (module_file);
- 	return ret;
--- 
-2.29.2
-
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 44942ac4f..0ba6dda8a 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
 	  and the GLib, to integrate well with GNOME applications.
 
-	  http://www.gtk.org/
+	  https://www.gtk.org/
 
 comment "gdk-pixbuf needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index be7593aeb..5e7dc7e03 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,4 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.2.sha256sum
-sha256  83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15  gdk-pixbuf-2.42.2.tar.xz
-# Locally calculated
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.4.sha256sum
+sha256  fe9c5dd88f486194ea2bc09b8814c1ed895bb6c530f37cbbf259757c4e482e4d  gdk-pixbuf-2.42.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 1bd422c0a..cd30d450d 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).4
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
-- 
2.30.2
