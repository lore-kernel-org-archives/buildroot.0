From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:02 +0100
Subject: [Buildroot] [next/testing Lua modules 02/11] support/testing: add
 lpeg test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                             |  2 ++
 support/testing/tests/package/test_lpeg.py | 25 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_lpeg.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2f0ebaa25..1730f3906 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -326,6 +326,8 @@ tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
+tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
+tests.package.test_lpeg.TestLuajitLPeg: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lpeg.py b/support/testing/tests/package/test_lpeg.py
new file mode 100644
index 000000000..e57415735
--- /dev/null
+++ b/support/testing/tests/package/test_lpeg.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLPeg(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LPEG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lpeg", script="print(require[[lpeg]].version())")
+
+
+class TestLuajitLPeg(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LPEG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lpeg", script="print(require[[lpeg]].version())")
-- 
2.17.1
