From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 5 Nov 2012 09:44:54 +0000
Subject: [Buildroot] [PATCH v3] fs/common: Create initial console device
Message-ID: <1352108694-11875-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

A /dev/console node must be present in rootfs when the Linux kernel
boots otherwise the kernel will print the following warning:
"Warning: unable to open an initial console"

This is because when we use an initramfs the /dev directory is not
populated at this point. This can cause problems when a program
(e.g ldso with early debugging enabled) opens a standard file
descriptor for read/write before these descriptors are actually
created by the init process later on.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
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
-- 
1.7.1
