From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 18 May 2020 07:23:45 +0200
Subject: [Buildroot] [PATCH] package/lua-inotify: new package
Message-ID: <20200518052345.1721724-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 package/Config.in                             |  1 +
 package/lua-inotify/Config.in                 |  6 +++++
 package/lua-inotify/lua-inotify.hash          |  3 +++
 package/lua-inotify/lua-inotify.mk            | 14 +++++++++++
 .../testing/tests/package/test_lua_inotify.py | 25 +++++++++++++++++++
 6 files changed, 51 insertions(+)
 create mode 100644 package/lua-inotify/Config.in
 create mode 100644 package/lua-inotify/lua-inotify.hash
 create mode 100644 package/lua-inotify/lua-inotify.mk
 create mode 100644 support/testing/tests/package/test_lua_inotify.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a0..85dadd00d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -421,6 +421,8 @@ tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
 tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
+tests.package.test_lua_inotify.TestLuaInotify: { extends: .runtime_test }
+tests.package.test_lua_inotify.TestLuajitInotify: { extends: .runtime_test }
 tests.package.test_lua_lyaml.TestLuaLuaLyaml: { extends: .runtime_test }
 tests.package.test_lua_lyaml.TestLuajitLuaLyaml: { extends: .runtime_test }
 tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
diff --git a/package/Config.in b/package/Config.in
index c12676d85..191eea859 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -653,6 +653,7 @@ menu "Lua libraries/modules"
 	source "package/lua-gd/Config.in"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-inotify/Config.in"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
diff --git a/package/lua-inotify/Config.in b/package/lua-inotify/Config.in
new file mode 100644
index 000000000..2b0c943c6
--- /dev/null
+++ b/package/lua-inotify/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_INOTIFY
+	bool "lua-inotify"
+	help
+	  Inotify bindings for Lua.
+
+	  http://hoelz.ro/projects/linotify
diff --git a/package/lua-inotify/lua-inotify.hash b/package/lua-inotify/lua-inotify.hash
new file mode 100644
index 000000000..183638954
--- /dev/null
+++ b/package/lua-inotify/lua-inotify.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 9164b5777b132d7e1e073478d8837a526262991c57e32d75d517100f533eb436  inotify-0.5-1.src.rock
+sha256 b02158adb3c7763e1183a9386672f4f037bfeaab0cb0c73d684f34f3ea1993d8  linotify-0.5/COPYRIGHT
diff --git a/package/lua-inotify/lua-inotify.mk b/package/lua-inotify/lua-inotify.mk
new file mode 100644
index 000000000..dde7fc0fa
--- /dev/null
+++ b/package/lua-inotify/lua-inotify.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-inotify
+#
+################################################################################
+
+LUA_INOTIFY_VERSION_UPSTREAM = 0.5
+LUA_INOTIFY_VERSION = $(LUA_INOTIFY_VERSION_UPSTREAM)-1
+LUA_INOTIFY_NAME_UPSTREAM = inotify
+LUA_INOTIFY_SUBDIR = linotify-$(LUA_INOTIFY_VERSION_UPSTREAM)
+LUA_INOTIFY_LICENSE = MIT
+LUA_INOTIFY_LICENSE_FILES = $(LUA_INOTIFY_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_lua_inotify.py b/support/testing/tests/package/test_lua_inotify.py
new file mode 100644
index 000000000..c951a9c5d
--- /dev/null
+++ b/support/testing/tests/package/test_lua_inotify.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaInotify(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_INOTIFY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("inotify")
+
+
+class TestLuajitInotify(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_INOTIFY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("inotify")
-- 
2.25.1
