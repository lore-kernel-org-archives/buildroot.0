From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 17:22:04 +0100
Subject: [Buildroot] [git commit] lua: refactor install steps
Message-ID: <20140226163328.5730C9BA95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=179266d292b483b9bb1fe847b7d5b191d751b643
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

since the comeback of version in module path (see commit ccd68a51)
the upstream Makefiles are usable for install.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   22 ++++++++++++++
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   22 ++++++++++++++
 package/lua/lua.mk                                 |   30 ++------------------
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
index 97a7068..bd40534 100644
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
+@@ -44,6 +44,7 @@
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
+ TO_LIB= liblua.a
++TO_SOLIB = liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -61,6 +62,8 @@
+ install: dummy
+ 	cd src && $(MKDIR) $(INSTALL_BIN) $(INSTALL_INC) $(INSTALL_LIB) $(INSTALL_MAN) $(INSTALL_LMOD) $(INSTALL_CMOD)
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
++	cd src && $(INSTALL_EXEC) $(TO_SOLIB) $(INSTALL_LIB)
++	ln -sf $(TO_SOLIB) $(INSTALL_LIB)/liblua.so
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
 Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
index 4679325..cd8a5bf 100644
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
+@@ -42,6 +42,7 @@
+ TO_BIN= lua luac
+ TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
+ TO_LIB= liblua.a
++TO_SOLIB = liblua.so.$(R)
+ TO_MAN= lua.1 luac.1
+ 
+ # Lua version and release.
+@@ -60,6 +61,8 @@
+ install: dummy
+ 	cd src && $(MKDIR) $(INSTALL_BIN) $(INSTALL_INC) $(INSTALL_LIB) $(INSTALL_MAN) $(INSTALL_LMOD) $(INSTALL_CMOD)
+ 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
++	cd src && $(INSTALL_EXEC) $(TO_SOLIB) $(INSTALL_LIB)
++	ln -sf $(TO_SOLIB) $(INSTALL_LIB)/liblua.so
+ 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
+ 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
+ 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
 Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index a20531c..c016d7e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -65,43 +65,19 @@ define HOST_LUA_BUILD_CMDS
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
 
 $(eval $(generic-package))
