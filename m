From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 13 Feb 2018 09:46:06 -0700
Subject: [Buildroot] [PATCH v3] qt5base: Qt KMS support does not depend on
 opengl
Message-ID: <1518540366-13393-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt KMS support should not explicitly depend on the availability of opengl.
Don't explicitly disable KMS if opengl is not available and fallback to
detecting if libdrm is available before disabling kms.

The scenario where this is necessary involves using the Qt linuxfb backend
"dumb buffer" support via the DRM API.  This is new in Qt 5.9 [1] and only
requires KMS, but not opengl.

[1] http://doc.qt.io/qt-5/embedded-linux.html#linuxfb

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

---

v3:
- Reorganize libdrm/egl make condition to be more clear.

v2:
- If libdrm is configured, make it an explicit dependency.
---
 package/qt5/qt5base/qt5base.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c79..644852d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -35,12 +35,19 @@ endif
 
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT5BASE_CONFIGURE_OPTS += -kms
+QT5BASE_DEPENDENCIES += libdrm
+else
+QT5BASE_CONFIGURE_OPTS += -no-kms
+endif
+
 # Uses libgbm from mesa3d
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-QT5BASE_CONFIGURE_OPTS += -kms -gbm
+QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += mesa3d
 else
-QT5BASE_CONFIGURE_OPTS += -no-kms
+QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
2.7.4
