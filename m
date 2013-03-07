From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:39 +0100
Subject: [Buildroot] [PATCH 11/32] qt5base: add GUI support
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in  |   44 ++++++++++++++++++++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk |   29 +++++++++++++++++++++-----
 2 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 4cd6ce0..801ef6f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -53,4 +53,48 @@ config BR2_PACKAGE_QT5BASE_XML
 	help
 	  This options enables the Qt5Xml library.
 
+config BR2_PACKAGE_QT5BASE_GUI
+	bool "gui module"
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT5BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
+	       !BR2_PACKAGE_QT5BASE_XCB
+	help
+	  This option enables the Qt5Gui library.
+
+if BR2_PACKAGE_QT5BASE_GUI
+
+config BR2_PACKAGE_QT5BASE_WIDGETS
+	bool "widgets module"
+	help
+	  This option enables the Qt5Widgets library.
+
+config BR2_PACKAGE_QT5BASE_LINUXFB
+	bool "linuxfb support"
+
+config BR2_PACKAGE_QT5BASE_DIRECTFB
+	bool "directfb support"
+	select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_QT5BASE_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_WM
+
+comment "X.org XCB backend available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
+	bool "print support module"
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  This option enables the Qt5PrintSupport
+
+endif
+
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fd85c4d..cad7b8d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -20,13 +20,8 @@ QT5BASE_INSTALL_STAGING = YES
 #    want to use the one packaged in Buildroot
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
-	-no-linuxfb \
-	-no-xcb \
-	-no-directfb \
 	-no-eglfs \
 	-no-kms \
-	-no-gui \
-	-no-widgets \
 	-no-opengl \
 	-no-glib \
 	-no-cups \
@@ -61,6 +56,26 @@ QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
 endif
 
+# We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
+# is to add a link against the "inuxfb" library.
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
+
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5BASE_CONFIGURE_OPTS += -xcb
+QT5BASE_DEPENDENCIES   += \
+	libxcb \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xlib_libX11
+else
+QT5BASE_CONFIGURE_OPTS += -no-xcb
+endif
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
@@ -69,6 +84,10 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
+
 # Ideally, we could use -device-option to substitute variable values
 # in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
 # nicely support variable values that contain spaces. So we use the
-- 
1.7.9.5
