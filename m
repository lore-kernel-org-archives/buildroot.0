From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Oct 2017 22:23:56 +0200
Subject: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_virt_defconfig: build
	and use ext4 rootfs
In-Reply-To: <20171012202356.20398-1-peter@korsgaard.com>
References: <20171012202356.20398-1-peter@korsgaard.com>
Message-ID: <20171012202356.20398-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "virt" machine supports disk emulation, so use a ext4 rootfs instead of
initramfs for consistency with the other qemu defconfigs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/readme.txt  | 2 +-
 configs/qemu_aarch64_virt_defconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index ece8a536a7..9e09d953f9 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0
+  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 84078ac892..c94c4ac773 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -6,8 +6,9 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Linux headers same as kernel, a 4.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
-- 
2.11.0
