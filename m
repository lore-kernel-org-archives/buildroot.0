From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Aug 2017 17:50:11 +0200
Subject: [Buildroot] [git commit] fs/iso9660: really create initrd temp dir
Message-ID: <20170815160109.763477FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a26adddde1e924236553584a5623485fdc90c7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case we're using an initrd, we create an empty "root" directory that
will contain only the bootloader stuff, not the actual root filesystem,
because it is in an initrd (standalone or initramfs).

We have to ensure that the directory is empty before assembling the
filesystem (to avoid any file lingering from a previous run, like the
sequence  "make; make"). So we first remove it before we create it, so
that on each build (especially not-from-scratch builds) we get the exact
expected content without any leftover.

However, the macro responsible for that, although defined since 7080eef9,
was never called.

Fix that by registering it as a pre-gen hook.

Note: the directory need not be created, as there are quite a few
"install -D" commands that ensure it is created. Yet, we prefer to
create it explicitly to avoid any confusion.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/iso9660/iso9660.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index fafe5b0..478cb02 100644
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
