From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:41:08 +0100
Subject: [Buildroot] [git commit] package/opencv3: remove qt backend option
Message-ID: <20190206145216.DBD217F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a3fdaebd960a15f3d9fd514a6325d154a9c539d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qt backend option uses the obsolete qt4 package, which we are about to
remove, so remove the qt backend option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy           |  6 ++++++
 package/opencv3/Config.in  | 16 +---------------
 package/opencv3/opencv3.mk | 11 ++---------
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cdf5f989b5..67e3b0dc70 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_QT
+	bool "opencv3 qt backend option removed"
+	select BR2_LEGACY
+	help
+	  The opencv3 qt backend option was removed.
+
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "opencv qt backend option removed"
 	select BR2_LEGACY
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 80a297a904..61405a7c64 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -82,20 +82,6 @@ comment "gtk3 support needs libgtk3"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_LIBGTK3
 
-config BR2_PACKAGE_OPENCV3_WITH_QT
-	bool "qt4"
-	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_STL
-	select BR2_PACKAGE_QT_GUI_MODULE
-	select BR2_PACKAGE_QT_TEST
-	help
-	  Use Qt4 with QtTest and QtGui modules and STL support, as
-	  GUI toolkit.
-
-comment "qt4 support needs qt"
-	depends on BR2_USE_MMU # qt
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
-
 config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
 	depends on BR2_PACKAGE_QT5
@@ -108,7 +94,7 @@ config BR2_PACKAGE_OPENCV3_WITH_QT5
 	  components, as GUI toolkit.
 
 comment "qt5 support needs qt5"
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_QT5
 
 endchoice
 
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 978f38c143..3a2594b584 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -288,18 +288,11 @@ else
 OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT)$(BR2_PACKAGE_OPENCV3_WITH_QT5),)
-OPENCV3_CONF_OPTS += -DWITH_QT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT),y)
-OPENCV3_CONF_OPTS += -DWITH_QT=4
-OPENCV3_DEPENDENCIES += qt
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
 OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
+else
+OPENCV3_CONF_OPTS += -DWITH_QT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TIFF),y)
