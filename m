From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri,  8 Aug 2014 15:11:32 +0200
Subject: [Buildroot] [PATCHv2 1/1] MPD: Add jack output support option
Message-ID: <1407503492-7464-1-git-send-email-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
Changes v1 -> v2:
  - Removed duplicate depends entries
  - Alpha sorting all entries

 package/mpd/Config.in |   31 +++++++++++++++++++++----------
 package/mpd/mpd.mk    |    5 +++++
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f5f5b34..0d02d9d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -42,16 +42,6 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 	  Enable audiofile input/streaming support.
 	  Select this if you want to play back WAV files.
 
-config BR2_PACKAGE_MPD_PULSEAUDIO
-	bool "pulseaudio"
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
-	select BR2_PACKAGE_PULSEAUDIO
-	help
-	  Enable pulseaudio output support.
-
-comment "pulseaudio support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_MPD_BZIP2
 	bool "bzip2"
 	select BR2_PACKAGE_BZIP2
@@ -90,6 +80,17 @@ config BR2_PACKAGE_MPD_FFMPEG
 comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
+config BR2_PACKAGE_MPD_JACK2
+	bool "jack2"
+	depends on BR2_LARGEFILE # libsndfile
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	select BR2_PACKAGE_JACK2
+	help
+	  Enable jack output support.
+
+comment "jack support needs a toolchain w/ largefile, atomic intrinsics"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS)
+
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
 	select BR2_PACKAGE_LAME
@@ -147,6 +148,16 @@ config BR2_PACKAGE_MPD_OPUS
 	  Enable opus input support.
 	  Select this if you want to play back OPUS encoded files.
 
+config BR2_PACKAGE_MPD_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable pulseaudio output support.
+
+comment "pulseaudio support needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "soundcloud"
 	select BR2_PACKAGE_YAJL
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e2ee760..f58f2e6 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -35,6 +35,11 @@ MPD_DEPENDENCIES += audiofile
 MPD_CONF_OPT += --enable-audiofile
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
+MPD_DEPENDENCIES += jack2
+MPD_CONF_OPT += --enable-jack
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
 MPD_CONF_OPT += --enable-pulse
-- 
1.7.9.5
