From: Simon Pasch <fpasch@googlemail.com>
Date: Sun, 29 Aug 2010 23:36:46 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: Don't overwrite
	$(TARGET_DIR)/init if it exists
Message-ID: <20100829213822.1B1A38A2D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c4cdcc3680c5dc551fa563b2133ca83c55967495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2443

Allow use of custom init scripts.

Signed-off-by: Simon Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    1 +
 fs/initramfs/initramfs.mk |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8550b6f..7ab4aa4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,6 +27,7 @@
 
 	#635:  util-linux fails to build in 2009.08
 	#2239: netcat package installs its binary to target as avr32-linux...
+	#2443: Initramfs: Don't overwrite $(TARGET_DIR)/init if it exists
 	#2449: Minor fixes for squashfs makefile and correct PowerPC e500 ...
 
 2010.08-rc1, Released July 30th, 2010:
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index e6d004e..30969a4 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -13,8 +13,9 @@ INITRAMFS_TARGET:= #nothing
 endif
 
 define ROOTFS_INITRAMFS_INIT_SYMLINK
-	rm -f $(TARGET_DIR)/init
-	ln -s sbin/init $(TARGET_DIR)/init
+	if [ ! -e $(TARGET_DIR)/init ]; then \
+		ln -s sbin/init $(TARGET_DIR)/init; \
+	fi
 endef
 
 ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_INIT_SYMLINK
-- 
1.7.1
