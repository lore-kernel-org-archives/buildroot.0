From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 11:08:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] fs/iso9660: really create
	initrd temp dir
Message-ID: <20170906112606.D604F8215D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ff69117fef4f36b6d1daf6883891add9c159546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
(cherry picked from commit 8a26adddde1e924236553584a5623485fdc90c7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/iso9660/iso9660.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d1d9cbf..ee98ecf 100644
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
