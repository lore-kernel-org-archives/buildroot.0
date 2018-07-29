From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 29 Jul 2018 15:19:19 -0400
Subject: [Buildroot] [PATCH v8 3/5] gstreamer1 packages: explicitly disable
 introspection
In-Reply-To: <20180729191921.11216-1-aduskett@gmail.com>
References: <20180729191921.11216-1-aduskett@gmail.com>
Message-ID: <20180729191921.11216-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


To get GStreamer ready for introspection, we must first explicitly
disable gstreamer1, plugins base and plugins bad from using introspection.
If not, adding the gobject-introspection will result in these packages
failing to build because setting the _GIR_EXTRA_LIBS_PATH variable is required.

The other gstreamer1 packages do not require setting the _GIR_EXTRA_LIBS_PATH
variable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add patch to series.
  - Change TARGET_MAKE_ENV += GIR_EXTRA_LIBS_PATH to
    PACKAGE_GIR_EXTRA_LIBS_PATH.

Changes v4 -> v5:
  - Change --enable-introspection=no to --disable-introspection (Yann)

Changes v5 -> v8:
  - None

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
-- 
2.17.1
