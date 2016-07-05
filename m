From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:43:57 +0200
Subject: [Buildroot] [git commit] qt5base: Enable KMS and GBM if Mesa 3D
	provides EGL
Message-ID: <20160705104424.06765821AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e2fdc14a1317d52d57f97d83ffb2651b05431cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 783cf3c..bf541b0 100644
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
