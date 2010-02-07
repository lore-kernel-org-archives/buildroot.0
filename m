From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 17:55:35 +0100
Subject: [Buildroot] [PATCH 03/10] lua: conversion to new package
	infrastructure
In-Reply-To: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265561742-5924-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also install development files to staging by default and to target if
requested.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/lua/lua.mk |  124 +++++++++++++++++++++++++--------------------------
 1 files changed, 61 insertions(+), 63 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aeb6c82..9cb1675 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,77 +5,75 @@
 #############################################################
 
 LUA_VERSION=5.1.4
-
 LUA_SOURCE=lua-$(LUA_VERSION).tar.gz
-LUA_CAT:=$(ZCAT)
 LUA_SITE=http://www.lua.org/ftp
+LUA_INSTALL_STAGING=YES
+LUA_DEPENDENCIES = readline ncurses
 
-LUA_DIR=$(BUILD_DIR)/lua-$(LUA_VERSION)
-
+#
 LUA_CFLAGS=-DLUA_USE_LINUX
 LUA_MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
 
-$(DL_DIR)/$(LUA_SOURCE):
-	$(call DOWNLOAD,$(LUA_SITE),$(LUA_SOURCE))
-
-$(LUA_DIR)/.unpacked: $(DL_DIR)/$(LUA_SOURCE)
-	$(LUA_CAT) $(DL_DIR)/$(LUA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LUA_DIR)/.unpacked
-
-$(LUA_DIR)/src/lua: $(LUA_DIR)/.unpacked
-	rm -f $@
+define LUA_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		MYCFLAGS=$(LUA_CFLAGS) \
 		MYLIBS=$(LUA_MYLIBS) \
 		AR="$(TARGET_CROSS)ar rcu" \
-		-C $(LUA_DIR)/src all
-
-$(LUA_DIR)/src/luac: $(LUA_DIR)/src/lua
-
-$(LUA_DIR)/src/liblua.a: $(LUA_DIR)/src/lua
-
-$(STAGING_DIR)/usr/lib/liblua.a: $(LUA_DIR)/src/liblua.a
-	cp -dpf $(LUA_DIR)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
-
-$(STAGING_DIR)/usr/bin/lua: $(LUA_DIR)/src/lua
-	cp -dpf $(LUA_DIR)/src/lua $(STAGING_DIR)/usr/bin/lua
-
-$(STAGING_DIR)/usr/bin/luac: $(LUA_DIR)/src/luac
-	cp -dpf $(LUA_DIR)/src/luac $(STAGING_DIR)/usr/bin/luac
-
-$(TARGET_DIR)/usr/lib/liblua.a: $(STAGING_DIR)/usr/lib/liblua.a
-	cp -dpf $(STAGING_DIR)/usr/lib/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-
-$(TARGET_DIR)/usr/bin/lua: $(STAGING_DIR)/usr/bin/lua
-	cp -dpf $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/lua
-
-$(TARGET_DIR)/usr/bin/luac: $(STAGING_DIR)/usr/bin/luac
-	cp -dpf $(STAGING_DIR)/usr/bin/luac $(TARGET_DIR)/usr/bin/luac
-
-
-lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-
-lua-libs: $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/liblua.a)
-
-lua: readline ncurses lua-bins lua-libs
-
-lua-source: $(DL_DIR)/$(LUA_SOURCE)
-
-lua-clean:
-	rm -f $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(STAGING_DIR)/usr/lib/liblua.a
-	rm -f $(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(TARGET_DIR)/usr/lib/liblua.a
-	-$(MAKE) -C $(LUA_DIR) clean
-
-lua-dirclean:
-	rm -rf $(LUA_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LUA),y)
-TARGETS+=lua
+		-C $(@D)/src all
+endef
+
+define LUA_INSTALL_STAGING_CMDS
+	cat $(@D)/etc/lua.pc | sed -e s/\\/usr\\/local/\\/usr/ > $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib
+	$(INSTALL) $(@D)/src/lua $(STAGING_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/luac $(STAGING_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/lua.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lualib.h $(STAGING_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include
+endef
+
+ifeq ($(BR2_HAVE_DEVFILES),y)
+define LUA_INSTALL_TARGET_HEADERS
+	install -D $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc $(TARGET_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) $(@D)/src/lua.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/luaconf.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lualib.h $(TARGET_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lauxlib.h $(TARGET_DIR)/usr/include
+endef
 endif
+
+define LUA_INSTALL_TARGET_CMDS
+	$(INSTALL) $(@D)/src/lua $(STAGING_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/luac $(STAGING_DIR)/usr/bin
+	$(INSTALL) -D $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
+	$(LUA_INSTALL_TARGET_HEADERS)
+endef
+
+LUA_INSTALLED_FILES = \
+	/usr/include/lua.h \
+	/usr/include/luaconf.h \
+	/usr/include/lualib.h \
+	/usr/include/lauxlib.h \
+	/usr/lib/pkgconfig/lua.pc \
+	/usr/bin/lua \
+	/usr/bin/luac \
+	/usr/lib/liblua.a
+
+define LUA_UNINSTALL_STAGING_CMDS
+	for i in $(LUA_INSTALLED_FILES); do \
+		rm -f $(STAGING_DIR)$$i; \
+	done
+endef
+
+define LUA_UNINSTALL_TARGET_CMDS
+	for i in $(LUA_INSTALLED_FILES); do \
+		rm -f $(TARGET_DIR)$$i; \
+	done
+endef
+
+define LUA_CLEAN_CMDS
+	-$(MAKE) $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,lua))
-- 
1.6.6
