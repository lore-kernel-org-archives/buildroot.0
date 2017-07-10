From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 00:14:52 +0200
Subject: [Buildroot] [PATCH 2/3 v2] fs/squashfs: align size to 256KiB
In-Reply-To: <cover.1499724881.git.yann.morin.1998@free.fr>
References: <cover.1499724881.git.yann.morin.1998@free.fr>
Message-ID: <a14a79f47c226a8eba56e26a35d7698e49ed3df9.1499724881.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By experimental evidence, the Linux kernel will refuse to mount a
squashfs image/partition that is not padded to a 256kiB boundary.

We already have a similar workaround in the testing infrastructure,
in support/testing/tests/fs/test_squashfs.py at 26.

Use that workaround directly during the squashfs generation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - drop the requirements to just 256KiB
---
 fs/squashfs/squashfs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 342c7a8a37..bf697acb3d 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -18,9 +18,12 @@ else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
+# Experimental evidence shows that a squashfs image size must be
+# a multiple of 256KiB.
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS)
+	truncate -s %256k $@
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
-- 
2.11.0
