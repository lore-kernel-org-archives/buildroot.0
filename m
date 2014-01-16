From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 16:52:18 +0800
Subject: [Buildroot] [RFC,
	PATCH 3/8] package/ncurses: Allow building wide char support
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <1389862338.918565.412332853863.3.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow ncurses to be configured with wide char support; this causes the
libraries to be built with the 'w' suffix (eg libncursesw.so,
libmenuw.so, etc), so we need to create a few symlinks.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/ncurses/Config.in  |    5 +++
 package/ncurses/ncurses.mk |   50 +++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index e8ab7102..337b0160 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -9,6 +9,11 @@ config BR2_PACKAGE_NCURSES
 	  http://www.gnu.org/software/ncurses/
 
 if BR2_PACKAGE_NCURSES
+config BR2_PACKAGE_NCURSES_WIDEC
+	bool "enable wide char support"
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Enable wide char & UTF-8 support in ncurses libraries
 
 config BR2_PACKAGE_NCURSES_TARGET_PANEL
 	bool "ncurses libpanel in target"
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index f3319763..ba4cacd1 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -12,7 +12,7 @@ HOST_NCURSES_DEPENDENCIES =
 NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
-NCURSES_CONFIG_SCRIPTS = ncurses5-config
+NCURSES_CONFIG_SCRIPTS = ncurses$(W)5-config
 
 NCURSES_CONF_OPT = \
 	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
@@ -36,6 +36,15 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	NCURSES_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WIDEC),y)
+NCURSES_CONF_OPT += --enable-widec
+W=w
+W_LINK=ln -sf
+else
+W=
+W_LINK=:
+endif
+
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
@@ -48,19 +57,22 @@ ifneq ($(BR2_PREFER_STATIC_LIB),y)
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
 define NCURSES_INSTALL_TARGET_PANEL
-	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libpanel$(W).so* $(TARGET_DIR)/usr/lib/
+	$(W_LINK) libpanelw.so $(TARGET_DIR)/usr/lib/libpanel.so
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM),y)
 define NCURSES_INSTALL_TARGET_FORM
-	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libform$(W).so* $(TARGET_DIR)/usr/lib/
+	$(W_LINK) libformw.so $(TARGET_DIR)/usr/lib/libform.so
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_MENU),y)
 define NCURSES_INSTALL_TARGET_MENU
-	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libmenu$(W).so* $(TARGET_DIR)/usr/lib/
+	$(W_LINK) libmenuw.so $(TARGET_DIR)/usr/lib/libmenu.so
 endef
 endif
 
@@ -78,7 +90,8 @@ endif
 
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
+	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses$(W).so* $(TARGET_DIR)/usr/lib/)
+	$(W_LINK) libncursesw.so $(TARGET_DIR)/usr/lib/libncurses.so
 	$(NCURSES_INSTALL_TARGET_PANEL)
 	$(NCURSES_INSTALL_TARGET_FORM)
 	$(NCURSES_INSTALL_TARGET_MENU)
@@ -101,6 +114,33 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
 endef # NCURSES_INSTALL_TARGET_CMDS
 
+define NCURSES_POST_INSTALL_SYMLINK
+	$(W_LINK) libncursesw.so $(STAGING_DIR)/usr/lib/libncurses.so
+endef
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_POST_INSTALL_SYMLINK
+
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
+define NCURSES_POST_INSTALL_SYMLINK_PANEL
+	$(W_LINK) libpanelw.so $(STAGING_DIR)/usr/lib/libpanel.so
+endef
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_POST_INSTALL_SYMLINK_PANEL
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM),y)
+define NCURSES_POST_INSTALL_SYMLINK_FORM
+	$(W_LINK) libformw.so $(STAGING_DIR)/usr/lib/libform.so
+endef
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_POST_INSTALL_SYMLINK_FORM
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_MENU),y)
+define NCURSES_POST_INSTALL_SYMLINK_MENU
+	$(W_LINK) libmenuw.so $(STAGING_DIR)/usr/lib/libmenu.so
+endef
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_POST_INSTALL_SYMLINK_MENU
+endif
+
+
 #
 # On systems with an older version of tic, the installation of ncurses hangs
 # forever. To resolve the problem, build a static version of tic on host
