From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 11 Sep 2019 17:33:44 -0300
Subject: [Buildroot] [PATCH v5] package/nfs-utils: enable IPv6
Message-ID: <20190911203344.7839-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC unconditionally.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: nathan.renniewaldock at gmail.com
CC: Peter Seiderer <ps.report@gmx.net>
CC: Arnout Vandecappelle <arnout@mind.be>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
--
Changes v1->v2
- Select LIBTIRPC unconditionally.
Changes v2->v3
- Do not select libtirpc inconditionally
Changes v3->v4
- Restore v1 commit message
- Add comment about selecting libtirpc to Config.in
Changes v4->v5
- Select LIBTIRPC unconditionally, again (back to v2)

I want the bike shed green.
---
 package/nfs-utils/Config.in    |  2 +-
 package/nfs-utils/nfs-utils.mk | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

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
index dc20942f71..9d3e5e7563 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -10,7 +10,7 @@ NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VE
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_AUTORECONF = YES
-NFS_UTILS_DEPENDENCIES = host-pkgconf
+NFS_UTILS_DEPENDENCIES = host-pkgconf libtirpc
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
@@ -19,7 +19,8 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv41 \
 	--disable-gss \
 	--disable-uuid \
-	--disable-ipv6 \
+	--enable-tirpc \
+	--enable-ipv6 \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
@@ -51,13 +52,6 @@ else
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
