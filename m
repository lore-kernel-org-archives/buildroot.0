From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  1 Jul 2015 10:10:47 +0200
Subject: [Buildroot] [PATCH v5 2/2] pkg-luarocks: fix top-level parallel
	makefile support
In-Reply-To: <1435738247-9015-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435738247-9015-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435738247-9015-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the *-install-target phase the manifest file is being updated, if multiply packages try to update it they fail.

To avoid multiple access to the manifest file use flock to sync
multiple luarocks packages.

e.g. installing three luarocks packages:
make lua-cjson-build lua-coat-build lua-coatpersistent-build
make lua-cjson lua-coat lua-coatpersistent -j

Fix error:
Updating manifest for /home/tetsuya/buildroot/br2/output/target/usr/lib/luarocks/rocks
No existing manifest. Attempting to rebuild...

Error: rock_manifest file not found for lua-coat 0.9.1-1 - not a LuaRocks 2 tree?

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/luarocks/luarocks.mk | 6 ++++--
 package/pkg-luarocks.mk      | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2b6c975..413e23d 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -53,8 +53,10 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
+LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+
+LUAROCKS_RUN = $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD)
 
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 83f338e..0a7ba47 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -58,8 +58,8 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($(2)_SRCDIR) && \
-		$$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
+	cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) flock $$(TARGET_DIR) \
+		$$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
 endef
 endif
 
-- 
2.4.3
