From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 23:45:38 +0100
Subject: [Buildroot] [git commit] qt5webengine: fix build issue with alsa
Message-ID: <20180219224647.AC84D8803C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=737278c2ccb607c4a5a8b3bb0d817c25a2dc2602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt WebEngine auto-guesses if it compiles support for alsa. When the
alsa-lib config is enabled but the features mixer, rawmidi, hwdep and
seq are not also enabled, it leads to a build failure.

Lets the developer decide whether or not support for alsa in Qt
WebEngine by adding the new config BR2_PACKAGE_QT5WEBENGINE_ALSA that
selects the features it needs when it is set.

Fixes [1].

[1]: http://autobuild.buildroot.net/results/d81537a8f67bb0a3625057560b2f16daf4828f98/build-end.log

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webengine/Config.in       | 10 ++++++++++
 package/qt5/qt5webengine/qt5webengine.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index d0c8d18210..7c99255061 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -81,4 +81,14 @@ config BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS
 	  which includes required proprietary audio and video codecs,
 	  such as H.264 and MPEG layer-3 (MP3).
 
+config BR2_PACKAGE_QT5WEBENGINE_ALSA
+	bool "alsa"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+	help
+	  Enable ALSA support.
+
 endif
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 365d7d5a17..4d423f8329 100644
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
