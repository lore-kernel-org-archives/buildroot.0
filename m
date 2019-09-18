From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 08:19:10 +0200
Subject: [Buildroot] [pkg-luarocks 1/6] pkg-luarocks: remove LUAROCKS_RUN_ENV
Message-ID: <20190918061915.31250-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk | 5 -----
 package/pkg-luarocks.mk      | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cd547e280..9cf5aba8a 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -48,11 +48,6 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN_ENV = \
-	LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(LUAROCKS_CFLAGS)" \
-	TARGET_LDFLAGS="$(TARGET_LDFLAGS)"
 LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
 
 define LUAROCKS_FINALIZE_TARGET
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 78d6c325f..ede9b2c83 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -53,7 +53,7 @@ ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	mkdir -p $$($(2)_DIR)/luarocks-extract
 	cd $$($(2)_DIR)/luarocks-extract && \
-		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
+		$$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
 	mv $$($(2)_DIR)/luarocks-extract/*/* $$($(2)_DIR)
 endef
 endif
@@ -63,7 +63,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($(2)_SRCDIR) && $$(LUAROCKS_RUN_ENV) \
+	cd $$($(2)_SRCDIR) && \
 		$$(LUAROCKS_RUN_CMD) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
 endef
 endif
-- 
2.20.1
