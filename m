From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:22 +0200
Subject: [Buildroot] [PATCH 4/7] support/testing: add a test for
 BR2_REFPOLICY_EXTRA_MODULES_DIRS
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-5-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a test for the BR2_REFPOLICY_EXTRA_MODULES_DIRS functionality (which
allows to provide custom SELinux modules).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/core/test_selinux.py          | 13 +++++++++++++
 .../core/test_selinux/extra_modules/buildroot.fc    |  0
 .../core/test_selinux/extra_modules/buildroot.if    |  1 +
 .../core/test_selinux/extra_modules/buildroot.te    |  3 +++
 4 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.fc
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.if
 create mode 100644 support/testing/tests/core/test_selinux/extra_modules/buildroot.te

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 10be30d7913d..9e189d6114df 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -34,3 +34,16 @@ class TestSELinuxExtraModules(TestSELinuxInfra):
         out, ret = self.emulator.run("seinfo -t tor_t", 15)
         self.assertEqual(ret, 0)
         self.assertEqual(out[2].strip(), "tor_t")
+
+class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_REFPOLICY_EXTRA_MODULES_DIRS="{}"
+             """.format(infra.filepath("tests/core/test_selinux/extra_modules"))
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -t buildroot_test_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "buildroot_test_t")
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.fc b/support/testing/tests/core/test_selinux/extra_modules/buildroot.fc
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.if b/support/testing/tests/core/test_selinux/extra_modules/buildroot.if
new file mode 100644
index 000000000000..acf797e6044b
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/extra_modules/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/support/testing/tests/core/test_selinux/extra_modules/buildroot.te b/support/testing/tests/core/test_selinux/extra_modules/buildroot.te
new file mode 100644
index 000000000000..266bc03be013
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/extra_modules/buildroot.te
@@ -0,0 +1,3 @@
+policy_module(buildroot, 1.0.0)
+
+type buildroot_test_t;
-- 
2.26.2
