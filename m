From: Dan Moulding <dan.moulding@rackwareinc.com>
Date: Tue, 29 Apr 2014 09:12:58 -0600
Subject: [Buildroot] [PATCH] Create /dev/null device node when building a
	cpio rootfs
In-Reply-To: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com>
References: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com>
Message-ID: <1398784378-20251-2-git-send-email-dan.moulding@rackwareinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows mdev to be used for automatic device creation, even if the
kernel doesn't support devtmpfs. The programs that run before mdev
(e.g. init) expect /dev/null to already exist.

Signed-off-by: Dan Moulding <dan.moulding@rackwareinc.com>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 771306c..8648ed9 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -22,6 +22,7 @@ define ROOTFS_CPIO_ADD_INIT
 endef
 
 PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
+PACKAGES_PERMISSIONS_TABLE += /dev/null c 666 0 0 1 3 - - -$(sep)
 
 endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
-- 
1.8.2.1
