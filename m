From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 18:22:09 -0500
Subject: [Buildroot] [PATCH v3 5/5] openjdk-hello-world: new test
In-Reply-To: <20190128232209.17485-1-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
Message-ID: <20190128232209.17485-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Daniel J. Leach" <dleach@belcan.com>

This test is a simple "Hello, World" integration test of the OpenJDK package.

It compiles the Java app on the host, then runs it on an emulated AARCH64
target and verifies "Hello, World" is printed.

Signed-off-by: Daniel J. Leach <dleach@belcan.com>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Added this patch to the series.

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 .../package/br2-external/openjdk/Config.in    |  1 +
 .../br2-external/openjdk/external.desc        |  1 +
 .../package/br2-external/openjdk/external.mk  |  1 +
 .../package/openjdk-hello-world/Config.in     | 26 ++++++++++++
 .../openjdk-hello-world/HelloWorld.java       |  8 ++++
 .../openjdk-hello-world.mk                    | 19 +++++++++
 support/testing/tests/package/test_openjdk.py | 42 +++++++++++++++++++
 9 files changed, 100 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/openjdk/Config.in
 create mode 100644 support/testing/tests/package/br2-external/openjdk/external.desc
 create mode 100644 support/testing/tests/package/br2-external/openjdk/external.mk
 create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
 create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
 create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
 create mode 100644 support/testing/tests/package/test_openjdk.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8f1e4ae804..8a8bd29d14 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -323,6 +323,7 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_lua.TestLua: *runtime_test
 tests.package.test_lua.TestLuajit: *runtime_test
+tests.package.test_openjdk.TestOpenJdk: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: *runtime_test
diff --git a/DEVELOPERS b/DEVELOPERS
index 0893af58dc..baa325eead 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1470,6 +1470,7 @@ F:	package/valijson/
 F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
+F:	support/testing/tests/package/br2-external/openjdk/
 
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
index 0000000000..4f9022fb92
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_OPENJDK_HELLO_WORLD
+	bool "openjdk hello world"
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # gtk2 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gtk2 -> glib2
+	depends on BR2_USE_MMU # gtk2 -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # gtk2, cups
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gtk2 -> pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENJDK
+	help
+	  Simple class for testing openjdk
+
+comment "OpenJDK-hello-world needs a glibc toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
new file mode 100644
index 0000000000..612d661cdd
--- /dev/null
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
@@ -0,0 +1,8 @@
+public class HelloWorld
+{
+    public static void main(String[] args)
+    {
+        System.out.println("Hello, World");
+    }
+
+}
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
new file mode 100644
index 0000000000..1847a11d4f
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
+	$(HOST_DIR)/openjdk/bin/javac $(@D)/HelloWorld.java
+endef
+
+define OPENJDK_HELLO_WORLD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/HelloWorld.class $(TARGET_DIR)/usr/bin/HelloWorld.class
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
new file mode 100644
index 0000000000..ed8a1f1be4
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
+        output, exit_code = self.emulator.run(cmd)
+        print(output)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["Hello, World"])
-- 
2.20.1
