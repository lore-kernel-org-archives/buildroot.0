From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 01:46:22 -0500
Subject: [Buildroot] [PATCH v2] initramfs: fix init symlink creation
In-Reply-To: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
References: <1289919526-2227-1-git-send-email-vapier@gentoo.org>
Message-ID: <1289976382-22357-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -e test will dereference the symlink, so if there is no /bin/init,
we will constantly try to create the symlink.  So rather than error on
subsequent runs when the link exists, use the force flag to ln.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- drop the -L change and just recreate the symlink for people
	  who install their own file at /init

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
1.7.3.2
