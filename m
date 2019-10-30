From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 10:27:58 -0300
Subject: [Buildroot] [PATCH RFC 2/3] packages/luainterpreter: remove
 target-finalize hack
In-Reply-To: <20191030132759.8643-1-unixmania@gmail.com>
References: <20191030132759.8643-1-unixmania@gmail.com>
Message-ID: <20191030132759.8643-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use LUAINTERPRETER_TARGET_FINALIZE_HOOKS, now that it's suported by
virtual packages.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/luainterpreter/luainterpreter.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 58d421b183..828b71e8d2 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -6,16 +6,11 @@
 
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
-# Lua packages often install documentation, clean that up globally
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
-- 
2.18.1
