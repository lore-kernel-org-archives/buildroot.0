From: Nathan Ford <nford@westpond.com>
Date: Fri, 28 Feb 2020 12:05:39 -0500
Subject: [Buildroot] [PATCH v3 1/2] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
Message-ID: <1582909540-10901-1-git-send-email-nford@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5engine also now requires webp mux support or the auto
detection will fail.

This patch is based on the suggested fix, and fixes, Bug #12416

Signed-off-by: Nathan Ford <nford@westpond.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/Config.in       |  1 +
 package/qt5/qt5webengine/qt5webengine.mk | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 0e776ec..18e4418 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	select BR2_PACKAGE_QT5BASE_DBUS
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 8987259..3824738 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -30,17 +30,35 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 endif
 
+# As of qt 5.10 these options are handled as arguments to qmake instead of defines
+# The -- is needed to separate qmake options from config options
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WEBENGINE_QMAKEFLAGS = --
+endif
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WEBENGINE_QMAKEFLAGS += -webengine-ffmpeg
+else
 QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
+endif
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WEBENGINE_QMAKEFLAGS += -webengine-proprietary-codecs
+else
 QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
 QT5WEBENGINE_DEPENDENCIES += alsa-lib
 else
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WEBENGINE_QMAKEFLAGS += -no-webengine-alsa
+else
 QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
 endif
+endif
 
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
-- 
2.7.4
