From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 12:39:19 +0100
Subject: [Buildroot] [git commit] lua: remove 3 sub-options,
	always install all
Message-ID: <20121115113939.A97CB99FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76983349cf2c77ed86e636cf81df5a61dce15a59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/Config.in |   18 ------------------
 package/lua/lua.mk    |   18 +-----------------
 2 files changed, 1 insertions(+), 35 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 76359c0..8233e2a 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -7,29 +7,11 @@ config BR2_PACKAGE_LUA
 
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
index de60c57..4704e4c 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -10,11 +10,7 @@ LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
 LUA_LICENSE_FILES = COPYRIGHT
 
-LUA_CFLAGS = -Wall
-ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-	LUA_CFLAGS += -fPIC
-endif
-
+LUA_CFLAGS = -Wall -fPIC
 LUA_MYLIBS += -ldl
 
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
@@ -46,13 +42,11 @@ define HOST_LUA_BUILD_CMDS
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
@@ -66,29 +60,19 @@ define LUA_INSTALL_STAGING_CMDS
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
