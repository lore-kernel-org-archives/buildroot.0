From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Wed, 21 Jul 2010 23:20:59 +0200
Subject: [Buildroot] [PATCH] qt: fix alsa-lib dependency
Message-ID: <1279747259-10054-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

If BR2_PACKAGE_QT_AUDIO_BACKEND=y, QtMultimedia requires the audio backend
to be already in staging in order to compile.
The backend is system-dependent, but since buildroot builds Linux systems
only, it is safe to assume that the it will be always ALSA.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/Config.in |    3 ++-
 package/qt/qt.mk     |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index b09d642..93a8ab1 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -311,8 +311,9 @@ config BR2_PACKAGE_QT_MULTIMEDIA
 config BR2_PACKAGE_QT_AUDIO_BACKEND
 	bool "QtMultimedia Audio backend"
 	depends on BR2_PACKAGE_QT_MULTIMEDIA
+	select BR2_PACKAGE_ALSA_LIB
 	help
-	  Build the platform audio backend into QtMultimedia if available
+	  Build the ALSA audio backend into QtMultimedia
 
 config BR2_PACKAGE_QT_SVG
 	bool "SVG Module"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 864e79b..baf6539 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -312,6 +312,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
 QT_CONFIGURE+= -audio-backend
+QT_DEP_LIBS+=alsa-lib
 else
 QT_CONFIGURE+= -no-audio-backend
 endif
-- 
1.5.4.3
