From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 24 May 2014 16:24:54 +0200
Subject: [Buildroot] [PATCH] audiofile: does not build with static-only
Message-ID: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also propagate to its reverse dependency (audiofile module for mpd).

Fixes:
  http://autobuild.buildroot.net/results/327/327c18db4e5d0ddc2c72a4684e103c19a1405e50/
  http://autobuild.buildroot.org/results/c8b/c8b64588eebf0bd8d879881b65e9d8efde00397d/
  http://autobuild.buildroot.org/results/028/028a3b97d56674560b8aa90b6e44b2e91858a5cb/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/audiofile/Config.in | 5 +++--
 package/mpd/Config.in       | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
index 4aa8d69..9752648 100644
--- a/package/audiofile/Config.in
+++ b/package/audiofile/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_AUDIOFILE
 	bool "audiofile"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The Audio File Library handles reading and writing audio files
 	  in many common formats.
 
 	  http://www.68k.org/~michael/audiofile/
 
-comment "audiofile needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "audiofile needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1bf7ad1..96a3885 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -40,10 +40,14 @@ config BR2_PACKAGE_MPD_AO
 config BR2_PACKAGE_MPD_AUDIOFILE
 	bool "audiofile"
 	select BR2_PACKAGE_AUDIOFILE
+	depends on !BR2_PREFER_STATIC_LIB # audiofile
 	help
 	  Enable audiofile input/streaming support.
 	  Select this if you want to play back WAV files.
 
+comment "audiofile needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
-- 
1.8.3.2
