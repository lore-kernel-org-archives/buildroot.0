From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:53:54 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] qt5base: Qt KMS support
 does not depend on opengl
Message-ID: <20181024155209.4810388D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eb45c226c813ff8b9886e704b5e57f26884a26f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Qt KMS support should not explicitly depend on the availability of opengl.
Don't explicitly disable KMS if opengl is not available and fallback to
detecting if libdrm is available before disabling kms.

The scenario where this is necessary involves using the Qt linuxfb backend
"dumb buffer" support via the DRM API.  This is new in Qt 5.9 [1] and only
requires KMS, but not opengl. Although on Qt 5.6, only eglfs actually
uses libdrm/kms, it doesn't hurt to add the dependency and the -kms
option there as well, and doing so keeps the logic in the .mk file
simple.

[1] http://doc.qt.io/qt-5/embedded-linux.html#linuxfb

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f91ea94a6f4d1387b062f9f09c98badf0766127f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ab2b883fc4..2b6fd39267 100644
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
