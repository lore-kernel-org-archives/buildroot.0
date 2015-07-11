From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 11 Jul 2015 16:48:20 +0200
Subject: [Buildroot] [PATCH 2/3] nfs_utils: Fix for read-only rootfs
In-Reply-To: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436626101-3598-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to work on a read-only rootfs, nfs_utils would like to write
stuff to /var/lib/nfs, since it's not a tmpfs, it won't work.

Instead of doing little dances around the filesystem, tell nfs_utils to
use /run/nfs for everyone.

Modify the startup script accordingly.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/nfs-utils/S60nfs       | 14 ++------------
 package/nfs-utils/nfs-utils.mk |  3 ++-
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 4afee55..91410ee 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -8,19 +8,9 @@
 [ -x /usr/sbin/rpc.mountd ] || exit 0
 [ -x /usr/sbin/exportfs ] || exit 0
 
-# Don't fail if /etc/exports doesn't exist; create a bare-bones version and continue.
-[ -r /etc/exports ] || \
-    { touch /etc/exports && chmod u+rw,g+r,o+r /etc/exports ; } || \
-    { echo "/etc/exports does not exist" ; exit 0 ; }
-    
-# The /var/lib/nfs directory is actually on a tmpfs filesystem.
-mkdir -p /var/lib/nfs/sm
-mkdir -p /var/lib/nfs/sm.bak
 mkdir -p /var/lock/subsys
-touch /var/lib/nfs/etab
-touch /var/lib/nfs/rmtab
-touch /var/lib/nfs/state
-touch /var/lib/nfs/xtab
+mkdir -p /run/nfs/sm
+touch /run/nfs/rmtab
 
 start() {
 	# Start daemons.
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index cec21e8..115a133 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -21,6 +21,7 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-uuid \
 	--disable-ipv6 \
 	--without-tcp-wrappers \
+	--with-statedir=/run/nfs \
 	--with-rpcgen=internal
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
@@ -36,8 +37,8 @@ endif
 
 define NFS_UTILS_INSTALL_FIXUP
 	rm -f $(NFS_UTILS_TARGETS_)
+	touch $(TARGET_DIR)/etc/exports
 endef
-
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
 define NFS_UTILS_INSTALL_INIT_SYSV
-- 
2.1.4
