From: Thierry Bultel <tbultel@free.fr>
Date: Tue,  9 Dec 2014 11:58:30 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses: add support for 256 colors
Message-ID: <1418122710-27852-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/ncurses/Config.in  |  7 +++++++
 package/ncurses/ncurses.mk | 14 +++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 44713f9..8d0a4b7 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -38,4 +38,11 @@ config BR2_PACKAGE_NCURSES_TARGET_PROGS
 	help
 	  Include ncurses programs in target (clear, reset, tput, ...)
 
+config BR2_PACKAGE_NCURSES_EXT_COLORS
+	bool "ncurses extended colors"
+	select BR2_PACKAGE_NCURSES_WCHAR
+	depends on BR2_USE_WCHAR
+	help
+	  compile for 256-color support
+
 endif
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e7bd967..262ac94 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -12,7 +12,7 @@ HOST_NCURSES_DEPENDENCIES =
 NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
-NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
+NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)$(NCURSES_ABI_VERSION)-config
 
 NCURSES_CONF_OPTS = \
 	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
@@ -107,6 +107,17 @@ define NCURSES_INSTALL_TARGET_PROGS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_EXT_COLORS),y)
+NCURSES_CONF_OPTS += --enable-ext-colors
+NCURSES_ABI_VERSION = 6
+define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm+256color $(TARGET_DIR)/usr/share/terminfo/x
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-256color $(TARGET_DIR)/usr/share/terminfo/x
+endef
+else
+NCURSES_ABI_VERSION = 5
+endif
+
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	$(NCURSES_INSTALL_TARGET_LIBS)
@@ -117,6 +128,7 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
+	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
-- 
1.9.1
