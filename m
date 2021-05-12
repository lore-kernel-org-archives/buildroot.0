From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:37:05 +0000
Subject: [Buildroot] [PATCH v5 09/10] support/testing: new boot test for EDK2
Message-ID: <ak5tBXqil4EDAAsTQddh8OZAsyKypphCsT7edi8OKJ4@cp4-web-028.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Boot a QEMU sbsa-ref machine with ATF, EDK2, GRUB2 and a minimal
kernel. This is a simple but effective test of a compliant setup.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 support/testing/tests/boot/test_edk2.py | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 support/testing/tests/boot/test_edk2.py

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
new file mode 100644
index 0000000000..c1be8fad95
--- /dev/null
+++ b/support/testing/tests/boot/test_edk2.py
@@ -0,0 +1,45 @@
+import os
+
+import infra.basetest
+
+
+class TestEdk2(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-sbsa/linux.config"
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_ARM64_EFI=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
+        flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
+        self.emulator.boot(arch="aarch64",
+                           options=["-M", "sbsa-ref",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-pflash", flash0,
+                                    "-pflash", flash1,
+                                    "-hda", hda])
+        self.emulator.login()
-- 
2.30.2
