From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 14:33:14 +0200
Subject: [Buildroot] [git commit master] fs/ext2: fix blocks/inodes
	calculation
Message-ID: <20100419123424.5CC5E20B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb951b93423356a7b648a8e268cd5af57d964f45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the ROOTFS_TARGET conversion, EXT2_OPTS gets evaluated very early
(before TARGET_DIR is populated with files), so the calculated
blocks/inodes numbers are wrong.

Fix it by moving the calculation to a shell script wrapper around
genext2fs, so it only gets executed just before genext2fs runs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/ext2.mk      |   13 ++-----------
 fs/ext2/genext2fs.sh |   39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 11 deletions(-)
 create mode 100755 fs/ext2/genext2fs.sh

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index f3d3ff9..18a6df4 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -24,17 +24,8 @@ endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-GENEXT2_REALSIZE=$(shell LC_ALL=C du -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//")
-GENEXT2_ADDTOROOTSIZE=$(shell if [ $(GENEXT2_REALSIZE) -ge 20000 ]; then echo 16384; else echo 2400; fi)
-GENEXT2_SIZE=$(shell expr $(GENEXT2_REALSIZE) + $(GENEXT2_ADDTOROOTSIZE))
-GENEXT2_ADDTOINODESIZE=$(shell find $(TARGET_DIR) | wc -l)
-GENEXT2_INODES=$(shell expr $(GENEXT2_ADDTOINODESIZE) + 400)
-EXT2_OPTS += -b $(GENEXT2_SIZE) -N $(GENEXT2_INODES)
-endif
-
 define ROOTFS_EXT2_CMD
-	$(HOST_DIR)/usr/bin/genext2fs -d $(TARGET_DIR) $(EXT2_OPTS) $$@
+	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $$@
 endef
 
-$(eval $(call ROOTFS_TARGET,ext2))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,ext2))
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
new file mode 100755
index 0000000..b315ec3
--- /dev/null
+++ b/fs/ext2/genext2fs.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+# genext2fs wrapper calculating needed blocks/inodes values if not specified
+
+export LC_ALL=C
+
+CALC_BLOCKS=1
+CALC_INODES=1
+
+while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
+do
+    case $f in
+	b) CALC_BLOCKS=0 ;;
+	N) CALC_INODES=0 ;;
+	d) TARGET_DIR=$OPTARG ;;
+    esac
+done
+
+# calculate needed blocks
+if [ $CALC_BLOCKS -eq 1 ];
+then
+    BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
+    if [ $BLOCKS -ge 20000 ];
+    then
+	BLOCKS=$(expr $BLOCKS + 16384)
+    else
+	BLOCKS=$(expr $BLOCKS + 2400)
+    fi
+    set -- $@ -b $BLOCKS
+fi
+
+# calculate needed inodes
+if [ $CALC_INODES -eq 1 ];
+then
+    INODES=$(find $TARGET_DIR | wc -l)
+    INODES=$(expr $INODES + 400)
+    set -- $@ -N $INODES
+fi
+
+exec genext2fs $@
-- 
1.6.3.3
