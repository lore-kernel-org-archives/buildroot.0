From: Thierry Bultel <tbultel@free.fr>
Date: Sat, 13 Dec 2014 08:18:59 +0100
Subject: [Buildroot] [PATCH v2] ncurses: add support for 256 colors
Message-ID: <1418455139-4668-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
Changes v1 -> v2:
  - extended colors enabled by default (suggested by Yann E. MORIN)
    Namely, size delta is negligible:
    with 256 colors:
     -rwxr-xr-x 1 thierry thierry 210K d?c.   9 14:23 output/target/usr/lib/libncursesw.so.6.0
    with std colors:
     -rwxr-xr-x 1 thierry thierry 202K d?c.   9 15:46 output/target/usr/lib/libncursesw.so.5.9
  - the option, now selected by default, still needs ABI 6, and support of widechar. Thus it
    is conditional in ncurses.mk, and we keep ABI 5 when widechar is not available

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/ncurses/ncurses.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index f54f379..480df98 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -12,7 +12,7 @@ HOST_NCURSES_DEPENDENCIES =
 NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
-NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
+NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)$(NCURSES_ABI_VERSION)-config
 
 NCURSES_CONF_OPTS = \
 	--without-cxx \
@@ -71,11 +71,20 @@ define NCURSES_LINK_LIBS
 endef
 endif
 
+NCURSES_CONF_OPTS += --enable-ext-colors
+NCURSES_ABI_VERSION = 6
+define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm+256color $(TARGET_DIR)/usr/share/terminfo/x
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-256color $(TARGET_DIR)/usr/share/terminfo/x
+endef
+
 NCURSES_LINK_TARGET_LIBS = $(call NCURSES_LINK_LIBS, $(TARGET_DIR))
 NCURSES_LINK_STAGING_LIBS = $(call NCURSES_LINK_LIBS, $(STAGING_DIR))
 
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 
+else
+NCURSES_ABI_VERSION = 5
 endif
 
 NCURSES_LIBS-y = libncurses
@@ -124,6 +133,7 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
+	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
-- 
1.9.1
