From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 18:00:50 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nfs-utils: always
 use libtirpc and enable IPv6
Message-ID: <20190925155624.5DF958F3D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9400e938cf442c79342b0b180fa9317af07038a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

nfs-utils selects rpcbind, and rpcbind unconditionally selects
libtirpc. Therefore, nfs-utils will never be used with the C library
RPC implementation: libtirpc will always be used. Consequently, all
the conditional logic to use libtirpc only if available is useless,
and we can use libtirpc unconditionally.

As an added bonus, this means that we can enable IPv6, because
libtirpc provides an IPv6-compatible RPC implementation.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 749334cb36ea5c0a0fd745dada43122f88a3144c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/Config.in    |  2 +-
 package/nfs-utils/nfs-utils.mk | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 055b711f0d..4b0eb1510a 100644
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
index 4bb62de1ce..9ae02c0036 100644
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
@@ -49,13 +50,6 @@ else
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
