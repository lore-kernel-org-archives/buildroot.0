From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 22:59:50 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: Add option for
	alsaloop util
Message-ID: <20160118220439.08FE78275C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4752566509da367229f8f62fb55d1793ddb69110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add libsamplerate as optional dependency, see
alsa-utils-1.1.0/alsaloop/Makefile.am

[Peter: move libsamplerate dependency outside alsaloop conditional]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/Config.in     |  3 +++
 package/alsa-utils/alsa-utils.mk | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 82f3ad6..9b8e8c0 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -29,6 +29,9 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 	bool "alsactl"
 	default y
 
+config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
+	bool "alsaloop"
+
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 32822bb..b5dc698 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -11,7 +11,8 @@ ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
-	$(if $(BR2_PACKAGE_NCURSES),ncurses)
+	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
+	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
 # Regenerate aclocal.m4 to pick the patched
 # version of alsa.m4 from alsa-lib
 ALSA_UTILS_AUTORECONF = YES
@@ -29,6 +30,12 @@ ALSA_UTILS_DEPENDENCIES += gettext
 ALSA_UTILS_CONF_ENV += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
+ALSA_UTILS_CONF_OPTS += --enable-alsaloop
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
