From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 22:00:29 +0100
Subject: [Buildroot] [git commit master 1/1] initramfs: fix init symlink
	creation
Message-ID: <20101117210123.CDC138E95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dde5b6830c7d53591cf7f52f9c433eed65c89f84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -e test will dereference the symlink, so if there is no /bin/init,
we will constantly try to create the symlink.  So rather than error on
subsequent runs when the link exists, use the force flag to ln.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/initramfs/initramfs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index dd6aa94..73122a8 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -8,7 +8,7 @@
 
 define ROOTFS_INITRAMFS_INIT_SYMLINK
 	if [ ! -e $(TARGET_DIR)/init ]; then \
-		ln -s sbin/init $(TARGET_DIR)/init; \
+		ln -sf sbin/init $(TARGET_DIR)/init; \
 	fi
 endef
 
@@ -20,4 +20,4 @@ endef
 
 ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
 
-$(eval $(call ROOTFS_TARGET,initramfs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,initramfs))
-- 
1.7.1
