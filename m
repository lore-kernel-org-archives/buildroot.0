From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 10:14:29 +0200
Subject: [Buildroot] [v4 08/13] pkg-download: support new subdir for mirrors
In-Reply-To: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402081434.4411-8-maxime.hadjinlian@gmail.com>
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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e88d3f9fda..54edbae29a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -75,6 +75,7 @@ export BR_NO_CHECK_HASH_FOR =
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE)/$(notdir $($(PKG)_DL_DIR)),urlencode) \
 	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
 endif
 
@@ -83,6 +84,7 @@ DOWNLOAD_URIS += \
 	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE)/$(notdir $($(PKG)_DL_DIR)),urlencode) \
 	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
 endif
 endif
-- 
2.16.2
