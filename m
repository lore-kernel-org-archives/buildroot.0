From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:20 +0100
Subject: [Buildroot] [PATCH 02/15 v2] fs/cpio: don't extend packages'
 permissions table
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <894a5d2acd54d9a1e61a3e92500ca4c804638c4c.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when we build a cpio filesystem without static devices, we
shoehorn the /dev/console node as if it were specified by a package.

This means that this device is added for all filesystems as well, not
just the cpio. But if we disable cpio, that device is not created for
other filesystems.

This is not very clean, and may break expectations.

Instead, use an explicit mknod as part of the _CMD, as we know it's
going to run under fakeroot.

This is still visible to all filesystems built after cpio, and not to
those built before it, though.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/cpio/cpio.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index aa4d947fa5..505976512b 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -15,14 +15,15 @@ endef
 else
 # devtmpfs does not get automounted when initramfs is used.
 # Add a pre-init script to mount it before running init
+# We must have /dev/console very early, even before /init runs, so
+# that it can at least open its stdin/stdout/stderr filedescriptors.
 define ROOTFS_CPIO_ADD_INIT
 	if [ ! -e $(TARGET_DIR)/init ]; then \
 		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
 	fi
+	mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
 endef
 
-PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
-
 endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
-- 
2.14.1
