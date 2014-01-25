From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 25 Jan 2014 15:51:14 +0100
Subject: [Buildroot] [PATCH 1/2] lua: refactor install steps
In-Reply-To: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
References: <1390661475-23218-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1390661475-23218-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   22 +++++++++++
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   22 +++++++++++
 package/lua/lua.mk                                 |   41 ++------------------
 3 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
index 97a7068..1227cbd 100644
--- a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
@@ -1,8 +1,30 @@
 Add the compilation of a shared library.
 Compile the lua binary with the shared library.
+And install the shared library.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@
+ # What to install.
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
+-TO_LIB= liblua.a
++TO_LIB= liblua.a liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -63,6 +63,7 @@
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
++	cd $(INSTALL_LIB) && ln -sf liblua.so.$(R) liblua.so
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+ 
+ ranlib:
 Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
index 4679325..9321c62 100644
--- a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
+++ b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
@@ -1,8 +1,30 @@
 Add the compilation of a shared library.
 Compile the lua binary with the shared library.
+And install the shared library.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -41,7 +41,7 @@
+ # What to install.
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
+-TO_LIB= liblua.a
++TO_LIB= liblua.a liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -62,6 +62,7 @@
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
++	cd $(INSTALL_LIB) && ln -sf liblua.so.$(R) liblua.so
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
+ 
+ uninstall:
 Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2c867f6..c016d7e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -65,55 +65,20 @@ define HOST_LUA_BUILD_CMDS
 endef
 
 define LUA_INSTALL_STAGING_CMDS
+	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) -m 0755 -D $(@D)/src/lua $(STAGING_DIR)/usr/bin/lua
-	$(INSTALL) -m 0755 -D $(@D)/src/luac $(STAGING_DIR)/usr/bin/luac
-	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
-		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
-	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib/liblua.a
-	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(STAGING_DIR)/usr/include/lua.h
-	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(STAGING_DIR)/usr/include/luaconf.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(STAGING_DIR)/usr/include/lualib.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include/lauxlib.h
 endef
 
 define LUA_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
-	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
-	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
-		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
-	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
-	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)
-	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)
+	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/src/lua $(HOST_DIR)/usr/bin/lua
-	$(INSTALL) -m 0755 -D $(@D)/src/luac $(HOST_DIR)/usr/bin/luac
-	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
-		$(HOST_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
-	ln -sf liblua.so.$(LUA_VERSION) $(HOST_DIR)/usr/lib/liblua.so
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
+	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
-	$(INSTALL) -m 0644 -D $(@D)/src/lua.h $(HOST_DIR)/usr/include/lua.h
-	$(INSTALL) -m 0644 -D $(@D)/src/luaconf.h $(HOST_DIR)/usr/include/luaconf.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lualib.h $(HOST_DIR)/usr/include/lualib.h
-	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include/lauxlib.h
 endef
 
-LUA_INSTALLED_FILES = \
-	/usr/include/lua.h \
-	/usr/include/luaconf.h \
-	/usr/include/lualib.h \
-	/usr/include/lauxlib.h \
-	/usr/lib/pkgconfig/lua.pc \
-	/usr/bin/lua \
-	/usr/bin/luac \
-	/usr/lib/liblua.a \
-	/usr/lib/liblua.so*
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
1.7.9.5
