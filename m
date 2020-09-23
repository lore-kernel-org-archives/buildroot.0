From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:24:25 +0200
Subject: [Buildroot] [git commit] package/gst1-devtools: new package (was
 gst1-validate)
Message-ID: <20200923201700.55A1F83C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60b4e7a533110dc5bd4aacc018b7e1975713a3de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 +++++
 package/gstreamer1/Config.in                       |  2 +-
 .../{gst1-validate => gst1-devtools}/Config.in     | 12 ++++----
 .../gstreamer1/gst1-devtools/gst1-devtools.hash    |  3 ++
 package/gstreamer1/gst1-devtools/gst1-devtools.mk  | 32 ++++++++++++++++++++++
 .../gstreamer1/gst1-validate/gst1-validate.hash    |  3 --
 package/gstreamer1/gst1-validate/gst1-validate.mk  | 29 --------------------
 7 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fddabfe223..c1b3e18186 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+connfig BR2_PACKAGE_GST1_VALIDATE
+	bool "gst1-validate was moved to gst1-devtools"
+	select BR2_PACKAGE_GST1_DEVTOOLS
+	select BR2_LEGACY
+	help
+	  This package has been removed, use gst1-devtools instead.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
 	bool "gst1-plugins-bad yadif plugin was removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 0e47d78e68..4a8111333e 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -8,13 +8,13 @@ source "package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-devtools/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-interpipe/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-python/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
-source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 source "package/gstreamer1/gstreamer1-editing-services/Config.in"
diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-devtools/Config.in
similarity index 59%
rename from package/gstreamer1/gst1-validate/Config.in
rename to package/gstreamer1/gst1-devtools/Config.in
index 63bce613ed..1ca8ab8299 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-devtools/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_GST1_VALIDATE
-	bool "gst1-validate"
+config BR2_PACKAGE_GST1_DEVTOOLS
+	bool "gst1-devtools"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_JSON_GLIB
@@ -8,12 +8,10 @@ config BR2_PACKAGE_GST1_VALIDATE
 	# cairo is autodetected but needs PNG support
 	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
 	help
-	  GstValidate is a tool that allows GStreamer developers to
-	  check that the GstElements they write behave the way they
-	  are supposed to.
+	  GStreamer development tools (gst-validate).
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org
 
-comment "gst1-validate depends on python"
+comment "gst1-devtools depends on python"
 	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
new file mode 100644
index 0000000000..8d26e200ad
--- /dev/null
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -0,0 +1,3 @@
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.0.tar.xz.sha256sum
+sha256  82337141b5654f11c440f783892ba9d9498b3b6b98c2286b000f96dce6945f16  gst-devtools-1.18.0.tar.xz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
new file mode 100644
index 0000000000..23b4d5ab8f
--- /dev/null
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# gst1-devtools
+#
+################################################################################
+
+GST1_DEVTOOLS_VERSION = 1.18.0
+GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
+GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
+GST1_DEVTOOLS_LICENSE = LGPL-2.1+
+GST1_DEVTOOLS_LICENSE_FILES = validate/COPYING
+
+GST1_DEVTOOLS_DEPENDENCIES = \
+	gstreamer1 \
+	gst1-plugins-base \
+	json-glib \
+	$(if $(BR2_PACKAGE_CAIRO),cairo)
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3
+else
+GST1_DEVTOOLS_DEPENDENCIES += host-python python
+endif
+
+GST1_DEVTOOLS_CONF_OPTS = \
+	-Dvalidate=enabled \
+	-Ddebug_viewer=disabled \
+	-Dintrospection=disabled \
+	-Dtests=disabled \
+	-Ddoc=disabled
+
+$(eval $(meson-package))
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
deleted file mode 100644
index 9a0fbf66a0..0000000000
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.2.tar.xz.sha256sum
-sha256 4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca gst-validate-1.16.2.tar.xz
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
deleted file mode 100644
index 38b50b6736..0000000000
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# gst1-validate
-#
-################################################################################
-
-GST1_VALIDATE_VERSION = 1.16.2
-GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
-GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
-GST1_VALIDATE_LICENSE = LGPL-2.1+
-GST1_VALIDATE_LICENSE_FILES = COPYING
-
-GST1_VALIDATE_DEPENDENCIES = \
-	gstreamer1 \
-	gst1-plugins-base \
-	json-glib \
-	$(if $(BR2_PACKAGE_CAIRO),cairo)
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-GST1_VALIDATE_DEPENDENCIES += host-python3 python3
-else
-GST1_VALIDATE_DEPENDENCIES += host-python python
-endif
-
-GST1_VALIDATE_CONF_OPTS = \
-	--disable-introspection \
-	--disable-sphinx-doc
-
-$(eval $(autotools-package))
