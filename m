From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 10 Sep 2019 05:30:08 +0200
Subject: [Buildroot] [LuaRocks 2/3] package/luarocks: fix generated
 configuration when luajit
In-Reply-To: <20190910033009.4252-1-francois.perrad@gadz.org>
References: <20190910033009.4252-1-francois.perrad@gadz.org>
Message-ID: <20190910033009.4252-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this trick removes the need of the patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-allow-libluajit-detection.patch      | 34 -------------------
 package/luarocks/luarocks.mk                  |  7 ++++
 2 files changed, 7 insertions(+), 34 deletions(-)
 delete mode 100644 package/luarocks/0001-allow-libluajit-detection.patch

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
deleted file mode 100644
index e0ff85d40..000000000
--- a/package/luarocks/0001-allow-libluajit-detection.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fedd1259e47a6f6cb97bce8c9bf31eeb261b93be Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sat, 27 Jul 2019 15:26:26 +0200
-Subject: [PATCH] allow libluajit detection
-
-This detection was done only if luarocks is runned by luajit.
-But on Buildroot, luarocks is always runned by lua.
-
-See https://github.com/luarocks/luarocks/pull/883
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- src/luarocks/deps.lua | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
-index cb85764..02cdda6 100644
---- a/src/luarocks/deps.lua
-+++ b/src/luarocks/deps.lua
-@@ -555,10 +555,8 @@ function deps.check_lua_libdir(vars)
-       "lua-" .. cfg.lua_version,
-       "lua-" .. shortv,
-       "lua",
-+      "luajit-" .. cfg.lua_version,
-    }
--   if ljv then
--      table.insert(libnames, 1, "luajit-" .. cfg.lua_version)
--   end
-    local cache = {}
-    for _, libname in ipairs(libnames) do
-       local ok = check_external_dependency("LUA", { library = libname }, vars, "build", cache)
--- 
-2.20.1
-
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 450561228..cd547e280 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -33,10 +33,17 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
 endef
 
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+define LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT
+	echo "lua_interpreter = [[luajit]]" >> $(LUAROCKS_CONFIG_FILE)
+endef
+endif
+
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
 	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
+	$(LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT)
 endef
 
 $(eval $(host-generic-package))
-- 
2.20.1
