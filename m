From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:24:30 +0200
Subject: [Buildroot] [git commit] nfs-utils: add host package
Message-ID: <20180527213342.737F78284A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0b92460c117f13bcfa910ea541200cf8433086b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only need the host package for the rpcgen utility. glibc deprecated
this utility in version 2.26. Fedora has recently removed rpcgen from
its glibc package. So we need to build the rpcgen from the nfs-utils
package.

The removal of Sun RPC from glibc also removed RPC headers from glibc.
rpcgen needs two of these headers. Add host-libtirpc to provide the RPC
headers.

Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 26112d69f2..9fa7ae200b 100644
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
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
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
