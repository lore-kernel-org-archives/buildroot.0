From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri,  2 Jul 2021 00:00:06 +0300
Subject: [Buildroot] [PATCH 4/4] stm32mp157c_dk2: fix U-Boot corruption on
 the first boot
In-Reply-To: <20210701210006.1171347-1-geomatsi@gmail.com>
References: <20210701210006.1171347-1-geomatsi@gmail.com>
Message-ID: <20210701210006.1171347-5-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both trusted and basic images successfully boot only once. Subsequent
boot attempts fail to reach U-Boot. The root cause turns out to be in
U-Boot corruption during the first boot. The stm32mp1 U-Boot stores its
environment at the end of GPT partition named 'ssbl' since v2020.10-rc2.
However Buildroot genimage template for stm32mp157 boards creates 'ssbl'
partition w/o extra space for U-Boot primary and redundant environments.
Add post-build script that appends placeholder for environment to U-Boot
image.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../common/stm32mp157/post-build.sh              | 16 ++++++++++++++++
 configs/stm32mp157c_dk2_basic_defconfig          |  1 +
 configs/stm32mp157c_dk2_trusted_defconfig        |  1 +
 3 files changed, 18 insertions(+)
 create mode 100755 board/stmicroelectronics/common/stm32mp157/post-build.sh

diff --git a/board/stmicroelectronics/common/stm32mp157/post-build.sh b/board/stmicroelectronics/common/stm32mp157/post-build.sh
new file mode 100755
index 0000000000..5c59a3f6bb
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp157/post-build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+set -u
+set -e
+
+cd "$BINARIES_DIR"
+
+dd if=/dev/zero of=env.bin bs=16384 count=1
+
+if [ -f u-boot.stm32 ]; then
+	cat env.bin >> u-boot.stm32
+fi
+
+if [ -f u-boot.img ]; then
+	cat env.bin >> u-boot.img
+fi
diff --git a/configs/stm32mp157c_dk2_basic_defconfig b/configs/stm32mp157c_dk2_basic_defconfig
index 153540ddc1..7976b248ad 100644
--- a/configs/stm32mp157c_dk2_basic_defconfig
+++ b/configs/stm32mp157c_dk2_basic_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/stm32mp157c_dk2_trusted_defconfig b/configs/stm32mp157c_dk2_trusted_defconfig
index a4bff897e5..c987a2b66e 100644
--- a/configs/stm32mp157c_dk2_trusted_defconfig
+++ b/configs/stm32mp157c_dk2_trusted_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.32.0
