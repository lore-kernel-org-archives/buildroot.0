From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Oct 2020 18:00:36 +0200
Subject: [Buildroot] [PATCH] configs/qemu_arm_versatile_defconfig: increase
 SD card image size to 64MiB
Message-ID: <20201002160036.1530041-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Qemu 5.1, this defconfig doesn't boot due to the to small SD card image size (60MB).

qemu-system-arm: sd_init failed: Invalid SD card size: 60 MiB
SD card size has to be a power of 2, e.g. 64 MiB.
You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
(note that this will lose data if you make the image smaller than it currently is).
qemu-system-arm: sd_init failed

From [1]:
"While the possibility to use small SD card images has been seen as
a feature, it became a bug with CVE-2020-13253, where the guest is
able to do OOB read/write accesses past the image size end."

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/766482935

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/qemu_arm_versatile_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 6dc212397c..a58bd995a1 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,6 +13,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+# Qemu >= 5.1 request an SD card size to be a power of 2, e.g. 64 MiB.
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
-- 
2.25.4
