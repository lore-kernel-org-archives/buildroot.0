From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 18:34:13 +0100
Subject: [Buildroot] [PATCH 05/21] nfs-utils: add support to use RPC support
	from libtirpc
In-Reply-To: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1de3d656cb1433f2babb78062e16a4f83fb11715.1352050008.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/Config.in    |    7 +++----
 package/nfs-utils/nfs-utils.mk |    8 +++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index c87502f..fa35f35 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_PORTMAP
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
@@ -10,8 +9,8 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE
+comment "nfs-utils requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 41a0e05..e59619f 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -16,7 +16,6 @@ NFS_UTILS_CONF_OPT = \
 		--disable-nfsv4 \
 		--disable-nfsv41 \
 		--disable-gss \
-		--disable-tirpc \
 		--disable-uuid \
 		--disable-ipv6 \
 		--without-tcp-wrappers \
@@ -26,6 +25,13 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+NFS_UTILS_CONF_OPT += --enable-tirpc --with-tirpcinclude=$(STAGING_DIR)/usr/include/tirpc/
+NFS_UTILS_DEPENDENCIES += libtirpc
+else
+NFS_UTILS_CONF_OPT += --disable-tirpc
+endif
+
 define NFS_UTILS_INSTALL_FIXUP
 	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
-- 
1.7.9.5
