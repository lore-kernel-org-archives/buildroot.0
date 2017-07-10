From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 18:26:19 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <cover.1499703968.git.yann.morin.1998@free.fr>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
Message-ID: <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel will refuse to mount a squashfs image/partition that is
not padded to a 1MiB boundary.

We already have this as a workaround in the testing infrastructure, in
support/testing/tests/fs/test_squashfs.py at 26.

Use that workaround directly during the squashfs generation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/squashfs/squashfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 342c7a8a37..ba2c956544 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -21,6 +21,7 @@ endif
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS)
+	truncate -s %1M $@
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
-- 
2.11.0
