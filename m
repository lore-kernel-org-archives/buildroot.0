From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:23:42 +0100
Subject: [Buildroot] [git commit] support/testing: add runtime test for
 Crudini (py2 and py3)
Message-ID: <20200205151310.6ADDF8CA02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b2319f93187127f3cb5d47392ac854762c8e1c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also adds the new tests to the gitlab CI configuration.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  2 ++
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_crudini.py | 49 +++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c0140527db..a6436a8417 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -375,6 +375,8 @@ tests.init.test_systemd.TestInitSystemSystemdRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_test }
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
+tests.package.test_crudini.TestCrudiniPy2: { extends: .runtime_test }
+tests.package.test_crudini.TestCrudiniPy3: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 67cce2f8e4..32b49f1736 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2460,6 +2460,7 @@ F:	package/mosquitto/
 F:	package/python-avro/
 F:	package/redis/
 F:	package/waf/
+F:	support/testing/tests/package/test_crudini.py
 
 N:	Trent Piepho <tpiepho@impinj.com>
 F:	package/libp11/
diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
new file mode 100644
index 0000000000..e320d3207e
--- /dev/null
+++ b/support/testing/tests/package/test_crudini.py
@@ -0,0 +1,49 @@
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
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_CRUDINI=y
+        """
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
+    config = TestCrudiniBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        """
+
+
+class TestCrudiniPy3(TestCrudiniBase):
+    __test__ = True
+    config = TestCrudiniBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        """
