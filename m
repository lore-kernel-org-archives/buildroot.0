From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi: Rework audio
	encoder support
Message-ID: <20150808105650.704AE7F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81c438aa207e8fdea776ae946a4d2d3f57cc143f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Make option BR2_PACKAGE_KODI_OPTICALDRIVE invisible, it is only
needed when an audio encoder addon is enabled.

Add Kconfig submenu for audio encoders to prepare for addition of
more binary addons.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 8dd3794..6ec2463 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -245,20 +245,14 @@ config BR2_PACKAGE_KODI_WAVPACK
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
 
