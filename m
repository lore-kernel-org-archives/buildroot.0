From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 12:25:52 +0200
Subject: [Buildroot] [git commit] qt5webkit: select libXrender if xcb is
	enabled
Message-ID: <20130918102655.558919B7D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a252d6f4c7b9bc122d6461b3db3f703f5fe1aeea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also add libXext]
Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5webkit/Config.in    |    2 ++
 package/qt5/qt5webkit/qt5webkit.mk |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 48b5125..9eb5ef8 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	help
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index b51f5c5..c95f3b4 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -21,6 +21,10 @@ QT5WEBKIT_LICENSE = Commercial license
 QT5WEBKIT_REDISTRIBUTE = NO
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
+endif
+
 define QT5WEBKIT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
