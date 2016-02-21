From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:43 +0100
Subject: [Buildroot] [PATCH 5/7] package/nfs-utils: add optional support for
	libcap
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066125-28379-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, nfs-utils will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/sm-notify | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libtirpc.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nfs-utils/nfs-utils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 6dd175c..179009d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -28,6 +28,13 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+NFS_UTILS_CONF_OPTS += --enable-caps
+NFS_UTILS_DEPENDENCIES += libcap
+else
+NFS_UTILS_CONF_OPTS += --disable-caps
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 NFS_UTILS_CONF_OPTS += --enable-tirpc
 NFS_UTILS_DEPENDENCIES += libtirpc
-- 
2.7.0
