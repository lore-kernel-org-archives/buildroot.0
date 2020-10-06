From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit] support/testing/tests/core/test_selinux:
 new tests for the packages SELinux functionalities
Message-ID: <20201006132256.22A958EB92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=751b660c1f2ea4419a9290231f075b3e94f44089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add tests to ensure the packages SELinux functionalities (being able to
select an extra SELinux module in the refpolicy, and being able to
provide a custom SELinux module) are working as expected.

We use a BR2_EXTERNAL folder, provided in the tests, to use a custom
SELinux enabled package.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_selinux.py         | 22 ++++++++++++++++++++++
 .../tests/core/test_selinux/br2_external/Config.in |  1 +
 .../core/test_selinux/br2_external/external.desc   |  1 +
 .../core/test_selinux/br2_external/external.mk     |  1 +
 .../br2_external/package/selinux-test/Config.in    |  4 ++++
 .../package/selinux-test/selinux-test.mk           |  9 +++++++++
 .../package/selinux-test/selinux/buildroot.fc      |  0
 .../package/selinux-test/selinux/buildroot.if      |  1 +
 .../package/selinux-test/selinux/buildroot.te      |  3 +++
 9 files changed, 42 insertions(+)

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index bb6604590a..28d99d3a69 100644
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
index 0000000000..9d9c84ee3c
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_SELINUX_PATH/package/selinux-test/Config.in"
diff --git a/support/testing/tests/core/test_selinux/br2_external/external.desc b/support/testing/tests/core/test_selinux/br2_external/external.desc
new file mode 100644
index 0000000000..44b5b95f5b
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/external.desc
@@ -0,0 +1 @@
+name: SELINUX
diff --git a/support/testing/tests/core/test_selinux/br2_external/external.mk b/support/testing/tests/core/test_selinux/br2_external/external.mk
new file mode 100644
index 0000000000..54d2402d52
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SELINUX_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
new file mode 100644
index 0000000000..e30ac83105
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_SELINUX_TEST
+	bool "SELinux test package"
+	help
+	  Test package for SELinux Buildroot helpers.
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux-test.mk
new file mode 100644
index 0000000000..0100b718be
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
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
new file mode 100644
index 0000000000..acf797e604
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te
new file mode 100644
index 0000000000..266bc03be0
--- /dev/null
+++ b/support/testing/tests/core/test_selinux/br2_external/package/selinux-test/selinux/buildroot.te
@@ -0,0 +1,3 @@
+policy_module(buildroot, 1.0.0)
+
+type buildroot_test_t;
