From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 19:01:00 +0100
Subject: [Buildroot] [git commit] support/testing: add lua-http test
Message-ID: <20190328180054.53332886DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5593ed554f85d2bcdf87edc5e20b3a3f0cd3b8e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  2 ++
 support/testing/tests/package/test_lua_http.py | 37 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b89df33755..68f542f679 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -334,6 +334,8 @@ tests.package.test_lua.TestLua: { extends: .runtime_test }
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
index 0000000000..ba6096a1b1
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
