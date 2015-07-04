From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:21:33 +0200
Subject: [Buildroot] [git commit] pkg-luarocks: fix top-level parallel
	makefile support
Message-ID: <20150704132150.68C4B80762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22b327fc743b48a33aec0a9190bd67118641b294
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: get rid of LUAROCKS_RUN, and use LUAROCKS_RUN_ENV +
LUAROCKS_RUN_CMD everywhere.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks.mk |    4 ++--
 package/pkg-luarocks.mk      |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2b6c975..ccbaaf7 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -53,8 +53,8 @@ endef
 
 $(eval $(host-generic-package))
 
-LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
+LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
 
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 83f338e..da5c912 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -49,7 +49,7 @@ $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
 ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	cd $$($(2)_DIR)/.. && \
-		$$(LUAROCKS_RUN) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
+		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
 endef
 endif
 
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
 
