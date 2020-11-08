From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  8 Nov 2020 16:27:36 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu_arm_vexpress_defconfig:
 increase SD card image size to 64MiB
In-Reply-To: <20201108152736.2956555-1-romain.naour@gmail.com>
References: <20201108152736.2956555-1-romain.naour@gmail.com>
Message-ID: <20201108152736.2956555-2-romain.naour@gmail.com>
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

The qemu_arm_vexpress_tz_defconfig doesn't trigger such issue since
it doesn't use the same filesystem support (i.e doesn't use
-drive file=output/images/rootfs.ext2,if=sd,format=raw).

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/766482935

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/qemu_arm_vexpress_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index f99b87c17a..3066bc855b 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -16,6 +16,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+# Qemu >= 5.1 request an SD card size to be a power of 2, e.g. 64 MiB.
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
-- 
2.25.4
