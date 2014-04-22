From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:50 +0200
Subject: [Buildroot] [PATCH v2 18/24] opencv: add jasper support
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-19-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- reword the option help text (Yann)
---
 package/opencv/Config.in | 7 +++++++
 package/opencv/opencv.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 0db239e..2f47869 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -161,6 +161,13 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	select BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_JASPER
+	bool "jpeg2000 support"
+	select BR2_PACKAGE_JASPER
+	help
+	  Use shared libjasper from the target system to provide support
+	  for jpeg2000.
+
 config BR2_PACKAGE_OPENCV_WITH_JPEG
 	bool "jpeg support"
 	select BR2_PACKAGE_JPEG
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index e6de252..c4aa967 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -185,6 +185,13 @@ else
 OPENCV_CONF_OPT += -DWITH_GTK=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
+OPENCV_CONF_OPT += -DWITH_JASPER=ON
+OPENCV_DEPENDENCIES += jasper
+else
+OPENCV_CONF_OPT += -DWITH_JASPER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
 OPENCV_CONF_OPT += -DWITH_JPEG=ON
 OPENCV_DEPENDENCIES += jpeg
-- 
1.9.2
