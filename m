From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:51:23 +0100
Subject: [Buildroot] [git commit] linux: ensure images/ exist before
 creating files there
Message-ID: <20181206204804.E911A87069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=524fb10bbe2038ea7ca45493193073d31732d1de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using an initramfs, on the first-pass build, we create a dummy cpio
so that the build succeeeds. The real cpio will come later, and we'll do
a second-pass build to use the actual cpio.

However, when we touch that dummy cpio, the images/ directory may not
yet exist, since commit d0f4f95e39 (Makefile: rework main directory
creation logic) removed its creation at the begining of the build, to
only at the moment we need it, i.e. during the *_INSTALL_IMAGES_CMDS
steps.

However, the linux build is not a _INSTALL_IMAGES_CMDS step, so there is
no guarantee that images/ already exist at that time.

Fix that by explicitly creating images/ before touching the dummy cpio.

Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index c00b326e8a..110260723b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -311,6 +311,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	# replaced later by the real cpio archive, and the kernel will be
 	# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+		mkdir -p $(BINARIES_DIR)
 		touch $(BINARIES_DIR)/rootfs.cpio
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
