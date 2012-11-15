From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 12:39:19 +0100
Subject: [Buildroot] [git commit] lua: refactor without useless define's
Message-ID: <20121115113940.1813899FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53adfc5f4976704d426681a0404c1643db009552
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |   36 +++++++++++-------------------------
 1 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 4704e4c..9e0d387 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -42,39 +42,21 @@ define HOST_LUA_BUILD_CMDS
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
-define LUA_INSTALL_STAGING_SHARED_LIB
-	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
-		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
-	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
-endef
-
 define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
 	$(INSTALL) -m 0755 -D $(@D)/src/lua $(STAGING_DIR)/usr/bin/lua
 	$(INSTALL) -m 0755 -D $(@D)/src/luac $(STAGING_DIR)/usr/bin/luac
+	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
+		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
+	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
 	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(STAGING_DIR)/usr/include/lua.h
 	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include/luaconf.h
 	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(STAGING_DIR)/usr/include/lualib.h
 	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include/lauxlib.h
 endef
 
-define LUA_INSTALL_INTERPRETER
-	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
-endef
-
-define LUA_INSTALL_COMPILER
-	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
-endef
-
-define LUA_INSTALL_LIBRARY
-	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
-		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
-	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-endif
-
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define LUA_INSTALL_DEVFILES
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
@@ -86,10 +68,14 @@ define LUA_INSTALL_DEVFILES
 endef
 endif
 
+
 define LUA_INSTALL_TARGET_CMDS
-	$(LUA_INSTALL_INTERPRETER)
-	$(LUA_INSTALL_COMPILER)
-	$(LUA_INSTALL_LIBRARY)
+	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
+	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
+	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
+		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
+	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
 	$(LUA_INSTALL_DEVFILES)
 endef
 
