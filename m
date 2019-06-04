From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  4 Jun 2019 14:40:02 +0200
Subject: [Buildroot] [PATCH] package/lua-cqueues: fix build failure due to
 Gcc Bug 68485
Message-ID: <20190604124002.824-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package lua-cqueues manifests Microblaze Gcc Bug 68485 resulting in a
build failure due to an Internal Compiler Error.

As done for other packages in Buildroot work around this Gcc Bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:
http://autobuild.buildroot.net/results/c35/c35964dda4e2328c2c1f3b2388677b68c5ed461e/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/lua-cqueues/lua-cqueues.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 4f31c3277f..42dacc1946 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -10,8 +10,15 @@ LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
 LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl host-m4
 
+LUA_CQUEUES_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+LUA_CQUEUES_CFLAGS += -O0
+endif
+
 define LUA_CQUEUES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(LUA_CQUEUES_CFLAGS)" -C $(@D) \
 		prefix="$(STAGING_DIR)/usr" all$(LUAINTERPRETER_ABIVER)
 endef
 
-- 
2.17.1
