From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 10:08:20 -0300
Subject: [Buildroot] [PATCHv3 5/6] alsa-utils: fixup ncurses config script
In-Reply-To: <1410959301-28053-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410959301-28053-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410959301-28053-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Point the build to the proper (which BTW was broken since it pointed to
the wrong directory) ncurses config by using $(NCURSES_CONFIG_SCRIPTS)
from the ncurses package directly.
Also select the proper variant (widec/non-widec) in configure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-utils/alsa-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.5.5
