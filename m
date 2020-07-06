From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Jul 2020 01:41:51 +0200
Subject: [Buildroot] [PATCH 8/8] board/qemu/aarch64-virt/linux.config:
 enable VIRTIO_FS driver
In-Reply-To: <20200706234151.2940865-1-romain.naour@gmail.com>
References: <20200706234151.2940865-1-romain.naour@gmail.com>
Message-ID: <20200706234151.2940865-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

virtio-fs allow sharing a directory between the host and the guest.
It require virtiofsd daemon running before starting Qemu.

The wiki [1] recommand to enable the following kernel options:

      CONFIG_VIRTIO
      CONFIG_VIRTIO_FS
      CONFIG_DAX
      CONFIG_FS_DAX
      CONFIG_DAX_DRIVER
      CONFIG_ZONE_DEVICE

But virtio-fs works fine with only VIRTIO_FS.

Note: ZONE_DEVICE can only be enabled on aarch64 since kernel >= 5.7.
ARCH_ENABLE_MEMORY_HOTREMOVE support is missing for previous kernel [2].

[1] https://virtio-fs.gitlab.io/howto-qemu.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bbd6ec605c0fc286c3f8ce60b4ed44635361d58b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 227723f855..02e0812ffd 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -60,5 +60,7 @@ CONFIG_MAILBOX=y
 CONFIG_PL320_MBOX=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.25.4
