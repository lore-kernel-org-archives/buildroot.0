From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:22:07 +0200
Subject: [Buildroot] [PATCH 09/13] pkg-download: support new subdir for
	mirrors
In-Reply-To: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704162211.13238-10-maxime.hadjinlian@gmail.com>
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

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9a455dc79b..47671e21a7 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -75,6 +75,7 @@ export BR_NO_CHECK_HASH_FOR =
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))/$(notdir $($(PKG)_DL_DIR)) \
 	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))
 endif
 
@@ -83,6 +84,7 @@ DOWNLOAD_URIS += \
 	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))/$(notdir $($(PKG)_DL_DIR)) \
 	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))
 endif
 endif
-- 
2.13.2
