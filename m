From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:23:56 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add build tests for the
 syslinux bootloader
In-Reply-To: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com>
References: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200324142356.1487610-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds four new tests for the syslinux bootloader:

 - Building on x86, for legacy BIOS
 - Building on x86, for EFI BIOS
 - Building on x86-64, for legacy BIOS
 - Building on x86-64, for EFI BIOS

Runtime testing in Qemu would certainly be possible, but is left as a
future addition to these tests.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  4 +
 DEVELOPERS                                  |  1 +
 support/testing/tests/boot/test_syslinux.py | 83 +++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 support/testing/tests/boot/test_syslinux.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f5ed95f5e7..b505e842ca 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -335,6 +335,10 @@ zynqmp_zcu106_defconfig: { extends: .defconfig }
 tests.boot.test_atf.TestATFAllwinner: { extends: .runtime_test }
 tests.boot.test_atf.TestATFMarvell: { extends: .runtime_test }
 tests.boot.test_atf.TestATFVexpress: { extends: .runtime_test }
+tests.boot.test_syslinux.TestSysLinuxX86EFI: { extends: .runtime_test }
+tests.boot.test_syslinux.TestSysLinuxX86LegacyBios: { extends: .runtime_test }
+tests.boot.test_syslinux.TestSysLinuxX86_64EFI: { extends: .runtime_test }
+tests.boot.test_syslinux.TestSysLinuxX86_64LegacyBios: { extends: .runtime_test }
 tests.core.test_file_capabilities.TestFileCapabilities: { extends: .runtime_test }
 tests.core.test_hardening.TestFortifyConserv: { extends: .runtime_test }
 tests.core.test_hardening.TestFortifyNone: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 8ea08739f7..fb12347512 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2501,6 +2501,7 @@ F:	package/scons/
 F:	package/squashfs/
 F:	package/wayland/
 F:	package/weston/
+F:	support/testing/tests/boot/test_syslinux.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
new file mode 100644
index 0000000000..6b1a8bc7d7
--- /dev/null
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -0,0 +1,83 @@
+import infra.basetest
+
+class TestSysLinuxBase(infra.basetest.BRTest):
+    x86_toolchain_config = \
+        """
+	BR2_x86_i686=y
+	BR2_TOOLCHAIN_EXTERNAL=y
+	BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+	BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
+	BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        """
+
+    x86_64_toolchain_config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        """
+
+    syslinux_legacy_config = \
+        """
+        BR2_TARGET_SYSLINUX=y
+        BR2_TARGET_SYSLINUX_ISOLINUX=y
+        BR2_TARGET_SYSLINUX_PXELINUX=y
+        BR2_TARGET_SYSLINUX_MBR=y
+        """
+
+    syslinux_efi_config = \
+        """
+        BR2_TARGET_SYSLINUX=y
+        BR2_TARGET_SYSLINUX_EFI=y
+        """
+
+class TestSysLinuxX86LegacyBios(TestSysLinuxBase):
+    config = \
+        TestSysLinuxBase.x86_toolchain_config + \
+        infra.basetest.MINIMAL_CONFIG + \
+        TestSysLinuxBase.syslinux_legacy_config
+
+    def test_run(self):
+        pass
+
+class TestSysLinuxX86EFI(TestSysLinuxBase):
+    config = \
+        TestSysLinuxBase.x86_toolchain_config + \
+        infra.basetest.MINIMAL_CONFIG + \
+        TestSysLinuxBase.syslinux_efi_config
+
+    def test_run(self):
+        pass
+
+class TestSysLinuxX86_64LegacyBios(TestSysLinuxBase):
+    config = \
+        TestSysLinuxBase.x86_64_toolchain_config + \
+        infra.basetest.MINIMAL_CONFIG + \
+        TestSysLinuxBase.syslinux_legacy_config
+
+    def test_run(self):
+        pass
+
+class TestSysLinuxX86_64EFI(TestSysLinuxBase):
+    config = \
+        TestSysLinuxBase.x86_64_toolchain_config + \
+        infra.basetest.MINIMAL_CONFIG + \
+        TestSysLinuxBase.syslinux_efi_config
+
+    def test_run(self):
+        pass
-- 
2.25.1
