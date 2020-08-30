From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:05:55 +0200
Subject: [Buildroot] [git commit] packages/luainterpreter: remove
 target-finalize hack
Message-ID: <20200902161639.EFC1585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a3530c0085e8d0c6b90f1ada8f1ff8c6dfb8dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LUAINTERPRETER_TARGET_FINALIZE_HOOKS, now that it's suported by
virtual packages.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: don't remove relevant comment]
---
 package/luainterpreter/luainterpreter.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 58d421b183..9d9f85a579 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -7,15 +7,11 @@
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 # Lua packages often install documentation, clean that up globally
-# Since luainterpreter is a virtual package, we can't use
-# LUAINTERPRETER_TARGET_FINALIZE_HOOKS
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 define LUAINTERPRETER_REMOVE_DOC
 	rm -rf $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/doc
 endef
 
-TARGET_FINALIZE_HOOKS += LUAINTERPRETER_REMOVE_DOC
-endif
+LUAINTERPRETER_TARGET_FINALIZE_HOOKS += LUAINTERPRETER_REMOVE_DOC
 
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
