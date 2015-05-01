From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:19 +0200
Subject: [Buildroot] [git commit] qt5base: fix "Unable to find an X11
	visual" error
Message-ID: <20150501205734.6B76481DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e9f459adf22ac3a1b1def8f1c10df69b1e7f246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix "Unable to find an X11 visual" bug that produce at runtime with Vivante
drivers. Add a conditionnal patch and add variable QT5BASE_EXTRA_CFLAGS in
order to enable workaround.

This patch is actually an improvement over the fix available in Yocto:
https://github.com/Freescale/meta-fsl-arm/blob/dizzy/qt5-layer/recipes-qt/qt5/qtbase/Force_egl_visual_ID_33.patch

[Thomas:
 - Add SoB from J??r??me Pouiller inside the patch imported from Yocto.
 - Add a space between $(TARGET_CFLAGS) and $(QT5BASE_EXTRA_CFLAGS),
   and ditto for CXXFLAGS.
 - Merge the QT5BASE_EXTRA_CFLAGS into an existing
   BR2_PACKAGE_GPU_VIV_BIN_MX6Q conditional.]

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  |   27 ++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |    5 ++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch b/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
new file mode 100644
index 0000000..c21775f
--- /dev/null
+++ b/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
@@ -0,0 +1,27 @@
+Workaround EGL initialization failure due visual mismatch
+
+Error:
+
+Warning: EGL suggested using X Visual ID 33 (RGB888) for EGL config 28 (RGB444), but this is incompatable
+Unable to find an X11 visual which matches EGL config 28
+Could not initialize EGL
+Aborted
+
+Upstream-Status: Inappropriate [workaround]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
+
+diff -Naur qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp
+--- qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:08:42.163895341 -0800
++++ qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:09:37.207893799 -0800
+@@ -180,5 +180,9 @@
+     }
+ 
+     qWarning("Unable to find an X11 visual which matches EGL config %d", configId);
++#ifdef ENABLE_MX6_WORKAROUND
++    return (VisualID)33;
++#else
+     return (VisualID)0;
++#endif
+ }
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 032ebed..3de824f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -116,6 +116,7 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
+QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
 endif
@@ -187,8 +188,8 @@ define QT5BASE_CONFIGURE_CMDS
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
 		-device-option BR_CCACHE="$(CCACHE)" \
-		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
-		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
+		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
