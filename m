From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 17 Sep 2013 11:53:09 +0200
Subject: [Buildroot] [PATCH v1] Fix EGL support in qt5base
In-Reply-To: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
References: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
Message-ID: <1379411589-8935-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For many EGL libraries, Qt5 need special instructions to compile correctly. 
This patch implement a more generic way to customize Qt5 compilation.

In add, it fix support for Rasberry Pi and Vivante GPUs.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

 You may try this patch. I have not yet added/tested support for Omap and 
 Mali, but it should work imx6.


 ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 --------------------
 package/qt5/qt5base/qt5base-mkspecs-files.patch    |    2 +-
 package/qt5/qt5base/qt5base.mk                     |   29 +++++++++++++++---
 3 files changed, 26 insertions(+), 37 deletions(-)
 delete mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch

diff --git a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
deleted file mode 100644
index a85a5aa..0000000
--- a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 588c60d0c3d11e79d19860fa62b03c935658d13a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 13 Jan 2013 14:36:48 +0100
-Subject: [PATCH qtbase] eglconvenience: add egl to CONFIG to get correct include
- paths
-
-The eglconvenience code includes <EGL/egl.h>. Therefore, it should get
-the appropriate EGL-specific include paths from QMAKE_INCDIR_EGL,
-otherwise the build might if the EGL library has its headers in
-special locations. In order to achieve this, we simply add the "egl"
-feature to the list of features imported by eglconvenience.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- .../eglconvenience/eglconvenience.pri              |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
-index 188eb1c..8996cea 100644
---- a/src/platformsupport/eglconvenience/eglconvenience.pri
-+++ b/src/platformsupport/eglconvenience/eglconvenience.pri
-@@ -5,6 +5,7 @@ contains(QT_CONFIG,egl) {
-     SOURCES += \
-         $$PWD/qeglconvenience.cpp \
-         $$PWD/qeglplatformcontext.cpp
-+    CONFIG += egl
- 
-     contains(QT_CONFIG,xlib) {
-         HEADERS += \
--- 
-1.7.9.5
-
diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
index bfa9c15..2669c2c 100644
--- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
@@ -52,7 +52,7 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 +QMAKE_LIBS             += -lrt -lpthread -ldl
 +
 +# device specific glue code
-+EGLFS_PLATFORM_HOOKS_SOURCES =
++include(qmake-extra-conf.conf)
 +
 +# Sanity check
 +deviceSanityCheckCompiler()
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1686dad..41d7dfa 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -99,8 +99,30 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
-	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
+define QT5BASE_EXTRA_OPTIONS
+EGLFS_PLATFORM_HOOKS_SOURCES = \
+	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp  \n\
+INCLUDEPATH += \
+	$(STAGING_DIR)/usr/include/interface/vcos/pthreads          \n
+endef
+else ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q)x$(BR2_PACKAGE_XORG7),yx)
+define QT5BASE_EXTRA_OPTIONS
+EGLFS_PLATFORM_HOOKS_SOURCES = \
+	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp   \n\
+QMAKE_CFLAGS += -DEGL_API_FB=1                                      \n\
+QMAKE_CXXFLAGS += -DEGL_API_FB=1                                    \n\
+QMAKE_LIBS_OPENGL_ES2 += -lEGL -lGAL                                \n\
+QMAKE_LIBS_OPENVG += -lEGL -lGAL                                    \n
+endef
+else ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q)x$(BR2_PACKAGE_XORG7),yxy)
+error("GPU_VIV_BIN_MX6Q + XORG7 + qt5 w/ eglfs is known to be broken.")
+define QT5BASE_EXTRA_OPTIONS
+# Notice this configuration is broken since eglvivante.h include    \n\
+# Xlib.h and Xlib.h defines tons of macros which conflict with Qt5  \n\
+# compilation                                                       \n\
+QMAKE_LIBS_OPENGL_ES2 += -lEGL -lGAL                                \n\
+QMAKE_LIBS_OPENVG += -lEGL -lGAL                                    \n
+endef
 endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
@@ -154,8 +176,7 @@ define QT5BASE_CONFIGURE_CMDS
 	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CFLAGS,$(TARGET_CFLAGS))
 	$(call QT5BASE_CONFIG_SET,BUILDROOT_COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
 	$(call QT5BASE_CONFIG_SET,BUILDROOT_INCLUDE_PATH,$(STAGING_DIR)/usr/include)
-	$(call QT5BASE_CONFIG_SET,EGLFS_PLATFORM_HOOKS_SOURCES, \
-		$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES))
+	printf '$(QT5BASE_EXTRA_OPTIONS)' > $(@D)/mkspecs/devices/linux-buildroot-g++/qmake-extra-conf.conf
 	(cd $(@D); \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
-- 
1.7.9.5
