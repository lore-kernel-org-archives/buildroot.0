From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:25:00 +0200
Subject: [Buildroot] [PATCH v2 17/18] support/testing/tests: add test for
 check_bin_arch
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-18-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This tests build a bogus package that installs a binary built for the
host architecture into $(TARGET_DIR), which should cause a build
failure, at least as long as the host architecture isn't ARM.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

This patch is retrieved from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-10-thomas.petazzoni at bootlin.com/

Compared to the first version, as proposed by Yann in the previous
review, this patch does not launch a subprocess (grep) to search the
string.

Note also that the .gitlab-ci.yml modification present in the previous
version is not present in this patch.

 .../br2-external/detect-bad-arch/Config.in    |  1 +
 .../detect-bad-arch/external.desc             |  1 +
 .../br2-external/detect-bad-arch/external.mk  |  1 +
 .../package/detect-bad-arch/Config.in         |  4 ++++
 .../detect-bad-arch/detect-bad-arch.mk        | 15 +++++++++++++++
 support/testing/tests/core/test_bad_arch.py   | 19 +++++++++++++++++++
 6 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
 create mode 100644 support/testing/tests/core/test_bad_arch.py

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
index 0000000000..0be7fdc9b7
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
+            s = 'ERROR: architecture for "/usr/bin/foo" is'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertEqual(len(lines), 0)
-- 
2.31.1
