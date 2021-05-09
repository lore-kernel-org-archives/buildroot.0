From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 May 2021 15:06:34 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] board/qemu/s390x: disable SSP when needed
Message-ID: <20210509130634.1105988-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure raised since commit
810ba387bec3c5b6904e8893fb4cb6f9d3717466 by disabling SSP when needed

Fixes:
 - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Romain Naour):
 - Move patch from linux to board/qemu/s390x

 ...01-arch-s390-disable-SSP-when-needed.patch | 47 +++++++++++++++++++
 configs/qemu_s390x_defconfig                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch

diff --git a/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch b/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
new file mode 100644
index 0000000000..c8199d4fd6
--- /dev/null
+++ b/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
@@ -0,0 +1,47 @@
+From 8a054081678ed0b0e56f829bac0a4656e3a198b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 May 2021 22:03:11 +0200
+Subject: [PATCH] arch/s390: disable SSP when needed
+
+Though -nostdlib is passed in PURGATORY_LDFLAGS and -ffreestanding in
+KBUILD_CFLAGS_DECOMPRESSOR, -fno-stack-protector must also be passed to
+avoid linking errors related to undefined references to
+'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
+-fstack-protector.
+
+Fixes:
+ - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ arch/s390/Makefile           | 1 +
+ arch/s390/purgatory/Makefile | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/arch/s390/Makefile b/arch/s390/Makefile
+index e443ed9947bd..098abe3a56f3 100644
+--- a/arch/s390/Makefile
++++ b/arch/s390/Makefile
+@@ -28,6 +28,7 @@ KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
+ KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float -mbackchain
+ KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
+ KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
++KBUILD_CFLAGS_DECOMPRESSOR += -fno-stack-protector
+ KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
+ KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
+ KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
+diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
+index c57f8c40e992..21c4ebe29b9a 100644
+--- a/arch/s390/purgatory/Makefile
++++ b/arch/s390/purgatory/Makefile
+@@ -24,6 +24,7 @@ KBUILD_CFLAGS := -fno-strict-aliasing -Wall -Wstrict-prototypes
+ KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
+ KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
+ KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
++KBUILD_CFLAGS += -fno-stack-protector
+ KBUILD_CFLAGS += $(CLANG_FLAGS)
+ KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
+ KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
+-- 
+2.30.2
+
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 9b3821f043..4aed9d9ae5 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/s390x/patches"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.30.2
