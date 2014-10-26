From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:13:33 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: optionally depends on
	gettext
Message-ID: <20141026171436.2CF29B0B8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53ff562a9ef2112f48074865f3c8e489e7661d66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas:
 - it's not only alsamixer, but also several other alsa-utils
   utilities, like aplay or arecord, which optionally depend on
   gettext. Therefore, the patch was changed to have the optional
   gettext dependency apply to the entire package.
 - in addition, we don't need gettext when locales are enabled:
   alsa-utils builds perfectly fine with a toolchain having locales
   enabled even without gettext. So all we really want is to have
   gettext built before alsa-utils, if gettext is enabled.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/alsa-utils.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 5eba337..208c5fc 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -13,6 +13,11 @@ ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
+# gettext support is optional
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ALSA_UTILS_DEPENDENCIES += gettext
+endif
+
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
