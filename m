From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Sep 2020 17:43:49 +0200
Subject: [Buildroot] [PATCH] package/luarocks: refactor infrastructure with
 DEPS_DIR
Message-ID: <20200928154349.2193859-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DEPS_DIR is a new CLI option introduced by the version 3.4.0,
which avoids the use of `external_deps_dirs` in the config files.

now, the host config doesn't need to be altered.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks-br-config.lua      | 5 -----
 package/luarocks/luarocks-br-host-config.lua | 3 ---
 package/luarocks/luarocks.mk                 | 9 +++++----
 package/pkg-luarocks.mk                      | 2 ++
 4 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 package/luarocks/luarocks-br-config.lua
 delete mode 100644 package/luarocks/luarocks-br-host-config.lua

diff --git a/package/luarocks/luarocks-br-config.lua b/package/luarocks/luarocks-br-config.lua
deleted file mode 100644
index 3a0bd68c9..000000000
--- a/package/luarocks/luarocks-br-config.lua
+++ /dev/null
@@ -1,5 +0,0 @@
--- BR cross-compilation
-local function getenv (name) return os_getenv(name) or '' end
-external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]] }
-gcc_rpath = false
-wrap_bin_scripts = false
diff --git a/package/luarocks/luarocks-br-host-config.lua b/package/luarocks/luarocks-br-host-config.lua
deleted file mode 100644
index 631959545..000000000
--- a/package/luarocks/luarocks-br-host-config.lua
+++ /dev/null
@@ -1,3 +0,0 @@
--- BR host compilation
-local function getenv (name) return os_getenv(name) or '' end
-external_deps_dirs = { getenv('HOST_DIR') }
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 00b3e17cb..670e7487a 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -34,10 +34,11 @@ endef
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 	$(MAKE1) -C $(@D) install
-	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua \
-		> $(LUAROCKS_CONFIG_FILE)
-	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-host-config.lua \
-		> $(HOST_LUAROCKS_CONFIG_FILE)
+	cp $(LUAROCKS_CONFIG_FILE_DEFAULT) $(LUAROCKS_CONFIG_FILE)
+	echo "-- BR cross-compilation"  >> $(LUAROCKS_CONFIG_FILE)
+	echo "gcc_rpath = false"        >> $(LUAROCKS_CONFIG_FILE)
+	echo "wrap_bin_scripts = false" >> $(LUAROCKS_CONFIG_FILE)
+	cp $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_CONFIG_FILE)
 	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 endef
 
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 81a6cf208..fd7985587 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -112,6 +112,7 @@ define $(2)_INSTALL_TARGET_CMDS
 		LUAROCKS_CONFIG=$$(LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
 			--tree "$$(TARGET_DIR)/usr" \
+			DEPS_DIR="$$(STAGING_DIR)/usr" \
 			LUA_INCDIR="$$(STAGING_DIR)/usr/include" \
 			LUA_LIBDIR="$$(STAGING_DIR)/usr/lib" \
 			CC=$$(TARGET_CC) \
@@ -127,6 +128,7 @@ define $(2)_INSTALL_CMDS
 	cd $$($(2)_SRCDIR) && \
 		LUAROCKS_CONFIG=$$(HOST_LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
+			DEPS_DIR="$$(HOST_DIR)" \
 			CFLAGS="$$(HOST_LUAROCKS_CFLAGS)" \
 			LIBFLAG="-shared $$(HOST_LDFLAGS)" \
 			$$($(2)_BUILD_OPTS) $$($(2)_ROCKSPEC)
-- 
2.25.1
