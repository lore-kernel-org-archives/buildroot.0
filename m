From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Jan 2014 20:54:33 +0100
Subject: [Buildroot] [V2 2/3] lua-modules: choice between Lua 5.1.x & Lua
	5.2.x
In-Reply-To: <1389815674-14759-1-git-send-email-francois.perrad@gadz.org>
References: <1389815674-14759-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389815674-14759-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lbase64/Config.in                        |    4 ++++
 package/lua-ev/lua-ev.mk                         |    2 +-
 package/lua-msgpack-native/Config.in             |    4 ++++
 package/lua-msgpack-native/lua-msgpack-native.mk |    3 ++-
 package/luaexpat/Config.in                       |    4 ++++
 package/luaexpatutils/Config.in                  |    4 ++++
 package/luaexpatutils/luaexpatutils.mk           |    2 +-
 package/luaposix/Config.in                       |    2 +-
 package/luaposix/luaposix.mk                     |    2 +-
 package/luarocks/luarocks.mk                     |    4 ++--
 package/luasec/Config.in                         |    4 ++++
 11 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index ca9dd5d..4593ab9 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  A base64 library for Lua
 
 	  http://luaforge.net/projects/lbase64/
+
+comment "lbase64 needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 1236d77..1b10a80 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -9,6 +9,6 @@ LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
-LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua/5.1"
+LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
 
 $(eval $(cmake-package))
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 1014298..498b30c 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  This is a native, C language implementation of msgpack
 	  (http://msgpack.org) library/protocol for Lua language
 
 	  https://github.com/kengonakajima/lua-msgpack-native
+
+comment "lua-msgpack-native needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index d4547ae..ceb453d 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -15,7 +15,8 @@ define LUA_MSGPACK_NATIVE_BUILD_CMDS
 endef
 
 define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/5.1/msgpack.so
+	$(INSTALL) -m 755 -D $(@D)/msgpack.so \
+		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/msgpack.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index f8db318..f1bd15d 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
 	  http://matthewwild.co.uk/projects/luaexpat/
+
+comment "LuaExpat needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
index cb2887a..9b406c8 100644
--- a/package/luaexpatutils/Config.in
+++ b/package/luaexpatutils/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LUAEXPATUTILS
 	bool "luaexpatutils"
 	select BR2_PACKAGE_LUAEXPAT
+	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  lxp.doc is a module that provides useful features for working with
 	  XML formats in LOM format as used by the LuaExpat project from Kepler.
 
 	  https://github.com/stevedonovan/LuaExpatUtils
+
+comment "LuaExpatUtils needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index 93cf621..9bfc654 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -11,7 +11,7 @@ LUAEXPATUTILS_DEPENDENCIES = luaexpat
 
 define LUAEXPATUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/lua/doc.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/lxp/doc.lua
+		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/lxp/doc.lua
 endef
 
 $(eval $(generic-package))
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index cad6fe9..a95c825 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
-	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
 	  luaposix is a POSIX binding, including curses, for Lua 5.1
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index b018995..77f5e62 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -10,7 +10,7 @@ LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
-LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua/5.1" --datarootdir="/usr/share/lua/5.1"
+LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
     LUAPOSIX_DEPENDENCIES += ncurses
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 6cfd92e..88ab22a 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -12,7 +12,7 @@ LUAROCKS_LICENSE_FILES = COPYING
 HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
 
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
-LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-5.1.lua
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 
 define HOST_LUAROCKS_CONFIGURE_CMDS
 	cd $(@D) && ./configure \
@@ -41,5 +41,5 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/5.1/?.lua" \
+LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
 	$(HOST_DIR)/usr/bin/lua $(HOST_DIR)/usr/bin/luarocks
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index ed55df7..54e1842 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -3,8 +3,12 @@ config BR2_PACKAGE_LUASEC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
 
 	  http://www.inf.puc-rio.br/~brunoos/luasec/
+
+comment "LuaSec needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
-- 
1.7.9.5
