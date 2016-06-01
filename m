From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Wed,  1 Jun 2016 12:38:09 +0900
Subject: [Buildroot] [PATCH 1/1] qt5base: Enable KMS and GBM if Mesa 3D
	provides EGL
In-Reply-To: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160601033811.6031-2-akihiko.odaki.4i@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
---
 package/qt5/qt5base/qt5base.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9ff7af1..3378804 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -20,7 +20,6 @@ QT5BASE_INSTALL_STAGING = YES
 #    want to use the one packaged in Buildroot
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
-	-no-kms \
 	-no-cups \
 	-no-nis \
 	-no-iconv \
@@ -29,6 +28,14 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+# Uses libgbm from mesa3d
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+QT5BASE_CONFIGURE_OPTS += -kms -gbm
+QT5BASE_DEPENDENCIES += mesa3d
+else
+QT5BASE_CONFIGURE_OPTS += -no-kms
+endif
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 QT5BASE_CONFIGURE_OPTS += -debug
 else
-- 
2.8.3
