From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Mar 2011 23:59:10 +0100
Subject: [Buildroot] [git commit master 1/1] alsa-utils: fix dependencies
Message-ID: <20110314230037.6598290334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6eaedac150c9cf9c6d11beb9278adf60a1a83e6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most alsa utilites depend on specific alsa-lib options, so ensure those
are selected. Arecord is furthermore just a symlink to aplay these days,
so get rid of the option.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-utils/Config.in     |   16 ++++++++++++----
 package/multimedia/alsa-utils/alsa-utils.mk |    3 +--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index b85ff7e..c65e33f 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	depends on BR2_USE_WCHAR
 	default y
 
@@ -34,36 +35,43 @@ comment "alsamixer requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	bool "amidi"
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "amixer"
 
 config BR2_PACKAGE_ALSA_UTILS_APLAY
-	bool "aplay"
-
-config BR2_PACKAGE_ALSA_UTILS_ARECORD
-	bool "arecord"
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	bool "aplay/arecord"
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
+	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "iecset"
 
 config BR2_PACKAGE_ALSA_UTILS_ACONNECT
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aconnect"
 
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aplaymidi"
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "arecordmidi"
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQDUMP
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aseqdump"
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQNET
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aseqnet"
 
 config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
+	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "speaker-test"
 
 endmenu
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 26c270b..d5c34d3 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -26,8 +26,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER) += usr/bin/alsamixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI) += usr/bin/amidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER) += usr/bin/amixer
-ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay
-ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORD) += usr/bin/arecord
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay usr/bin/arecord
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET) += usr/bin/iecset
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT) += usr/bin/aconnect
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAYMIDI) += usr/bin/aplaymidi
-- 
1.7.3.4
