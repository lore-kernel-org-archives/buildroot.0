From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Jul 2015 21:06:56 +0200
Subject: [Buildroot] [PATCH v7 2/7] package/opencv: add gstreamer-1.x support
In-Reply-To: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436036821-10073-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
and Gstreamer-1, but only one can be enabled at the same time (OpenCV
chooses Gstreamer-1 over Gstreamer-0.10 when both are available).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v6->v7:
- move gstreamer1 comment inside the choice (Yann)
- remove extra endif in opencv.mk (catched by Yann)

changes v5->v6:
- rebase
- use a choice

changes v4->v5:
- rebase
- update a/r/t tags
- rework gst-X backend selection (use similar structure for qt)
- remove patch merged upstream

changes v3->v4:
- new patch
---
 package/opencv/Config.in | 13 +++++++++++++
 package/opencv/opencv.mk | 13 ++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c3b7535..92a1306 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -194,6 +194,19 @@ comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
+	bool "gstreamer-1.x"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 endchoice
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 633c2bf..6b1a139 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -222,11 +222,18 @@ else
 OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER)$(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
-else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
+OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-- 
2.4.5
