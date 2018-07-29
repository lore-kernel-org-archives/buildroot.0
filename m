From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 29 Jul 2018 11:44:57 +0200
Subject: [Buildroot] [PATCH] luarocks: fix lua modules building with luajit
Message-ID: <20180729094457.32098-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

currently, when luajit is selected as luainterpreter,
all lua module fails to build with the message:
    Error: Failed finding Lua library. You may need to configure LUA_LIBDIR.

see http://autobuild.buildroot.net/results/66de049c306d7aff66894d53e2f4fa755fd01594

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-allow-libluajit-detection.patch      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/luarocks/0001-allow-libluajit-detection.patch

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
new file mode 100644
index 000000000..c5e52f428
--- /dev/null
+++ b/package/luarocks/0001-allow-libluajit-detection.patch
@@ -0,0 +1,32 @@
+From 961269271134e711bcfffebb0f179ffddcbf3d5a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 29 Jul 2018 11:17:34 +0200
+Subject: [PATCH] allow libluajit detection
+
+This detection was done only if luarocks is runned by luajit.
+But on Buildroot, luarocks is always runned by lua.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ src/luarocks/deps.lua | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
+index 8403f12..c1c0220 100644
+--- a/src/luarocks/deps.lua
++++ b/src/luarocks/deps.lua
+@@ -511,10 +511,8 @@ function deps.check_lua(vars)
+       "lua-" .. cfg.lua_version,
+       "lua-" .. shortv,
+       "lua",
++      "luajit-" .. cfg.lua_version,
+    }
+-   if cfg.luajit_version then
+-      table.insert(libnames, 1, "luajit-" .. cfg.lua_version)
+-   end
+    for _, libname in ipairs(libnames) do
+       local ok = check_external_dependency("LUA", { library = libname }, vars, "build")
+       if ok then
+-- 
+2.17.1
+
-- 
2.17.1
