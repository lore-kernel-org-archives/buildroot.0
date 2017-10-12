From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:49:21 +0200
Subject: [Buildroot] [git commit] configs/qemu_aarch64_virt_defconfig: build
	and use ext4 rootfs
Message-ID: <20171012204201.D2A427FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c74a484fd1a5809369df0fbf4f1ca0bfe59e36b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "virt" machine supports disk emulation, so use a ext4 rootfs instead of
initramfs for consistency with the other qemu defconfigs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/aarch64-virt/readme.txt  | 2 +-
 configs/qemu_aarch64_virt_defconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index ece8a53..9e09d95 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0
+  qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 84078ac..c94c4ac 100644
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
