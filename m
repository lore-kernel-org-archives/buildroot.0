From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 28 Mar 2019 14:53:09 +0100
Subject: [Buildroot] [PATCH v2] package/nfs-utils: making nfs server optional
Message-ID: <1553781189-15924-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes nfs server component optional. This is useful when
only client tools are used and not the nfs server.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2: Fixing minor formatting nitpick.

 package/nfs-utils/Config.in    | 6 ++++++
 package/nfs-utils/nfs-utils.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 055b711..50c47aa 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -30,4 +30,10 @@ config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	help
 	  NFS remote quota server
 
+config BR2_PACKAGE_NFS_UTILS_SERVER
+        bool "server daemon"
+        default y
+        help
+          Install the NFS server daemon
+
 endif
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 9fa7ae2..ec39588 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -71,6 +71,7 @@ else
 NFS_UTILS_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_NFS_UTILS_SERVER),y)
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
@@ -95,6 +96,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
 endef
+endif
 
 define NFS_UTILS_REMOVE_NFSIOSTAT
 	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
-- 
2.7.4
