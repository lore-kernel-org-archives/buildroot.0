From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:20:05 +0200
Subject: [Buildroot] [git commit] support/testing: add tests for musl and
	uclibc toolchains
Message-ID: <20170705101716.D4A207FBDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bbc37e933e93742f5e9cb7d4571667a44bcbbd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These tests simply build a system with musl and uclibc toolchains, and
boot them under qemu. It allows to minimally validate that our support
for musl/uclibc external toolchains is working. We already had some
tests covering glibc toolchains, so we can now easily test that all
three C libraries are supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This commit is part of the series, as I've written/used those tests to
validate that things are still working correctly with all of glibc,
uclibc and musl toolchains.
---
 .gitlab-ci.yml                                   |  3 +
 support/testing/tests/toolchain/test_external.py | 75 ++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ae7e5d..583e2f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -226,6 +226,9 @@ tests.fs.test_ubi.TestUbi: *runtime_test
 tests.fs.test_yaffs2.TestYaffs2: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_python.TestPythonBase: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 0b15d48..afb4bb0 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -154,3 +154,78 @@ BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
                            kernel="builtin",
                            options=["-initrd", img])
         self.emulator.login()
+
+class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-444-g6c704ba.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+"""
+    toolchain_prefix = "arm-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+class TestExternalToolchainCtngMusl(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
+BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+"""
+    toolchain_prefix = "arm-ctng-linux-musleabihf"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+"""
+    toolchain_prefix = "arm-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
