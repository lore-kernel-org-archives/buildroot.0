From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  3 Jul 2017 17:51:53 +0200
Subject: [Buildroot] [PATCH v2 5/6] fs/ext2: simplify code
In-Reply-To: <20170703155154.24104-1-s.martin49@gmail.com>
References: <20170703155154.24104-1-s.martin49@gmail.com>
Message-ID: <20170703155154.24104-6-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just collate all options into a single assignment.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v1->v2:
- new patch
---
 fs/ext2/ext2.mk | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 7ab2b5cf8f..1b3c1db39b 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -9,22 +9,19 @@ ifeq ($(EXT2_SIZE),)
 $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 endif
 
-EXT2_OPTS = -d $(TARGET_DIR)
-EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
-
 EXT2_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_FEATURES))
-ifneq ($(EXT2_FEATURES),)
-EXT2_OPTS += -O "$(EXT2_FEATURES)"
-endif
-
-EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
-EXT2_OPTS += -L "$(EXT2_LABEL)"
+EXT2_OPTS = \
+	-d $(TARGET_DIR) \
+	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
+	-L "$(EXT2_LABEL)" \
+	$(if $(EXT2_FEATURES),-O "$(EXT2_FEATURES)")
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
-- 
2.13.2
