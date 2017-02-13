From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Feb 2017 23:34:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5base: use system/buildroot provided
	freetype
Message-ID: <20170213223455.9915-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select (and use) builroot provided freetype in case qt5base gui is
selected (gui without freetype/font support makes not much sense
and gives compile errors).

Qt 5.6 needs some support to find the include headers, 5.8 is
clever enough inherently.

Fixes [1] (by avoiding the build-in freetype library which depends
on avtivated libpng support):

  Project ERROR: Library 'libpng' is not defined.
  make[3]: *** [sub-3rdparty-freetype-make_first] Error 3

[1] http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - updated patch description
 - checked and fixed for Qt 5.6
---
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index f22e034b3..337dcf245 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -128,6 +128,7 @@ config BR2_PACKAGE_QT5BASE_XML
 
 config BR2_PACKAGE_QT5BASE_GUI
 	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 09bf5cf7b..3825f5bcc 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -100,6 +100,11 @@ endif
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-system-freetype,-no-freetype)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/freetype2
+endif
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_GUI),freetype)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-- 
2.11.0
