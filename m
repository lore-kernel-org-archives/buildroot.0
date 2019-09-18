From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 08:19:11 +0200
Subject: [Buildroot] [pkg-luarocks 2/6] pkg-luarocks: refactor infra
In-Reply-To: <20190918061915.31250-1-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
Message-ID: <20190918061915.31250-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all variables containing BR data (except external_deps_dirs)
are now options of the command `luarocks make`

paths for external dependencies are now handled by the BR addon
which generates the variable _BUILD_OPTS with the content excepted
by `luarocks make`

and the remaining content of luarocks-br-config.lua is now inlined
in luarocks.mk

here, the config file is usable for host-luarocks

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-luarocks.txt | 12 ++++++------
 package/luarocks/buildroot.lua           | 21 ++++++++++++++++++++-
 package/luarocks/luarocks-br-config.lua  | 13 -------------
 package/luarocks/luarocks.mk             | 17 +++--------------
 package/pkg-luarocks.mk                  | 16 +++++++++++++++-
 5 files changed, 44 insertions(+), 35 deletions(-)
 delete mode 100644 package/luarocks/luarocks-br-config.lua

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index df97cdd50..f7104f373 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -19,10 +19,10 @@ with an example :
 06:
 07: LUA_FOO_VERSION = 1.0.2-1
 08: LUA_FOO_NAME_UPSTREAM = foo
-09: LUA_FOO_DEPENDENCIES = bar
-10:
-11: LUA_FOO_BUILD_OPTS += BAR_INCDIR=$(STAGING_DIR)/usr/include
-12: LUA_FOO_BUILD_OPTS += BAR_LIBDIR=$(STAGING_DIR)/usr/lib
+09:
+10: LUA_FOO_DEPENDENCIES = bar
+11: LUA_FOO_BUILD_OPTS = BAR_DIR=$(STAGING_DIR)/usr
+12:
 13: LUA_FOO_LICENSE = luaFoo license
 14: LUA_FOO_LICENSE_FILES = $(LUA_FOO_SUBDIR)/COPYING
 15:
@@ -38,10 +38,10 @@ Buildroot, we give Lua-related packages a name that starts with "lua", so the
 Buildroot name is different from the upstream name. +LUA_FOO_NAME_UPSTREAM+
 makes the link between the two names.
 
-On line 9, we declare our dependencies against native libraries, so that they
+On line 10, we declare our dependencies against native libraries, so that they
 are built before the build process of our package starts.
 
-On lines 11-12, we tell Buildroot to pass custom options to LuaRocks when it is
+On line 11, we tell Buildroot to pass custom options to LuaRocks when it is
 building the package.
 
 On lines 13-14, we specify the licensing terms for the package.
diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index e829b6db0..e3ab3f7f1 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -94,9 +94,18 @@ local function get_main_modules (rockspec)
    return t
 end
 
-local function get_external_dependencies (rockspec)
+local function get_raw_external_dependencies (rockspec)
    local t = {}
    for k in pairs(rockspec.external_dependencies or {}) do
+      t[#t+1] = k
+   end
+   table.sort(t)
+   return t
+end
+
+local function get_external_dependencies (rockspec)
+   local t = {}
+   for _, k in ipairs(get_raw_external_dependencies(rockspec)) do
       k = k:lower()
       if fs.is_dir('package/' .. k) then
          t[#t+1] = k
@@ -254,6 +263,16 @@ local function generate_mk (rockspec, lcname, licenses)
    end
    if #external_dependencies > 0 then
       f:write(ucname .. '_DEPENDENCIES = ' .. table.concat(external_dependencies, ' ') .. '\n')
+      local deps = get_raw_external_dependencies(rockspec)
+      if #deps == 1 then
+         f:write(ucname .. '_BUILD_OPTS = ' .. deps[1] .. '_DIR="$(STAGING_DIR)/usr"\n')
+      else
+         f:write(ucname .. '_BUILD_OPTS =')
+         for i = 1, #deps do
+            f:write(' \\\n\t' .. deps[i] .. '_DIR="$(STAGING_DIR)/usr"')
+         end
+         f:write('\n')
+      end
    end
    f:write('\n$(eval $(luarocks-package))\n')
    f:close()
diff --git a/package/luarocks/luarocks-br-config.lua b/package/luarocks/luarocks-br-config.lua
deleted file mode 100644
index 32d71e1e2..000000000
--- a/package/luarocks/luarocks-br-config.lua
+++ /dev/null
@@ -1,13 +0,0 @@
--- BR cross-compilation
-local function getenv (name) return os_getenv(name) or '' end
-variables.LUA_INCDIR = getenv('STAGING_DIR') .. [[/usr/include]]
-variables.LUA_LIBDIR = getenv('STAGING_DIR') .. [[/usr/lib]]
-variables.CC = getenv('TARGET_CC')
-variables.LD = getenv('TARGET_CC')
-variables.CFLAGS = getenv('TARGET_CFLAGS')
-variables.LIBFLAG = [[-shared ]] .. getenv('TARGET_LDFLAGS')
-external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]] }
-gcc_rpath = false
-rocks_trees = { getenv('TARGET_DIR') .. [[/usr]] }
-wrap_bin_scripts = false
-deps_mode = [[none]]
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 9cf5aba8a..27fb753d5 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -13,10 +13,6 @@ HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
 LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
-LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
-endif
 
 define LUAROCKS_ADDON_EXTRACT
 	mkdir $(@D)/src/luarocks/cmd/external
@@ -33,23 +29,16 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
 endef
 
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-define LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT
-	echo "lua_interpreter = [[luajit]]" >> $(LUAROCKS_CONFIG_FILE)
-endef
-endif
-
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
-	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
-	$(LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT)
+	echo "-- BR tricks"                     >> $(LUAROCKS_CONFIG_FILE)
+	echo "gcc_rpath = false"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "wrap_bin_scripts = false"         >> $(LUAROCKS_CONFIG_FILE)
 endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
-
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index ede9b2c83..23906f4a8 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -17,6 +17,12 @@
 #
 ################################################################################
 
+LUAROCKS_RUN_CMD = $(HOST_DIR)/bin/luarocks
+LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
+endif
+
 ################################################################################
 # inner-luarocks-package -- defines how the configuration, compilation and
 # installation of a LuaRocks package should be done, implements a few hooks to
@@ -64,7 +70,15 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
-		$$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
+		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
+			--tree "$$(TARGET_DIR)/usr" \
+			LUA_INCDIR="$$(STAGING_DIR)/usr/include" \
+			LUA_LIBDIR="$$(STAGING_DIR)/usr/lib" \
+			CC=$$(TARGET_CC) \
+			LD=$$(TARGET_CC) \
+			CFLAGS="$$(LUAROCKS_CFLAGS)" \
+			LIBFLAG="-shared $$(TARGET_LDFLAGS)" \
+			$$($(2)_BUILD_OPTS) $$($(2)_ROCKSPEC)
 endef
 endif
 
-- 
2.20.1
