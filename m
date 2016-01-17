From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 22:00:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: Add util alsaloop
Message-ID: <1453064452-31266-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/Config.in     | 4 ++++
 package/alsa-utils/alsa-utils.mk | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 82f3ad6..2e98176 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -29,6 +29,10 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 	bool "alsactl"
 	default y
 
+config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
+	bool "alsaloop"
+	select BR2_PACKAGE_LIBSAMPLERATE
+
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 32822bb..7841fbb 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -29,6 +29,13 @@ ALSA_UTILS_DEPENDENCIES += gettext
 ALSA_UTILS_CONF_ENV += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
+ALSA_UTILS_CONF_OPTS += --enable-alsaloop
+ALSA_UTILS_DEPENDENCIES += libsamplerate
+else
+ALSA_UTILS_CONF_OPTS += --disable-alsaloop
+endif
+
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
 ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
 endif
@@ -42,6 +49,7 @@ endif
 
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSALOOP) += usr/bin/alsaloop
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER) += usr/bin/alsamixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSATPLG) += usr/bin/alsatplg
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI) += usr/bin/amidi
-- 
2.7.0.rc3
