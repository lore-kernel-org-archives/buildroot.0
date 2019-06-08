From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Jun 2019 23:18:26 +0200
Subject: [Buildroot] [Lua 1/2] package/lua-msgpack-native: remove it
In-Reply-To: <20190608211827.7731-1-francois.perrad@gadz.org>
References: <20190608211827.7731-1-francois.perrad@gadz.org>
Message-ID: <20190608211827.7731-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                              |  8 +++++++
 package/Config.in                             |  1 -
 package/lua-msgpack-native/Config.in          | 12 ----------
 .../lua-msgpack-native.hash                   |  2 --
 .../lua-msgpack-native/lua-msgpack-native.mk  | 22 -------------------
 5 files changed, 8 insertions(+), 37 deletions(-)
 delete mode 100644 package/lua-msgpack-native/Config.in
 delete mode 100644 package/lua-msgpack-native/lua-msgpack-native.hash
 delete mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a32cbcb6f..744b1ca4d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2019.08"
+
+config BR2_PACKAGE_LUA_MSGPACK_NATIVE
+	bool "lua-msgpack-native package removed"
+	select BR2_LEGACY
+	help
+	  The lua-msgpack-native package was removed.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
diff --git a/package/Config.in b/package/Config.in
index f592e74a9..29cfc11c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,7 +627,6 @@ menu "Lua libraries/modules"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
-	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-std-debug/Config.in"
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
deleted file mode 100644
index 8af508dd9..000000000
--- a/package/lua-msgpack-native/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LUA_MSGPACK_NATIVE
-	bool "lua-msgpack-native"
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	help
-	  This is a native, C language implementation of msgpack
-	  (http://msgpack.org) library/protocol for Lua language
-
-	  https://github.com/kengonakajima/lua-msgpack-native
-
-comment "lua-msgpack-native needs Lua 5.1 or LuaJIT"
-	depends on !BR2_PACKAGE_LUA_5_1
-	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/lua-msgpack-native/lua-msgpack-native.hash b/package/lua-msgpack-native/lua-msgpack-native.hash
deleted file mode 100644
index cfc598319..000000000
--- a/package/lua-msgpack-native/lua-msgpack-native.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  025cf91d509fa3985869d18ef9b8eaeb875ff3c9fcf6467beeed6eab3bb35c93  lua-msgpack-native-41a91b994c70389dc9daa1a15678741d8ec41749.tar.gz
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
deleted file mode 100644
index acd3a0e1c..000000000
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# lua-msgpack-native
-#
-################################################################################
-
-LUA_MSGPACK_NATIVE_VERSION = 41a91b994c70389dc9daa1a15678741d8ec41749
-LUA_MSGPACK_NATIVE_SITE = $(call github,kengonakajima,lua-msgpack-native,$(LUA_MSGPACK_NATIVE_VERSION))
-LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
-LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
-LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
-
-define LUA_MSGPACK_NATIVE_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
-endef
-
-define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/msgpack.so \
-		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/msgpack.so
-endef
-
-$(eval $(generic-package))
-- 
2.20.1
