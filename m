From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 May 2012 07:33:37 -0300
Subject: [Buildroot] [PATCH 2/2] screen: enable terminfo and install screenrc
In-Reply-To: <1336386817-29877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336386817-29877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336386817-29877-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable terminfo support as reported on bug #5198
Also install screenrc if it's not already present in the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/screen/screen.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 4b3d427..d117bde 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -7,8 +7,17 @@
 SCREEN_VERSION = 4.0.3
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_DEPENDENCIES = ncurses
-SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no
+SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
+	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"
 SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+define SCREEN_INSTALL_SCREENRC
+	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
+		$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc; \
+	fi
+endef
+
+SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
