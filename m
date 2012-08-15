From: Richard Braun <rbraun@sceen.net>
Date: Wed, 15 Aug 2012 16:57:54 +0200
Subject: [Buildroot] [PATCH] grub: add host support
Message-ID: <1345042674-28463-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change makes it possible to use a grub executable built for the
host to install the boot loader inside an image. It's also a hack to
make it possible to work around x86_64 issues, as long as the user has
32-bits libraries available to his native toolchain.

-- Informative part --

This change alone doesn't mean you'll have grub magically installed in
your rootfs. First, legacy grub apparently requires a partition table to
mount file systems. You must work around this limitation yourself. Then,
it requires crafting the file system so that grub stuff is provided at
the proper location (e.g. in boot/grub inside your rootfs). On x86_64
systems, the target grub simply doesn't build, so you'll need to build
host-grub manually and, for example, make your post-build script do
anything necessary so that the host grub is able to setup the boot
loader on your disk image.

This part is intended as a hint to people trying to use buildroot for
embedded x86 targets in the hope it helps. Included here is a reference
shell script that doesn't require root privileges, which you can use as
a template for your own projects :

set -e

CF_SIZE=1024966656       # 1024 MB
CF_BOOT_SIZE=8388608     # 8 MiB
CF_HPC=16   # Heads per cylinder
CF_SPT=63   # Sectors per track

IMAGES_DIR="output/images"
KERNEL_IMG="$IMAGES_DIR/bzImage"
CF_IMG="$IMAGES_DIR/cf.img"
BOOT_DIR="output/target_boot"
BOOT_IMG="$IMAGES_DIR/bootfs.ext2"
ROOTFS_IMG="$IMAGES_DIR/rootfs.squashfs"

HOST_DIR="output/host"
SFDISK="$HOST_DIR/usr/sbin/sfdisk"
GENEXT2FS="$HOST_DIR/usr/bin/genext2fs"
E2FSCK="$HOST_DIR/usr/sbin/e2fsck"
GRUB="$HOST_DIR/usr/sbin/grub"

rm -f $CF_IMG $BOOT_IMG

make host-util-linux host-genext2fs host-e2fsprogs host-grub

echo

cf_boot_start=64
cf_boot_size=$(($CF_BOOT_SIZE / 512))
cf_rootfs_start=$(($cf_boot_start + $cf_boot_size))
cf_sectors=$(($CF_SIZE / 512))
cf_rootfs_size=$(($cf_sectors - $cf_rootfs_start))

cat << EOF
CF layout :
  boot: $cf_boot_start ($cf_boot_size)
rootfs: $cf_rootfs_start ($cf_rootfs_size)

EOF

cf_cylinders=$(($cf_sectors / ($CF_SPT * $CF_HPC)))
cf_heads=$((($cf_sectors / $CF_SPT) % $CF_HPC))
cf_sectors=$((($cf_sectors % $CF_SPT) + 1))

cat << EOF
CHS emulation:
cylinders: $cf_cylinders
    heads: $cf_heads
  sectors: $cf_sectors

EOF

dd if=/dev/zero of=$CF_IMG bs=1 count=0 seek=$CF_SIZE
$SFDISK -q -L -uS -C $cf_cylinders -H $cf_heads -S $cf_sectors --no-reread $CF_IMG << EOF
$cf_boot_start $cf_boot_size L *
$cf_rootfs_start $cf_rootfs_size
EOF

$GENEXT2FS -m 0 -b $(($cf_boot_size / 2)) -d $BOOT_DIR -N 64 -U $BOOT_IMG
$E2FSCK -fyDC0 $BOOT_IMG || true
dd if=$BOOT_IMG of=$CF_IMG conv=notrunc seek=$cf_boot_start bs=512

dd if=$ROOTFS_IMG of=$CF_IMG conv=notrunc seek=$cf_rootfs_start bs=512

$GRUB --device-map=/dev/null --batch << EOF
device (hd0) $CF_IMG
root (hd0,0)
setup (hd0)
EOF

echo

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 boot/grub/grub.mk |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index e8d66f1..c4f52cc 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -82,4 +82,23 @@ define GRUB_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/boot/grub
 endef
 
+HOST_GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
+
+HOST_GRUB_CONF_ENV = \
+	CFLAGS="$(GRUB_CFLAGS) -fno-stack-protector" \
+	grub_cv_prog_objcopy_absolute=yes
+
+HOST_GRUB_CONF_OPT = \
+	--disable-auto-linux-mem-opt \
+	--disable-graphics
+
+define HOST_GRUB_INSTALL_CMDS
+	install -m 0755 -D $(@D)/grub/grub $(HOST_DIR)/usr/sbin/grub
+	mkdir -p $(HOST_DIR)/boot/grub
+	cp $(@D)/stage1/stage1 $(HOST_DIR)/boot/grub
+	cp $(@D)/stage2/*1_5   $(HOST_DIR)/boot/grub
+	cp $(@D)/stage2/stage2 $(HOST_DIR)/boot/grub
+endef
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.2.5
