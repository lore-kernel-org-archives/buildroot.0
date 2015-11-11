From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:09:08 +0100
Subject: [Buildroot] [git commit branch/next] alsa-utils: bump to version
	1.1.0
Message-ID: <20151111141413.B07B0804EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c835db65fa9084690ce244a5401d5943d98274c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add BAT (Basic Audio Testing) tool option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in       |    4 ++++
 package/alsa-utils/alsa-utils.hash |    2 +-
 package/alsa-utils/alsa-utils.mk   |   10 +++++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 3a99279..a08743e 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -50,6 +50,10 @@ config BR2_PACKAGE_ALSA_UTILS_APLAY
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "aplay/arecord"
 
+config BR2_PACKAGE_ALSA_UTILS_BAT
+	select BR2_PACKAGE_FFTW
+	bool "bat"
+
 config BR2_PACKAGE_ALSA_UTILS_IECSET
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "iecset"
diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index ba5061b..e6530eb 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5160058f3e14483ced5de919dd473f93932059454530a9b7ef97dcabd6833e9b	alsa-utils-1.0.29.tar.bz2
+sha256	3b1c3135b76e14532d3dd23fb15759ddd7daf9ffbc183f7a9a0a3a86374748f1	alsa-utils-1.1.0.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 06bda9a..11b46c4 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.0.29
+ALSA_UTILS_VERSION = 1.1.0
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
@@ -33,12 +33,20 @@ ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
 ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
+ALSA_UTILS_CONF_OPTS += --enable-bat
+ALSA_UTILS_DEPENDENCIES += fftw
+else
+ALSA_UTILS_CONF_OPTS += --disable-bat
+endif
+
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER) += usr/bin/alsamixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI) += usr/bin/amidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER) += usr/bin/amixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay usr/bin/arecord
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_BAT) += usr/bin/bat
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET) += usr/bin/iecset
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT) += usr/bin/aconnect
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAUCM) += usr/bin/alsaucm
