From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri,  6 Dec 2019 15:46:49 -0800
Subject: [Buildroot] [PATCH v6 6/6] support/testing: add polkit initd test
In-Reply-To: <20191206234649.3972927-1-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
Message-ID: <20191206234649.3972927-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This test is a simple integration test of the polkit package on systems
running systemd.

It consists of the following:
- The brtest user attempts to restart the systemd-timesyncd service and is
  denied.

- A systemd-timesyncd-restart.rules file provided by polkit-rules-test-systemd
  is copied from /root/ to /etc/polkit-1/rules.d

- The brtest user attempts to restart the systemd-timesyncd service and should
  now succeed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v5:
 - Reorder this patch in the series.
 - Add test to .gitlab-ci.yml
 - Instead of a seperate test file, add the test to test_polkit.py in another
   class.

Changes v5 -> v6:
  - Use self.assertRunOk in test_polkit.py
  - Flake8 cleanup.

 .gitlab-ci.yml                                |  1 +
 .../package/br2-external/polkit/Config.in     |  1 +
 .../package/polkit-rules-test-initd/Config.in |  6 +++
 .../polkit-rules-test-initd/hello-polkit.c    |  6 +++
 .../hello-polkit.policy                       | 14 +++++
 .../hello-polkit.rules                        |  6 +++
 .../polkit-rules-test-initd.mk                | 31 +++++++++++
 support/testing/tests/package/test_polkit.py  | 51 +++++++++++++++++++
 8 files changed, 116 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.c
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.policy
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.rules
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/polkit-rules-test-initd.mk

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 475d205d4a..448ba140ae 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -426,6 +426,7 @@ tests.package.test_perl_mail_dkim.TestPerlMailDKIM: { extends: .runtime_test }
 tests.package.test_perl_x10.TestPerlX10: { extends: .runtime_test }
 tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: { extends: .runtime_test }
 tests.package.test_polkit.TestPolkitSystemd: { extends: .runtime_test }
+tests.package.test_polkit.TestPolkitInitd: { extends: .runtime_test }
 tests.package.test_prosody.TestProsodyLua51: { extends: .runtime_test }
 tests.package.test_prosody.TestProsodyLuajit: { extends: .runtime_test }
 tests.package.test_python.TestPython2: { extends: .runtime_test }
diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
index bb555b5097..97309b9fca 100644
--- a/support/testing/tests/package/br2-external/polkit/Config.in
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -1 +1,2 @@
+source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test-initd/Config.in"
 source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test-systemd/Config.in"
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/Config.in b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/Config.in
new file mode 100644
index 0000000000..f19fc2660d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POLKIT_RULES_TEST_INITD
+	bool "polkit rules test for initd"
+	depends on BR2_PACKAGE_POLKIT
+	help
+	  Simple test to ensure polkit is loading and enforcing rules
+	  correctly using initd.
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.c b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.c
new file mode 100644
index 0000000000..cf5343cd75
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.c
@@ -0,0 +1,6 @@
+#include <stdio.h>
+
+int main(void){
+    printf("Hello polkit!\n");
+    return 0;
+}
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.policy b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.policy
new file mode 100644
index 0000000000..8220293175
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.policy
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
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.rules
new file mode 100644
index 0000000000..a0a66f644d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.rules
@@ -0,0 +1,6 @@
+polkit.addRule(function(action, subject) {
+   if (action.id == "org.freedesktop.policykit.pkexec.hello-polkit" &&
+       subject.user == "brtest") {
+       return polkit.Result.YES;
+   }
+});
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/polkit-rules-test-initd.mk b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/polkit-rules-test-initd.mk
new file mode 100644
index 0000000000..394c3e4405
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/polkit-rules-test-initd.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# polkit-rules-test-initd
+#
+################################################################################
+
+POLKIT_RULES_TEST_INITD_DEPENDENCIES = polkit
+
+define POLKIT_RULES_TEST_INITD_USERS
+	brtest  -1  brtest  -1   =password  /home/brtest /bin/sh brtest
+endef
+
+define POLKIT_RULES_TEST_INITD_BUILD_CMDS
+	$(INSTALL) -D $(POLKIT_RULES_TEST_INITD_PKGDIR)/hello-polkit.c $(@D)/hello-polkit.c
+	$(TARGET_CC) $(@D)/hello-polkit.c -o $(@D)/hello-polkit
+endef
+
+
+define POLKIT_RULES_TEST_INITD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/polkit-1/actions/
+	$(INSTALL) -D $(@D)/hello-polkit $(TARGET_DIR)/usr/bin/hello-polkit
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_INITD_PKGDIR)/hello-polkit.policy \
+		$(TARGET_DIR)/usr/share/polkit-1/actions/hello-polkit.policy
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_INITD_PKGDIR)/hello-polkit.rules \
+		$(TARGET_DIR)/root/hello-polkit.rules
+
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3ee06958a6..448a55127e 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -46,3 +46,54 @@ class TestPolkitSystemd(infra.basetest.BRTest):
 
         cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
         self.assertRunOk(cmd, timeout=10)
+
+
+class TestPolkitInitd(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/polkit")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_JLEVEL=10
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_POLKIT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_POLKIT_RULES_TEST_INITD=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=[
+                               "-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img
+                           ])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        print(output)
+        self.assertEqual(exit_code, 127)
+        self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+
+        cmd = "mv /root/hello-polkit.rules /etc/polkit-1/rules.d/hello-polkit.rules"
+        self.assertRunOk(cmd, timeout=10)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        print(output)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello polkit!")
-- 
2.23.0
