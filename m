From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:59:03 +0200
Subject: [Buildroot] [git commit] opencv: add jasper support
Message-ID: <20140716210452.E91609D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cff18c2f347a46fb996808b6ac439e2a222aa189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: adjust Config.in help text as suggested by Yann E. Morin.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   10 ++++++++++
 package/opencv/opencv.mk |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8d9599f..bec9b9e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -161,6 +161,16 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	select BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_JASPER
+	bool "jpeg2000 support"
+	select BR2_PACKAGE_JASPER
+	help
+	  Enable jpeg2000 support.
+
+	  Note: this does not use the libjasper bundled with opencv,
+	  but uses the libjasper package installed system-wide by
+	  Buildroot.
+
 config BR2_PACKAGE_OPENCV_WITH_JPEG
 	bool "jpeg support"
 	select BR2_PACKAGE_JPEG
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index c3a6bea..1341d32 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -184,6 +184,13 @@ else
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
