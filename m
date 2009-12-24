From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:23:11 +0100
Subject: [Buildroot] [PATCH] lua: install development files to staging by
 default and to target if requested
Message-ID: <1261614191.5867.1.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/lua/lua.mk |   55 +++++++++++++++++++++++++++++++++++-----------------
 1 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aeb6c82..ea0401e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -34,28 +34,47 @@ $(LUA_DIR)/src/luac: $(LUA_DIR)/src/lua
 
 $(LUA_DIR)/src/liblua.a: $(LUA_DIR)/src/lua
 
-$(STAGING_DIR)/usr/lib/liblua.a: $(LUA_DIR)/src/liblua.a
-	cp -dpf $(LUA_DIR)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
+$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc:
+	cat $(LUA_DIR)/etc/lua.pc | sed -e s/\\/usr\\/local/\\/usr/ > $@
 
+$(STAGING_DIR)/usr/lib/liblua.a: $(LUA_DIR)/src/liblua.a
 $(STAGING_DIR)/usr/bin/lua: $(LUA_DIR)/src/lua
-	cp -dpf $(LUA_DIR)/src/lua $(STAGING_DIR)/usr/bin/lua
-
 $(STAGING_DIR)/usr/bin/luac: $(LUA_DIR)/src/luac
-	cp -dpf $(LUA_DIR)/src/luac $(STAGING_DIR)/usr/bin/luac
-
+$(STAGING_DIR)/usr/include/lua.h: $(LUA_DIR)/src/lua.h
+$(STAGING_DIR)/usr/include/luaconf.h: $(LUA_DIR)/src/luaconf.h
+$(STAGING_DIR)/usr/include/lualib.h: $(LUA_DIR)/src/lualib.h
+$(STAGING_DIR)/usr/include/lauxlib.h: $(LUA_DIR)/src/lauxlib.h
 $(TARGET_DIR)/usr/lib/liblua.a: $(STAGING_DIR)/usr/lib/liblua.a
-	cp -dpf $(STAGING_DIR)/usr/lib/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-
 $(TARGET_DIR)/usr/bin/lua: $(STAGING_DIR)/usr/bin/lua
-	cp -dpf $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/lua
-
 $(TARGET_DIR)/usr/bin/luac: $(STAGING_DIR)/usr/bin/luac
-	cp -dpf $(STAGING_DIR)/usr/bin/luac $(TARGET_DIR)/usr/bin/luac
-
-
-lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-
-lua-libs: $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/liblua.a)
+$(TARGET_DIR)/usr/include/lua.h: $(STAGING_DIR)/usr/include/lua.h
+$(TARGET_DIR)/usr/include/luaconf.h: $(STAGING_DIR)/usr/include/luaconf.h
+$(TARGET_DIR)/usr/include/lualib.h: $(STAGING_DIR)/usr/include/lualib.h
+$(TARGET_DIR)/usr/include/lauxlib.h: $(STAGING_DIR)/usr/include/lauxlib.h
+$(TARGET_DIR)/usr/lib/pkgconfig/lua.pc: $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	cp -dpf $< $@
+
+LUA_STAGING_DEV_FILES = \
+	$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc \
+	$(STAGING_DIR)/usr/lib/liblua.a \
+	$(STAGING_DIR)/usr/include/lua.h \
+	$(STAGING_DIR)/usr/include/luaconf.h \
+	$(STAGING_DIR)/usr/include/lualib.h \
+	$(STAGING_DIR)/usr/include/lauxlib.h
+
+LUA_TARGET_DEV_FILES = \
+	$(TARGET_DIR)/usr/lib/liblua.a \
+	$(TARGET_DIR)/usr/lib/pkgconfig/lua.pc \
+	$(TARGET_DIR)/usr/include/lua.h \
+	$(TARGET_DIR)/usr/include/luaconf.h \
+	$(TARGET_DIR)/usr/include/lualib.h \
+	$(TARGET_DIR)/usr/include/lauxlib.h
+
+lua-bins: $(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
+
+lua-libs: \
+	$(LUA_STAGING_DEV_FILES) \
+	$(if $(BR2_HAVE_DEVFILES),$(LUA_TARGET_DEV_FILES))
 
 lua: readline ncurses lua-bins lua-libs
 
@@ -63,9 +82,9 @@ lua-source: $(DL_DIR)/$(LUA_SOURCE)
 
 lua-clean:
 	rm -f $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(STAGING_DIR)/usr/lib/liblua.a
+	rm -f $(LUA_STAGING_DEV_FILES)
 	rm -f $(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
-	rm -f $(TARGET_DIR)/usr/lib/liblua.a
+	rm -f $(LUA_TARGET_DEV_FILES)
 	-$(MAKE) -C $(LUA_DIR) clean
 
 lua-dirclean:
-- 
1.6.5.7
