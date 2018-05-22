From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 13:30:13 +0300
Subject: [Buildroot] [PATCH v2 2/6] nfs-utils: add host package
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <134051d83451aeb788e09c3e4e540806a198fe48.1526985017.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only need the host package for the rpcgen utility. glibc deprecated
this utility in version 2.26. Fedora has recently removed rpcgen from
its glibc package. So we need to build the rpcgen from the nfs-utils
package.

The removal of Sun RPC from glibc also removed RPC headers from glibc.
rpcgen needs two of these headers. Add host-libtirpc to provide the RPC
headers.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: add host-libtirpc dependency (Thomas P)
---
 package/nfs-utils/nfs-utils.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 26112d69f230..c9e79866e42c 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -24,6 +24,20 @@ NFS_UTILS_CONF_OPTS = \
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
+HOST_NFS_UTILS_DEPENDENCIES = host-libtirpc
+
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
@@ -89,4 +103,13 @@ endef
 # nfsiostat is interpreted python, so remove it unless it's in the target
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
+define HOST_NFS_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/tools/rpcgen
+endef
+
+define HOST_NFS_UTILS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/rpcgen/rpcgen $(HOST_DIR)/bin/rpcgen
+endef
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.0
