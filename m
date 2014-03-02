From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 17:52:47 +0100
Subject: [Buildroot] [PATCH 06/19] package/lua: rename config options
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <94325713b9304e6c90b940a614c9d99579679f77.1393778339.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Package's options should be named after the package.

Lua is an interpreter, but the package is named 'lua'. So we want to
name the config option with '_LUA_', not with '_LUA_INTERPRETER_'

Besides, naming them with '_LUA_INTERPRETER_' might be confusing, since
there is a package named 'luainterpreter'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 Config.in.legacy      | 21 +++++++++++++++++++++
 package/lua/Config.in | 10 +++++-----
 package/lua/lua.mk    |  4 ++--
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index afcd3b1..e536ae0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,27 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
+config BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
+	bool "Lua command-line editing none has been renamed"
+	help
+	  The BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE option has been
+	  renamed to BR2_PACKAGE_LUA_EDITING_NONE. You will have to select
+	  it in the corresponding choice.
+
+config BR2_PACKAGE_LUA_INTERPRETER_READLINE
+	bool "Lua command-line editing using readline has been renamed"
+	help
+	  The BR2_PACKAGE_LUA_INTERPRETER_READLINE option has been
+	  renamed to BR2_PACKAGE_LUA_READLINE. You will have to select
+	  it in the corresponding choice.
+
+config BR2_PACKAGE_LUA_INTERPRETER_LINENOISE
+	bool "Lua command-line editing using linenoise has been renamed"
+	help
+	  The BR2_PACKAGE_LUA_INTERPRETER_LINENOISE option has been
+	  renamed to BR2_PACKAGE_LUA_LINENOISE. You will have to select
+	  it in the corresponding choice.
+
 config BR2_KERNEL_HEADERS_SNAP
 	bool "Local Linux snapshot support removed"
 	select BR2_LEGACY
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 2f1b25b..0e31858 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -30,22 +30,22 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.2"	if BR2_PACKAGE_LUA_5_2
 
 choice
-	prompt "Lua Interpreter command-line editing"
-	default BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
+	prompt "Lua command-line editing"
+	default BR2_PACKAGE_LUA_EDITING_NONE
 
-config BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
+config BR2_PACKAGE_LUA_EDITING_NONE
 	bool "none"
 	help
 	  None.
 
-config BR2_PACKAGE_LUA_INTERPRETER_READLINE
+config BR2_PACKAGE_LUA_READLINE
 	bool "readline support"
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_NCURSES
 	help
 	  Enables command-line editing in the Lua interpreter.
 
-config BR2_PACKAGE_LUA_INTERPRETER_LINENOISE
+config BR2_PACKAGE_LUA_LINENOISE
 	bool "linenoise support"
 	select BR2_PACKAGE_LINENOISE
 	help
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index bf68e65..bc8799a 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -31,12 +31,12 @@ else
 	LUA_MYLIBS += -ldl
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
+ifeq ($(BR2_PACKAGE_LUA_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
 	LUA_CFLAGS += -DLUA_USE_READLINE
 else
-ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_LINENOISE),y)
+ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
 	LUA_DEPENDENCIES = linenoise
 	LUA_MYLIBS += -llinenoise
 	LUA_CFLAGS += -DLUA_USE_LINENOISE
-- 
1.8.3.2
