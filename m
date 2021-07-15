From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Jul 2021 21:13:16 -0600
Subject: [Buildroot] [PATCH v2 3/3] package/nfs-utils: Add optional GSS
 support
In-Reply-To: <20210715031316.3325515-1-james.hilliard1@gmail.com>
References: <20210715031316.3325515-1-james.hilliard1@gmail.com>
Message-ID: <20210715031316.3325515-3-james.hilliard1@gmail.com>
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
index b736f6c973..d699c9f96f 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -24,6 +24,13 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
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
index 2598f0908b..86013b41be 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -16,7 +16,6 @@ NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
-	--disable-gss \
 	--disable-uuid \
 	--enable-tirpc \
 	--enable-ipv6 \
@@ -58,6 +57,16 @@ else
 NFS_UTILS_CONF_OPTS += --disable-caps
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
 define NFS_UTILS_INSTALL_FIXUP
 	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)
 	touch $(TARGET_DIR)/etc/exports
-- 
2.25.1
