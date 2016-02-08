From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 12:12:49 +0100
Subject: [Buildroot] [git commit] configs/qemu: drop arm nuri
Message-ID: <20160208111306.7B2227FB0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a10562c1a1473cc22c2a21641138bce52f4d275c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This config has no prospect of going into the future (by using DTS), and
qemu doesn't do a good job at emulating it (networking problems), so
drop it.
All of the ARM SMP testing duties are now in the vexpress defconfig
which is better suited/supported.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-nuri/readme.txt  | 11 -----------
 configs/qemu_arm_nuri_defconfig | 24 ------------------------
 2 files changed, 35 deletions(-)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
deleted file mode 100644
index df07a5c..0000000
--- a/board/qemu/arm-nuri/readme.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-Run the emulation with:
-
-  qemu-system-arm -M nuri -kernel output/images/zImage -append "console=ttySAC1,115200" -smp 2 -serial null -serial stdio
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Startup time is slow because of the SMP CPU emulation so be patient.
-This emulation is known to be flaky.
-
-Tested with QEMU 2.3.0
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
deleted file mode 100644
index 9c64f74..0000000
--- a/configs/qemu_arm_nuri_defconfig
+++ /dev/null
@@ -1,24 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3D16=y
-
-# System
-BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
-
-# Filesystem
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-# Stuck at 3.10.x because there's no Nuri DTS
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.96"
-BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
-BR2_LINUX_KERNEL_ZIMAGE=y
