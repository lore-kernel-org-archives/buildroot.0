From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:24 +0200
Subject: [Buildroot] [PATCH 6/7] support/testing: add tests for the packages
 SELinux functionalities
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-7-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add tests to ensure the packages SELinux functionalities (being able to
select an extra SELinux module in the refpolicy, and being able to
provide a custom SELinux module) are working as expected.

We use a BR2_EXTERNAL folder, provided in the tests, to use a custom
SELinux enabled package.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/core/test_selinux.py    | 22 +++++++++++++++++++
 .../core/test_selinux/br2_external/Config.in  |  1 +
 .../test_selinux/br2_external/external.desc   |  1 +
 .../test_selinux/br2_external/external.mk     |  1 +
 .../package/selinux-test/Config.in            |  6 +++++
 .../package/selinux-test/selinux-test.mk      |  9 ++++++++
 .../package/selinux-test/selinux/buildroot.fc |  0
 .../package/selinux-test/selinux/buildroot.if |  1 +
 .../package/selinux-test/selinux/buildroot.te |  3 +++
 9 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/Config.in
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/external.desc
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/external.mk
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.fc
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
 create mode 100644 support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index bb6604590ab5..28d99d3a6912 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -58,3 +58,25 @@ class TestSELinuxCustomGit(TestSELinuxInfra):
 
     def test_run(self):
         pass
+
+class TestSELinuxPackage(TestSELinuxInfra):
+    br2_external = [infra.filepath("tests/core/test_selinux/br2_external")]
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_PACKAGE_SELINUX_TEST=y
+             """
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -t ntpd_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "ntpd_t")
+
+        out, ret = self.emulator.run("seinfo -t tor_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "tor_t")
+
+        out, ret = self.emulator.run("seinfo -t buildroot_test_t", 15)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[2].strip(), "buildroot_test_t")
diff --git a/support/testing/tests/core/test_selinux/br2_external/Config.in b/support/testing/tests/core/test_selinux/br2_external/Config.in
new file mode 100644
index 000000000000..9d9c84ee3cfe
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_SELINUX_PATH/package/selinux-test/Config.in"
diff --git a/support/testing/tests/core/test_selinux/br2_external/external.desc b/support/testing/tests/core/test_selinux/br2_external/external.desc
new file mode 100644
index 000000000000..44b5b95f5b4e
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/external.desc
@@ -0,0 +1 @@
+name: SELINUX
diff --git a/support/testing/tests/core/test_selinux/br2_external/external.mk b/support/testing/tests/core/test_selinux/br2_external/external.mk
new file mode 100644
index 000000000000..54d2402d52e3
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SELINUX_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
new file mode 100644
index 000000000000..c50631bd3a5b
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SELINUX_TEST
+	bool "SELinux test package"
+	depends on BR2_PACKAGE_LIBSELINUX
+	depends on BR2_PACKAGE_REFPOLICY
+	help
+	  Test package for SELinux Buildroot helpers.
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk
new file mode 100644
index 000000000000..0100b718be3f
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# SELinux test package
+#
+################################################################################
+
+SELINUX_TEST_SELINUX_MODULES = ntp tor
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.fc b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.fc
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
new file mode 100644
index 000000000000..acf797e6044b
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te
new file mode 100644
index 000000000000..266bc03be013
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te
@@ -0,0 +1,3 @@
+policy_module(buildroot, 1.0.0)
+
+type buildroot_test_t;
-- 
2.26.2
