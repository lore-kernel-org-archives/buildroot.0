From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Aug 2017 15:31:11 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
Message-ID: <20170813133111.3959-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`install` works even when the directory pkgconfig is not already created

see http://autobuild.buildroot.net/results/101/101c89e1d6aee942a0b1c4e4f3daf8ac2414a56c/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 0692c5376..36561aed3 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -65,6 +65,14 @@ endif
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
+define LUA_CONFIGURE_CMDS
+	$(SED) "s/@MYLIBS@/$(LUA_MYLIBS)/" $(@D)/etc/lua.pc
+endef
+
+define HOST_LUA_CONFIGURE_CMDS
+	$(SED) "s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" $(@D)/etc/lua.pc
+endef
+
 define LUA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
@@ -86,8 +94,8 @@ endef
 
 define LUA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
-	sed -e "s/@MYLIBS@/$(LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
-		> $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
@@ -96,8 +104,8 @@ endef
 
 define HOST_LUA_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)" -C $(@D) install
-	sed -e "s/@MYLIBS@/$(HOST_LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
-		> $(HOST_DIR)/lib/pkgconfig/lua.pc
+	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
+		$(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
