From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:05 +0200
Subject: [Buildroot] [PATCH/RFC v2 06/44] package/kodi: Rework audio encoder
	support
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make option BR2_PACKAGE_KODI_OPTICALDRIVE invisible, it is only
needed when an audio encoder addon is enabled.

Add Kconfig submenu for audio encoders to prepare for addition of
more binary addons.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/Config.in   |    1 +
 package/kodi-audioencoder-lame/Config.in   |    1 +
 package/kodi-audioencoder-vorbis/Config.in |    1 +
 package/kodi-audioencoder-wav/Config.in    |    1 +
 package/kodi/Config.in                     |   20 +++++++-------------
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi-audioencoder-flac/Config.in
index 799f9c5..95acbba 100644
--- a/package/kodi-audioencoder-flac/Config.in
+++ b/package/kodi-audioencoder-flac/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_AUDIOENCODER_FLAC
 	bool "kodi-audioencoder-flac"
 	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_KODI_OPTICALDRIVE
 	select BR2_PACKAGE_LIBOGG
 	help
 	  An audioencoder addon for Kodi
diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi-audioencoder-lame/Config.in
index be00296..dc6a0cd 100644
--- a/package/kodi-audioencoder-lame/Config.in
+++ b/package/kodi-audioencoder-lame/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIOENCODER_LAME
 	bool "kodi-audioencoder-lame"
+	select BR2_PACKAGE_KODI_OPTICALDRIVE
 	select BR2_PACKAGE_LAME
 	help
 	  An audioencoder addon for Kodi
diff --git a/package/kodi-audioencoder-vorbis/Config.in b/package/kodi-audioencoder-vorbis/Config.in
index ab8b4b3..8b84626 100644
--- a/package/kodi-audioencoder-vorbis/Config.in
+++ b/package/kodi-audioencoder-vorbis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS
 	bool "kodi-audioencoder-vorbis"
+	select BR2_PACKAGE_KODI_OPTICALDRIVE
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	help
diff --git a/package/kodi-audioencoder-wav/Config.in b/package/kodi-audioencoder-wav/Config.in
index 6813f02..6bdbb9a 100644
--- a/package/kodi-audioencoder-wav/Config.in
+++ b/package/kodi-audioencoder-wav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_AUDIOENCODER_WAV
 	bool "kodi-audioencoder-wav"
+	select BR2_PACKAGE_KODI_OPTICALDRIVE
 	help
 	  An audioencoder addon for Kodi
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7d4b068..f182fbf 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -247,20 +247,14 @@ config BR2_PACKAGE_KODI_WAVPACK
 	  Select this if you want to play back WV files.
 
 config BR2_PACKAGE_KODI_OPTICALDRIVE
-	bool "optical drive"
-	help
-	  Enable support for optical drives
-
-if BR2_PACKAGE_KODI_OPTICALDRIVE
-
-comment "Kodi audioencoder addons"
-
-source "package/kodi-audioencoder-flac/Config.in"
-source "package/kodi-audioencoder-lame/Config.in"
-source "package/kodi-audioencoder-vorbis/Config.in"
-source "package/kodi-audioencoder-wav/Config.in"
+	bool
 
-endif # BR2_PACKAGE_KODI_OPTICALDRIVE
+menu "Audio encoder addons"
+	source "package/kodi-audioencoder-flac/Config.in"
+	source "package/kodi-audioencoder-lame/Config.in"
+	source "package/kodi-audioencoder-vorbis/Config.in"
+	source "package/kodi-audioencoder-wav/Config.in"
+endmenu
 
 comment "Kodi PVR addons"
 
-- 
1.7.10.4
