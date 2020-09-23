From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:20:23 +0200
Subject: [Buildroot] [git commit] package/gstreamer1: bump version to 1.18.0
Message-ID: <20200923201700.1C1A283C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f21ffbc65e08af5f2f3cd9aaf088550db032ae8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
  (upstream [1])

- meson options: add extra-checks=disabled, gst_parse=true, doc=disabled
  (and re-order tools and gobjec-cast-checks according to meson_options.txt order)

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/35db4a2433fbdf8612cf98b5aab5b14aeb5372f8.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ven-when-cross-compiling-if-introspection.patch | 36 ----------------------
 package/gstreamer1/gstreamer1/Config.in            |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  6 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  9 ++++--
 4 files changed, 10 insertions(+), 43 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
deleted file mode 100644
index fc290f6cc0..0000000000
--- a/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
-From: Tim Philipp <tim@centricular.com>
-Date: Thu, 17 Oct 2019 12:13:35 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-Fixes #454 and #381.
-
-Upstream commit: 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8
-Signed-off-by: Tim Philipp <tim@centricular.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 90d98d8eb00..a47e7f34e8a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -453,7 +453,7 @@ rt_lib = cc.find_library('rt', required : false)
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
- 
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- 
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
--- 
-2.24.1
-
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 0626bcc96d..5609d8699d 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GSTREAMER1
 	  GStreamer is an open source multimedia framework. This 1.x
 	  version of Gstreamer is incompatible with Gstreamer 0.10.x.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
 
 if BR2_PACKAGE_GSTREAMER1
 
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index dd379e6027..47cf680ba6 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.2.tar.xz.sha256sum
-sha256 e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e gstreamer-1.16.2.tar.xz
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.0.tar.xz.sha256sum
+sha256  0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a1ff0318f9c00c7805  gstreamer-1.18.0.tar.xz
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 47615aad1f..1f190c0bc3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.16.2
+GSTREAMER1_VERSION = 1.18.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
@@ -15,16 +15,19 @@ GSTREAMER1_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
 	-Dbenchmarks=disabled \
+	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled) \
 	-Dgtk_doc=disabled \
+	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
-	-Dgobject-cast-checks=disabled \
+	-Dextra-checks=disabled \
 	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),enabled,disabled) \
 	-Dtracer_hooks=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),true,false) \
 	-Doption-parsing=$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),true,false) \
 	-Dgst_debug=$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),true,false) \
+	-Dgst_parse=true \
 	-Dregistry=$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),true,false) \
-	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled)
+	-Ddoc=disabled
 
 GSTREAMER1_DEPENDENCIES = \
 	host-bison \
