From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Feb 2017 18:40:08 +0100
Subject: [Buildroot] [PATCH v1] qt5base: select qt-libpng in case builtin
	freetype library is used
Message-ID: <20170209174008.22871-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  Project ERROR: Library 'libpng' is not defined.
  make[3]: *** [sub-3rdparty-freetype-make_first] Error 3

[1] http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 2cf0331b0..afe373123 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -149,7 +149,12 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
+ifeq ($(BR2_QT5_VERSION_5_6)$(BR2_PACKAGE_QT5BASE_FONTCONFIG),)
+# qt-5.8.0 freetype needs libpng support
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-qt-libpng)
+else
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
+endif
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
-- 
2.11.0
