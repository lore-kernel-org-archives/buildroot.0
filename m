From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2018 16:31:04 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 3.0.1
Message-ID: <20180815143104.27453-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-allow-libluajit-detection.patch      | 32 -------------------
 package/luarocks/luarocks.hash                |  2 +-
 package/luarocks/luarocks.mk                  |  8 ++---
 3 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/luarocks/0001-allow-libluajit-detection.patch

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
deleted file mode 100644
index c5e52f428..000000000
--- a/package/luarocks/0001-allow-libluajit-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 961269271134e711bcfffebb0f179ffddcbf3d5a Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 29 Jul 2018 11:17:34 +0200
-Subject: [PATCH] allow libluajit detection
-
-This detection was done only if luarocks is runned by luajit.
-But on Buildroot, luarocks is always runned by lua.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- src/luarocks/deps.lua | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
-index 8403f12..c1c0220 100644
---- a/src/luarocks/deps.lua
-+++ b/src/luarocks/deps.lua
-@@ -511,10 +511,8 @@ function deps.check_lua(vars)
-       "lua-" .. cfg.lua_version,
-       "lua-" .. shortv,
-       "lua",
-+      "luajit-" .. cfg.lua_version,
-    }
--   if cfg.luajit_version then
--      table.insert(libnames, 1, "luajit-" .. cfg.lua_version)
--   end
-    for _, libname in ipairs(libnames) do
-       local ok = check_external_dependency("LUA", { library = libname }, vars, "build")
-       if ok then
--- 
-2.17.1
-
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 87ef6827c..4aa791cb4 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a43fffb997100f11cccb529a3db5456ce8dab18171a5cb3645f948147b6f64a1  luarocks-3.0.0.tar.gz
+sha256 b989c4b60d6c9edcd65169e5e42fcffbd39cdbebe6b138fa5aea45102f8d9ec0  luarocks-3.0.1.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index af64f72a6..55fbd7b5d 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.0
+LUAROCKS_VERSION = 3.0.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
-LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc/luarocks
-LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
 LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
 
 HOST_LUAROCKS_CONF_OPTS = \
@@ -28,8 +28,6 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
 	echo "-- BR cross-compilation"                                  >> $(LUAROCKS_CONFIG_FILE)
-	echo "variables.LUA_DIR = [[$(STAGING_DIR)/usr]]"               >> $(LUAROCKS_CONFIG_FILE)
-	echo "variables.LUA_BINDIR = [[$(STAGING_DIR)/usr/bin]]"        >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.LUA_INCDIR = [[$(STAGING_DIR)/usr/include]]"    >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]]"        >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.CC = [[$(TARGET_CC)]]"                          >> $(LUAROCKS_CONFIG_FILE)
-- 
2.17.1
