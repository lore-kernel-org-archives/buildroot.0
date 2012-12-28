From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:20 -0300
Subject: [Buildroot] [PATCH 4/7] ntfs-3g: needs libgcrypt
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've moved to gnutls 3.x which no longer uses libgcrypt we
need to pull it in as a dependency for ntfs-3g encrypted volume support
to avoid build breakage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/Config.in  |    1 +
 package/ntfs-3g/ntfs-3g.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 5301038..1d3e2fb 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_NTFS_3G
 config BR2_PACKAGE_NTFS_3G_ENCRYPTED
 	bool "encrypted volumes"
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  Enable support for NTFS encrypted volumes.
 
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index d2e6861..cefb73a 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -23,7 +23,7 @@ endif
 ifeq ($(BR2_PACKAGE_NTFS_3G_ENCRYPTED),y)
 	NTFS_3G_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 	NTFS_3G_CONF_OPT += --enable-crypto
-	NTFS_3G_DEPENDENCIES += gnutls
+	NTFS_3G_DEPENDENCIES += gnutls libgcrypt
 endif
 
 ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
-- 
1.7.8.6
