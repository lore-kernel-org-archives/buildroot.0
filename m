From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:03:52 +0200
Subject: [Buildroot] [git commit branch/next] lua: use install -D everywhere
Message-ID: <20120802195256.DBF7B8D2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8da6d1dd656caf5454c50ee5dddb4beead60326
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Installation of host-lua was failing because it was the first package
to be built, and $(HOST_DIR)/usr/lib didn't exist. Therefore, use
install -D everywhere so that intermediate directories are created as
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk |   50 +++++++++++++++++++++++++-------------------------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 074b9ad..fa1e7b1 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -46,7 +46,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 define LUA_INSTALL_STAGING_SHARED_LIB
-	$(INSTALL) -D $(@D)/src/liblua.so.$(LUA_VERSION) \
+	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
 endef
@@ -55,37 +55,37 @@ endif
 define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib
-	$(INSTALL) $(@D)/src/lua $(STAGING_DIR)/usr/bin
-	$(INSTALL) $(@D)/src/luac $(STAGING_DIR)/usr/bin
-	$(INSTALL) $(@D)/src/lua.h $(STAGING_DIR)/usr/include
-	$(INSTALL) $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lualib.h $(STAGING_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0755 -D $(@D)/src/lua $(STAGING_DIR)/usr/bin/lua
+	$(INSTALL) -m 0755 -D $(@D)/src/luac $(STAGING_DIR)/usr/bin/luac
+	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(STAGING_DIR)/usr/include/lua.h
+	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include/luaconf.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(STAGING_DIR)/usr/include/lualib.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include/lauxlib.h
 endef
 
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER),y)
 define LUA_INSTALL_INTERPRETER
-	$(INSTALL) $(@D)/src/lua $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_COMPILER),y)
 define LUA_INSTALL_COMPILER
-	$(INSTALL) $(@D)/src/luac $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 define LUA_INSTALL_LIBRARY
-	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
+	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
-	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
 endef
 else
 define LUA_INSTALL_LIBRARY
-	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0644 -D$(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
 endef
 endif
 
@@ -93,10 +93,10 @@ ifeq ($(BR2_HAVE_DEVFILES),y)
 define LUA_INSTALL_DEVFILES
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(TARGET_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) $(@D)/src/lua.h $(TARGET_DIR)/usr/include
-	$(INSTALL) $(@D)/src/luaconf.h $(TARGET_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lualib.h $(TARGET_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lauxlib.h $(TARGET_DIR)/usr/include
+	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(TARGET_DIR)/usr/include/lua.h
+	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(TARGET_DIR)/usr/include/luaconf.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(TARGET_DIR)/usr/include/lualib.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(TARGET_DIR)/usr/include/lauxlib.h
 endef
 endif
 
@@ -108,18 +108,18 @@ define LUA_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(INSTALL) $(@D)/src/lua $(HOST_DIR)/usr/bin
-	$(INSTALL) $(@D)/src/luac $(HOST_DIR)/usr/bin
-	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
+	$(INSTALL) -m 0755 -D $(@D)/src/lua $(HOST_DIR)/usr/bin/lua
+	$(INSTALL) -m 0755 -D $(@D)/src/luac $(HOST_DIR)/usr/bin/luac
+	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(HOST_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(HOST_DIR)/usr/lib/liblua.so
-	$(INSTALL) $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) $(@D)/src/lua.h $(HOST_DIR)/usr/include
-	$(INSTALL) $(@D)/src/luaconf.h $(HOST_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lualib.h $(HOST_DIR)/usr/include
-	$(INSTALL) $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include
+	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(HOST_DIR)/usr/include/lua.h
+	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(HOST_DIR)/usr/include/luaconf.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(HOST_DIR)/usr/include/lualib.h
+	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include/lauxlib.h
 endef
 
 LUA_INSTALLED_FILES = \
