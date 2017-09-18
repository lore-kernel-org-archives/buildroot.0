From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 18 Sep 2017 11:43:54 -0700
Subject: [Buildroot] [PATCH] qt5base: Qt KMS support does not depend on
	opengl
Message-ID: <1505760234-15705-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt KMS support should not explicitly depend on the availability of opengl.
Don't explicitly disable KMS if opengl is not available and allow Qt to auto
detect and built as necessary.

The scenario where this is necessary involves using the Qt linuxfb backend
"dumb buffer" support via the DRM API.  This is new in Qt 5.9 [1] and only
requires KMS, but not opengl.

[1] http://doc.qt.io/qt-5/embedded-linux.html#linuxfb

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/qt5/qt5base/qt5base.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0ca11a5..9e81af4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -39,8 +39,6 @@ QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_CONFIGURE_OPTS += -kms -gbm
 QT5BASE_DEPENDENCIES += mesa3d
-else
-QT5BASE_CONFIGURE_OPTS += -no-kms
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
2.7.4
