From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 16 Jul 2012 15:45:51 +0200
Subject: [Buildroot] [PATCH 4/5] lua : refactor with POST_PATH_HOOKS
In-Reply-To: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1342446352-31231-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lua/lua.mk |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 5b8022a..04c47fc 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -23,9 +23,19 @@ HOST_LUA_DEPENDENCIES =
 HOST_LUA_MYCFLAGS = -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
+define LUA_PREFIX_FIX_PKG_CONFIG
+	$(SED) 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
+endef
+LUA_POST_PATCH_HOOKS += LUA_PREFIX_FIX_PKG_CONFIG
+HOST_LUA_POST_PATCH_HOOKS += LUA_PREFIX_FIX_PKG_CONFIG
+
+define LUA_OPTIM_FIX_MAKEFILE
+	$(SED) 's/-O2//' $(@D)/src/Makefile
+endef
+LUA_POST_PATCH_HOOKS += LUA_OPTIM_FIX_MAKEFILE
+HOST_LUA_POST_PATCH_HOOKS += LUA_OPTIM_FIX_MAKEFILE
+
 define LUA_BUILD_CMDS
-	sed -i -e 's/-O2//' $(@D)/src/Makefile
-	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
 	$(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
 	MYCFLAGS="$(TARGET_CFLAGS) $(LUA_MYCFLAGS)" \
@@ -34,8 +44,6 @@ define LUA_BUILD_CMDS
 endef
 
 define HOST_LUA_BUILD_CMDS
-	sed -i -e 's/-O2//' $(@D)/src/Makefile
-	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
 	$(MAKE) \
 	MYCFLAGS="$(HOST_LUA_MYCFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
-- 
1.7.9.5
