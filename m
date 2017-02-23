From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:36 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-15-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed to make luaposix work.

The upstream name is just "bit32", but the luarocks infra doesn't
support an upstream name different from the Buildroot name. We therefore
have to explicitly set all variables and we need custom extract
commands.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                |  1 +
 package/lua-bit32/Config.in      |  9 +++++++++
 package/lua-bit32/lua-bit32.hash |  2 ++
 package/lua-bit32/lua-bit32.mk   | 20 ++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/lua-bit32/Config.in
 create mode 100644 package/lua-bit32/lua-bit32.hash
 create mode 100644 package/lua-bit32/lua-bit32.mk

diff --git a/package/Config.in b/package/Config.in
index efcde1fdd2..ca24bb20f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
diff --git a/package/lua-bit32/Config.in b/package/lua-bit32/Config.in
new file mode 100644
index 0000000000..6acecf0552
--- /dev/null
+++ b/package/lua-bit32/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_BIT32
+	bool "lua-bit32"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  bit32 is the native Lua 5.2 bit manipulation library, in the
+	  version from Lua 5.3; it is compatible with Lua 5.1, 5.2 and
+	  5.3.
+
+	  http://www.lua.org/manual/5.2/manual.html#6.7
diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
new file mode 100644
index 0000000000..21dbd05318
--- /dev/null
+++ b/package/lua-bit32/lua-bit32.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
new file mode 100644
index 0000000000..8304d6eaec
--- /dev/null
+++ b/package/lua-bit32/lua-bit32.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# lua-bit32
+#
+################################################################################
+
+LUA_BIT32_VERSION = 5.3.0-1
+LUA_BIT32_SUBDIR = lua-compat-5.2
+LUA_BIT32_ROCKSPEC = bit32-$(LUA_BIT32_VERSION).rockspec
+LUA_BIT32_SOURCE = bit32-$(LUA_BIT32_VERSION).src.rock
+LUA_BIT32_LICENSE = MIT
+LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
+
+define LUA_BIT32_EXTRACT_CMDS
+        cd $(LUA_BIT32_DIR) && \
+                $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD) unpack --force $(DL_DIR)/$(LUA_BIT32_SOURCE) && \
+		mv bit32-$(LUA_BIT32_VERSION)/* .
+endef
+
+$(eval $(luarocks-package))
-- 
2.11.0
