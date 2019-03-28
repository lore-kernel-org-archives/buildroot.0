From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add rings test
Message-ID: <20190328161637.6F81787F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6de6f21dc30455b9edcaceed8ab41c273615ed13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  2 ++
 support/testing/tests/package/test_rings.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4197b4d0b1..b89df33755 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -404,6 +404,8 @@ tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: { extends: .runtime_te
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy2Ubjson: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy3Ubjson: { extends: .runtime_test }
+tests.package.test_rings.TestLuaRings: { extends: .runtime_test }
+tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
 tests.package.test_rust.TestRustBin: { extends: .runtime_test }
 tests.package.test_syslog_ng.TestSyslogNg: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_rings.py b/support/testing/tests/package/test_rings.py
new file mode 100644
index 0000000000..be9765f185
--- /dev/null
+++ b/support/testing/tests/package/test_rings.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaRings(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_RINGS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rings")
+
+
+class TestLuajitRings(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_RINGS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rings")
