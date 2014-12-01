From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:53:34 +0100
Subject: [Buildroot] [git commit] nfs-utils: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.BCAA18002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e28cb103ab6944d51547266ddb58997897988cc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also move back the NFS_UTILS_INSTALL_FIXUP hook registration right
after the hook definition.

[Peter: use install -D as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 8b56edf..91a1baf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -35,17 +35,20 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
-	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \
-		$(TARGET_DIR)/etc/init.d/S60nfs
 	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
+NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
+
+define NFS_UTILS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
+		$(TARGET_DIR)/etc/init.d/S60nfs
+endef
+
 define NFS_UTILS_REMOVE_NFSIOSTAT
 	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
 endef
 
-NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
-
 # nfsiostat is interpreted python, so remove it unless it's in the target
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
