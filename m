From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 19:00:59 +0100
Subject: [Buildroot] [git commit] support/testing: add tests for ATF
Message-ID: <20171208181255.7511482867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cf3ce04e9c4a4c4685b80edd9e8e873fe44d8e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These new tests only do build tests, but allow to quickly verify that
the ATF/U-Boot combinations for vexpress, Allwinner and Marvell
platforms all continue to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/__init__.py |  0
 support/testing/tests/boot/test_atf.py | 79 ++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/support/testing/tests/boot/__init__.py b/support/testing/tests/boot/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
new file mode 100644
index 0000000..02f93b9
--- /dev/null
+++ b/support/testing/tests/boot/test_atf.py
@@ -0,0 +1,79 @@
+import os
+import infra.basetest
+
+class TestATFVexpress(infra.basetest.BRTest):
+    config = \
+    """
+    BR2_aarch64=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+    BR2_TARGET_UBOOT=y
+    BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
+    BR2_TARGET_VEXPRESS_FIRMWARE=y
+    """
+
+    def test_run(self):
+        pass
+
+class TestATFAllwinner(infra.basetest.BRTest):
+    config = \
+    """
+    BR2_aarch64=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+    BR2_TARGET_UBOOT=y
+    BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+    BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+    BR2_TARGET_UBOOT_NEEDS_DTC=y
+    BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+    BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+    BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+    BR2_TARGET_UBOOT_SPL=y
+    BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+    """
+
+    def test_run(self):
+        pass
+
+class TestATFMarvell(infra.basetest.BRTest):
+    config = \
+    """
+    BR2_aarch64=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+    BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+    BR2_TARGET_BINARIES_MARVELL=y
+    BR2_TARGET_BINARIES_MARVELL_8040=y
+    BR2_TARGET_MV_DDR_MARVELL=y
+    BR2_TARGET_UBOOT=y
+    BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+    """
+
+    def test_run(self):
+        pass
