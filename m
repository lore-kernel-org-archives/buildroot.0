From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 16:45:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: alsamixer optionally
	depends on gettext
Message-ID: <1413729905-12035-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To get a reproducable build add optional gettext dependency.

- Configure log without gettext

checking for GNU gettext in libc... no
checking for iconv... yes
checking for working iconv... guessing yes
checking for GNU gettext in libintl... no
checking whether to use NLS... no

- Configure log with gettext built before alsa-utils

checking for GNU gettext in libc... no
checking for iconv... yes
checking for working iconv... guessing yes
checking for GNU gettext in libintl... yes
checking whether to use NLS... yes
checking where the gettext function comes from... external libintl
checking how to link with libintl... -lintl

Tested using this defconfig

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_AMIDI=y
BR2_PACKAGE_ALSA_UTILS_AMIXER=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_IECSET=y
BR2_PACKAGE_ALSA_UTILS_ACONNECT=y
BR2_PACKAGE_ALSA_UTILS_APLAYMIDI=y
BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI=y
BR2_PACKAGE_ALSA_UTILS_ASEQDUMP=y
BR2_PACKAGE_ALSA_UTILS_ASEQNET=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_NCURSES_WCHAR=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/Config.in     |    1 +
 package/alsa-utils/alsa-utils.mk |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 58ecf51..e932014 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 5eba337..d42d06f 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -20,7 +20,11 @@ ALSA_UTILS_CONF_OPTS = \
 	--disable-xmlto \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
-ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ALSA_UTILS_DEPENDENCIES += gettext
+endif
+else
 ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
 endif
 
-- 
1.7.10.4
