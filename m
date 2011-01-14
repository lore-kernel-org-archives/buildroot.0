From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 11:20:38 +0100
Subject: [Buildroot] [git commit master 1/1] fs/jffs2: remove
	BR2_JFFS2_TARGET_SREC option
Message-ID: <20110114102129.741618B4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=921f75e2607e7f3d16b7ba8ee62ed68a3632eeb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This kind of custom image conversion is better handled outside BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/jffs2/Config.in |    5 -----
 fs/jffs2/jffs2.mk  |   10 +---------
 2 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index edb1f4d..5748fbb 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -80,11 +80,6 @@ config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	  Do not use cleanmarkers if using NAND flash or Dataflash where
 	  the pagesize is not a power of 2
 
-config BR2_JFFS2_TARGET_SREC
-	bool "RootFS in SREC file format"
-	help
-	  The binary data will be encoded in Motorola's S-record format
-
 config BR2_TARGET_ROOTFS_JFFS2_PAD
 	bool "Pad output"
 
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index fd5da0c..2a69849 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -46,12 +46,4 @@ define ROOTFS_JFFS2_CMD
 endef
 endif
 
-define JFFS2_GEN_SREC
-	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $$@ $$@.srec
-endef
-
-ifeq ($(BR2_JFFS2_TARGET_SREC),y)
-ROOTFS_JFFS2_POST_GEN_HOOKS += JFFS2_GEN_SREC
-endif
-
-$(eval $(call ROOTFS_TARGET,jffs2))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,jffs2))
-- 
1.7.2.2
