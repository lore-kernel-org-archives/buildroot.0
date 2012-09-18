From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 19:21:37 +0200
Subject: [Buildroot] [PATCH 2/3] alsa-lib: require thread support
In-Reply-To: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1347988898-5279-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some parts of alsa-lib correctly use threads only when available, but
some other parts, especially certain PCM plugins, unconditionally
require threads. While it would certainly be possible to fix alsa-lib
to only use threads when available, it probably doesn't make much
sense, since on an embedded system that has audio, we are probably
powerful enough to enable thread support in the C library.

Fixes:

  http://autobuild.buildroot.org/results/e14469be7f6171f4c8c0c09c8e32943819f7938b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/Config.in              |    8 ++++++++
 package/bluez_utils/Config.in           |    2 +-
 package/multimedia/alsa-utils/Config.in |    5 +++--
 package/multimedia/mpd/Config.in        |    1 +
 package/portaudio/Config.in             |    1 +
 package/qt/Config.in                    |    1 +
 6 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 8123b5f..ca063d8 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -4,12 +4,20 @@ config BR2_PACKAGE_ALSA_LIB
 	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
 	# is fixed
 	select BR2_PACKAGE_ALSA_LIB_PCM
+	# Even though some parts of alsa-lib use threads only when
+	# available, some PCM plugins use them unconditionally. Since
+	# the usage of alsa-lib on no-thread systems is pretty
+	# unlikely, just require thread support globally for alsa-lib.
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
 	  functionality to the Linux operating system.
 
 	  http://www.alsa-project.org/
 
+comment "alsa-lib needs threads support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index d63284d..9836b21 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index c65e33f..4bc1204 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  This package contains the command line utilities for the ALSA
@@ -8,8 +9,8 @@ config BR2_PACKAGE_ALSA_UTILS
 
 	  http://www.alsa-project.org/
 
-comment "alsa-utils requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "alsa-utils requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_ALSA_UTILS
 menu "ALSA utils selection"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index c7c0cd7..5d08182 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_MPD_ALSA
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	help
 	  Enable alsa output support.
 
diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index f91acc0..df884a7 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_PORTAUDIO
 config BR2_PACKAGE_PORTAUDIO_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	default y
 	help
 	  Compile with ALSA support.
diff --git a/package/qt/Config.in b/package/qt/Config.in
index b75f224..b99bf4c 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -315,6 +315,7 @@ config BR2_PACKAGE_QT_AUDIO_BACKEND
 	bool "QtMultimedia Audio backend"
 	depends on BR2_PACKAGE_QT_MULTIMEDIA
 	select BR2_PACKAGE_ALSA_LIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	help
 	  Build the ALSA audio backend into QtMultimedia
 
-- 
1.7.9.5
