From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Dec 2016 19:42:03 +0200
Subject: [Buildroot] [PATCH] fs/tar: make --no-recursion effective
Message-ID: <a5d19ac14d835abbc645fef67aad61ce48e247b9.1482860523.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tar --no-recursion option is position sensitive. It only affects following
file listing options. Move --no-recursion before the -T option to make it
effective. This fixes duplication of entries in the generated rootfs.tar
archive.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index b14c977d761c..0e3eacbedf05 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -8,7 +8,7 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
-		tar $(TAR_OPTS) -cf $@ --null -T - --no-recursion --numeric-owner)
+		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
-- 
2.11.0
