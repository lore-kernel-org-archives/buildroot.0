From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:03:55 +0100
Subject: [Buildroot] [git commit] lua: remove documentation from target
Message-ID: <20170305210519.C17F1821E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf38fa8338db7d9ec98e4c03c75661cfb88eb7e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many packages install documentation under /usr/share/lua/.../doc. Add
a TARGET_FINALIZE_HOOK to remove it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luainterpreter/luainterpreter.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index a6c98ab..90382fa 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -6,6 +6,17 @@
 
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
+# Lua packages often install documentation, clean that up globally
+# Since luainterpreter is a virtual package, we can't use
+# LUAINTERPRETER_TARGET_FINALIZE_HOOKS
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+define LUAINTERPRETER_REMOVE_DOC
+	rm -rf $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/doc
+endef
+
+TARGET_FINALIZE_HOOKS += LUAINTERPRETER_REMOVE_DOC
+endif
+
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
 
