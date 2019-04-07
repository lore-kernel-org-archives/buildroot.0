From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:17 +0200
Subject: [Buildroot] [PATCH 02/10] infra/pkg-download: make the URI list a
 callable macro
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <63416c278b970c4be6abe15af836fa39d9de91f9.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, that variable is context-dependent, as it expects the PKG
variable to exist and be defined to the current package.

This is not so clean, so change the variable to a callable macro.

Adapt the caller accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f9411213b6..611df5f982 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -71,11 +71,17 @@ export BR_NO_CHECK_HASH_FOR =
 #
 # Argument 1 is the source location
 #
+#
+# DOWNLOAD_URIS - List the candidates URIs where to get the package from:
+#
+# Argument 1 is the source location
+# Argument 2 is the upper-case package name
+#
 ################################################################################
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
-	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
@@ -84,7 +90,7 @@ DOWNLOAD_URIS += \
 	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
-	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
 endif
 endif
@@ -101,7 +107,7 @@ define DOWNLOAD
 		-N '$($(PKG)_RAWNAME)' \
 		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		$(patsubst %,-u %,$(DOWNLOAD_URIS)) \
+		$(patsubst %,-u %,$(call DOWNLOAD_URIS,$(1),$(PKG))) \
 		$(QUIET) \
 		-- \
 		$($(PKG)_DL_OPTS)
-- 
2.14.1
