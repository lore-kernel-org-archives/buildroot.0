From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:04:05 +0200
Subject: [Buildroot] [git commit] luarocks: move the option --deps-mode
Message-ID: <20140726070716.922349D302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5363cf1733e12066ff98cc2d527f648f3781ed14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option moves from `luarocks make` command to the LuaRocks config file.

This change and the merge of PR https://github.com/keplerproject/luarocks/pull/236
in LuaRocks 2.2.0 avoids the confusing message "Missing dependency"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luarocks/luarocks.mk |    1 +
 package/pkg-luarocks.mk      |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 19c1c94..5f7f395 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -38,6 +38,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
 	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
+	echo "deps_mode = [[none]]"                             >> $(LUAROCKS_CONFIG_FILE)
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index be0d4cc..95b397c 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -59,7 +59,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
-	 $$(LUAROCKS_RUN) make --deps-mode=none --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT)
+	 $$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT)
 endef
 endif
 
