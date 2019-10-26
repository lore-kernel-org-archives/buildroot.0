From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:31:36 +0200
Subject: [Buildroot] [git commit] support/testing: add lua-sdl2 test
Message-ID: <20191026142648.406BC88562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1e01107a74142e7a8b141a6c95b4c10829dc4e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  2 ++
 support/testing/tests/package/test_lua_sdl2.py | 41 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3c2525d339..c689039007 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -390,6 +390,8 @@ tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
 tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
+tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
+tests.package.test_lua_sdl2.TestLuajitLuaSDL2: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_sdl2.py b/support/testing/tests/package/test_lua_sdl2.py
new file mode 100644
index 0000000000..22c4087f5d
--- /dev/null
+++ b/support/testing/tests/package/test_lua_sdl2.py
@@ -0,0 +1,41 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaSDL2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_SDL2=y
+        BR2_PACKAGE_SDL2_IMAGE=y
+        BR2_PACKAGE_SDL2_MIXER=y
+        BR2_PACKAGE_SDL2_NET=y
+        BR2_PACKAGE_SDL2_TTF=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("SDL")
+        self.module_test("SDL.image")
+        self.module_test("SDL.mixer")
+        self.module_test("SDL.net")
+        self.module_test("SDL.ttf")
+
+
+class TestLuajitLuaSDL2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_SDL2=y
+        BR2_PACKAGE_SDL2_IMAGE=y
+        BR2_PACKAGE_SDL2_MIXER=y
+        BR2_PACKAGE_SDL2_NET=y
+        BR2_PACKAGE_SDL2_TTF=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("SDL")
+        self.module_test("SDL.image")
+        self.module_test("SDL.mixer")
+        self.module_test("SDL.net")
+        self.module_test("SDL.ttf")
