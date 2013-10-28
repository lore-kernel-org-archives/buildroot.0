From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 10:09:23 +0100
Subject: [Buildroot] [git commit] qt5base: add tslib plugin
Message-ID: <20131028091113.9B16A9BA43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5986cb4163590082081aeb2fb186baab94cd4802
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Tslib plugin.

[Peter: propagate !static dependency / add comment]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in  |   10 ++++++++++
 package/qt5/qt5base/qt5base.mk |    3 +++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e433373..83f17e3 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -185,4 +185,14 @@ config BR2_PACKAGE_QT5BASE_ICU
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
+config BR2_PACKAGE_QT5BASE_TSLIB
+	bool "Enable Tslib support"
+	depends on !BR2_PREFER_STATIC_LIB # dlopen
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0106c2c..ce78d31 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -128,6 +128,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),-tslib,-no-tslib)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
