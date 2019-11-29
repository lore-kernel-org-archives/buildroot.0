From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:59:13 -0800
Subject: [Buildroot] [PATCH/next v5 4/6] support/testing: add polkit systemd
 test
In-Reply-To: <20191129215915.2549083-1-aduskett@gmail.com>
References: <20191129215915.2549083-1-aduskett@gmail.com>
Message-ID: <20191129215915.2549083-4-aduskett@gmail.com>
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
 - Instead of a seperate test file for both systemd and initd, use just a single
   file called test_polkit.py.

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  2 +
 .../package/br2-external/polkit/Config.in     |  1 +
 .../package/br2-external/polkit/external.desc |  1 +
 .../package/br2-external/polkit/external.mk   |  1 +
 .../polkit-rules-test-systemd/Config.in       |  6 +++
 .../polkit-rules-test-systemd.mk              | 20 ++++++++
 .../systemd-timesyncd-restart.rules           |  7 +++
 support/testing/tests/package/test_polkit.py  | 51 +++++++++++++++++++
 9 files changed, 90 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 22befa0427..05f717344a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -425,6 +425,7 @@ tests.package.test_perl_libwww_perl.TestPerllibwwwperl: { extends: .runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: { extends: .runtime_test }
 tests.package.test_perl_x10.TestPerlX10: { extends: .runtime_test }
 tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: { extends: .runtime_test }
+tests.package.test_polkit.TestPolkitSystemd: { extends: .runtime_test }
 tests.package.test_prosody.TestProsodyLua51: { extends: .runtime_test }
 tests.package.test_prosody.TestProsodyLuajit: { extends: .runtime_test }
 tests.package.test_python.TestPython2: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 9b52295ad8..916655b0c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -76,6 +76,8 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	support/testing/tests/package/br2-external/polkit/
+F:	support/testing/tests/package/test_polkit.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
new file mode 100644
index 0000000000..bb555b5097
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -0,0 +1 @@
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
diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
new file mode 100644
index 0000000000..c9086e878e
--- /dev/null
+++ b/support/testing/tests/package/test_polkit.py
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
