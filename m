From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:25:01 +0200
Subject: [Buildroot] [PATCH v2 18/18] support/testing/tests: add test for
 file overwrite detection
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-19-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

This patch is retrieved from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-12-thomas.petazzoni at bootlin.com/

Compared to the first version, as proposed by Yann in the previous
review, this patch does not launch a subprocess (grep) to find the
string.
Additionally, the strings searched were changed from a specific
file ('path/file: FAILED') to the "ERROR: package ..." overwrite
detection message.

Note also that the .gitlab-ci.yml modification present in the previous
version is not present in this patch.

 .../br2-external/detect-overwrite/Config.in   |  1 +
 .../detect-overwrite/external.desc            |  1 +
 .../br2-external/detect-overwrite/external.mk |  1 +
 .../package/detect-overwrite/Config.in        |  5 ++
 .../detect-overwrite/detect-overwrite.mk      | 19 ++++++++
 .../testing/tests/core/test_file_overwrite.py | 48 +++++++++++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
 create mode 100644 support/testing/tests/core/test_file_overwrite.py

diff --git a/support/testing/tests/core/br2-external/detect-overwrite/Config.in b/support/testing/tests/core/br2-external/detect-overwrite/Config.in
new file mode 100644
index 0000000000..b5514510bd
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_DETECT_OVERWRITE_PATH/package/detect-overwrite/Config.in"
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/external.desc b/support/testing/tests/core/br2-external/detect-overwrite/external.desc
new file mode 100644
index 0000000000..6fedc276e8
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/external.desc
@@ -0,0 +1 @@
+name: DETECT_OVERWRITE
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/external.mk b/support/testing/tests/core/br2-external/detect-overwrite/external.mk
new file mode 100644
index 0000000000..90927b33ef
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_DETECT_OVERWRITE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
new file mode 100644
index 0000000000..fff8b0320f
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DETECT_OVERWRITE
+	bool "detect-overwrite"
+
+config BR2_PACKAGE_HOST_DETECT_OVERWRITE
+	bool "host-detect-overwrite"
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
new file mode 100644
index 0000000000..c6df2a339d
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# detect-overwrite
+#
+################################################################################
+
+define DETECT_OVERWRITE_INSTALL_TARGET_CMDS
+	grep -q "^foo" $(TARGET_DIR)/etc/passwd || \
+		echo "foo" >> $(TARGET_DIR)/etc/passwd
+endef
+
+HOST_DETECT_OVERWRITE_DEPENDENCIES = host-pkgconf
+
+define HOST_DETECT_OVERWRITE_INSTALL_CMDS
+	$(SED) 's/manipulating/tweaking/' $(HOST_DIR)/lib/pkgconfig/libpkgconf.pc
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/test_file_overwrite.py b/support/testing/tests/core/test_file_overwrite.py
new file mode 100644
index 0000000000..96553cb483
--- /dev/null
+++ b/support/testing/tests/core/test_file_overwrite.py
@@ -0,0 +1,48 @@
+import infra
+import infra.basetest
+import subprocess
+
+
+class DetectTargetFileOverwriteTest(infra.basetest.BRConfigTest):
+    config = \
+        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_PACKAGE_DETECT_OVERWRITE=y
+        """
+    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = 'ERROR: package detect-overwrite has overwritten files installed by a previous package, aborting.'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertNotEqual(len(lines), 0)
+
+
+class DetectHostFileOverwriteTest(infra.basetest.BRConfigTest):
+    config = \
+        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_PACKAGE_HOST_DETECT_OVERWRITE=y
+        """
+    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = './lib/pkgconfig/hco_libpkgconf.pc: FAILED'
+            s = 'ERROR: package host-detect-overwrite has overwritten files installed by a previous package, aborting.'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertNotEqual(len(lines), 0)
-- 
2.31.1
