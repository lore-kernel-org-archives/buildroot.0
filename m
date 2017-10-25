From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:58 +0200
Subject: [Buildroot] [PATCH v2 08/13] pkg-download: support new subdir for
	mirrors
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-9-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Since we introduced subdirectory to the DL_DIR, we need to support them
in the PRIMARY and BACKUP mirror as they evolve to the new tree
structure.

We check first the new URI (with the subdir), and in case of failure, we
go check without.
By checking both URIs, we ensure that old mirror are usable.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/a7d5ad4a34322e7f77849e2d5ef38ebc23e42149.patch
  - use urlencode
---
 package/pkg-download.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b94a828579..b76d0ec289 100644
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
2.14.2
