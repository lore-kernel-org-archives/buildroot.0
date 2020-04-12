From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:48:18 +0200
Subject: [Buildroot] [git commit] package/pkg-luarocks.mk: use custom
 luarocks config file
Message-ID: <20200412123416.2E0608E6C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a850cdce5373408890a2b35de31db04963870143
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the addition of the support for host-luarocks
packages, this commit changes the luarocks logic to use a custom
configuration file in $(HOST_DIR)/etc/luarocks/config.lua instead of
the default
$(HOST_DIR)/etc/luarocks/config-$(LUAINTERPRETER_ABIVER).lua.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: extracted from a larger patch from Fran??ois]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.mk | 9 ++++++---
 package/pkg-luarocks.mk      | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 17360048cd..cf111e4c91 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -12,7 +12,8 @@ LUAROCKS_LICENSE_FILES = COPYING
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
 LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
-LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_FILE_DEFAULT = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua
 
 define LUAROCKS_ADDON_EXTRACT
 	mkdir $(@D)/src/luarocks/cmd/external
@@ -30,9 +31,11 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 endef
 
 define HOST_LUAROCKS_INSTALL_CMDS
-	rm -f $(LUAROCKS_CONFIG_FILE)
+	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 	$(MAKE1) -C $(@D) install
-	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
+	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua \
+		> $(LUAROCKS_CONFIG_FILE)a
+	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 23906f4a86..a50a4fcf5a 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -70,6 +70,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
+		LUAROCKS_CONFIG=$$(LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
 			--tree "$$(TARGET_DIR)/usr" \
 			LUA_INCDIR="$$(STAGING_DIR)/usr/include" \
