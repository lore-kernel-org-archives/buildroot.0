From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:34 +0200
Subject: [Buildroot] [PATCH v5 08/13] package/opencv: add gstreamer-1.x
	support
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
and Gstreamer-1, but only one can be enabled at the same time (OpenCV
uses Gstreamer-1 when available).

Since Buildroot allows both Gstreamer versions to co-exist, the
configure options and dependencies are set to reflect the OpenCV
preference.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v4->v5:
- rebase
- rework gst-X backend selection (use similar structure for qt)
- remove patch merged upstream

changes v3->v4:
- new patch
---
 package/opencv/Config.in | 34 ++++++++++++++++++++++++++--------
 package/opencv/opencv.mk |  9 +++++++--
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index db950f4..55e7580 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -170,17 +170,35 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	  Use ffmpeg from the target system.
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer support"
-	depends on BR2_USE_MMU # gstreamer -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
-	select BR2_PACKAGE_GSTREAMER
+	bool "gstreamer backend support"
+	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_OPENCV_GSTREAMER_BACKEND  if BR2_PACKAGE_GSTREAMER && \
+		!BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_OPENCV_GSTREAMER1_BACKEND if BR2_PACKAGE_GSTREAMER1
+	help
+	  Enable Gstreamer support for OpenCV.
+
+	  This uses whatever Gstreamer version you enabled: Gstreamer-0.10
+	  or Gstreamer-1.
+
+	  If both Gstreamer version are enable, only Gstreamer-1 will be
+	  used by OpenCV.
+
+config BR2_PACKAGE_OPENCV_GSTREAMER_BACKEND
+	bool
+	# no need to select gstreamer
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+config BR2_PACKAGE_OPENCV_GSTREAMER1_BACKEND
+	bool
+	# no need to select gstreamer1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer backend needs either Gstreamer-0.10 or Gstreamer-1"
+	depends on !BR2_PACKAGE_GSTREAMER && !BR2_PACKAGE_GSTREAMER1
+	depends on BR2_USE_MMU # gstreamer -> libglib2
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index aa972dc..6162d1e 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -211,10 +211,15 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
+OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
+endif
 else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-- 
2.4.2
