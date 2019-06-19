From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:55:10 +0200
Subject: [Buildroot] [git commit] package/lua-cqueues: fix build failure due
 to gcc bug 68485
Message-ID: <20190619195513.DB9CA81FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3fa156fbf192ad2ffb7183ea9757e112ea8c755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lua-cqueues package exhibits gcc bug 68485 when built for the
Microblaze architecture with optimization enabled, which causes a
build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:

  http://autobuild.buildroot.net/results/c35964dda4e2328c2c1f3b2388677b68c5ed461e/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
