From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Feb 2017 12:32:01 +0100
Subject: [Buildroot] [PATCH v3 2/3] qt5base: use system/buildroot provided
	freetype
In-Reply-To: <20170218113202.14213-1-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
Message-ID: <20170218113202.14213-2-ps.report@gmx.net>
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
on activated libpng support):

  Project ERROR: Library 'libpng' is not defined.
  make[3]: *** [sub-3rdparty-freetype-make_first] Error 3

[1] http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v2 -> v3:
  - fix typo in patch description s/avtivated/activated (Arnout Vandecappelle)
  - group freetype related options into ifeq and only set freetype include path
    in case GUI is selected (Arnout Vandecappelle)
  - add Reviewed-by: Arnout Vandecappelle

Changes v1 -> v2:
 - updated patch description
 - checked and fixed for Qt 5.6
---
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index 582421ac5..78db08ce4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -97,7 +97,13 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
+ifeq ($(BR2_PACKAGE_QT5BASE_GUI),y)
+QT5BASE_CONFIGURE_OPTS += -gui -system-freetype
+QT5BASE_CONFIGURE_OPTS +=  $(if $(BR2_PACKAGE_QT5_VERSION_5_6),-I$(STAGING_DIR)/usr/include/freetype2)
+QT5BASE_DEPENDENCIES += freetype
+else
+QT5BASE_CONFIGURE_OPTS += -no-gui -no-freetype
+endif
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
-- 
2.11.0
