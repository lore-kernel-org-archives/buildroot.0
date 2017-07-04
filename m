From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:47:57 +0200
Subject: [Buildroot] [git commit] fs/ext2: allow reserving zero block for
	root
Message-ID: <20170704064454.B4A4981768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3286a4d6aa2707e9dcdcb26e7c391bd7a07eddad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous default, zero, just meant "use the default value of the
filesystem generator", which happened to be 5% (the traditional value
for all ext-creating tools we've ever seen).

So, change the new default accordingly to 5%.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in | 7 ++++++-
 fs/ext2/ext2.mk   | 2 --
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index a1e3647..6f16dde 100644
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
+	  default to reserving 5% when creating a new ext filesystem.
 
 choice
 	prompt "Compression method"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 6a35b33..57058b5 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,9 +12,7 @@ EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
 
 EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
-endif
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
