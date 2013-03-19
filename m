From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:37 +0100
Subject: [Buildroot] [PATCH v4 04/21] qt5base: add D-Bus support
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in  |    8 ++++++++
 package/qt5/qt5base/qt5base.mk |    6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 8b0291b..d313db9 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -132,4 +132,12 @@ config BR2_PACKAGE_QT5BASE_PNG
 
 endif
 
+config BR2_PACKAGE_QT5BASE_DBUS
+	bool "DBus module"
+	select BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  This option enables the D-Bus module.
+
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 65fe451..62f0b9a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -27,7 +27,6 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-libudev \
 	-no-iconv \
 	-no-icu \
-	-no-dbus \
 	-no-gstreamer \
 	-no-gtkstyle \
 	-system-zlib \
@@ -93,6 +92,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
@@ -105,6 +107,8 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
+
 # Ideally, we could use -device-option to substitute variable values
 # in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
 # nicely support variable values that contain spaces. So we use the
-- 
1.7.9.5
