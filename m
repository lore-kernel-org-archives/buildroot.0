From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 May 2018 14:31:56 +0300
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
Message-ID: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only need the host package for the rpcgen utility. glibc deprecated
this utility in version 2.26. Fedora has recently removed rpcgen from
its glibc package. So we need to build the rpcgen from the nfs-utils
package.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nfs-utils/nfs-utils.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 26112d69f230..8100706c1505 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -24,6 +24,19 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
 
+HOST_NFS_UTILS_CONF_OPTS = \
+	--disable-nfsv4 \
+	--disable-nfsv41 \
+	--disable-gss \
+	--disable-uuid \
+	--disable-ipv6 \
+	--without-tcp-wrappers \
+	--with-statedir=/run/nfs \
+	--disable-caps \
+	--disable-tirpc \
+	--without-systemd \
+	--with-rpcgen=internal
+
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
@@ -89,4 +102,9 @@ endef
 # nfsiostat is interpreted python, so remove it unless it's in the target
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
+define HOST_NFS_UTILS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/rpcgen/rpcgen $(HOST_DIR)/bin/rpcgen
+endef
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.0
