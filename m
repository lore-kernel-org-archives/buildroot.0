From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:36:56 +0100
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/core/test_cpeid: new test
Message-ID: <20201126152254.D504C86487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3950c53cd0d062c1bb446d0837fee2c005cae009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds a number of test cases to verify that the CPE_ID_*
variables are properly handled by the generic package infrastructure
and that the "make show-info" JSON output matches what we expect.

A total of 5 different example packages are used to exercise different
scenarios of CPE_ID_* variables usage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/core/cpeid-br2-external/Config.in        |   0
 .../tests/core/cpeid-br2-external/external.desc    |   1 +
 .../tests/core/cpeid-br2-external/external.mk      |   1 +
 .../package/cpe-id-pkg1/cpe-id-pkg1.mk             |   4 +
 .../package/cpe-id-pkg2/cpe-id-pkg2.mk             |   3 +
 .../package/cpe-id-pkg3/cpe-id-pkg3.mk             |   5 +
 .../package/cpe-id-pkg4/cpe-id-pkg4.mk             |   9 ++
 .../package/cpe-id-pkg5/cpe-id-pkg5.mk             |  16 +++
 support/testing/tests/core/test_cpeid.py           | 109 +++++++++++++++++++++
 9 files changed, 148 insertions(+)

diff --git a/support/testing/tests/core/cpeid-br2-external/Config.in b/support/testing/tests/core/cpeid-br2-external/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/core/cpeid-br2-external/external.desc b/support/testing/tests/core/cpeid-br2-external/external.desc
new file mode 100644
index 0000000000..d19ae79e7a
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/external.desc
@@ -0,0 +1 @@
+name: CPE_ID
diff --git a/support/testing/tests/core/cpeid-br2-external/external.mk b/support/testing/tests/core/cpeid-br2-external/external.mk
new file mode 100644
index 0000000000..47492d7f82
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_CPE_ID_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg1/cpe-id-pkg1.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg1/cpe-id-pkg1.mk
new file mode 100644
index 0000000000..5e7460286b
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg1/cpe-id-pkg1.mk
@@ -0,0 +1,4 @@
+CPE_ID_PKG1_VERSION = 42
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg2/cpe-id-pkg2.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg2/cpe-id-pkg2.mk
new file mode 100644
index 0000000000..12b3f3223f
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg2/cpe-id-pkg2.mk
@@ -0,0 +1,3 @@
+CPE_ID_PKG2_VERSION = 67
+
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
new file mode 100644
index 0000000000..5added78df
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
@@ -0,0 +1,5 @@
+CPE_ID_PKG3_VERSION = 67
+CPE_ID_PKG3_CPE_ID_VALID = YES
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
new file mode 100644
index 0000000000..c37f73fa82
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
@@ -0,0 +1,9 @@
+CPE_ID_PKG4_VERSION = 67
+CPE_ID_PKG4_CPE_ID_VENDOR = foo
+CPE_ID_PKG4_CPE_ID_NAME = bar
+CPE_ID_PKG4_CPE_ID_VERSION = 42
+CPE_ID_PKG4_CPE_ID_VERSION_MINOR = b2
+CPE_ID_PKG4_CPE_ID_PREFIX = cpe:2.4:a
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
new file mode 100644
index 0000000000..18e98c4ca4
--- /dev/null
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
@@ -0,0 +1,16 @@
+CPE_ID_PKG5_VERSION = 57
+
+CPE_ID_PKG5_CPE_ID_VENDOR = foo
+CPE_ID_PKG5_CPE_ID_NAME = bar
+CPE_ID_PKG5_CPE_ID_VERSION = 42
+CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b2
+CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.4:a
+
+HOST_CPE_ID_PKG5_CPE_ID_VENDOR = baz
+HOST_CPE_ID_PKG5_CPE_ID_NAME = fuz
+HOST_CPE_ID_PKG5_CPE_ID_VERSION = 43
+HOST_CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b3
+HOST_CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.5:a
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/test_cpeid.py b/support/testing/tests/core/test_cpeid.py
new file mode 100644
index 0000000000..23471e4444
--- /dev/null
+++ b/support/testing/tests/core/test_cpeid.py
@@ -0,0 +1,109 @@
+import infra
+import subprocess
+import json
+
+class CpeIdTest(infra.basetest.BRConfigTest):
+    config = ""
+    br2_external = [infra.filepath("tests/core/cpeid-br2-external")]
+
+    def get_vars(self, var):
+        cmd = ["make", "--no-print-directory", "-C", self.b.builddir,
+               "VARS=%s%%" % var, "printvars"]
+        lines = subprocess.check_output(cmd).splitlines()
+        return dict([str(x, "utf-8").split("=") for x in lines])
+
+    def get_json(self, pkg):
+        cmd = ["make", "--no-print-directory", "-C", self.b.builddir,
+               "%s-show-info" % pkg]
+        return json.loads(subprocess.check_output(cmd))
+
+    def test_pkg1(self):
+        # this package has no CPE ID information, it should not have
+        # any CPE_ID variable defined.
+        pkg_vars = self.get_vars("CPE_ID_PKG1_CPE_ID")
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_NAME", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+                    "CPE_ID_PREFIX", "CPE_ID"]
+        for v in cpe_vars:
+            self.assertNotIn("CPE_ID_PKG1_%s" % v, pkg_vars)
+        pkg_json = self.get_json("cpe-id-pkg1")
+        self.assertNotIn("cpe-id", pkg_json['cpe-id-pkg1'])
+
+        pkg_vars = self.get_vars("HOST_CPE_ID_PKG1_CPE_ID")
+        for v in cpe_vars:
+            self.assertNotIn("HOST_CPE_ID_PKG1_%s" % v, pkg_vars)
+        pkg_json = self.get_json("host-cpe-id-pkg1")
+        self.assertNotIn("cpe-id", pkg_json['host-cpe-id-pkg1'])
+
+    def test_pkg2(self):
+        # this package has no CPE ID information, it should not have
+        # any CPE_ID variable defined.
+        pkg_vars = self.get_vars("HOST_CPE_ID_PKG2_CPE_ID")
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_NAME", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+                    "CPE_ID_PREFIX", "CPE_ID"]
+        for v in cpe_vars:
+            self.assertNotIn("HOST_CPE_ID_PKG2_%s" % v, pkg_vars)
+        pkg_json = self.get_json("host-cpe-id-pkg2")
+        self.assertNotIn("cpe-id", pkg_json['host-cpe-id-pkg2'])
+
+    def test_pkg3(self):
+        # this package has just <pkg>_CPE_ID_VALID defined, so verify
+        # it has the default CPE_ID value, and that inheritance of the
+        # values for the host package is working
+        pkg_vars = self.get_vars("CPE_ID_PKG3_CPE_ID")
+        self.assertEqual(pkg_vars["CPE_ID_PKG3_CPE_ID"],
+                         "cpe:2.3:a:cpe-id-pkg3_project:cpe-id-pkg3:67:*:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["CPE_ID_PKG3_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("cpe-id-pkg3")
+        self.assertEqual(pkg_json['cpe-id-pkg3']['cpe-id'],
+                         "cpe:2.3:a:cpe-id-pkg3_project:cpe-id-pkg3:67:*:*:*:*:*:*:*")
+
+        pkg_vars = self.get_vars("HOST_CPE_ID_PKG3_CPE_ID")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG3_CPE_ID"],
+                         "cpe:2.3:a:cpe-id-pkg3_project:cpe-id-pkg3:67:*:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG3_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("host-cpe-id-pkg3")
+        self.assertEqual(pkg_json['host-cpe-id-pkg3']['cpe-id'],
+                         "cpe:2.3:a:cpe-id-pkg3_project:cpe-id-pkg3:67:*:*:*:*:*:*:*")
+
+    def test_pkg4(self):
+        # this package defines
+        # <pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX},
+        # make sure we get the computed <pkg>_CPE_ID, and that it is
+        # inherited by the host variant
+        pkg_vars = self.get_vars("CPE_ID_PKG4_CPE_ID")
+        self.assertEqual(pkg_vars["CPE_ID_PKG4_CPE_ID"],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["CPE_ID_PKG4_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("cpe-id-pkg4")
+        self.assertEqual(pkg_json['cpe-id-pkg4']['cpe-id'],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+
+        pkg_vars = self.get_vars("HOST_CPE_ID_PKG4_CPE_ID")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG4_CPE_ID"],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG4_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("host-cpe-id-pkg4")
+        self.assertEqual(pkg_json['host-cpe-id-pkg4']['cpe-id'],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+
+    def test_pkg5(self):
+        # this package defines
+        # <pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX} and
+        # HOST_<pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX}
+        # separately, with different values. Make sure we get the
+        # right <pkg>_CPE_ID and HOST_<pkg>_CPE_ID values.
+        pkg_vars = self.get_vars("CPE_ID_PKG5_CPE_ID")
+        self.assertEqual(pkg_vars["CPE_ID_PKG5_CPE_ID"],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["CPE_ID_PKG5_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("cpe-id-pkg5")
+        self.assertEqual(pkg_json['cpe-id-pkg5']['cpe-id'],
+                         "cpe:2.4:a:foo:bar:42:b2:*:*:*:*:*:*")
+
+        pkg_vars = self.get_vars("HOST_CPE_ID_PKG5_CPE_ID")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG5_CPE_ID"],
+                         "cpe:2.5:a:baz:fuz:43:b3:*:*:*:*:*:*")
+        self.assertEqual(pkg_vars["HOST_CPE_ID_PKG5_CPE_ID_VALID"], "YES")
+        pkg_json = self.get_json("host-cpe-id-pkg5")
+        self.assertEqual(pkg_json['host-cpe-id-pkg5']['cpe-id'],
+                         "cpe:2.5:a:baz:fuz:43:b3:*:*:*:*:*:*")
