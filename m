From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  8 Feb 2018 20:22:36 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webengine: fix build issue with alsa
Message-ID: <20180209012236.5118-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt WebEngine auto-guesses if it compiles support for alsa. When the
alsa-lib config is enabled but the features mixer, rawmidi, hwdep and
seq are not also enabled, it leads to a build failure.

Lets the developer decide whether or not support for alsa in Qt
WebEngine by adding the new config BR2_PACKAGE_QT5WEBENGINE_ALSA that
selects the features it needs when it is set.

Fixes [1].

[1]: http://autobuild.buildroot.net/results/d81537a8f67bb0a3625057560b2f16daf4828f98/build-end.log

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webengine/Config.in       | 10 ++++++++++
 package/qt5/qt5webengine/qt5webengine.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index d0c8d18210..387ce0a76e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -81,4 +81,14 @@ config BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS
 	  which includes required proprietary audio and video codecs,
 	  such as H.264 and MPEG layer-3 (MP3).
 
+config BR2_PACKAGE_QT5WEBENGINE_ALSA
+	bool "alsa"
+	depends on BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+	help
+	  Enable ALSA support.
+
 endif
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 96dd401c6c..344ecc514b 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -28,6 +28,12 @@ ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
 QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
 endif
 
+ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
+QT5WEBENGINE_DEPENDENCIES += alsa-lib
+else
+QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
+endif
+
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-- 
2.15.1
