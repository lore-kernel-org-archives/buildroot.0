From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 18 Jul 2021 14:44:06 -0600
Subject: [Buildroot] [PATCH v4 2/2] package/nfs-utils: Add optional GSS
 support
In-Reply-To: <20210718204406.899038-1-james.hilliard1@gmail.com>
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
Message-ID: <20210718204406.899038-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nfs-utils/Config.in    |  7 +++++++
 package/nfs-utils/nfs-utils.mk | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index bd1e091331..f2997b9c91 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -26,6 +26,13 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	help
 	  Enable NFSv4/NFSv4.1 support
 
+config BR2_PACKAGE_NFS_UTILS_GSS
+	bool "gss"
+	depends on BR2_PACKAGE_NFS_UTILS_NFSV4
+	select BR2_PACKAGE_LIBTIRPC_GSS
+	help
+	  Enable GSS support
+
 config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
 	bool "rpcdebug"
 	help
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 0b4bca4772..763dd57ace 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -16,7 +16,6 @@ NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
-	--disable-gss \
 	--enable-tirpc \
 	--enable-ipv6 \
 	--without-tcp-wrappers \
@@ -52,6 +51,16 @@ else
 NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
 endif
 
+ifeq ($(BR2_PACKAGE_NFS_UTILS_GSS),y)
+NFS_UTILS_CONF_OPTS += \
+	--enable-gss \
+	--enable-svcgss \
+	--with-krb5=$(STAGING_DIR)/usr
+NFS_UTILS_DEPENDENCIES += libkrb5
+else
+NFS_UTILS_CONF_OPTS += --disable-gss --disable-svcgss
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NFS_UTILS_CONF_OPTS += --enable-caps
 NFS_UTILS_DEPENDENCIES += libcap
-- 
2.25.1
