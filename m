From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:31:33 +0100
Subject: [Buildroot] [git commit] fs/common: Create initial console device
Message-ID: <20121121103218.0C2D896997@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1ebae700ace80ded99e1a977e28375dc4f7255d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A /dev/console node must be present in rootfs when the Linux kernel
boots otherwise the kernel will print the following warning:
"Warning: unable to open an initial console"

This is because when we use an initramfs the /dev directory is not
populated at this point. This can cause problems when a program
(e.g ldso with early debugging enabled) opens a standard file
descriptor for read/write before these descriptors are actually
created by the init process later on.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/cpio/cpio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index aa20b41..5533322 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -21,6 +21,8 @@ define ROOTFS_CPIO_ADD_INIT
         fi
 endef
 
+PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
+
 endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
