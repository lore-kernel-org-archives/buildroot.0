From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:48 +0100
Subject: [Buildroot] [PATCH 16/51] nfs-utils: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also move back the NFS_UTILS_INSTALL_FIXUP hook registration right
after the hook definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/nfs-utils.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 522e790..aef051c 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -35,17 +35,20 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
+	rm -f $(NFS_UTILS_TARGETS_)
+endef
+
+NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
+
+define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
-	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
 define NFS_UTILS_REMOVE_NFSIOSTAT
 	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
 endef
 
-NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
-
 # nfsiostat is interpreted python, so remove it unless it's in the target
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
-- 
2.1.0
