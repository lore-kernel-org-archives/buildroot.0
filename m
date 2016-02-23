From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:18:42 +0100
Subject: [Buildroot] [git commit] qt53d: enable assimpsceneparser plugin
Message-ID: <20160302202756.930507FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0a1fc98477f5c81a41ee3e563a8ce71ef4c92a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add hint to help text
- add assimp dependency
- always install the gltf (and any future) sceneparser to target.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: update commit message as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt53d/Config.in | 2 ++
 package/qt5/qt53d/qt53d.mk  | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index b2d2912..ff50204 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_QT53D
 
 	  This package corresponds to the qt53d module.
 
+	  Enable the assimp package to gain the assimp sceneparser plugin.
+
 	  http://doc.qt.io/qt-5/qt3d-index.html
 
 comment "qt53d module needs an OpenGL-capable backend"
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 810242b..24c42e6 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -10,6 +10,10 @@ QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_ASSIMP),y)
+QT53D_DEPENDENCIES += assimp
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT53D_LICENSE = GPLv2+ or LGPLv3
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.LGPLv3
@@ -34,6 +38,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define QT53D_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
 endef
 endif
