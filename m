From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:02:18 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_openjdk: new test
Message-ID: <20190317130057.160798EC66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7bf8fb4124ae7de1f002dc03154279bfec660a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test is a simple "Hello, World" integration test of the OpenJDK
package.

It compiles the Java app on the host, then runs it on an emulated
AARCH64 target and verifies "Hello, World" is printed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 ++
 .../tests/package/br2-external/openjdk/Config.in   |  1 +
 .../package/br2-external/openjdk/external.desc     |  1 +
 .../tests/package/br2-external/openjdk/external.mk |  1 +
 .../openjdk/package/openjdk-hello-world/Config.in  |  5 +++
 .../package/openjdk-hello-world/HelloWorld.java    |  7 ++++
 .../openjdk-hello-world/openjdk-hello-world.mk     | 18 ++++++++++
 support/testing/tests/package/test_openjdk.py      | 42 ++++++++++++++++++++++
 9 files changed, 78 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28feeef2ef..2dc489ff76 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -327,6 +327,7 @@ tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
+tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 4412c4512e..2da50e0299 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1501,6 +1501,8 @@ F:	package/valijson/
 F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
+F:	support/testing/tests/package/br2-external/openjdk/
+F:	support/testing/tests/package/test_openjdk.py
 
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
diff --git a/support/testing/tests/package/br2-external/openjdk/Config.in b/support/testing/tests/package/br2-external/openjdk/Config.in
new file mode 100644
index 0000000000..00c7fd4799
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_OPENJDK_PATH/package/openjdk-hello-world/Config.in"
diff --git a/support/testing/tests/package/br2-external/openjdk/external.desc b/support/testing/tests/package/br2-external/openjdk/external.desc
new file mode 100644
index 0000000000..f28ba5060c
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/external.desc
@@ -0,0 +1 @@
+name: OPENJDK
diff --git a/support/testing/tests/package/br2-external/openjdk/external.mk b/support/testing/tests/package/br2-external/openjdk/external.mk
new file mode 100644
index 0000000000..54c24e8c64
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_OPENJDK_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
new file mode 100644
index 0000000000..c37346a486
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_OPENJDK_HELLO_WORLD
+	bool "openjdk hello world"
+	depends on BR2_PACKAGE_OPENJDK
+	help
+	  Simple class for testing openjdk
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
new file mode 100644
index 0000000000..37489e44c3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
@@ -0,0 +1,7 @@
+public class HelloWorld
+{
+    public static void main(String[] args)
+    {
+        System.out.println("Hello, World");
+    }
+}
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
new file mode 100644
index 0000000000..998117b8e2
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# openjdk hello world
+#
+################################################################################
+
+OPENJDK_HELLO_WORLD_DEPENDENCIES = openjdk
+
+define OPENJDK_HELLO_WORLD_BUILD_CMDS
+	$(INSTALL) -D $(OPENJDK_HELLO_WORLD_PKGDIR)/HelloWorld.java $(@D)/HelloWorld.java
+	$(HOST_DIR)/bin/javac $(@D)/HelloWorld.java
+endef
+
+define OPENJDK_HELLO_WORLD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/HelloWorld.class $(TARGET_DIR)/usr/bin/HelloWorld.class
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
new file mode 100644
index 0000000000..5fbb500fbd
--- /dev/null
+++ b/support/testing/tests/package/test_openjdk.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenJdk(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/openjdk")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_XORG7=y
+        BR2_PACKAGE_OPENJDK=y
+        BR2_PACKAGE_OPENJDK_HELLO_WORLD=y
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
+        cmd = "java -cp /usr/bin HelloWorld"
+        output, exit_code = self.emulator.run(cmd, 120)
+        print(output)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["Hello, World"])
