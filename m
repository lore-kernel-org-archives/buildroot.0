From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 09:00:30 +0200
Subject: [Buildroot] [git commit] configs/qemu_arm_versatile_defconfig:
 increase SD card image size to 64MiB
Message-ID: <20201003065707.B754D8E1C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb62a8e0a2b88b6c1b3ffe74e9eb370bf686fa62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_arm_versatile_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 6dc212397c..280c313407 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,6 +13,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+# Qemu >= 5.1 requires SD card size to be a power of 2, e.g. 64 MiB.
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
