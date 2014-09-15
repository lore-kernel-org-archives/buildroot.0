From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Sep 2014 21:01:27 -0400
Subject: [Buildroot] [PATCH] qt: add gst-plugins-base dependency to
	multimedia module
Message-ID: <1410742887-30344-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt Multimedia module requires libs and h-files installed
by gst-plugins-base.  This commit adds the depends-on gstreamer
and select gst-plugins-base, exactly like the existing logic
in the Qt Phonon module.

Fixes: http://autobuild.buildroot.net/results/389617c7c36dfe92b85d3a3db12a706ae092c73d/

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/qt/Config.in | 5 +++++
 package/qt/qt.mk     | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index da159b4..f824914 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -336,9 +336,14 @@ config BR2_PACKAGE_QT_XMLPATTERNS
 config BR2_PACKAGE_QT_MULTIMEDIA
 	bool "Multimedia Module"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  Build QtMultimedia module.
 
+comment "Multimedia module needs gstreamer and gui support"
+	depends on !(BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_QT_GUI_MODULE)
+
 config BR2_PACKAGE_QT_AUDIO_BACKEND
 	bool "QtMultimedia Audio backend"
 	depends on BR2_PACKAGE_QT_MULTIMEDIA
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 92a090f..709e532 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -544,6 +544,7 @@ QT_INSTALL_LIBS    += QtSql
 endif
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
 QT_INSTALL_LIBS    += QtMultimedia
+QT_DEPENDENCIES    += gstreamer gst-plugins-base
 endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_INSTALL_LIBS    += phonon
-- 
1.9.1
