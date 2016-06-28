From: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Tue, 28 Jun 2016 16:18:02 -0300
Subject: [Buildroot] [PATCH 1/1] protobuf-lua: new package
Message-ID: <1467141482-28706-1-git-send-email-tiago.brusamarello@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google's Protocol Buffers support to Lua.

This package adds support to compile and use Google's
Protocol buffers using Lua scripts. It also includes
the plugin for compiling the message types (.proto files)
to the Lua language.

The original package from GitHub supports deployment as
a LuaRocks package, but the module name as set to 'protobuf'
and not 'protobuf-lua' which causes naming problems when
building it in Buildroot so the 'generick-package' method
was used instead.

Change-Id: I50c2b0da9dedb2d8ed2dbd9635194e64402355f3
Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
---
 package/Config.in                    |  1 +
 package/protobuf-lua/Config.in       |  8 ++++++++
 package/protobuf-lua/protobuf-lua.mk | 39 ++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/protobuf-lua/Config.in
 create mode 100644 package/protobuf-lua/protobuf-lua.mk

diff --git a/package/Config.in b/package/Config.in
index a2a02a8..362dbf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1298,6 +1298,7 @@ endif
 	source "package/poco/Config.in"
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
+	source "package/protobuf-lua/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/startup-notification/Config.in"
diff --git a/package/protobuf-lua/Config.in b/package/protobuf-lua/Config.in
new file mode 100644
index 0000000..e2a94cb
--- /dev/null
+++ b/package/protobuf-lua/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PROTOBUF_LUA
+    bool "protobuf-lua"
+    depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+    help
+      Code generator and runtime libraries to use Protocol Buffers
+      from Lua scripts.
+
+      https://github.com/djungelorm/protobuf-lua
diff --git a/package/protobuf-lua/protobuf-lua.mk b/package/protobuf-lua/protobuf-lua.mk
new file mode 100644
index 0000000..0ca8c70
--- /dev/null
+++ b/package/protobuf-lua/protobuf-lua.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# protobuf-lua
+#
+################################################################################
+
+PROTOBUF_LUA_VERSION = v1.1.1
+PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))
+PROTOBUF_LUA_DEPENDENCIES = luainterpreter host-python python
+PROTOBUF_LUA_LICENSE = BSD-3c
+PROTOBUF_LUA_LICENSE_FILES = LICENSE
+
+define PROTOBUF_LUA_BUILD_CMDS
+	# build Lua Protobuf shared lib
+	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
+endef
+
+define PROTOBUF_LUA_INSTALL_TARGET_CMDS
+	# install Lua Protobuf support
+	mkdir -p $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf
+	$(INSTALL) -m 0755 $(@D)/protobuf/pb.so \
+		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf
+	mkdir -p $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
+	$(INSTALL) -m 0755 $(@D)/protobuf/*.lua \
+		$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf
+
+	# install protoc Lua plugin
+	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(TARGET_DIR)/usr/bin
+endef
+
+define HOST_PROTOBUF_LUA_INSTALL_CMDS
+	# install protoc Lua plugin
+	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
