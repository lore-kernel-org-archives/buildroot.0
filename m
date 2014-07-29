From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:22:58 +0200
Subject: [Buildroot] [git commit] luarocks: refactor with
	TARGET_FINALIZE_HOOKS
Message-ID: <20140729182303.DB1DE9D337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8d5182b93289e42a5e86180f1c2f60da603b8a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |    1 -
 package/luarocks/luarocks.mk |    7 +++++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index ee66494..022beea 100644
--- a/Makefile
+++ b/Makefile
@@ -576,7 +576,6 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
-	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 80b9e9f..f4c06d6 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -51,3 +51,10 @@ $(eval $(host-generic-package))
 
 LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
 	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+
+define LUAROCKS_FINALIZE_TARGET
+	rm -rf $(TARGET_DIR)/usr/lib/luarocks
+endef
+
+TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
+
