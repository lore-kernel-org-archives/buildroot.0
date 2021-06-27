From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jun 2021 11:50:01 +0200
Subject: [Buildroot] [git commit] support/tests: fix squashfs test
Message-ID: <20210627092224.C77078DC5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7f0408f496fbbfac8663c76d308b9f691e19e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3cf2782906d5 (support/testing/infra/emulator.py: update pre-built
kernels) bumped the default kernels used by the testing infra.

However, the newer armv7 kernel (at least) no longer has support for
lz4-compressed squashfs filesystems.

This breaks the squashfs test:

    Filesystem uses "lz4" compression. This is not supported
    List of all partitions:
    1f00          131072 mtdblock0
     (driver?)
    1f01           32768 mtdblock1
     (driver?)
    b300            2048 mmcblk0
     driver: mmcblk
    No filesystem could mount root, tried:
     squashfs

    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)

Updating the kernel again is a little bit cumbersome, while fixing the
actual test is relatively trivial, so this is what we do: we switch
over to lzo, which is supported by the new kernel:

    # zcat /proc/config.gz |grep SQUA
    CONFIG_SQUASHFS=y
    CONFIG_SQUASHFS_ZLIB=y
    # CONFIG_SQUASHFS_LZ4 is not set
    CONFIG_SQUASHFS_LZO=y
    # CONFIG_SQUASHFS_XZ is not set

While at it, also drop the superfluous line disabling gzip compression:
it is part of a choice, so enabling one (lzo here) forcibly disables the
others (of which gzip).

Fixes: 3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_squashfs.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 745f93ee55..a914f5aac7 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -7,8 +7,7 @@ class TestSquashfs(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_SQUASHFS=y
-        # BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
-        BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -18,7 +17,7 @@ class TestSquashfs(infra.basetest.BRTest):
         out = out.splitlines()
         self.assertEqual(out[0],
                          "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
-        self.assertEqual(out[3], "Compression lz4")
+        self.assertEqual(out[3], "Compression lzo")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
         infra.img_round_power2(img)
