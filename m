From: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Tue, 19 Jul 2016 09:31:13 -0300
Subject: [Buildroot] [PATCH v2 3/3] package/protobuf-lua: new package
In-Reply-To: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <1468931473-19614-3-git-send-email-tiago.brusamarello@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds support to use Google's Protocol buffers
from Lua scripts.

The original package from GitHub supports deployment as
a LuaRocks package, but the module name as set to 'protobuf'
and not 'protobuf-lua' which causes naming problems when
building it in Buildroot so the 'generick-package' method
was used instead.

This package builds a shared library named 'pb.so' thats
is only supported on Lua versions 5.1 and 5.2. So this
package will be available only when one of these two version
is selected.

This package depends on the 'host-protoc-gen-lua' plugin
to be used with the 'protoc' tool from the Google's Protobuf
package to generate Protobuf messages types in Lua format.
It's a Python script and is currently only supported on
Python version 2.x.

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>

---
Changes v1 -> v2:
  - Added '-D' option on each 'install' command invocation (suggested by Thomas Petazzoni)
  - Lua files were listed in a variable and installed with a 'foreach' loop (suggested by Thomas Petazzoni)
  - Examples are not deployed to the target anymore (suggested by Thomas Petazzoni)
  - Added comment about the 'pb.so' compatibility issue (suggested by Romain Naour)
  - Removed empty line from the start of the '.mk' file (suggested by Romain Naour)
  - Added dependency to the 'host-protobuf' package (suggested by Romain Naour)

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
---
 package/Config.in                      |  1 +
 package/protobuf-lua/Config.in         | 10 ++++++++++
 package/protobuf-lua/protobuf-lua.hash |  2 ++
 package/protobuf-lua/protobuf-lua.mk   | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/protobuf-lua/Config.in
 create mode 100644 package/protobuf-lua/protobuf-lua.hash
 create mode 100644 package/protobuf-lua/protobuf-lua.mk

diff --git a/package/Config.in b/package/Config.in
index e5ddc3e..c4ef91f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,6 +548,7 @@ menu "Lua libraries/modules"
 	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
 	source "package/orbit/Config.in"
+	source "package/protobuf-lua/Config.in"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
diff --git a/package/protobuf-lua/Config.in b/package/protobuf-lua/Config.in
new file mode 100644
index 0000000..3c5274c
--- /dev/null
+++ b/package/protobuf-lua/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PROTOBUF_LUA
+	bool "protobuf-lua"
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUA_5_2
+	depends on !BR2_PACKAGE_PYTHON3
+	help
+	  Runtime libraries to use Protocol Buffers from Lua scripts.
+	  This package requires 'host-protoc-gen-lua' which depends on
+	  Python version 2.x to work.
+
+	  https://github.com/djungelorm/protobuf-lua
diff --git a/package/protobuf-lua/protobuf-lua.hash b/package/protobuf-lua/protobuf-lua.hash
new file mode 100644
index 0000000..4791361
--- /dev/null
+++ b/package/protobuf-lua/protobuf-lua.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  bccdd9c65970c42fd29b87084db83777cad75780a67c5107b68f96603b5788a8  protobuf-lua-v1.1.1.tar.gz
diff --git a/package/protobuf-lua/protobuf-lua.mk b/package/protobuf-lua/protobuf-lua.mk
new file mode 100644
index 0000000..da17871
--- /dev/null
+++ b/package/protobuf-lua/protobuf-lua.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# protobuf-lua
+#
+################################################################################
+
+PROTOBUF_LUA_VERSION = v1.1.1
+PROTOBUF_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOBUF_LUA_VERSION))
+PROTOBUF_LUA_DEPENDENCIES = luainterpreter host-protobuf host-protoc-gen-lua
+PROTOBUF_LUA_LICENSE = BSD-3c
+PROTOBUF_LUA_LICENSE_FILES = LICENSE
+
+define PROTOBUF_LUA_BUILD_CMDS
+	# build Lua Protobuf shared lib
+	$(TARGET_CC) -Os -shared -std=gnu99 -fPIC $(@D)/protobuf/pb.c -o $(@D)/protobuf/pb.so
+
+	# build Lua Protobuf examples
+	PATH=$(BR_PATH) $(HOST_DIR)/usr/bin/protoc --lua_out=$(@D)/example --proto_path=$(@D)/example \
+		$(@D)/example/person.proto
+endef
+
+PROTOBUF_LUA_FILES = \
+	containers decoder descriptor encoder init listener \
+	text_format type_checkers wire_format
+
+define PROTOBUF_LUA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/protobuf/pb.so \
+		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/protobuf/pb.so
+
+	$(foreach f,$(PROTOBUF_LUA_FILES),\
+		$(INSTALL) -D -m 0755 $(@D)/protobuf/$(f).lua \
+			$(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/protobuf/$(f).lua
+	)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
