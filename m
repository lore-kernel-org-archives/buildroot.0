From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:46 +0200
Subject: [Buildroot] [RFC v4 12/16] pacakge/luarocks: add GCC_SYSROOT
	environment variable to support pps
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-13-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, add the GCC_SYSROOT
environment variable and use it for building luarocks pacakges.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...ctions-to-the-global-environment-of-the-c.patch | 54 +++++++++++++++
 package/luarocks/0002-fixed-typo.patch             | 27 ++++++++
 ...e-environment-table-for-the-system-config.patch | 76 ++++++++++++++++++++++
 ...is-not-being-integrated-bug-introduced-in.patch | 62 ++++++++++++++++++
 package/luarocks/luarocks.mk                       | 11 ++--
 5 files changed, 226 insertions(+), 4 deletions(-)
 create mode 100644 package/luarocks/0001-added-2-functions-to-the-global-environment-of-the-c.patch
 create mode 100644 package/luarocks/0002-fixed-typo.patch
 create mode 100644 package/luarocks/0003-fix-use-same-environment-table-for-the-system-config.patch
 create mode 100644 package/luarocks/0004-config.lua-is-not-being-integrated-bug-introduced-in.patch

diff --git a/package/luarocks/0001-added-2-functions-to-the-global-environment-of-the-c.patch b/package/luarocks/0001-added-2-functions-to-the-global-environment-of-the-c.patch
new file mode 100644
index 0000000..f83c139
--- /dev/null
+++ b/package/luarocks/0001-added-2-functions-to-the-global-environment-of-the-c.patch
@@ -0,0 +1,54 @@
+From b3ea8783a4d73d437a27befc1d8ab47ef69d4ba1 Mon Sep 17 00:00:00 2001
+From: Thijs Schreijer <thijs@thijsschreijer.nl>
+Date: Tue, 16 Jun 2015 19:31:01 +0200
+Subject: [PATCH 1/4] added 2 functions to the global environment of the
+ config-file loader sandbox; `os_getenv()` and `__dump_env()`
+
+(Upstream patch taken from master branch)
+(cherry picked from commit e1dd6375822d800984e1d3d821899a315bc1b222)
+---
+ src/luarocks/cfg.lua | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/src/luarocks/cfg.lua b/src/luarocks/cfg.lua
+index 99b4077..cf0c0d3 100644
+--- a/src/luarocks/cfg.lua
++++ b/src/luarocks/cfg.lua
+@@ -145,6 +145,14 @@ end
+ cfg.variables = {}
+ cfg.rocks_trees = {}
+ 
++-- some extras for the global enviornment in the config files;
++cfg.os_getenv = os.getenv
++cfg.__dump_env = function()
++  -- debug function, calling it from a config file will show all 
++  -- available globals to that config file
++  print(util.show_table(cfg, "global environment"))
++end
++
+ sys_config_file = site_config.LUAROCKS_SYSCONFIG or sys_config_dir.."/config-"..cfg.lua_version..".lua"
+ local err, errcode
+ sys_config_ok, err, errcode = persist.load_into_table(sys_config_file, cfg)
+@@ -158,11 +166,18 @@ if (not sys_config_ok) and errcode ~= "open" then -- either "load" or "run"; bad
+    os.exit(cfg.errorcodes.CONFIGFILE)
+ end
+ 
+-local env_for_config_file = {
++local env_for_config_file
++env_for_config_file = {
+    home = cfg.home,
+    lua_version = cfg.lua_version,
+    platform = util.make_shallow_copy(detected),
+    processor = proc,
++   os_getenv = os.getenv, 
++   __dump_env = function()
++     -- debug function, calling it from a config file will show all 
++     -- available globals to that config file
++     print(util.show_table(env_for_config_file, "global environment"))
++   end,
+ }
+ 
+ if not site_config.LUAROCKS_FORCE_CONFIG then
+-- 
+2.4.3
+
diff --git a/package/luarocks/0002-fixed-typo.patch b/package/luarocks/0002-fixed-typo.patch
new file mode 100644
index 0000000..f4defef
--- /dev/null
+++ b/package/luarocks/0002-fixed-typo.patch
@@ -0,0 +1,27 @@
+From 53c9599371b3e0815d62d3d34b1f1aef2b2877db Mon Sep 17 00:00:00 2001
+From: Thijs Schreijer <thijs@thijsschreijer.nl>
+Date: Wed, 17 Jun 2015 11:01:48 +0200
+Subject: [PATCH 2/4] fixed typo
+
+(Upstream patch taken from master branch)
+(cherry picked from commit 4792618d8882eb36c9e9d05efac8b1ae336f00cb)
+---
+ src/luarocks/cfg.lua | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/luarocks/cfg.lua b/src/luarocks/cfg.lua
+index cf0c0d3..278be4a 100644
+--- a/src/luarocks/cfg.lua
++++ b/src/luarocks/cfg.lua
+@@ -145,7 +145,7 @@ end
+ cfg.variables = {}
+ cfg.rocks_trees = {}
+ 
+--- some extras for the global enviornment in the config files;
++-- some extras for the global environment in the config files;
+ cfg.os_getenv = os.getenv
+ cfg.__dump_env = function()
+   -- debug function, calling it from a config file will show all 
+-- 
+2.4.3
+
diff --git a/package/luarocks/0003-fix-use-same-environment-table-for-the-system-config.patch b/package/luarocks/0003-fix-use-same-environment-table-for-the-system-config.patch
new file mode 100644
index 0000000..05e6a5e
--- /dev/null
+++ b/package/luarocks/0003-fix-use-same-environment-table-for-the-system-config.patch
@@ -0,0 +1,76 @@
+From a51259a3308aef9ce61f611144324b998ad67710 Mon Sep 17 00:00:00 2001
+From: Thijs Schreijer <thijs@thijsschreijer.nl>
+Date: Thu, 18 Jun 2015 18:01:19 +0200
+Subject: [PATCH 3/4] fix: use same environment table for the system config
+ file as well.
+
+(Upstream patch taken from master branch)
+(cherry picked from commit 998d012a7228099990a88454150e843559074e0c)
+---
+ src/luarocks/cfg.lua | 37 +++++++++++++++----------------------
+ 1 file changed, 15 insertions(+), 22 deletions(-)
+
+diff --git a/src/luarocks/cfg.lua b/src/luarocks/cfg.lua
+index 278be4a..5dcd59c 100644
+--- a/src/luarocks/cfg.lua
++++ b/src/luarocks/cfg.lua
+@@ -145,27 +145,7 @@ end
+ cfg.variables = {}
+ cfg.rocks_trees = {}
+ 
+--- some extras for the global environment in the config files;
+-cfg.os_getenv = os.getenv
+-cfg.__dump_env = function()
+-  -- debug function, calling it from a config file will show all 
+-  -- available globals to that config file
+-  print(util.show_table(cfg, "global environment"))
+-end
+-
+-sys_config_file = site_config.LUAROCKS_SYSCONFIG or sys_config_dir.."/config-"..cfg.lua_version..".lua"
+-local err, errcode
+-sys_config_ok, err, errcode = persist.load_into_table(sys_config_file, cfg)
+-
+-if (not sys_config_ok) and errcode == "open" then -- file not found, so try alternate file
+-   sys_config_file = sys_config_dir.."/config.lua"
+-   sys_config_ok, err, errcode = persist.load_into_table(sys_config_file, cfg)
+-end
+-if (not sys_config_ok) and errcode ~= "open" then -- either "load" or "run"; bad config file, bail out with error
+-   io.stderr:write(err.."\n")
+-   os.exit(cfg.errorcodes.CONFIGFILE)
+-end
+-
++-- The global environment in the config files;
+ local env_for_config_file
+ env_for_config_file = {
+    home = cfg.home,
+@@ -173,13 +153,26 @@ env_for_config_file = {
+    platform = util.make_shallow_copy(detected),
+    processor = proc,
+    os_getenv = os.getenv, 
+-   __dump_env = function()
++   dump_env = function()
+      -- debug function, calling it from a config file will show all 
+      -- available globals to that config file
+      print(util.show_table(env_for_config_file, "global environment"))
+    end,
+ }
+ 
++sys_config_file = site_config.LUAROCKS_SYSCONFIG or sys_config_dir.."/config-"..cfg.lua_version..".lua"
++local err, errcode
++   sys_config_ok, err, errcode = persist.load_into_table(sys_config_file, env_for_config_file)
++
++if (not sys_config_ok) and errcode == "open" then -- file not found, so try alternate file
++   sys_config_file = sys_config_dir.."/config.lua"
++      sys_config_ok, err, errcode = persist.load_into_table(sys_config_file, env_for_config_file)
++end
++if (not sys_config_ok) and errcode ~= "open" then -- either "load" or "run"; bad config file, bail out with error
++   io.stderr:write(err.."\n")
++   os.exit(cfg.errorcodes.CONFIGFILE)
++end
++
+ if not site_config.LUAROCKS_FORCE_CONFIG then
+ 
+    local home_overrides, err, errcode
+-- 
+2.4.3
+
diff --git a/package/luarocks/0004-config.lua-is-not-being-integrated-bug-introduced-in.patch b/package/luarocks/0004-config.lua-is-not-being-integrated-bug-introduced-in.patch
new file mode 100644
index 0000000..af702eb
--- /dev/null
+++ b/package/luarocks/0004-config.lua-is-not-being-integrated-bug-introduced-in.patch
@@ -0,0 +1,62 @@
+From 3cd403fd0979328f9c6f711a3983c64c250ce7df Mon Sep 17 00:00:00 2001
+From: Thijs Schreijer <thijs@thijsschreijer.nl>
+Date: Thu, 25 Jun 2015 00:14:50 +0200
+Subject: [PATCH 4/4] config.lua is not being integrated, bug introduced in
+ #385
+
+(Upstream patch taken from master branch)
+(cherry picked from commit f6974b40735b9300f7b529da6e602459d0db9c49)
+---
+ src/luarocks/cfg.lua | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+ mode change 100644 => 100755 src/luarocks/cfg.lua
+
+diff --git a/src/luarocks/cfg.lua b/src/luarocks/cfg.lua
+old mode 100644
+new mode 100755
+index 5dcd59c..3cf0565
+--- a/src/luarocks/cfg.lua
++++ b/src/luarocks/cfg.lua
+@@ -159,6 +159,16 @@ env_for_config_file = {
+      print(util.show_table(env_for_config_file, "global environment"))
+    end,
+ }
++-- Merge values from config files read into the `cfg` table
++local merge_overrides = function(overrides)
++   if overrides.rocks_trees then
++      cfg.rocks_trees = nil
++   end
++   if overrides.rocks_servers then
++      cfg.rocks_servers = nil
++   end
++   util.deep_merge(cfg, overrides)
++end
+ 
+ sys_config_file = site_config.LUAROCKS_SYSCONFIG or sys_config_dir.."/config-"..cfg.lua_version..".lua"
+ local err, errcode
+@@ -172,6 +182,7 @@ if (not sys_config_ok) and errcode ~= "open" then -- either "load" or "run"; bad
+    io.stderr:write(err.."\n")
+    os.exit(cfg.errorcodes.CONFIGFILE)
+ end
++   merge_overrides(sys_config_ok)
+ 
+ if not site_config.LUAROCKS_FORCE_CONFIG then
+ 
+@@ -189,13 +200,7 @@ if not site_config.LUAROCKS_FORCE_CONFIG then
+    end
+    if home_overrides then
+       home_config_ok = true
+-      if home_overrides.rocks_trees then
+-         cfg.rocks_trees = nil
+-      end
+-      if home_overrides.rocks_servers then
+-         cfg.rocks_servers = nil
+-      end
+-      util.deep_merge(cfg, home_overrides)
++      merge_overrides(home_overrides)
+    else
+       home_config_ok = home_overrides
+       if errcode ~= "open" then
+-- 
+2.4.4
+
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 413e23d..042019f 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -35,16 +35,17 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install \
 		PREFIX=$(HOST_DIR)/usr
+	echo "gcc_sysroot = os_getenv([[GCC_SYSROOT]])"         >> $(LUAROCKS_CONFIG_FILE)
 	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LUA_INCDIR = [[$(STAGING_DIR)/usr/include]],"  >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LUA_INCDIR = gcc_sysroot..[[/usr/include]],"   >> $(LUAROCKS_CONFIG_FILE)
+	echo "   LUA_LIBDIR = gcc_sysroot..[[/usr/lib]],"       >> $(LUAROCKS_CONFIG_FILE)
 	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
 	echo "   CFLAGS = [[$(LUAROCKS_CFLAGS)]],"              >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
-	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
+	echo 'external_deps_dirs = { gcc_sysroot..[[/usr]] }'   >> $(LUAROCKS_CONFIG_FILE)
 	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
 	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
@@ -53,7 +54,9 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
+LUAROCKS_RUN_ENV = \
+	GCC_SYSROOT="$(STAGING_DIR)" \
+	LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
 LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
 
 LUAROCKS_RUN = $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD)
-- 
2.4.3
