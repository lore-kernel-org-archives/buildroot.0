From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:39 +0100
Subject: [Buildroot] [PATCH 6/7] package/qt5: generalize the condition on
 which EGLFS KMS gets supported
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-7-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_HAS_LIBEGL indicates that the virtual libegl packet is
enabled. This packet may be provided by mesa3d (this is actually what
happens when selecting BR2_PACKAGE_MESA3D_OPENGL_EGL) but
other providers may exist.

Generalize the condition on which EGLFS KMS support is added to Qt5 to
allow rockchip-mali-bifrost (and potentially other) to use the KMS
back-end.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 8803a4821e..ad01c7c843 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -295,7 +295,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
 endif
 ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
-- 
2.20.1
