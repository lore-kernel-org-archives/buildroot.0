From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 28 Jul 2015 11:06:25 +0200
Subject: [Buildroot] [PATCH] qt5base/gpu_vivante: Fix activation of visualID
	workaround
Message-ID: <1438074385-6443-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-Force_egl_visual_ID_33.patch have to be enabled as soon as gpu_vivante/xorg
is used. This does not depends on eglfs option.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/qt5/qt5base/qt5base.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 6f0f526..753b069 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -118,12 +118,13 @@ endif
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
-QT5BASE_CONFIGURE_OPTS += -eglfs
-QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
 endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
+QT5BASE_CONFIGURE_OPTS += -eglfs
+QT5BASE_DEPENDENCIES   += libegl
 else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
-- 
2.1.4
