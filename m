From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 11:52:47 +0200
Subject: [Buildroot] [PATCH 10/11] support/testing/tests: add test for
 check_bin_arch
In-Reply-To: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200430095249.782597-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tests build a bogus package that installs a binary built for the
host architecture into $(TARGET_DIR), which should cause a build
failure, at least as long as the host architecture isn't ARM.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  1 +
 .../br2-external/detect-bad-arch/Config.in    |  1 +
 .../detect-bad-arch/external.desc             |  1 +
 .../br2-external/detect-bad-arch/external.mk  |  1 +
 .../package/detect-bad-arch/Config.in         |  4 ++++
 .../detect-bad-arch/detect-bad-arch.mk        | 15 +++++++++++++++
 support/testing/tests/core/test_bad_arch.py   | 19 +++++++++++++++++++
 7 files changed, 42 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
 create mode 100644 support/testing/tests/core/test_bad_arch.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..dd69fb9d50 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -354,6 +354,7 @@ tests.boot.test_syslinux.TestSysLinuxX86EFI: { extends: .runtime_test }
 tests.boot.test_syslinux.TestSysLinuxX86LegacyBios: { extends: .runtime_test }
 tests.boot.test_syslinux.TestSysLinuxX86_64EFI: { extends: .runtime_test }
 tests.boot.test_syslinux.TestSysLinuxX86_64LegacyBios: { extends: .runtime_test }
+tests.core.test_bad_arch.DetectBadArchTest: { extends: .runtime_test }
 tests.core.test_file_capabilities.TestFileCapabilities: { extends: .runtime_test }
 tests.core.test_hardening.TestFortifyConserv: { extends: .runtime_test }
 tests.core.test_hardening.TestFortifyNone: { extends: .runtime_test }
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..530c077bbe
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_DETECT_BAD_ARCH_PATH/package/detect-bad-arch/Config.in"
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.desc b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
new file mode 100644
index 0000000000..3c4232c90d
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
@@ -0,0 +1 @@
+name: DETECT_BAD_ARCH
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.mk b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
new file mode 100644
index 0000000000..71b9821ddc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_DETECT_BAD_ARCH_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..9893e9afc1
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_DETECT_BAD_ARCH
+	bool
+	default y
+
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
new file mode 100644
index 0000000000..5e78c55f1f
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# detect-bad-arch
+#
+################################################################################
+
+define DETECT_BAD_ARCH_BUILD_CMDS
+	echo "int main(void) { return 0; }" | $(HOSTCC) -x c -o $(@D)/foo -
+endef
+
+define DETECT_BAD_ARCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/foo $(TARGET_DIR)/usr/bin/foo
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
new file mode 100644
index 0000000000..8f4bd57b0e
--- /dev/null
+++ b/support/testing/tests/core/test_bad_arch.py
@@ -0,0 +1,19 @@
+import infra
+import infra.basetest
+import subprocess
+
+
+class DetectBadArchTest(infra.basetest.BRConfigTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG
+    br2_external = [infra.filepath("tests/core/br2-external/detect-bad-arch")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = 'ERROR: architecture for "/usr/bin/foo" is "Advanced Micro Devices X86-64", should be "ARM"'
+            logf = open(logf_path, "r")
+            ret = subprocess.call(["grep", "-q", s], stdin=logf)
+            self.assertEqual(ret, 0)
-- 
2.25.4
