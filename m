From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 14 Mar 2018 13:12:21 -0400
Subject: [Buildroot] [PATCH v4 4/4] gstreamer1 packages: add support for
 introspection
In-Reply-To: <20180314171221.10856-1-aduskett@gmail.com>
References: <20180314171221.10856-1-aduskett@gmail.com>
Message-ID: <20180314171221.10856-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that there is support for gobject-introspection, we can add the appropriate
configuration options to support compiling against gobject-introspection.

gst1-plugins-base requires a patch to drop a incorrect reference to
sdp when compiling the rtsp gir file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.

 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  5 ++++
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch | 28 ++++++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  5 ++++
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  6 +++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 595e62072c..44b65bcf5d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -64,6 +64,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-introspection=yes
+GST1_PLUGINS_BAD_GIR_EXTRA_LIBS_PATH=$(@D)/gst-libs/gst/allocators/.libs
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
 GST1_PLUGINS_BAD_CONF_ENV += \
diff --git a/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
new file mode 100644
index 0000000000..71d9732604
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -0,0 +1,28 @@
+From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 17:30:14 +0200
+Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in
+ Makefile.am
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
+@@ -75,7 +75,6 @@ GstRtsp- at GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp- at GST_API_VERS
+ 		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer- at GST_API_VERSION@ \
+-		--pkg gstreamer-sdp- at GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtsp- at GST_API_VERSION@ \
+ 		--add-init-section="$(INTROSPECTION_INIT)" \
+ 		--output $@ \
+-- 
+2.6.2
+
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index f492c4a175..0c474b921c 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -25,6 +25,11 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 
 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-introspection=yes
+GST1_PLUGINS_BASE_GIR_EXTRA_LIBS_PATH=$(@D)/gst-libs/gst/tag/.libs:$(@D)/gst-libs/gst/video/.libs:$(@D)/gst-libs/gst/audio/.libs:$(@D)/gst-libs/gst/rtp/.libs
+endif
+
 # These plugins are liste in the order from ./configure --help
 
 ifeq ($(BR2_PACKAGE_ORC),y)
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 25a799240d..1731d25957 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -32,4 +32,10 @@ GSTREAMER1_DEPENDENCIES = \
 	libglib2 \
 	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GSTREAMER1_DEPENDENCIES += gobject-introspection
+GSTREAMER1_CONF_OPTS += --enable-introspection=yes
+GSTREAMER1_GIR_EXTRA_LIBS_PATH += GIR_EXTRA_LIBS_PATH="$(@D)/gst/.libs:$(@D)/libs/gst/base/.libs"
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
