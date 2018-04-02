From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 16:57:57 +0200
Subject: [Buildroot] [PATCH 3/8] pkg-download: support new subdir for mirrors
In-Reply-To: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402145802.17611-3-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we introduced subdirectory to the DL_DIR, we need to support them
in the PRIMARY and BACKUP mirror as they evolve to the new tree
structure.

We check first the new URI (with the subdir), and in case of failure, we
go check without.
By checking both URIs, we ensure that old mirror are usable.

Also, add a missing qstrip call for BR2_BACKUP_SITE.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v4 -> v5:
   - Use new DL_SUBDIR
   - Add missing qstrip
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 3f35661a16..7ca6fcc757 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -75,6 +75,7 @@ export BR_NO_CHECK_HASH_FOR =
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
 	-u $(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
@@ -83,7 +84,8 @@ DOWNLOAD_URIS += \
 	-u $($(PKG)_SITE_METHOD)+$(dir $(call qstrip,$(1)))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
-	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
+	-u $(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	-u $(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
 endif
 endif
 
-- 
2.16.2
