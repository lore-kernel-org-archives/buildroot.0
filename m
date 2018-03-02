From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  2 Mar 2018 20:34:37 +0100
Subject: [Buildroot] [Patch next v2 3/3] qt5multimedia: fix Qt5.10.1 target
 installation
In-Reply-To: <20180302193437.15573-1-ps.report@gmx.net>
References: <20180302193437.15573-1-ps.report@gmx.net>
Message-ID: <20180302193437.15573-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  cp: cannot stat ?.../host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libqgsttools*.so.*?: No such file or directory

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update descripton (add missing compile error line)
  - move !BR2_PACKAGE_QT5_VERSION_LATEST dependency to the right
    if scope
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 6120403f30..e2210817c1 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -48,7 +48,9 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+# since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
+# and is installed by the default target install step below
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
@@ -59,7 +61,7 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
 	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
 endef
-endif
+endif # !BR2_STATIC_LIBS
 
 # this is only built with quick/opengl support enabled
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_GL_AVAILABLE),yy)
-- 
2.16.2
