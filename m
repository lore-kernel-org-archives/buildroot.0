From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 May 2019 22:37:44 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: fix unnecessary files
 removal
Message-ID: <20190505203401.9B56C8036B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a64c3a847da62e56ddc5c212f0910f207f3563c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removal of unnecessary files is currently broken by the fact that
the rm command is executed from the buildroot directory and not the
target directory.

This patch fixes the problem changing to target directory before
removing files.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 9fa7ae200b..4bb62de1ce 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -57,7 +57,7 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
-	rm -f $(NFS_UTILS_TARGETS_)
+	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
 	$(INSTALL) -D -m 644 \
 		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
