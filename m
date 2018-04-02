From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 15:33:53 +0200
Subject: [Buildroot] [PATCH] core/pkg-download: fixes autobuilder fallout
Message-ID: <20180402133353.24586-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some arguments can be empty, so we need to add simple quote around them
But since they are simple quote; double quote inside them are now not
interpreted by the shell and as such must be removed; hence the use of
qstrip.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2847a99d2f..2d5f26bfc5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -75,12 +75,12 @@ export BR_NO_CHECK_HASH_FOR =
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
-	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
+	-u $(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
 ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 DOWNLOAD_URIS += \
-	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
+	-u $($(PKG)_SITE_METHOD)+$(dir $(call qstrip,$(1)))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
 	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
@@ -88,14 +88,15 @@ endif
 endif
 
 define DOWNLOAD
-	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1))) \
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),
+		BR_NO_CHECK_HASH_FOR=$(notdir $(call qstrip,$(1)))) \
 	$(EXTRA_ENV) $(DL_WRAPPER) \
-		-c $($(PKG)_DL_VERSION) \
-		-f $(notdir $(1)) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		-n $($(PKG)_BASENAME_RAW) \
-		-N $($(PKG)_RAWNAME) \
-		-o $(DL_DIR)/$(notdir $(1)) \
+		-c '$($(PKG)_DL_VERSION)' \
+		-f '$(notdir $(1))' \
+		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
+		-n '$($(PKG)_BASENAME_RAW)' \
+		-N '$($(PKG)_RAWNAME)' \
+		-o '$(DL_DIR)/$(notdir $(1))' \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(DOWNLOAD_URIS) \
 		$(QUIET) \
-- 
2.16.2
