From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Sep 2012 08:58:37 +0200
Subject: [Buildroot] [PATCH 1/5] lua-msgpack-native: new package v2
Message-ID: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                |    1 +
 package/lua-msgpack-native/Config.in             |    7 ++++++
 package/lua-msgpack-native/lua-msgpack-native.mk |   29 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/lua-msgpack-native/Config.in
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..f05f5f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -257,6 +257,7 @@ source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
+source "package/lua-msgpack-native/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
new file mode 100644
index 0000000..90eecc3
--- /dev/null
+++ b/package/lua-msgpack-native/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_MSGPACK_NATIVE
+	bool "lua-msgpack-native"
+	help
+	  This is a native, C language implementation of msgpack (http://msgpack.org)
+	  library/protocol for Lua language
+
+	  https://github.com/kengonakajima/lua-msgpack-native
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
new file mode 100644
index 0000000..5d8cd2d
--- /dev/null
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# lua-msgpack-native
+#
+#############################################################
+LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6
+LUA_MSGPACK_NATIVE_SITE = git://github.com/kengonakajima/lua-msgpack-native.git
+LUA_MSGPACK_NATIVE_METHOD = git
+LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
+LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
+LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
+
+define LUA_MSGPACK_NATIVE_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
+endef
+
+define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
+endef
+
+define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/lua/msgpack.so
+endef
+
+define LUA_MSGPACK_NATIVE_CLEAN_CMDS
+	rm -f $(@D)/msgpack.so
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
