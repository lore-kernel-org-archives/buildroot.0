From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 22 Jan 2014 12:13:34 +0100
Subject: [Buildroot] [PATCH] lua: fix compilation with Blackfin FLAT
Message-ID: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the dlfcn interface is not available with flat memory model

see http://autobuild.buildroot.net/results/b41/b4146bf821d59f694546f6e3a341394cc8fa43ce/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2c867f6..b263070 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -15,7 +15,6 @@ LUA_LICENSE = MIT
 LUA_LICENSE_FILES = COPYRIGHT
 
 LUA_CFLAGS = -Wall -fPIC
-LUA_MYLIBS += -ldl
 
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_CFLAGS += -DLUA_COMPAT_ALL
@@ -24,17 +23,22 @@ LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 endif
 endif
 
+ifneq ($(BR2_BINFMT_FLAT),y)
+	LUA_CFLAGS += -DLUA_USE_DLOPEN
+	LUA_MYLIBS += -ldl
+endif
+
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_READLINE
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_LINENOISE),y)
 	LUA_DEPENDENCIES = linenoise
 	LUA_MYLIBS += -llinenoise
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_LINENOISE
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_LINENOISE
 else
-	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
+	LUA_CFLAGS += -DLUA_USE_POSIX
 endif
 endif
 
-- 
1.7.9.5
