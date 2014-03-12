From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 12 Mar 2014 11:45:57 +0800
Subject: [Buildroot] [PATCH 03/10 v2] package/ncurses: Remove duplicated
 library install code
In-Reply-To: <1394595957.563937.119075350083.0.gpush@pablo>
Message-ID: <1394595957.564990.873226929317.3.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the ncurses package conditionally defines macros to install
the panel, form and menu libraries. This means we duplicate the install
step for each library type.

Rather than defining a set of macros, this change introduces a variable
for the set of installed libraries, $(NCURSES_LIBS-y). We use this in a
single macro to perform the library installation in one place.

Based on a change suggested by Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/ncurses/ncurses.mk |   33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e180a95..c2e1c3f 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -36,6 +36,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	NCURSES_DEPENDENCIES += busybox
 endif
 
+NCURSES_LIBS-y = libncurses
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += libmenu
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += libpanel
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
+
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
@@ -45,27 +50,13 @@ define NCURSES_BUILD_CMDS
 endef
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
-define NCURSES_INSTALL_TARGET_PANEL
-	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM),y)
-define NCURSES_INSTALL_TARGET_FORM
-	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/usr/lib/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_MENU),y)
-define NCURSES_INSTALL_TARGET_MENU
-	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
+define NCURSES_INSTALL_TARGET_LIBS
+	for lib in $(NCURSES_LIBS-y); do \
+		cp -dpf $(NCURSES_DIR)/lib/$${lib}.so* $(TARGET_DIR)/usr/lib/; \
+	done
 endef
 endif
 
-endif
-
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
 define NCURSES_INSTALL_TARGET_PROGS
 	for x in $(NCURSES_PROGS); do \
@@ -78,11 +69,7 @@ endif
 
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
-	$(NCURSES_INSTALL_TARGET_PANEL)
-	$(NCURSES_INSTALL_TARGET_FORM)
-	$(NCURSES_INSTALL_TARGET_MENU)
-	$(NCURSES_INSTALL_TARGET_PROGS)
+	$(NCURSES_INSTALL_TARGET_LIBS)
 	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
