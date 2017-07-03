From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 00:50:59 +0200
Subject: [Buildroot] [PATCH v3 04/11] fs/ext2: allow reserving zero block
	for root
In-Reply-To: <20170703225106.1492-1-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
Message-ID: <20170703225106.1492-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The previous default, zero, just meant "use the default value of the
filesystem generator", which happened to be 5% (the traditional value
for all ext-creating tools we've ever seen).

So, change the new default accordingly to 5%.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- none

changes v1->v2:
- rebase
- fix typos
---
 fs/ext2/Config.in | 7 ++++++-
 fs/ext2/ext2.mk   | 2 --
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index a1e3647a14..09ec87786f 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -65,7 +65,12 @@ config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
 
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
-	default 0
+	default 5
+	help
+	  The number of blocks on the filesystem (as a percentage of the
+	  total number of blocksi), that are reserved for use by root.
+	  Traditionally, this has been 5%, and all ext-related tools still
+	  default to reserving 5% when creating a nez ext filesystem.
 
 choice
 	prompt "Compression method"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 6a35b33117..57058b5fd2 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,9 +12,7 @@ EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
 
 EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
-endif
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-- 
2.13.2
