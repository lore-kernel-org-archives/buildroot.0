From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:34:33 +0100
Subject: [Buildroot] [git commit] lua: Allow building lua for the host
Message-ID: <20120126220754.D218090591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd21fa2d661f0c2bbdfd93f4aded7a8a61caf504
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index c95e18a..1dabedf 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -21,6 +21,10 @@ else
 	LUA_MYCFLAGS += -DLUA_USE_POSIX
 endif
 
+HOST_LUA_DEPENDENCIES =
+HOST_LUA_MYCFLAGS = -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+HOST_LUA_MYLIBS = -ldl
+
 define LUA_BUILD_CMDS
 	sed -i -e 's/-O2//' $(@D)/src/Makefile
 	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
@@ -31,6 +35,15 @@ define LUA_BUILD_CMDS
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
+define HOST_LUA_BUILD_CMDS
+	sed -i -e 's/-O2//' $(@D)/src/Makefile
+	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
+	$(MAKE) \
+	MYCFLAGS="$(HOST_LUA_MYCFLAGS)" \
+	MYLIBS="$(HOST_LUA_MYLIBS)" \
+	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
+endef
+
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 define LUA_INSTALL_STAGING_SHARED_LIB
 	$(INSTALL) -D $(@D)/src/liblua.so.$(LUA_VERSION) \
@@ -94,6 +107,21 @@ define LUA_INSTALL_TARGET_CMDS
 	$(LUA_INSTALL_DEVFILES)
 endef
 
+define HOST_LUA_INSTALL_CMDS
+	$(INSTALL) $(@D)/src/lua $(HOST_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/luac $(HOST_DIR)/usr/bin
+	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
+		$(HOST_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
+	ln -sf liblua.so.$(LUA_VERSION) $(HOST_DIR)/usr/lib/liblua.so
+	$(INSTALL) $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
+		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) $(@D)/src/lua.h $(HOST_DIR)/usr/include
+	$(INSTALL) $(@D)/src/luaconf.h $(HOST_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lualib.h $(HOST_DIR)/usr/include
+	$(INSTALL) $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include
+endef
+
 LUA_INSTALLED_FILES = \
 	/usr/include/lua.h \
 	/usr/include/luaconf.h \
@@ -117,8 +145,19 @@ define LUA_UNINSTALL_TARGET_CMDS
 	done
 endef
 
+define HOST_LUA_UNINSTALL_TARGET_CMDS
+	for i in $(LUA_INSTALLED_FILES); do \
+		rm -f $(HOST_DIR)$$i; \
+	done
+endef
+
 define LUA_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
+define HOST_LUA_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
 $(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
