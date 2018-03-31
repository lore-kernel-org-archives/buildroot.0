From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:47:25 +0200
Subject: [Buildroot] [git commit] fs/cpio: don't extend packages'
 permissions table
Message-ID: <20180331185351.7F40383836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dec061adce133111460ecf29dbb8a0da36dad772
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: ensure /dev exists, simplify comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/cpio/cpio.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index aa4d947fa5..1f0cafe62f 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -15,14 +15,16 @@ endef
 else
 # devtmpfs does not get automounted when initramfs is used.
 # Add a pre-init script to mount it before running init
+# We must have /dev/console very early, even before /init runs,
+# for stdin/stdout/stderr
 define ROOTFS_CPIO_ADD_INIT
 	if [ ! -e $(TARGET_DIR)/init ]; then \
 		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
 	fi
+	mkdir -p $(TARGET_DIR)/dev
+	mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
 endef
 
-PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
-
 endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
