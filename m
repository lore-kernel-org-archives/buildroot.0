From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 10:13:21 +0100
Subject: [Buildroot] [git commit] fs/tar: make --no-recursion effective
Message-ID: <20161228092134.1B8DA81DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d91ce1aa08016fa3fb186be9e6ef425dad6f050f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tar --no-recursion option is position sensitive. It only affects following
file listing options. Move --no-recursion before the -T option to make it
effective. This fixes duplication of entries in the generated rootfs.tar
archive.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index b14c977..0e3eacb 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -8,7 +8,7 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
-		tar $(TAR_OPTS) -cf $@ --null -T - --no-recursion --numeric-owner)
+		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
