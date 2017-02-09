From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Feb 2017 23:30:54 +0100
Subject: [Buildroot] [PATCH v1 1/2] qt5base: use system/buildroot provided
	freetype
Message-ID: <20170209223055.31121-1-ps.report@gmx.net>
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
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 2 ++
 2 files changed, 3 insertions(+)

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
index 2cf0331b0..07803e776 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -100,6 +100,8 @@ endif
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-system-freetype,-no-freetype)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_GUI),freetype)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-- 
2.11.0
