From: Adam Duskett <aduskett@gmail.com>
Date: Sun,  4 Jul 2021 22:40:59 -0700
Subject: [Buildroot] [PATCH 4/5] support/testing: add polkit tests
In-Reply-To: <20210705054100.2857251-1-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
Message-ID: <20210705054100.2857251-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This test script tests polkit with and without systemd.

The Systemd test does the following:
  - The brtest user attempts to restart the systemd-timesyncd service and is
    denied.

  - A systemd-timesyncd-restart.rules file provided by polkit-rules-test
    is copied from /root/ to /etc/polkit-1/rules.d

  - The brtest user attempts to restart the systemd-timesyncd service and should
    now succeed.

The initd test does the following:
- The brtest user attempts to run the test application "hello-polkit" with the
  command "pkexec hello-polkit" and is denied.

- A hello-polkit.rules file provided by polkit-rules-test is copied from /root/
  to /etc/polkit-1/rules.d

- The brtest user attempts to re-run the test hello-polkit binary with
  "pkexec hello-polkit" and succeeds.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../package/br2-external/polkit/Config.in     |  1 +
 .../package/br2-external/polkit/external.desc |  1 +
 .../package/br2-external/polkit/external.mk   |  1 +
 .../package/polkit-rules-test/Config.in       |  6 ++
 .../polkit-rules-test/initd/hello-polkit.c    |  6 ++
 .../initd/hello-polkit.policy                 | 14 ++++
 .../initd/hello-polkit.rules                  |  6 ++
 .../polkit-rules-test/polkit-rules-test.mk    | 38 ++++++++++
 .../systemd/systemd-timesyncd-restart.rules   |  7 ++
 support/testing/tests/package/test_polkit.py  | 70 +++++++++++++++++++
 10 files changed, 150 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit.py

diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
new file mode 100644
index 0000000000..2d11756193
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/polkit/external.desc b/support/testing/tests/package/br2-external/polkit/external.desc
new file mode 100644
index 0000000000..ecef48692b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/external.desc
@@ -0,0 +1 @@
+name: POLKIT
diff --git a/support/testing/tests/package/br2-external/polkit/external.mk b/support/testing/tests/package/br2-external/polkit/external.mk
new file mode 100644
index 0000000000..64e369cce4
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_POLKIT_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
new file mode 100644
index 0000000000..0fe125ec8f
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POLKIT_RULES_TEST
+	bool "polkit rules test"
+	depends on BR2_PACKAGE_POLKIT
+	help
+	  Simple test to ensure polkit is loading and enforcing rules
+	  correctly.
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
new file mode 100644
index 0000000000..cf5343cd75
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
@@ -0,0 +1,6 @@
+#include <stdio.h>
+
+int main(void){
+    printf("Hello polkit!\n");
+    return 0;
+}
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
new file mode 100644
index 0000000000..8220293175
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
@@ -0,0 +1,14 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE policyconfig PUBLIC
+ "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
+ "http://www.freedesktop.org/software/polkit/policyconfig-1.dtd">
+<policyconfig>
+  <action id="org.freedesktop.policykit.pkexec.hello-polkit">
+    <message>Authentication is required to run the hello world test program</message>
+    <defaults>
+      <allow_inactive>no</allow_inactive>
+      <allow_active>no</allow_active>
+    </defaults>
+    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/hello-polkit</annotate>
+  </action>
+</policyconfig>
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
new file mode 100644
index 0000000000..a0a66f644d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
@@ -0,0 +1,6 @@
+polkit.addRule(function(action, subject) {
+   if (action.id == "org.freedesktop.policykit.pkexec.hello-polkit" &&
+       subject.user == "brtest") {
+       return polkit.Result.YES;
+   }
+});
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
new file mode 100644
index 0000000000..4ec3805ee3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# polkit-rules-test
+#
+################################################################################
+
+POLKIT_RULES_TEST_DEPENDENCIES = polkit
+
+define POLKIT_RULES_TEST_USERS
+	brtest  -1  brtest  -1   =password  /home/brtest /bin/sh brtest
+endef
+
+define POLKIT_RULES_TEST_BUILD_CMDS
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.c $(@D)/hello-polkit.c
+	$(TARGET_CC) $(@D)/hello-polkit.c -o $(@D)/hello-polkit
+endef
+
+# Install the rules file to /root. Test_polkit.py first tests that restarting
+# timesyncd as a user fails, then moves the rules file and confirmes restarting
+# timesyncd as a user succeeds.
+define POLKIT_RULES_TEST_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/polkit-1/rules.d
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/systemd/systemd-timesyncd-restart.rules \
+		$(TARGET_DIR)/root/systemd-timesyncd-restart.rules
+endef
+
+define POLKIT_RULES_TEST_INSTALL_INIT_SYSV
+	mkdir -p $(TARGET_DIR)/usr/share/polkit-1/actions/
+	$(INSTALL) -D $(@D)/hello-polkit $(TARGET_DIR)/usr/bin/hello-polkit
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.policy \
+		$(TARGET_DIR)/usr/share/polkit-1/actions/hello-polkit.policy
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.rules \
+		$(TARGET_DIR)/root/hello-polkit.rules
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
new file mode 100644
index 0000000000..9461195091
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
@@ -0,0 +1,7 @@
+polkit.addRule(function(action, subject) {
+    if (action.id == "org.freedesktop.systemd1.manage-units" &&
+        action.lookup("unit") == "systemd-timesyncd.service" &&
+        subject.user == "brtest") {
+        return polkit.Result.YES;
+    }
+});
diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
new file mode 100644
index 0000000000..502d38d13e
--- /dev/null
+++ b/support/testing/tests/package/test_polkit.py
@@ -0,0 +1,70 @@
+import os
+import infra.basetest
+
+
+class TestPolkitInfra(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/polkit")]
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_POLKIT=y
+        BR2_PACKAGE_POLKIT_RULES_TEST=y
+        """
+
+    def base_test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7", kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+
+class TestPolkitSystemd(TestPolkitInfra):
+    config = \
+        """
+        {}
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(TestPolkitInfra.config)
+
+    def test_run(self):
+        TestPolkitInfra.base_test_run(self)
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 1)
+
+        cmd = "mv /root/systemd-timesyncd-restart.rules /etc/polkit-1/rules.d"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPolkitInitd(TestPolkitInfra):
+    config = TestPolkitInfra.config
+
+    def test_run(self):
+        TestPolkitInfra.base_test_run(self)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 127)
+        self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+
+        cmd = "mv /root/hello-polkit.rules /etc/polkit-1/rules.d/hello-polkit.rules"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello polkit!")
-- 
2.31.1
