From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Jun 2021 17:42:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/lua-zlib: new package
Message-ID: <20210613154240.2877974-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this module is compatible with lzlib (which is no longer maintained).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 package/lua-zlib/Config.in                    | 10 ++++++++
 package/lua-zlib/lua-zlib.hash                |  2 ++
 package/lua-zlib/lua-zlib.mk                  | 12 +++++++++
 .../testing/tests/package/test_lua_zlib.py    | 25 +++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/lua-zlib/Config.in
 create mode 100644 package/lua-zlib/lua-zlib.hash
 create mode 100644 package/lua-zlib/lua-zlib.mk
 create mode 100644 support/testing/tests/package/test_lua_zlib.py

diff --git a/package/Config.in b/package/Config.in
index 82b28d283..1abfd787f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -689,6 +689,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-utf8/Config.in"
 	source "package/lua-valua/Config.in"
+	source "package/lua-zlib/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luadbi/Config.in"
 	source "package/luadbi-sqlite3/Config.in"
diff --git a/package/lua-zlib/Config.in b/package/lua-zlib/Config.in
new file mode 100644
index 000000000..ffdb4a8e6
--- /dev/null
+++ b/package/lua-zlib/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUA_ZLIB
+	bool "lua-zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Simple streaming interface to zlib for Lua.
+	  Consists of two functions: inflate and deflate.
+	  Both functions return "stream functions" (takes a buffer
+	  of input and returns a buffer of output).
+
+	  https://github.com/brimworks/lua-zlib
diff --git a/package/lua-zlib/lua-zlib.hash b/package/lua-zlib/lua-zlib.hash
new file mode 100644
index 000000000..8c108b39a
--- /dev/null
+++ b/package/lua-zlib/lua-zlib.hash
@@ -0,0 +1,2 @@
+# computed by luarocks/buildroot
+sha256 42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
diff --git a/package/lua-zlib/lua-zlib.mk b/package/lua-zlib/lua-zlib.mk
new file mode 100644
index 000000000..23e2a8ae3
--- /dev/null
+++ b/package/lua-zlib/lua-zlib.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-zlib
+#
+################################################################################
+
+LUA_ZLIB_VERSION = 1.2-0
+LUA_ZLIB_SUBDIR = lua-zlib
+LUA_ZLIB_LICENSE = MIT
+LUA_ZLIB_DEPENDENCIES = zlib
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_zlib.py b/support/testing/tests/package/test_lua_zlib.py
new file mode 100644
index 000000000..6089daa2e
--- /dev/null
+++ b/support/testing/tests/package/test_lua_zlib.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuazlib(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_ZLIB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("zlib")
+
+
+class TestLuajitLuazlib(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_ZLIB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("zlib")
-- 
2.30.2
