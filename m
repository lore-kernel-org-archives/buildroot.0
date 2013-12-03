From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Dec 2013 15:03:20 -0300
Subject: [Buildroot] [PATCH] ncurses: add target progs option
Message-ID: <1386093800-22296-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Closes bug #5072
Based on work from Stefan Mei?ner, thanks!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/Config.in  | 12 +++++++++---
 package/ncurses/ncurses.mk | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 613b5b5..e8ab710 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -8,20 +8,26 @@ config BR2_PACKAGE_NCURSES
 
 	  http://www.gnu.org/software/ncurses/
 
+if BR2_PACKAGE_NCURSES
+
 config BR2_PACKAGE_NCURSES_TARGET_PANEL
 	bool "ncurses libpanel in target"
-	depends on BR2_PACKAGE_NCURSES
 	help
 	  Includes ncurses dynamic libpanel in target
 
 config BR2_PACKAGE_NCURSES_TARGET_FORM
 	bool "ncurses libform in target"
-	depends on BR2_PACKAGE_NCURSES
 	help
 	  Includes ncurses dynamic libform in target
 
 config BR2_PACKAGE_NCURSES_TARGET_MENU
 	bool "ncurses libmenu in target"
-	depends on BR2_PACKAGE_NCURSES
 	help
 	  Includes ncurses dynamic libmenu in target
+
+config BR2_PACKAGE_NCURSES_TARGET_PROGS
+	bool "ncurses programs"
+	help
+	  Include ncurses programs in traget (clear, reset, tput, ...)
+
+endif
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index dbb514e..f331976 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -8,6 +8,8 @@ NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
+HOST_NCURSES_DEPENDENCIES =
+NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses5-config
@@ -17,7 +19,6 @@ NCURSES_CONF_OPT = \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
-	--without-progs \
 	--without-tests \
 	--disable-big-core \
 	--without-profile \
@@ -27,13 +28,18 @@ NCURSES_CONF_OPT = \
 	--enable-const \
 	--enable-overwrite \
 	--enable-pc-files \
+	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
 	$(if $(BR2_HAVE_DOCUMENTATION),,--without-manpages)
 
+# Install after busybox for the full-blown versions
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	NCURSES_DEPENDENCIES += busybox
+endif
+
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
 
-
 define NCURSES_BUILD_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
@@ -60,12 +66,23 @@ endif
 
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
+define NCURSES_INSTALL_TARGET_PROGS
+	for x in $(NCURSES_PROGS); do \
+		$(INSTALL) -m 0755 $(NCURSES_DIR)/progs/$$x \
+			$(TARGET_DIR)/usr/bin/$$x; \
+	done
+	ln -sf tset $(TARGET_DIR)/usr/bin/reset
+endef
+endif
+
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
 	$(NCURSES_INSTALL_TARGET_PANEL)
 	$(NCURSES_INSTALL_TARGET_FORM)
 	$(NCURSES_INSTALL_TARGET_MENU)
+	$(NCURSES_INSTALL_TARGET_PROGS)
 	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
-- 
1.8.3.2
