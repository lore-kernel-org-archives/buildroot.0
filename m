From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 16:09:46 +0100
Subject: [Buildroot] [git commit] lua: add option 32bits
Message-ID: <20150202152924.13EDA800AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=984bd5a94d7cd519fe3b5c3ddc7810b18978d9bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: tweak config/help text]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/Config.in      |   11 +++++++++++
 package/lua/lua.mk         |    8 ++++++++
 package/luabitop/Config.in |    4 ++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index dde999f..d9f85e2 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -33,6 +33,17 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.2"	if BR2_PACKAGE_LUA_5_2
 	default "5.3"	if BR2_PACKAGE_LUA_5_3
 
+if BR2_PACKAGE_LUA_5_3
+config BR2_PACKAGE_LUA_32BITS
+	bool "Use 32 bit numbers"
+	default y if !BR2_ARCH_IS_64
+	help
+	  Use a 32 bit data type for numbers / integers instead of the
+	  default 64 bit type.  This option is particularly attractive
+	  for small machines and embedded systems.
+
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
