From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 16:40:04 +0200
Subject: [Buildroot] [git commit] ncurses: build statically when
	BR2_PREFER_STATIC_LIB
Message-ID: <20120629144806.71910805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=311a58303f06bdb89aa8e2af3945b552235e319a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-static is no more. Only try to install .so files if not
configured for static linking.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 10a55dd..afeb41b 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -29,7 +29,7 @@ NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 
 NCURSES_CONF_OPT = \
-	--with-shared \
+	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
@@ -41,8 +41,7 @@ NCURSES_CONF_OPT = \
 	--enable-echo \
 	--enable-const \
 	--enable-overwrite \
-	--enable-broken_linker \
-	--disable-static
+	--enable-broken_linker
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
@@ -79,6 +78,8 @@ define NCURSES_INSTALL_TARGET_DEVFILES
 endef
 endif
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
 define NCURSES_INSTALL_TARGET_PANEL
 	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
@@ -97,9 +98,11 @@ define NCURSES_INSTALL_TARGET_MENU
 endef
 endif
 
+endif
+
 define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
+	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
 	$(NCURSES_INSTALL_TARGET_PANEL)
 	$(NCURSES_INSTALL_TARGET_FORM)
 	$(NCURSES_INSTALL_TARGET_MENU)
