From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 15 Dec 2018 18:35:55 -0500
Subject: [Buildroot] [PATCH v9 4/4] gstreamer1 packages: add support for
 introspection
In-Reply-To: <20181215233555.98482-1-aduskett@gmail.com>
References: <20181215233555.98482-1-aduskett@gmail.com>
Message-ID: <20181215233555.98482-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Now that there is support for gobject-introspection, we can add the appropriate
configuration options to support compiling against gobject-introspection.

In addition: gst1-plugins-base requires a patch to drop a incorrect reference
to sdp when compiling the rtsp gir file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.

Changes v4 -> v5:
  - Changed --enable-introspection=yes to --enable-introspection (Yann)
  - Changed += GIR_EXTRA_LIBS_PATH="$(@D)/gst/.libs:$(@D)/libs/gst/base/.libs"
    to GSTREAMER1_GIR_EXTRA_LIBS_PATH=$(@D)/gst/.libs:$(@D)/libs/gst/base/.libs

Chagnes v5 -> v6:
  - None

Changes v6 -> v7:
  - Refresh for changes since v6.

Changes v7 -> v9:
  - None

 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  5 ++++
 ...ect-reference-to-gstreamer-sdp-in-Ma.patch | 26 +++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.mk    |  5 ++++
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  6 +++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac39f1e5ce..77795d8c69 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -63,6 +63,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-introspection
+GST1_PLUGINS_BAD_GIR_EXTRA_LIBS_PATH=$(@D)/gst-libs/gst/allocators/.libs
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
 GST1_PLUGINS_BAD_CONF_ENV += \
diff --git a/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
new file mode 100644
index 0000000000..07d4d8c476
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -0,0 +1,26 @@
+From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 17:30:14 +0200
+Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in Makefile.am
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ gst-libs/gst/rtsp/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index 4f6d9f8..0afa370 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -79,7 +79,6 @@ GstRtsp- at GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp- at GST_API_VERS
+ 		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer- at GST_API_VERSION@ \
+-		--pkg gstreamer-sdp- at GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtsp- at GST_API_VERSION@ \
+ 		--add-init-section="$(INTROSPECTION_INIT)" \
+ 		--output $@ \
+-- 
+2.6.2
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index fb976f9a94..d788d65495 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -25,6 +25,11 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 
 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-introspection
+GST1_PLUGINS_BASE_GIR_EXTRA_LIBS_PATH=$(@D)/gst-libs/gst/tag/.libs:$(@D)/gst-libs/gst/video/.libs:$(@D)/gst-libs/gst/audio/.libs:$(@D)/gst-libs/gst/rtp/.libs
+endif
+
 # These plugins are listed in the order from ./configure --help
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 76a74a0806..ae22a1985a 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -32,4 +32,10 @@ GSTREAMER1_DEPENDENCIES = \
 	libglib2 \
 	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GSTREAMER1_DEPENDENCIES += gobject-introspection
+GSTREAMER1_CONF_OPTS += --enable-introspection
+GSTREAMER1_GIR_EXTRA_LIBS_PATH=$(@D)/gst/.libs:$(@D)/libs/gst/base/.libs
+endif
+
 $(eval $(autotools-package))
-- 
2.19.2
