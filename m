From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix alsa-lib dependency
Message-ID: <20100726225418.34C5A834AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cf75bd278968a7dca0d01dcd3f5885cbe3c74d39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PACKAGE_QT_AUDIO_BACKEND=y, QtMultimedia requires the audio backend
to be already in staging in order to compile.
The backend is system-dependent, but since buildroot builds Linux systems
only, it is safe to assume that the it will always be ALSA.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.1
