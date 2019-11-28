From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 27 Nov 2019 17:26:08 -0800
Subject: [Buildroot] [PATCH v4 5/6] polkit-rules-test-systemd: new test
In-Reply-To: <20191128012609.3632661-1-aduskett@gmail.com>
References: <20191128012609.3632661-1-aduskett@gmail.com>
Message-ID: <20191128012609.3632661-6-aduskett@gmail.com>
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
 DEVELOPERS                                    |  2 +
 .../package/br2-external/polkit/Config.in     |  2 +
 .../package/br2-external/polkit/external.desc |  1 +
 .../package/br2-external/polkit/external.mk   |  1 +
 .../polkit-rules-test-systemd/Config.in       |  6 +++
 .../polkit-rules-test-systemd.mk              | 20 ++++++++
 .../systemd-timesyncd-restart.rules           |  7 +++
 .../tests/package/test_polkit_systemd.py      | 51 +++++++++++++++++++
 8 files changed, 90 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit_systemd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 00dd4d39e9..2c99ace54f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -76,6 +76,8 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	support/testing/tests/package/br2-external/polkit/
+F:	support/testing/tests/package/test_polkit_systemd.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
new file mode 100644
index 0000000000..97309b9fca
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -0,0 +1,2 @@
+source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test-initd/Config.in"
+source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test-systemd/Config.in"
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
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in
new file mode 100644
index 0000000000..662b991d3b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POLKIT_RULES_TEST_SYSTEMD
+	bool "polkit rules test for systemd"
+	depends on BR2_PACKAGE_POLKIT
+	help
+	  Simple test to ensure polkit is loading and enforcing rules
+	  correctly using a rules file meant for systemd.
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk
new file mode 100644
index 0000000000..19a6be2b2f
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# polkit-rules-test-systemd
+#
+################################################################################
+
+POLKIT_RULES_TEST_SYSTEMD_DEPENDENCIES = polkit
+
+define POLKIT_RULES_TEST_SYSTEMD_USERS
+	brtest  -1  brtest  -1   =password  /home/brtest /bin/sh brtest
+endef
+
+define POLKIT_RULES_TEST_SYSTEMD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/etc/polkit-1/rules.d
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_SYSTEMD_PKGDIR)/systemd-timesyncd-restart.rules \
+		$(TARGET_DIR)/root/systemd-timesyncd-restart.rules
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules
new file mode 100644
index 0000000000..9461195091
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules
@@ -0,0 +1,7 @@
+polkit.addRule(function(action, subject) {
+    if (action.id == "org.freedesktop.systemd1.manage-units" &&
+        action.lookup("unit") == "systemd-timesyncd.service" &&
+        subject.user == "brtest") {
+        return polkit.Result.YES;
+    }
+});
diff --git a/support/testing/tests/package/test_polkit_systemd.py b/support/testing/tests/package/test_polkit_systemd.py
new file mode 100644
index 0000000000..c9086e878e
--- /dev/null
+++ b/support/testing/tests/package/test_polkit_systemd.py
@@ -0,0 +1,51 @@
+import os
+
+import infra.basetest
+
+
+class TestPolkitSystemd(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/polkit")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_SYSTEMD=y
+        BR2_JLEVEL=10
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_POLKIT=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_POLKIT_RULES_TEST_SYSTEMD=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 1)
+
+
+        cmd = "mv /root/systemd-timesyncd-restart.rules /etc/polkit-1/rules.d"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
-- 
2.23.0
