From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 28 Jul 2015 22:03:49 +0200
Subject: [Buildroot] [PATCH 1/1] luv: new package
Message-ID: <1438113829-6706-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuv bindings for LuaJIT and Lua.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/Config.in     |  1 +
 package/luv/Config.in |  8 ++++++++
 package/luv/luv.mk    | 30 ++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/luv/Config.in
 create mode 100644 package/luv/luv.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..43a6d74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,6 +512,7 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/lutok/Config.in"
+	source "package/luv/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/luv/Config.in b/package/luv/Config.in
new file mode 100644
index 0000000..6ee5668
--- /dev/null
+++ b/package/luv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUV
+	bool "luv"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LIBUV
+	help
+	  libuv bindings for LuaJIT and Lua.
+
+	  https://github.com/luvit/luv
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
new file mode 100644
index 0000000..86b168e
--- /dev/null
+++ b/package/luv/luv.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# luv
+#
+################################################################################
+
+LUV_VERSION = v1.6.1
+LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
+LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
+LUV_LICENSE = Apache-2.0
+LUV_LICENSE_FILE = LICENSE.txt
+LUV_DEPENDENCIES = libuv
+LUV_INSTALL_STAGING = YES
+
+LUV_CONF_OPTS += \
+	-DBUILD_MODULE=OFF \
+	-DWITH_SHARED_LIBUV=ON \
+	-DLUA_BUILD_TYPE=System
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUV_DEPENDENCIES += luajit
+LUV_CONF_OPTS += \
+	-DWITH_LUA_ENGINE=LuaJIT
+else
+LUV_DEPENDENCIES += lua
+LUV_CONF_OPTS += \
+	-DWITH_LUA_ENGINE=Lua
+endif
+
+$(eval $(cmake-package))
-- 
2.5.0
