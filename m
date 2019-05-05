From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 May 2019 22:41:11 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: making nfs server
 optional
Message-ID: <20190505203920.2909581D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01b656323e758b80cdfbab96b7602d4515a2b8ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes nfs server component optional. This is useful when
only client tools are needed instead of the full nfs server.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nfs-utils/Config.in    |  6 ++++++
 package/nfs-utils/nfs-utils.mk | 13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 055b711f0d..04ea4db3ed 100644
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
index 4bb62de1ce..b81891a912 100644
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
 
