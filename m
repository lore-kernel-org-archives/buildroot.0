From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Mon, 17 Jan 2011 19:14:45 +0300
Subject: [Buildroot] [PATCH 1/2] ncurses: Add wchar support
Message-ID: <1295280886-20910-1-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the BR2_USE_WCHAR is "y" the ncurses will be configured with
wide char support. It will build ncursesw.* instead ncurses.*.
---
 package/ncurses/ncurses.mk |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0a49887..2e9c5d0 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -43,11 +43,17 @@ NCURSES_CONF_OPT = \
 	--enable-broken_linker \
 	--disable-static
 
+ifeq ($(BR2_USE_WCHAR),y)
+NCURSES_CONF_OPT += \
+	--enable-widec \
+	--with-build-cppflags=-D_GNU_SOURCE
+NCURSES_W = w
+endif
+
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
 
-
 define NCURSES_BUILD_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
@@ -67,38 +73,38 @@ define NCURSES_INSTALL_TARGET_DEVFILES
 	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libncurses*.a $(TARGET_DIR)/usr/lib/
 	(cd $(TARGET_DIR)/usr/lib; \
-	 ln -fs libncurses.a libcurses.a; \
-	 ln -fs libncurses.a libtermcap.a; \
+	 ln -fs libncurses$(NCURSES_W).a libcurses.a; \
+	 ln -fs libncurses$(NCURSES_W).a libtermcap.a; \
 	)
 	(cd $(TARGET_DIR)/usr/include; ln -fs curses.h ncurses.h)
-	rm -f $(TARGET_DIR)/usr/lib/libncurses.so
-	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.so.$(NCURSES_VERSION) libncurses.so)
+	rm -f $(TARGET_DIR)/usr/lib/libncurses*.so
+	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses$(NCURSES_W).so.$(NCURSES_VERSION) libncurses$(NCURSES_W).so)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
 define NCURSES_INSTALL_TARGET_PANEL
-	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libpanel*.so* $(TARGET_DIR)/usr/lib/
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM),y)
 define NCURSES_INSTALL_TARGET_FORM
-	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libform*.so* $(TARGET_DIR)/usr/lib/
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_MENU),y)
 define NCURSES_INSTALL_TARGET_MENU
-	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libmenu*.so* $(TARGET_DIR)/usr/lib/
 endef
 endif
 
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libncurses*.so* $(TARGET_DIR)/usr/lib/
 	$(NCURSES_INSTALL_TARGET_PANEL)
 	$(NCURSES_INSTALL_TARGET_FORM)
 	$(NCURSES_INSTALL_TARGET_MENU)
@@ -116,7 +122,7 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses.so*
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses*.so*
 	$(NCURSES_INSTALL_TARGET_DEVFILES)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
-- 
1.7.3.5
