From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 21:47:21 +0100
Subject: [Buildroot] [git commit] alsa-utils: fix linking with intl
Message-ID: <20141111205928.E63C8B4003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48fe144111652547cf72d2bf3e8e15f36ee40b6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa-utils needs to link with intl if the toolchain needs gettext and
locale is set. Otherwise we will see an error like this one:

alsamixer-cli.o: In function `main':
cli.c:(.text.startup+0x4d): undefined reference to `libintl_textdomain'
cli.c:(.text.startup+0xc1): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0xd5): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0xe9): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0x1fd): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0x223): undefined reference to `libintl_gettext'

Fixes:
  http://autobuild.buildroot.net/results/707/707016a2490fc97b98d17e2b6a9c6423a56bb4a9/

[Peter: correct autobuilder reference]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/Config.in     |    1 +
 package/alsa-utils/alsa-utils.mk |   10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 58ecf51..cc66711 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_ALSA_UTILS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 208c5fc..17895c3 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -13,11 +13,6 @@ ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
-# gettext support is optional
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-ALSA_UTILS_DEPENDENCIES += gettext
-endif
-
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
@@ -25,6 +20,11 @@ ALSA_UTILS_CONF_OPTS = \
 	--disable-xmlto \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ALSA_UTILS_DEPENDENCIES += gettext
+ALSA_UTILS_CONF_ENV += LIBS=-lintl
+endif
+
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
 ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
 endif
