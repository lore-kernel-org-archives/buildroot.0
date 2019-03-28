From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add lpeg test
Message-ID: <20190328161637.350C587F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac2bfe7643e0b9fd40e95e63bfc1a593789e9164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                             |  2 ++
 support/testing/tests/package/test_lpeg.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef16b73bfb..8bb05f9c7e 100644
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
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lpeg.py b/support/testing/tests/package/test_lpeg.py
new file mode 100644
index 0000000000..e574157350
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
