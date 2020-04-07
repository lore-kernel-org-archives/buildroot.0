From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue,  7 Apr 2020 16:45:14 +0530
Subject: [Buildroot] [PATCH v8 4/5] support/testing: add python-pybind11 test
In-Reply-To: <20200407111515.21131-1-jagan@amarulasolutions.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
Message-ID: <20200407111515.21131-5-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This test is a simple integration test of the python-pybind11 package.

It consists of the following:
- The python-pybind11-addition-example package compiles a simple cpp file
  which adds two given numbers together and returns the results and installs
  the compiled file to /root/
  This example is from the following URL:
    https://pybind11.readthedocs.io/en/stable/basics.html

- The python-pybind11-addition-example package installs the
  sample_python_pybind11.py file which imports the above-compiled file and adds
  1 and 2 together to /root/

- Execute the sample_python_pybind11.py in an emulator with the expected output
  of 3 and an exit code of 0.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[jagan: rebase, fix trailing whitespace, new line warninings]
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v8
- new patch

 .gitlab-ci.yml                                |  2 +
 DEVELOPERS                                    |  2 +
 .../br2-external/python-pybind11/Config.in    |  1 +
 .../python-pybind11/external.desc             |  1 +
 .../br2-external/python-pybind11/external.mk  |  1 +
 .../Config.in                                 |  5 ++
 .../pybind11_addition_example.cpp             |  9 +++
 .../python-pybind11-addition-example.mk       | 39 ++++++++++
 .../sample_python_pybind11.py                 |  4 +
 .../tests/package/test_python_pybind11.py     | 76 +++++++++++++++++++
 10 files changed, 140 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.desc
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
 create mode 100644 support/testing/tests/package/test_python_pybind11.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d9519c3812..ce524337cb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -471,6 +471,8 @@ tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test
 tests.package.test_python_passlib.TestPythonPy3Passlib: { extends: .runtime_test }
 tests.package.test_python_pexpect.TestPythonPy2Pexpect: { extends: .runtime_test }
 tests.package.test_python_pexpect.TestPythonPy3Pexpect: { extends: .runtime_test }
+tests.package.test_python_pybind11.TestPythonPy2Pybind11: { extends: .runtime_test }
+tests.package.test_python_pybind11.TestPythonPy3Pybind11: { extends: .runtime_test }
 tests.package.test_python_pynacl.TestPythonPy2Pynacl: { extends: .runtime_test }
 tests.package.test_python_pynacl.TestPythonPy3Pynacl: { extends: .runtime_test }
 tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 308a59b264..f06d54a662 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -85,6 +85,8 @@ F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
 F:	support/testing/tests/package/test_python_gobject.py
+F:	support/testing/tests/package/br2-external/python-pybind11/
+F:	support/testing/tests/package/test_python_pybind11.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/br2-external/python-pybind11/Config.in b/support/testing/tests/package/br2-external/python-pybind11/Config.in
new file mode 100644
index 0000000000..27b502313b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_PYTHON_PYBIND11_PATH/package/python-pybind11-addition-example/Config.in"
diff --git a/support/testing/tests/package/br2-external/python-pybind11/external.desc b/support/testing/tests/package/br2-external/python-pybind11/external.desc
new file mode 100644
index 0000000000..04a636053a
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/external.desc
@@ -0,0 +1 @@
+name: PYTHON_PYBIND11
diff --git a/support/testing/tests/package/br2-external/python-pybind11/external.mk b/support/testing/tests/package/br2-external/python-pybind11/external.mk
new file mode 100644
index 0000000000..db34e5f54d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND11_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
new file mode 100644
index 0000000000..7860559a13
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE
+	bool "python-pybind11 addition example"
+	depends on BR2_PACKAGE_PYTHON_PYBIND11
+	help
+	  Simple class for testing python-pybind11
diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
new file mode 100644
index 0000000000..61b3fce051
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
@@ -0,0 +1,9 @@
+#include <pybind11/pybind11.h>
+
+int add(int i, int j) {
+    return i + j;
+}
+
+PYBIND11_MODULE(pybind11_addition_example, m) {
+    m.def("add", &add, "A function which adds two numbers");
+}
diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
new file mode 100644
index 0000000000..f620424fca
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# python-pybind11_addition_example
+#
+################################################################################
+
+PYTHON_PYBIND11_ADDITION_EXAMPLE_DEPENDENCIES = python-pybind11
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES=`$(STAGING_DIR)/usr/bin/python2-config --includes`
+PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX=`$(STAGING_DIR)/usr/bin/python2-config --extension-suffix`
+else
+PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES=`$(STAGING_DIR)/usr/bin/python3-config --includes`
+PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX=`$(STAGING_DIR)/usr/bin/python3-config --extension-suffix`
+endif
+PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT=pybind11_addition_example$(PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX)
+
+define PYTHON_PYBIND11_ADDITION_EXAMPLE_BUILD_CMDS
+	$(INSTALL) -D $(PYTHON_PYBIND11_ADDITION_EXAMPLE_PKGDIR)/pybind11_addition_example.cpp \
+		$(@D)/pybind11_addition_example.cpp
+
+	$(INSTALL) -D $(PYTHON_PYBIND11_ADDITION_EXAMPLE_PKGDIR)/sample_python_pybind11.py \
+		$(@D)/sample_python_pybind11.py
+
+	cd $(@D); \
+		$(TARGET_CXX) -std=c++11 -fPIC -shared \
+		$(PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES) pybind11_addition_example.cpp \
+		-o $(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT)
+endef
+
+define PYTHON_PYBIND11_ADDITION_EXAMPLE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/$(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT) \
+		$(TARGET_DIR)/root/$(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT)
+
+	$(INSTALL) -D -m 755 $(@D)/sample_python_pybind11.py \
+		$(TARGET_DIR)/root/sample_python_pybind11.py
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
new file mode 100644
index 0000000000..29196481e1
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
@@ -0,0 +1,4 @@
+#!/usr/bin/env python
+import pybind11_addition_example
+
+print(pybind11_addition_example.add(1, 2))
diff --git a/support/testing/tests/package/test_python_pybind11.py b/support/testing/tests/package/test_python_pybind11.py
new file mode 100644
index 0000000000..12bd77807e
--- /dev/null
+++ b/support/testing/tests/package/test_python_pybind11.py
@@ -0,0 +1,76 @@
+import os
+import infra.basetest
+
+class TestPythonPy2Pybind11(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/python-pybind11")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_PYBIND11=y
+        BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE=y
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
+        cmd = "python sample_python_pybind11.py"
+        output, exit_code = self.emulator.run(cmd, 120)
+        print(output)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["3"])
+
+class TestPythonPy3Pybind11(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/python-pybind11")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYBIND11=y
+        BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE=y
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
+        cmd = "python3 sample_python_pybind11.py"
+        output, exit_code = self.emulator.run(cmd, 120)
+        print(output)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["3"])
-- 
2.17.1
