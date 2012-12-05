From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 10:58:01 -0800
Subject: [Buildroot] [git commit] lua: support linenoise
Message-ID: <20121205190030.811F699357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=635bebf559f4f76bc4fa49c3ccb468476a654151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/Config.in              |   17 +++++++++++++++++
 package/lua/lua-11-linenoise.patch |   24 ++++++++++++++++++++++++
 package/lua/lua.mk                 |    8 +++++++-
 3 files changed, 48 insertions(+), 1 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 8233e2a..4166730 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -7,6 +7,15 @@ config BR2_PACKAGE_LUA
 
 if BR2_PACKAGE_LUA
 
+choice
+	prompt "Lua Interpreter command-line editing"
+	default BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
+
+config BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
+	bool "none"
+	help
+	  None.
+
 config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 	bool "readline support"
 	select BR2_PACKAGE_READLINE
@@ -14,4 +23,12 @@ config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 	help
 	  Enables command-line editing in the lua interpreter.
 
+config BR2_PACKAGE_LUA_INTERPRETER_LINENOISE
+	bool "linenoise support"
+	select BR2_PACKAGE_LINENOISE
+	help
+	  Enables command-line editing in the lua interpreter.
+
+endchoice
+
 endif
diff --git a/package/lua/lua-11-linenoise.patch b/package/lua/lua-11-linenoise.patch
new file mode 100644
index 0000000..488c080
--- /dev/null
+++ b/package/lua/lua-11-linenoise.patch
@@ -0,0 +1,24 @@
+Add support of linenoise (replace readline)
+
+see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/luaconf.h
+===================================================================
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -279,6 +279,13 @@
+ 	if (lua_strlen(L,idx) > 0)  /* non-empty line? */ \
+ 	  add_history(lua_tostring(L, idx));  /* add it to history */
+ #define lua_freeline(L,b)	((void)L, free(b))
++#elif defined(LUA_USE_LINENOISE)
++#include <linenoise.h>
++#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
++#define lua_saveline(L,idx) \
++	if (lua_strlen(L,idx) > 0)  /* non-empty line? */ \
++	  linenoiseHistoryAdd(lua_tostring(L, idx));  /* add it to history */
++#define lua_freeline(L,b)	((void)L, free(b))
+ #else
+ #define lua_readline(L,b,p)	\
+ 	((void)L, fputs(p, stdout), fflush(stdout),  /* show prompt */ \
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9e0d387..32acc99 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -16,10 +16,16 @@ LUA_MYLIBS += -ldl
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
-	LUA_CFLAGS += -DLUA_USE_LINUX
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE
+else
+ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_LINENOISE),y)
+	LUA_DEPENDENCIES = linenoise
+	LUA_MYLIBS += -llinenoise
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_LINENOISE
 else
 	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
 endif
+endif
 
 # We never want to have host-readline and host-ncurses as dependencies
 # of host-lua.
