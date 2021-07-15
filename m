From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 22:42:41 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: enable optional uuid
 support
Message-ID: <20210715200907.0463590FB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=5acba5e41475f7b40c674a45593b1290d990237c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable when libuuid and libblkid are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/nfs-utils.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index d6408ee8f7..80e6ad0ddc 100644
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
