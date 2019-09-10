From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 10 Sep 2019 07:59:10 -0300
Subject: [Buildroot] [PATCH v4] package/nfs-utils: enable IPv6 if libtirpc
 is selected
Message-ID: <20190910105910.32098-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

IPv6 support requires libtirpc, so enable it if libtirpc is selected.

In practice this always enables IPv6, since nfs-utils needs rpcbind,
which in its turn selects libtirpc.

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

So we're back to v1 with a lot of discussion in between. I want the bike
shed purple.
---
 package/nfs-utils/Config.in    | 3 +++
 package/nfs-utils/nfs-utils.mk | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 04ea4db3ed..966fe1406a 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -6,11 +6,14 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
+	# Just in case, since rpcbind already selects libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_RPCBIND # runtime
 	help
 	  The NFS Linux kernel server.
 
+	  For IPv6 support, ensure that libtirpc is selected too.
+
 	  http://linux-nfs.org/
 
 if BR2_PACKAGE_NFS_UTILS
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index dc20942f71..3d5f5412cf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -19,7 +19,6 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv41 \
 	--disable-gss \
 	--disable-uuid \
-	--disable-ipv6 \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
@@ -51,11 +50,12 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
+# IPv6 requires libtirpc
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-NFS_UTILS_CONF_OPTS += --enable-tirpc
+NFS_UTILS_CONF_OPTS += --enable-tirpc --enable-ipv6
 NFS_UTILS_DEPENDENCIES += libtirpc
 else
-NFS_UTILS_CONF_OPTS += --disable-tirpc
+NFS_UTILS_CONF_OPTS += --disable-tirpc --disable-ipv6
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
-- 
2.18.1
