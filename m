From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 11:17:58 +0100
Subject: [Buildroot] [PATCH v2 next 02/11] gst1-vaapi: bump version to 1.12.0
In-Reply-To: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512101807.42378-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001 patch already included in this release:
  https://github.com/GStreamer/gstreamer-vaapi/commit/159e3c3f08ef1c19da4ede8a437337dd8cf7f0b7
0002 patch already included in this release:
  https://github.com/GStreamer/gstreamer-vaapi/commit/152217064f1192bb836620ad7eaadbc031624f4c

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Nothing.
---
 .../0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch | 52 -------------
 ...n-debug-disabled-default-category-is-NULL.patch | 91 ----------------------
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |  2 +-
 4 files changed, 3 insertions(+), 146 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch
 delete mode 100644 package/gstreamer1/gst1-vaapi/0002-plugins-when-debug-disabled-default-category-is-NULL.patch

diff --git a/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch b/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch
deleted file mode 100644
index d69846c..0000000
--- a/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3e392e097fc0e98e606721748e8baee0e079a1a2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 12 Mar 2017 18:59:42 +0100
-Subject: [PATCH] O_CLOEXEC needs _GNU_SOURCE defined
-
-From man open(2):
-
-    The O_CLOEXEC, O_DIRECTORY, and O_NOFOLLOW flags are not specified
-    in POSIX.1-2001, but are specified in POSIX.1-2008.  Since glibc
-    2.12, one can obtain their definitions by defining either
-    _POSIX_C_SOURCE with a value greater than or equal to 200809L or
-    _XOPEN_SOURCE with a value greater than or equal to 700.  In glibc
-    2.11 and earlier, one obtains the definitions by defining
-    _GNU_SOURCE.
-
-And indeed, with the uClibc C library, O_CLOEXEC is not exposed if
-_GNU_SOURCE is not defined. Therefore, this commit fixes the build of
-gstreamer-vaapi with the uClibc C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gst-libs/gst/vaapi/gstvaapidisplay_drm.c | 1 +
- tests/test-display.c                     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_drm.c b/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
-index f436036..00ff039 100644
---- a/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
-+++ b/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
-@@ -25,6 +25,7 @@
-  * @short_description: VA/DRM display abstraction
-  */
- 
-+#define _GNU_SOURCE
- #include "sysdeps.h"
- #include <string.h>
- #include <unistd.h>
-diff --git a/tests/test-display.c b/tests/test-display.c
-index be9c24b..9abe754 100644
---- a/tests/test-display.c
-+++ b/tests/test-display.c
-@@ -22,6 +22,7 @@
-  *  Boston, MA 02110-1301 USA
-  */
- 
-+#define _GNU_SOURCE
- #include "gst/vaapi/sysdeps.h"
- #include <gst/video/video.h>
- #if USE_DRM
--- 
-2.7.4
-
diff --git a/package/gstreamer1/gst1-vaapi/0002-plugins-when-debug-disabled-default-category-is-NULL.patch b/package/gstreamer1/gst1-vaapi/0002-plugins-when-debug-disabled-default-category-is-NULL.patch
deleted file mode 100644
index 0d83c5a..0000000
--- a/package/gstreamer1/gst1-vaapi/0002-plugins-when-debug-disabled-default-category-is-NULL.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 152217064f1192bb836620ad7eaadbc031624f4c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
- <vjaquez@igalia.com>
-Date: Mon, 20 Mar 2017 16:45:01 +0100
-Subject: [PATCH] plugins: when debug disabled, default category is NULL
-
-As in gstreamer-vaapi a common base class is used, the specific
-default category is passed to the base-plugin initializator, thus
-the log messages are categorized with the used plugin.
-
-Nonetheless, when the gst-debug is disabled in compilation time,
-it is needed to pass NULL to the base-plugin initializator. This
-patch does that.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=780302
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- gst/vaapi/gstvaapidecode.c   | 4 ++++
- gst/vaapi/gstvaapiencode.c   | 4 ++++
- gst/vaapi/gstvaapipostproc.c | 4 ++++
- gst/vaapi/gstvaapisink.c     | 4 ++++
- 4 files changed, 16 insertions(+)
-
-diff --git a/gst/vaapi/gstvaapidecode.c b/gst/vaapi/gstvaapidecode.c
-index 407e25b..c2bb42a 100644
---- a/gst/vaapi/gstvaapidecode.c
-+++ b/gst/vaapi/gstvaapidecode.c
-@@ -49,7 +49,11 @@
- #define GST_VAAPI_DECODE_FLOW_PARSE_DATA        GST_FLOW_CUSTOM_SUCCESS_2
- 
- GST_DEBUG_CATEGORY_STATIC (gst_debug_vaapidecode);
-+#ifndef GST_DISABLE_GST_DEBUG
- #define GST_CAT_DEFAULT gst_debug_vaapidecode
-+#else
-+#define GST_CAT_DEFAULT NULL
-+#endif
- 
- #define GST_VAAPI_DECODE_PARAMS_QDATA \
-   g_quark_from_static_string("vaapidec-params")
-diff --git a/gst/vaapi/gstvaapiencode.c b/gst/vaapi/gstvaapiencode.c
-index dd60901..b0f0a32 100644
---- a/gst/vaapi/gstvaapiencode.c
-+++ b/gst/vaapi/gstvaapiencode.c
-@@ -38,7 +38,11 @@
- #define GST_VAAPI_ENCODE_FLOW_CONVERT_ERROR     GST_FLOW_CUSTOM_ERROR_1
- 
- GST_DEBUG_CATEGORY_STATIC (gst_vaapiencode_debug);
-+#ifndef GST_DISABLE_GST_DEBUG
- #define GST_CAT_DEFAULT gst_vaapiencode_debug
-+#else
-+#define GST_CAT_DEFAULT NULL
-+#endif
- 
- G_DEFINE_ABSTRACT_TYPE_WITH_CODE (GstVaapiEncode,
-     gst_vaapiencode, GST_TYPE_VIDEO_ENCODER,
-diff --git a/gst/vaapi/gstvaapipostproc.c b/gst/vaapi/gstvaapipostproc.c
-index f4ddbb5..d45f7ee 100644
---- a/gst/vaapi/gstvaapipostproc.c
-+++ b/gst/vaapi/gstvaapipostproc.c
-@@ -49,7 +49,11 @@
- #define GST_PLUGIN_DESC "A VA-API video postprocessing filter"
- 
- GST_DEBUG_CATEGORY_STATIC (gst_debug_vaapipostproc);
-+#ifndef GST_DISABLE_GST_DEBUG
- #define GST_CAT_DEFAULT gst_debug_vaapipostproc
-+#else
-+#define GST_CAT_DEFAULT NULL
-+#endif
- 
- /* Default templates */
- /* *INDENT-OFF* */
-diff --git a/gst/vaapi/gstvaapisink.c b/gst/vaapi/gstvaapisink.c
-index cca71d9..9cc5154 100644
---- a/gst/vaapi/gstvaapisink.c
-+++ b/gst/vaapi/gstvaapisink.c
-@@ -59,7 +59,11 @@
- #define GST_PLUGIN_DESC "A VA-API based videosink"
- 
- GST_DEBUG_CATEGORY_STATIC (gst_debug_vaapisink);
-+#ifndef GST_DISABLE_GST_DEBUG
- #define GST_CAT_DEFAULT gst_debug_vaapisink
-+#else
-+#define GST_CAT_DEFAULT NULL
-+#endif
- 
- /* Default template */
- /* *INDENT-OFF* */
--- 
-2.6.2
-
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 5409c2e..977b188 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.4.tar.xz.sha256sum
-sha256 03e690621594d9f9495d86c7dac8b8590b3a150462770ed070dc76f66a70de75  gstreamer-vaapi-1.10.4.tar.xz
+# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.0.tar.xz.sha256sum
+sha256 4a1a5a174b3d3a76ce6c123203e7ee535a347d77f9d4f4ffaf69bfbbfeb03ddb  gstreamer-vaapi-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 8cb51bf..e92d758 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.10.4
+GST1_VAAPI_VERSION = 1.12.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.10.2
