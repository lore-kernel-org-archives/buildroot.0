From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 00:07:04 +0200
Subject: [Buildroot] [git commit] alsa-utils: fixup ncurses config script
Message-ID: <20140918195020.CCB979D6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8360013249dbdbe831dbe4659c8e5745ef4b6db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Point the build to the proper (which BTW was broken since it pointed to
the wrong directory) ncurses config by using $(NCURSES_CONFIG_SCRIPTS)
from the ncurses package directly.
Also select the proper variant (widec/non-widec) in configure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 4536b07..2afd6f9 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -14,11 +14,11 @@ ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
 ALSA_UTILS_CONF_ENV = \
-	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config
+	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
 ALSA_UTILS_CONF_OPT = \
 	--disable-xmlto \
-	--with-curses=ncurses
+	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
 ALSA_UTILS_CONF_OPT += --disable-alsamixer --disable-alsatest
