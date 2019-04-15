From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:18:25 +0200
Subject: [Buildroot] [git commit] infra/pkg-download: return just a list of
 URIs
Message-ID: <20190415214606.45BE98B8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=813b94e6be3978cbe0097ec41fccdc33b1b6cd52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the internal DOWNLOAD_URIS variable is set to be a list of
options to pass to the download wrapper, with each URI passed as
'-u URI'.

This precludes using that variable to get just the list of URIs, in
case we need to do something else with it.

Fix the variable to really only contain the list of URIs.

Adapt the caller accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7cd87c38ff..4163333998 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -75,17 +75,17 @@ export BR_NO_CHECK_HASH_FOR =
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
-	-u $(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
-	-u $(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
+	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
 ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 DOWNLOAD_URIS += \
-	-u $(patsubst %/,%,$(dir $(call qstrip,$(1))))
+	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
-	-u $(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
-	-u $(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
+	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
 endif
 endif
 
@@ -101,7 +101,7 @@ define DOWNLOAD
 		-N '$($(PKG)_RAWNAME)' \
 		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		$(DOWNLOAD_URIS) \
+		$(foreach uri,$(DOWNLOAD_URIS),-u $(uri)) \
 		$(QUIET) \
 		-- \
 		$($(PKG)_DL_OPTS)
