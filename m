From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Aug 2017 23:03:35 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: really create initrd temp dir
Message-ID: <20170814210335.1426-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case we're using an initrd, we create an empty "root" directory that
will contain only the bootloader stuff, not the actual root filesystem,
because it is in an initrd (standalone or initramfs).

But the macro that ensures that temporary directory exists and is clean
is never called.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index fafe5b0e84..478cb0239b 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -40,6 +40,7 @@ define ROOTFS_ISO9660_CREATE_TEMPDIR
 	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
 	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
 endef
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_CREATE_TEMPDIR
 else
 ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
 endif
-- 
2.11.0
