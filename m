From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:56:22 +0200
Subject: [Buildroot] [git commit] gstreamer1: explicitly disable
 introspection
Message-ID: <20180731205108.13F4C8B2CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73fd5befdda19bc46aa3209e64aed85f19bbf83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To get GStreamer ready for introspection, we must first explicitly
disable gstreamer1, plugins base and plugins bad from using
introspection. If not, adding the gobject-introspection will result in
these packages failing to build because setting the
_GIR_EXTRA_LIBS_PATH variable is required.

The other gstreamer1 packages do not require setting the
_GIR_EXTRA_LIBS_PATH variable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 3 ++-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 3 ++-
 package/gstreamer1/gstreamer1/gstreamer1.mk               | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c9bf2b2fb7..4fd5b3fc8f 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -21,7 +21,8 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
-	--disable-acm
+	--disable-acm \
+	--disable-introspection
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 36440ef5fa..10b1fec439 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -14,7 +14,8 @@ GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 # gio_unix_2_0 is only used for tests
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
-	--disable-valgrind
+	--disable-valgrind \
+	--disable-introspection
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BASE_CONF_OPTS += \
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 092d6cb82e..26316e73cd 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -17,6 +17,7 @@ GSTREAMER1_CONF_OPTS = \
 	--disable-failing-tests \
 	--disable-valgrind \
 	--disable-benchmarks \
+	--disable-introspection \
 	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
