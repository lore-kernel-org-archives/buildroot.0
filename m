From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 May 2019 14:40:32 -0500
Subject: [Buildroot] [PATCH v7 5/5] testing/tests: CLANG compiler-rt runtime
 test
In-Reply-To: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
References: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190501194032.765-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a test case that
 1) Builds the complete LLVM and CLANG set of host tools
 2) Cross-compiles the compiler-rt runtime using CLANG
 3) Builds a cross-compiled application using CLANG and the libfuzzer
    compiler-rt library.
 4) Executes the fuzz application (part of the libfuzzer package) on
    target and checks expected output

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with the entire series applied on next branch:
 https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/121908178
 NOTE: this test case takes longer than test_rust, ~2 hours in my host
 machine with all tarballs previously downloaded]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes
v1 -> v2
[Ricardo
 - updated yml with test case
 - moved emulator launch cmd to test case from infra
 - defconfig in the order provided by savedefconfig
 - indent defconfig
 - add full package for test code to the test br2-external
 - consolidated to one class only

v2 -> v3
 - Added Review/tested by

v4
 - None

v5
 - Rebased post 2018.11 on master

v6
 - Testing of LLVM/Clang bump

v7
 - Rebase on master and testing of LLVM/Clang bump to 8.0
 - Updated hashes for archive and legal info (legal info changed
   because of spelling cleanup)
---
 .gitlab-ci.yml                                |  1 +
 package/compiler-rt/compiler-rt.hash          |  4 +-
 .../br2-external/clang-compiler-rt/Config.in  |  1 +
 .../clang-compiler-rt/external.desc           |  1 +
 .../clang-compiler-rt/external.mk             |  1 +
 .../package/libfuzzer/Config.in               |  7 +++
 .../package/libfuzzer/libfuzzer.hash          |  2 +
 .../package/libfuzzer/libfuzzer.mk            | 24 ++++++++++
 support/testing/tests/package/test_clang.py   | 46 +++++++++++++++++++
 9 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
 create mode 100644 support/testing/tests/package/test_clang.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 558676709f..9a35a1cab8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -357,6 +357,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_test }
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
+tests.package.test_clang.TestClangCompilerRT: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
index 4b6bd1a75e..ead0171551 100644
--- a/package/compiler-rt/compiler-rt.hash
+++ b/package/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 782edfc119ee172f169c91dd79f2c964fb6b248bd9b73523149030ed505bbe18  compiler-rt-7.0.1.src.tar.xz
-sha256 417541d990edb3f96327ac03cb67e52eac80fc5c3e7afc69213cd04d7c3b9b27  LICENSE.TXT
+sha256 b435c7474f459e71b2831f1a4e3f1d21203cb9c0172e94e9d9b69f50354f21b1  compiler-rt-8.0.0.src.tar.xz
+sha256 dd27f8c290bcdc8368549cd7cd98710a9dbdc34122f2e096a1edb97824ed4148  LICENSE.TXT
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
new file mode 100644
index 0000000000..e1f9f8c598
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_CLANG_COMPILER_RT_PATH/package/libfuzzer/Config.in"
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc b/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
new file mode 100644
index 0000000000..92df85911d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
@@ -0,0 +1 @@
+name: CLANG_COMPILER_RT
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
new file mode 100644
index 0000000000..6fa55c1211
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_CLANG_COMPILER_RT_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
new file mode 100644
index 0000000000..5af5d1b6b9
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFUZZER
+	bool "libfuzzer"
+	help
+	  This is a set of tests (benchmarks) for fuzzing
+	  engines (fuzzers).
+
+	  https://github.com/google/fuzzer-test-suite
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
new file mode 100644
index 0000000000..6baf5763cf
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
@@ -0,0 +1,2 @@
+sha256 c0addb4d7f0447fc9fd7c80e5721fafe4c137f29a8ebd94c5fef7e1d6a2c944c  libfuzzer-64e4d9aa19a8d33b61882154addbf8419d7416e1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
new file mode 100644
index 0000000000..7d6f83b4d3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libfuzzer
+#
+################################################################################
+
+LIBFUZZER_VERSION = 64e4d9aa19a8d33b61882154addbf8419d7416e1
+LIBFUZZER_SITE = $(call github,google,fuzzer-test-suite,$(LIBFUZZER_VERSION))
+LIBFUZZER_LICENSE = Apache-2.0
+LIBFUZZER_LICENSE_FILES = LICENSE
+LIBFUZZER_DEPENDENCIES = compiler-rt
+
+define LIBFUZZER_BUILD_CMDS
+	$(HOST_DIR)/bin/clang++ -mcpu=cortex-a53 --sysroot=$(STAGING_DIR) \
+		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
+		$(@D)/tutorial/fuzz_me.cc \
+		-o $(@D)/fuzz_me
+endef
+
+define LIBFUZZER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/fuzz_me $(TARGET_DIR)/usr/bin/fuzz_me
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
new file mode 100644
index 0000000000..84a2528b00
--- /dev/null
+++ b/support/testing/tests/package/test_clang.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+FUZZ_TIMEOUT = 120
+
+
+class TestClangCompilerRT(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
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
+        BR2_PACKAGE_COMPILER_RT=y
+        BR2_PACKAGE_LLVM=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LIBFUZZER=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Sanitizers overallocate memory and the minimum that seemed to work was 512MB
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a53", "-m", "512", "-initrd", img])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # The test case verifies both that the application executes and that
+        # the symbolizer is working to decode the stack trace
+        cmd = "fuzz_me 2>&1 | grep _M_replace"
+        _, exit_code = self.emulator.run(cmd, FUZZ_TIMEOUT)
+        self.assertEqual(exit_code, 0)
-- 
2.17.1
