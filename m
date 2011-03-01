From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Mar 2011 09:34:24 -0500
Subject: [Buildroot] [PATCH] nfs-utils: Add a Config option to enable NFSv4
	support
In-Reply-To: <1298990065-648-2-git-send-email-mort@bork.org>
References: <1298990065-648-1-git-send-email-mort@bork.org>
	<1298990065-648-2-git-send-email-mort@bork.org>
Message-ID: <1298990065-648-3-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I moved the Kconfig 'comment' block for nfs-utils to the end of the
file so indentation would work properly for the items dependent on
BR2_PACKAGE_NFS_UTILS

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/nfs-utils/Config.in    |   17 ++++++++++++++---
 package/nfs-utils/nfs-utils.mk |    7 ++++++-
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 774395b..753bdf5 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,9 +9,6 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
-	depends on !BR2_INET_RPC || !BR2_LARGEFILE
-
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
 
@@ -34,3 +31,17 @@ config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	  NFS remote quota server
 
 endmenu
+
+config BR2_PACKAGE_NFS_UTILS_NFS4
+	bool "NFSv4 support"
+	depends on BR2_PACKAGE_NFS_UTILS
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBNFSIDMAP
+	help
+	  Support for NFSv4.  Don't forget to enable the kernel facility
+	  also.
+
+
+comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
+	depends on !BR2_INET_RPC || !BR2_LARGEFILE
+
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 382676c..e82c2b0 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -10,13 +10,18 @@ NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPT = \
-		--disable-nfsv4 \
 		--disable-gss \
 		--disable-tirpc \
 		--disable-uuid \
 		--without-tcp-wrappers \
 		--with-rpcgen=internal
 
+ifneq ($(BR2_PACKAGE_NFS_UTILS_NFS4),y)
+  NFS_UTILS_CONF_OPT += --disable-nfsv4
+else
+  NFS_UTILS_DEPENDENCIES = libevent libnfsidmap
+endif
+
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
-- 
1.5.6.5
