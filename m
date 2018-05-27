From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:46:29 +0200
Subject: [Buildroot] [git commit] fs: ensure hard links in TARGET_DIR are
 correctly copied for filesystem input
Message-ID: <20180527214612.ED016819D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=065e7672e1e933f8b5257eddc9d1d8b7021a1687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #11046

Commit bb2a57a17a7 (fs: run packages' filesystem hooks in a copy of target/)
changed the file system logic to run file system hooks from packages on a
copy of TARGET_DIR, and finally use this copy as input for the file system
generation.

This copy was done with rsync, which by default does not preserve hard
links, leading to an expansion of the file system images when hard links are
present.

Fix it by passing the -H option to rsync (preserve hard links).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 9baf367729..abf35418cb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -71,7 +71,7 @@ $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	@$(call MESSAGE,"Generating common rootfs tarball")
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
-	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)
+	rsync -auH $(BASE_TARGET_DIR)/ $(TARGET_DIR)
 	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
 	echo "set -e" >> $(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
