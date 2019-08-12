From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 12 Aug 2019 14:37:12 -0300
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6
Message-ID: <20190812173712.23202-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC inconditionally.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: nathan.renniewaldock at gmail.com
CC: Peter Seiderer <ps.report@gmx.net>
---
 package/nfs-utils/Config.in    |  2 +-
 package/nfs-utils/nfs-utils.mk | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 04ea4db3ed..cfca034019 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_RPCBIND # runtime
 	help
 	  The NFS Linux kernel server.
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index dc20942f71..5e2525cdbf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -10,7 +10,7 @@ NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VE
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_AUTORECONF = YES
-NFS_UTILS_DEPENDENCIES = host-pkgconf
+NFS_UTILS_DEPENDENCIES = host-pkgconf libtirpc
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
@@ -19,7 +19,7 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv41 \
 	--disable-gss \
 	--disable-uuid \
-	--disable-ipv6 \
+	--enable-tirpc \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
@@ -51,13 +51,6 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-NFS_UTILS_CONF_OPTS += --enable-tirpc
-NFS_UTILS_DEPENDENCIES += libtirpc
-else
-NFS_UTILS_CONF_OPTS += --disable-tirpc
-endif
-
 define NFS_UTILS_INSTALL_FIXUP
 	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
-- 
2.18.1
