From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Oct 2020 17:02:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add webp support
Message-ID: <20201018150211.1299636-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webp support is available since version 3.0.0 and
https://github.com/opencv/opencv/commit/500b7318beee639d8c341e9ea63ac7610ca225f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/Config.in  | 8 ++++++++
 package/opencv3/opencv3.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index ac7da67c5f..b9ea033f13 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -312,6 +312,14 @@ config BR2_PACKAGE_OPENCV3_WITH_V4L
 	  If the package libv4l is enabled, its support is
 	  automatically enabled.
 
+config BR2_PACKAGE_OPENCV3_WITH_WEBP
+	bool "webp support"
+	select BR2_PACKAGE_WEBP
+	help
+	  Enable WebP support.
+
+	  Use shared libwebp from the target system.
+
 comment "Install options"
 
 config BR2_PACKAGE_OPENCV3_INSTALL_DATA
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index c67387e114..8cd28cbf0c 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -223,7 +223,6 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_VA=OFF \
 	-DWITH_VA_INTEL=OFF \
 	-DWITH_VTK=OFF \
-	-DWITH_WEBP=OFF \
 	-DWITH_XINE=OFF
 
 OPENCV3_DEPENDENCIES += host-pkgconf zlib
@@ -318,6 +317,13 @@ else
 OPENCV3_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_WEBP),y)
+OPENCV3_CONF_OPTS += -DWITH_WEBP=ON
+OPENCV3_DEPENDENCIES += webp
+else
+OPENCV3_CONF_OPTS += -DWITH_WEBP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_PYTHON),y)
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
-- 
2.28.0
