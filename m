From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 28 Mar 2019 18:20:47 +0100
Subject: [Buildroot] [PATCH 3/4] support/testing: add lua-http test
In-Reply-To: <20190328172048.30238-1-francois.perrad@gadz.org>
References: <20190328172048.30238-1-francois.perrad@gadz.org>
Message-ID: <20190328172048.30238-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 +
 .../testing/tests/package/test_lua_http.py    | 37 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_http.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ec143b1d2..681b0d3f5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -332,6 +332,8 @@ tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
+tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
+tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_http.py b/support/testing/tests/package/test_lua_http.py
new file mode 100644
index 000000000..ba6096a1b
--- /dev/null
+++ b/support/testing/tests/package/test_lua_http.py
@@ -0,0 +1,37 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaHttp(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_HTTP=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("http.version", script="local ver=require[[http.version]]; print(ver.name, ver.version)")
+        self.module_test("http.client")
+        self.module_test("http.cookie")
+        self.module_test("http.proxies")
+        self.module_test("http.server")
+        self.module_test("http.socks")
+        self.module_test("http.websocket")
+
+
+class TestLuajitHttp(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_HTTP=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("http.version", script="local ver=require[[http.version]]; print(ver.name, ver.version)")
+        self.module_test("http.client")
+        self.module_test("http.cookie")
+        self.module_test("http.proxies")
+        self.module_test("http.server")
+        self.module_test("http.socks")
+        self.module_test("http.websocket")
-- 
2.17.1
