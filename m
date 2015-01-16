From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Jan 2015 22:09:52 +0100
Subject: [Buildroot] [PATCH 3/6] lua: add option 32bits
In-Reply-To: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1421442595-27575-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in      | 9 +++++++++
 package/lua/lua.mk         | 8 ++++++++
 package/luabitop/Config.in | 4 ++++
 3 files changed, 21 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index dde999f..0f7b136 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -33,6 +33,15 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.2"	if BR2_PACKAGE_LUA_5_2
 	default "5.3"	if BR2_PACKAGE_LUA_5_3
 
+if BR2_PACKAGE_LUA_5_3
+config BR2_PACKAGE_LUA_32BITS
+	bool "Lua 32bits"
+	default y if !BR2_ARCH_IS_64
+	help
+	  The option with 32 bits for both integers and floats is particularly
+	  attractive for small machines and embedded systems.
+endif
+
 choice
 	prompt "Lua command-line editing"
 	default BR2_PACKAGE_LUA_EDITING_NONE
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 0e30186..f008d34 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -58,6 +58,14 @@ ifneq ($(BR2_LARGEFILE),y)
 	LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 endif
 
+ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
+define LUA_32BITS_LUACONF
+	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
+endef
+
+LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
+endif
+
 # We never want to have host-readline and host-ncurses as dependencies
 # of host-lua.
 HOST_LUA_DEPENDENCIES =
diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index 83a85b1..c5b3f60 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
+	depends on !BR2_PACKAGE_LUA_32BITS
 	help
 	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
 	  operations on numbers.
 
 	  http://bitop.luajit.org
+
+comment "luabitop needs a full Lua interpreter"
+	depends on BR2_PACKAGE_LUA_32BITS
-- 
2.1.0
