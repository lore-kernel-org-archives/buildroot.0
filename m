From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 30 Jul 2012 08:31:29 +0200
Subject: [Buildroot] [PATCH 3/4] lua: remove 3 sub-options,
	always install all
In-Reply-To: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
References: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1343629890-4657-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lua/Config.in |   18 ------------------
 package/lua/lua.mk    |   17 +----------------
 2 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 06f3046..fc6bb4c 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -32,29 +32,11 @@ endchoice
 
 if BR2_PACKAGE_LUA
 
-config BR2_PACKAGE_LUA_COMPILER
-	bool "lua compiler"
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
-	help
-	  Install luac binary
-
-config BR2_PACKAGE_LUA_INTERPRETER
-	bool "lua interpreter"
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
-	help
-	  Install lua binary
-
 config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 	bool "readline support"
-	depends on BR2_PACKAGE_LUA_INTERPRETER
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_NCURSES
 	help
 	  Enables command-line editing in the lua interpreter.
 
-config BR2_PACKAGE_LUA_SHARED_LIBRARY
-	bool "shared library"
-	help
-	  Install shared liblua.so
-
 endif
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 26c1576..136dca6 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -8,10 +8,7 @@ LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 
-LUA_CFLAGS = -Wall
-ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-	LUA_CFLAGS += -fPIC
-endif
+LUA_CFLAGS = -Wall -fPIC
 
 LUA_MYLIBS += -ldl
 
@@ -44,13 +41,11 @@ define HOST_LUA_BUILD_CMDS
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
-ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 define LUA_INSTALL_STAGING_SHARED_LIB
 	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
 endef
-endif
 
 define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
@@ -64,29 +59,19 @@ define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(STAGING_DIR)/usr/include/lauxlib.h
 endef
 
-ifeq ($(BR2_PACKAGE_LUA_INTERPRETER),y)
 define LUA_INSTALL_INTERPRETER
 	$(INSTALL) -m 0755 -D $(@D)/src/lua $(TARGET_DIR)/usr/bin/lua
 endef
-endif
 
-ifeq ($(BR2_PACKAGE_LUA_COMPILER),y)
 define LUA_INSTALL_COMPILER
 	$(INSTALL) -m 0755 -D $(@D)/src/luac $(TARGET_DIR)/usr/bin/luac
 endef
-endif
 
-ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 define LUA_INSTALL_LIBRARY
 	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
 	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-endef
-else
-define LUA_INSTALL_LIBRARY
-	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-endef
 endif
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
-- 
1.7.9.5
