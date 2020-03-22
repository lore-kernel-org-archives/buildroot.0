From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Mar 2020 09:07:03 +0100
Subject: [Buildroot] [pkg-luarocks v2 2/5] pkg-luarocks: refactor infra
In-Reply-To: <20200322080706.19806-1-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
Message-ID: <20200322080706.19806-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

move stuff from luarocks.mk and luarocks-br-config.lua
to pkg-luarocks.mk

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks-br-config.lua |  8 --------
 package/luarocks/luarocks.mk            | 11 -----------
 package/pkg-luarocks.mk                 | 20 +++++++++++++++++---
 3 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/package/luarocks/luarocks-br-config.lua b/package/luarocks/luarocks-br-config.lua
index 32d71e1e2..3a0bd68c9 100644
--- a/package/luarocks/luarocks-br-config.lua
+++ b/package/luarocks/luarocks-br-config.lua
@@ -1,13 +1,5 @@
 -- BR cross-compilation
 local function getenv (name) return os_getenv(name) or '' end
-variables.LUA_INCDIR = getenv('STAGING_DIR') .. [[/usr/include]]
-variables.LUA_LIBDIR = getenv('STAGING_DIR') .. [[/usr/lib]]
-variables.CC = getenv('TARGET_CC')
-variables.LD = getenv('TARGET_CC')
-variables.CFLAGS = getenv('TARGET_CFLAGS')
-variables.LIBFLAG = [[-shared ]] .. getenv('TARGET_LDFLAGS')
 external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]] }
 gcc_rpath = false
-rocks_trees = { getenv('TARGET_DIR') .. [[/usr]] }
 wrap_bin_scripts = false
-deps_mode = [[none]]
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index d48c95ced..17360048c 100644
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
@@ -41,13 +37,6 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_ENV = \
-	LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(LUAROCKS_CFLAGS)" \
-	TARGET_LDFLAGS="$(TARGET_LDFLAGS)"
-LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
-
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 78d6c325f..23906f4a8 100644
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
@@ -53,7 +59,7 @@ ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	mkdir -p $$($(2)_DIR)/luarocks-extract
 	cd $$($(2)_DIR)/luarocks-extract && \
-		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
+		$$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
 	mv $$($(2)_DIR)/luarocks-extract/*/* $$($(2)_DIR)
 endef
 endif
@@ -63,8 +69,16 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) \
-		$$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
+	cd $$($(2)_SRCDIR) && \
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
