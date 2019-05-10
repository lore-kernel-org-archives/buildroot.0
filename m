From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:56:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nfs-utils: fix
 unnecessary files removal
Message-ID: <20190510095143.609AF8889F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=284cf7d39f580bc2e50cffec34a5ff1c69e9365d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The removal of unnecessary files is currently broken by the fact that
the rm command is executed from the buildroot directory and not the
target directory.

This patch fixes the problem changing to target directory before
removing files.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a64c3a847da62e56ddc5c212f0910f207f3563c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
