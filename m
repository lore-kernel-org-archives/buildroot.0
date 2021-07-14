From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Jul 2021 17:17:02 -0600
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: enable optional uuid
 support
Message-ID: <20210714231702.850078-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable when libuuid and libblkid are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nfs-utils/nfs-utils.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index c384e939d8..9042094a29 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -19,7 +19,6 @@ NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv4 \
 	--disable-nfsv41 \
 	--disable-gss \
-	--disable-uuid \
 	--enable-tirpc \
 	--enable-ipv6 \
 	--without-tcp-wrappers \
@@ -53,6 +52,13 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
+NFS_UTILS_CONF_OPTS += --enable-uuid
+NFS_UTILS_DEPENDENCIES += util-linux
+else
+NFS_UTILS_CONF_OPTS += --disable-uuid
+endif
+
 define NFS_UTILS_INSTALL_FIXUP
 	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
-- 
2.25.1
