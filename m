From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:43 +0100
Subject: [Buildroot] [PATCH 15/32] qt5base: add support for fontconfig, png,
	jpeg, gif
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in  |   26 ++++++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk |   12 ++++++++----
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e91c405..08e3c16 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -112,6 +112,32 @@ config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	help
 	  This option enables the Qt5PrintSupport
 
+config BR2_PACKAGE_QT5BASE_FONTCONFIG
+	bool "fontconfig support"
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This option enables Fontconfig and Freetype support using
+	  the system fontconfig and freetype2 libraries.
+
+config BR2_PACKAGE_QT5BASE_GIF
+	bool "GIF support"
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT5BASE_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option enables JPEG support using the system libjpeg
+	  library.
+
+config BR2_PACKAGE_QT5BASE_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This option enables PNG support using the system libpng
+	  library.
+
 endif
 
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index af6c578..e2f9d4e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -26,10 +26,6 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-nis \
 	-no-libudev \
 	-no-iconv \
-	-no-fontconfig \
-	-no-gif \
-	-no-libpng \
-	-no-libjpeg \
 	-no-icu \
 	-no-dbus \
 	-no-gstreamer \
@@ -89,6 +85,14 @@ endif
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),openssl)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
-- 
1.7.9.5
