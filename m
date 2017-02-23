From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:47 +0100
Subject: [Buildroot] [PATCH 25/25] lua: remove documentation from target
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-26-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages install documentation under /usr/share/lua/.../doc. Add
a TARGET_FINALIZE_HOOK to remove it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luainterpreter/luainterpreter.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index a6c98ab992..90382fa78f 100644
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
 
-- 
2.11.0
