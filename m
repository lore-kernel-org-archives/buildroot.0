From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Feb 2021 23:01:10 +0100
Subject: [Buildroot] [git commit] package/gdk-pixbuf: fix static build
Message-ID: <20210216214050.3184A8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ecf22a2fe012b038dc0bdad4cabc91f6b720699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix static build failure which is raised since the switch to
meson-package in commit a7b51ed3013c919b293deb95299e33363fb9df70

Fixes:
 - http://autobuild.buildroot.org/results/6cd54c497f5d19342ec94ece713547b887e4c02d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: add link to upstream MR]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...gdk-pixbuf-io.c-fix-build-without-gmodule.patch | 41 ++++++++++++++++++++++
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  4 +++
 2 files changed, 45 insertions(+)

diff --git a/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch b/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
new file mode 100644
index 0000000000..74bc967a68
--- /dev/null
+++ b/package/gdk-pixbuf/0002-gdk-pixbuf-gdk-pixbuf-io.c-fix-build-without-gmodule.patch
@@ -0,0 +1,41 @@
+From 46c7fe11bd0ed8595c3f920d42a9914fa864d893 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Feb 2021 18:51:14 +0100
+Subject: [PATCH] gdk-pixbuf/gdk-pixbuf-io.c: fix build without gmodule
+
+Fix the following build failure:
+
+../gdk-pixbuf/gdk-pixbuf-io.c: In function 'gdk_pixbuf_io_init':
+../gdk-pixbuf/gdk-pixbuf-io.c:681:16: error: implicit declaration of function 'gdk_pixbuf_get_module_file'; did you mean '_gdk_pixbuf_get_module'? [-Werror=implicit-function-declaration]
+  681 |  module_file = gdk_pixbuf_get_module_file ();
+      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                _gdk_pixbuf_get_module
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6cd54c497f5d19342ec94ece713547b887e4c02d
+
+Upstream status: Accepted
+https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/103
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdk-pixbuf/gdk-pixbuf-io.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gdk-pixbuf/gdk-pixbuf-io.c b/gdk-pixbuf/gdk-pixbuf-io.c
+index 40eb920c8..2dc2ea6da 100644
+--- a/gdk-pixbuf/gdk-pixbuf-io.c
++++ b/gdk-pixbuf/gdk-pixbuf-io.c
+@@ -678,7 +678,9 @@ gdk_pixbuf_io_init (void)
+ 	gboolean ret;
+ 
+ 	gdk_pixbuf_io_init_builtin ();
++#ifdef USE_GMODULE
+ 	module_file = gdk_pixbuf_get_module_file ();
++#endif
+ 	ret = gdk_pixbuf_io_init_modules (module_file, NULL);
+ 	g_free (module_file);
+ 	return ret;
+-- 
+2.29.2
+
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 3560734841..1bd422c0a1 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -28,6 +28,10 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dintrospection=disabled \
 	-Dman=false
 
+ifeq ($(BR2_STATIC_LIBS),y)
+GDK_PIXBUF_CONF_OPTS += -Dbuiltin_loaders=all
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GDK_PIXBUF_CONF_OPTS += -Dintrospection=enabled
 GDK_PIXBUF_DEPENDENCIES += gobject-introspection
