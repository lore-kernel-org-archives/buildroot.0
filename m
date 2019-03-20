From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 20 Mar 2019 23:05:21 +0000
Subject: [Buildroot] [PATCH v6 4/5] configs: qemu_riscv*_virt: Use OpenSBI
 by default
In-Reply-To: <20190320230422.13592-1-alistair.francis@wdc.com>
References: <20190320230422.13592-1-alistair.francis@wdc.com>
Message-ID: <20190320230422.13592-4-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use OpenSBI by default instead of riscv-pk (BBL).

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 board/qemu/riscv32-virt/readme.txt  | 6 +++---
 board/qemu/riscv64-virt/readme.txt  | 6 +++---
 configs/qemu_riscv32_virt_defconfig | 5 ++++-
 configs/qemu_riscv64_virt_defconfig | 5 ++++-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 2da99580e5..b984e47105 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,7 +1,7 @@
-Run the emulation with:
+Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.12.1
+Tested with QEMU 3.1
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 9f6e35c867..84c7ab3221 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,7 +1,7 @@
-Run the emulation with:
+Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.12.1
+Tested with QEMU 3.1
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index fab152e50a..5d3e06bf3c 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -20,6 +20,9 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config.fragment"
+BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
-BR2_TARGET_RISCV_PK=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_USE_PLAT=y
+BR2_TARGET_OPENSBI_PLAT="qemu/virt"
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 596edf2fcd..05d2764003 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -19,6 +19,9 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
-BR2_TARGET_RISCV_PK=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_USE_PLAT=y
+BR2_TARGET_OPENSBI_PLAT="qemu/virt"
-- 
2.21.0
