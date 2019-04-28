From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 28 Apr 2019 11:02:55 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/nfs-utils: making nfs server
 optional
In-Reply-To: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
References: <1556442175-1494-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1556442175-1494-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes nfs server component optional. This is useful when
only client tools are needed instead of the full nfs server.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2: Fixing minor formatting nitpick.
v2->v3: Fixing systemd stuff as suggested by Thomas
v3->v4: Added conditional define for nfs unit file as requested by Arnout

 package/nfs-utils/Config.in    |  6 ++++++
 package/nfs-utils/nfs-utils.mk | 13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 055b711..04ea4db 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -25,6 +25,12 @@ config BR2_PACKAGE_NFS_UTILS_RPC_LOCKD
 	help
 	  NFS lock manager for Linux kernels older than 2.4
 
+config BR2_PACKAGE_NFS_UTILS_RPC_NFSD
+	bool "rpc.nfsd"
+	default y
+	help
+	  NFS server
+
 config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	bool "rpc.rquotad"
 	help
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4bb62de..b81891a 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -41,6 +41,8 @@ HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
+NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
+	usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NFS_UTILS_CONF_OPTS += --enable-caps
@@ -71,16 +73,23 @@ else
 NFS_UTILS_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
 endef
 
+define NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD
+	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
+endef
+endif
+
 define NFS_UTILS_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
+	$(NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD)
+
 	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
 
-- 
2.7.4
