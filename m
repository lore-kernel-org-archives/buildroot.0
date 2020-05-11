From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 11 May 2020 23:47:44 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: test_uboot_tools: Add a
 test building a binary that include fw_env.h
In-Reply-To: <20200511214744.2749796-1-romain.naour@gmail.com>
References: <20200511214744.2749796-1-romain.naour@gmail.com>
Message-ID: <20200511214744.2749796-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Carrier <nicolas.carrier@orolia.com>

Nicolas Carrier proposed a package to reproduce the uboot-tools issue
he reported [1] with uboot 2020.01 packaged in the Buildroot 2020.02
release.

Add this package to the Buildroot testsuite in order to ckeck in gitlab
if fw_env.h doesn't contain any header that require building uboot
with a board configuration for the target.

[1] http://lists.busybox.net/pipermail/buildroot/2020-April/280307.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 .../tests/boot/br2-external/uboot-tools/Config.in |  1 +
 .../boot/br2-external/uboot-tools/external.desc   |  1 +
 .../boot/br2-external/uboot-tools/external.mk     |  1 +
 .../package/uboot-tools-test/Config.in            |  6 ++++++
 .../package/uboot-tools-test/uboot-env-test.c     | 14 ++++++++++++++
 .../package/uboot-tools-test/uboot-tools-test.mk  | 14 ++++++++++++++
 support/testing/tests/boot/test_uboot_tools.py    | 15 +++++++++++++++
 7 files changed, 52 insertions(+)
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/Config.in
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/external.desc
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/external.mk
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/Config.in
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-env-test.c
 create mode 100644 support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-tools-test.mk
 create mode 100644 support/testing/tests/boot/test_uboot_tools.py

diff --git a/support/testing/tests/boot/br2-external/uboot-tools/Config.in b/support/testing/tests/boot/br2-external/uboot-tools/Config.in
new file mode 100644
index 0000000000..3cd7c06bb8
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_UBOOT_TOOLS_TEST_PATH/package/uboot-tools-test/Config.in"
diff --git a/support/testing/tests/boot/br2-external/uboot-tools/external.desc b/support/testing/tests/boot/br2-external/uboot-tools/external.desc
new file mode 100644
index 0000000000..2f8477edaf
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/external.desc
@@ -0,0 +1 @@
+name: UBOOT_TOOLS_TEST
diff --git a/support/testing/tests/boot/br2-external/uboot-tools/external.mk b/support/testing/tests/boot/br2-external/uboot-tools/external.mk
new file mode 100644
index 0000000000..61cfd5878f
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_UBOOT_TOOLS_TEST_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/Config.in b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/Config.in
new file mode 100644
index 0000000000..1bdc09a731
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UBOOT_TOOLS_TEST
+	bool "uboot-tools-test"
+	select BR2_PACKAGE_UBOOT_TOOLS
+	help
+	  Test code for fw_env.h inclusion.
+
diff --git a/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-env-test.c b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-env-test.c
new file mode 100644
index 0000000000..0bd7c9993f
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-env-test.c
@@ -0,0 +1,14 @@
+/*
+ * Based on http://lists.busybox.net/pipermail/buildroot/2020-April/280307.html
+ */
+
+#include <stdlib.h>
+#include <fw_env.h>
+#include <stdio.h>
+
+int main(void)
+{
+	puts("Hello world!");
+
+	return EXIT_SUCCESS;
+}
diff --git a/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-tools-test.mk b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-tools-test.mk
new file mode 100644
index 0000000000..93937aa879
--- /dev/null
+++ b/support/testing/tests/boot/br2-external/uboot-tools/package/uboot-tools-test/uboot-tools-test.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# uboot-tools-test
+#
+################################################################################
+
+UBOOT_TOOLS_TEST_DEPENDENCIES = uboot-tools
+
+define UBOOT_TOOLS_TEST_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -lubootenv \
+		$(UBOOT_TOOLS_TEST_PKGDIR)/uboot-env-test.c -o $(@D)/uboot-env-test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/boot/test_uboot_tools.py b/support/testing/tests/boot/test_uboot_tools.py
new file mode 100644
index 0000000000..55a5fba3c6
--- /dev/null
+++ b/support/testing/tests/boot/test_uboot_tools.py
@@ -0,0 +1,15 @@
+
+import infra.basetest
+
+
+class TestUbootToolsEnv(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/boot/br2-external/uboot-tools")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_UBOOT_TOOLS_TEST=y
+        """
+
+    def test_run(self):
+        pass
-- 
2.25.4
