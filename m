From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 13 Nov 2018 17:02:25 -0600
Subject: [Buildroot] [PATCH 4/5] support/testing/tests: CLANG compiler-rt
 runtime test
In-Reply-To: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1542150146-12188-4-git-send-email-matthew.weber@rockwellcollins.com>
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
 4) Executes the fuzz application on target and checkes expected output

Credit to the fuzzer test suite for the tutorial example used as the
fuzz test application.
https://github.com/google/fuzzer-test-suite

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/tests/package/test_clang.py | 93 +++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 support/testing/tests/package/test_clang.py

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
new file mode 100644
index 0000000..9c42c0d
--- /dev/null
+++ b/support/testing/tests/package/test_clang.py
@@ -0,0 +1,93 @@
+import os
+import tempfile
+import subprocess
+import shutil
+
+import infra.basetest
+
+FUZZ_TIMEOUT = 120
+
+
+class TestClangBase(infra.basetest.BRTest):
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Sanitizers overallocate memory and the minimum that seemed to work was 512MB
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           options=["-m", "512", "-initrd", img])
+        self.emulator.login()
+
+    def build_test_prog(self):
+        hostdir = os.path.join(self.builddir, 'host')
+        linkerdir = os.path.join(hostdir, 'opt', 'ext-toolchain')
+        stagingdir = os.path.join(self.builddir, 'staging')
+        env = os.environ.copy()
+        env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
+        clangcpp = os.path.join(hostdir, 'bin', 'clang++')
+        workdir = os.path.join(tempfile.mkdtemp(suffix='-br2-testing-compiler-rt'))
+        fuzz_src = os.path.join(workdir, 'fuzz_me.cc')
+        fuzz_bin = os.path.join(workdir, 'fuzz_me')
+        with open(fuzz_src, 'w+') as source_file:
+            source_file.write('#include <stdint.h>\n')
+            source_file.write('#include <stddef.h>\n')
+            source_file.write('bool FuzzMe(const uint8_t *Data, size_t DataSize) {\n')
+            source_file.write('  return DataSize >= 3 &&\n')
+            source_file.write('      Data[0] == \'F\' &&\n')
+            source_file.write('      Data[1] == \'U\' &&\n')
+            source_file.write('      Data[2] == \'Z\' &&\n')
+            source_file.write('      Data[3] == \'Z\';\n')
+            source_file.write('}\n')
+            source_file.write('extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {\n')
+            source_file.write('  FuzzMe(Data, Size);\n')
+            source_file.write('  return 0;\n')
+            source_file.write('}\n')
+
+        cmd = [clangcpp,
+               '-mcpu=cortex-a53',
+               '--sysroot', stagingdir,
+               '-B', linkerdir,
+               '-fsanitize=address,fuzzer',
+               fuzz_src,
+               '-o', fuzz_bin]
+        ret = subprocess.call(cmd,
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile,
+                              env=env)
+        if ret != 0:
+            raise SystemError("Clang build process launch failed")
+
+        shutil.copy(fuzz_bin, os.path.join(self.builddir, 'target', 'usr', 'bin'))
+        self.b.build()
+        shutil.rmtree(workdir)
+
+
+class TestClangCompilerRT(TestClangBase):
+    config = \
+             """
+             BR2_aarch64=y
+             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+             BR2_TOOLCHAIN_EXTERNAL=y
+             BR2_LINUX_KERNEL=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+             BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+             BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+             BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+             BR2_TARGET_ROOTFS_CPIO=y
+             BR2_TARGET_ROOTFS_CPIO_GZIP=y
+             # BR2_TARGET_ROOTFS_TAR is not set
+             BR2_PACKAGE_COMPILER_RT=y
+             BR2_PACKAGE_LLVM=y
+             """
+
+    def test_run(self):
+        self.build_test_prog()
+        self.login()
+
+        # The test case verifies both that the application executes and that
+        # the symbolizer is working to decode the stack trace
+        cmd = "fuzz_me 2>&1 | grep _M_replace"
+        _, exit_code = self.emulator.run(cmd, FUZZ_TIMEOUT)
+        self.assertEqual(exit_code, 0)
-- 
1.9.1
