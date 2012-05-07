From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 23:20:36 +0200
Subject: [Buildroot] [git commit] screen: enable terminfo and install
	screenrc
Message-ID: <20120507212231.76D1496C5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98873717c2654e27ce069c44e9b5dbe3383c0f97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #5198

Enable terminfo support as reported on bug #5198
Also install screenrc if it's not already present in the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    1 +
 package/screen/screen.mk |   11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 09dd6b1..c17e141 100644
--- a/CHANGES
+++ b/CHANGES
@@ -78,6 +78,7 @@
 	#5018: dialog broken: exits with assert in uClibc
 	#5102: qt package moc, uic, rcc read from wrong place
 	#5144: Patch to fix ixon bug in uemacs
+	#5198: Line graphics output is broken in GNU Screen
 	#5204: Missing terminfo file(s) for GNU screen terminal type
 
 2012.02, Released February 29th, 2012:
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
