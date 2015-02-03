From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 17:52:27 +0100
Subject: [Buildroot] [git commit] ncurses: add support for 256 colors
Message-ID: <20150203165403.67F5480E07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=423903b1bba53208588372f46e936ba9ff2f0f79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fixup nano to use $(NCURSES_CONFIG_SCRIPTS) now that the
ncurses config script can have a different name depending on the
configuration.]

Signed-off-by: Thierry Bultel <tbultel@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.mk       |    2 +-
 package/ncurses/ncurses.mk |   14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index fcfbfd8..cb8b60e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -13,7 +13,7 @@ NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG="$(STAGING_DIR)/usr/bin/ncursesw5-config"
+	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
 	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
 	NANO_MAKE_ENV += CURSES_LIB="-lncurses"
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5f9e4bd..66ee96a 100644
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
@@ -94,10 +94,19 @@ NCURSES_LINK_STAGING_LIBS = \
 
 NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
 
+NCURSES_CONF_OPTS += --enable-ext-colors
+NCURSES_ABI_VERSION = 6
+define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm+256color $(TARGET_DIR)/usr/share/terminfo/x
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-256color $(TARGET_DIR)/usr/share/terminfo/x
+endef
+
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
 
-endif
+else # BR2_PACKAGE_NCURSES_WCHAR
+NCURSES_ABI_VERSION = 5
+endif # BR2_PACKAGE_NCURSES_WCHAR
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPTS += --without-debug
@@ -140,6 +149,7 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
+	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
