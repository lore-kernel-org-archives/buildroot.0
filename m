From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed,  5 Feb 2020 15:11:49 +0100
Subject: [Buildroot] [PATCH 3/3] support/testing: add runtime test for
 Crudini (py2 and py3)
In-Reply-To: <20200205141149.20749-1-titouan.christophe@railnova.eu>
References: <20200205141149.20749-1-titouan.christophe@railnova.eu>
Message-ID: <20200205141149.20749-4-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also adds the new tests to the gitlab CI configuration.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 .gitlab-ci.yml                                |  2 +
 support/testing/tests/package/test_crudini.py | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_crudini.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c0140527db..aa64bb5fee 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -375,6 +375,8 @@ tests.init.test_systemd.TestInitSystemSystemdRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_test }
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
+tests.package.test_crudini.TestCrudiniPy2: {extends: .runtime_test}
+tests.package.test_crudini.TestCrudiniPy3: {extends: .runtime_test}
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
new file mode 100644
index 0000000000..498c5982cc
--- /dev/null
+++ b/support/testing/tests/package/test_crudini.py
@@ -0,0 +1,40 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+INI_FILE_CONTENT = """
+[section]
+param = this-is-the-magic-value
+other = dont care
+"""
+
+
+class TestCrudiniBase(TestPythonPackageBase):
+    config = TestPythonPackageBase.config + "\nBR2_PACKAGE_CRUDINI=y"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5", kernel="builtin",
+                           options=["-initrd", img])
+
+        self.emulator.login()
+
+        # 1. Create some sample .ini file
+        cmd = "echo -e '%s' > config.ini" % INI_FILE_CONTENT
+        _, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+
+        # 2. Attempt to get the value
+        out, ret = self.emulator.run("crudini --get config.ini section param")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out, ['this-is-the-magic-value'])
+
+
+class TestCrudiniPy2(TestCrudiniBase):
+    __test__ = True
+    config = TestCrudiniBase.config + "\nBR2_PACKAGE_PYTHON=y"
+
+
+class TestCrudiniPy3(TestCrudiniBase):
+    __test__ = True
+    config = TestCrudiniBase.config + "\nBR2_PACKAGE_PYTHON3=y"
-- 
2.24.1
