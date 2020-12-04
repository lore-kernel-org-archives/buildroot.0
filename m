From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  4 Dec 2020 13:33:11 +0100
Subject: [Buildroot] [PATCH 1/2] core: add
 BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
Message-ID: <20201204123313.14455-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

If configured, the primary site typically points to a mirror on the intranet
of an organization. The purpose of BR2_PRIMARY_SITE_ONLY is then to only
download from this mirror.

However, the organization may also have some local Buildroot packages
that download from a version control repository (git, hg, ...). In this case,
the mirror will normally not contain the sources, instead they should be
cloned via the version control tool. So in this case, BR2_PRIMARY_SITE_ONLY
cannot be used.

This means that the organization must resort to other means to make sure no
external downloads are performed.

This patch attempts to solve this situation by adding
BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS. This string option can contain
additional domains from which download is allowed when BR2_PRIMARY_SITE_ONLY
is set.

The organization can thus set:
BR2_PRIMARY_SITE_ONLY=y
BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS="git.example.com hg.example.com"

to disallow any external downloads other than the primary site and the
mentioned version control domains.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in               | 12 ++++++++++++
 package/pkg-download.mk |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index e35a78fb71..c9206876ff 100644
--- a/Config.in
+++ b/Config.in
@@ -231,6 +231,18 @@ config BR2_PRIMARY_SITE_ONLY
 	  the project can be built even if the upstream tarball
 	  locations disappear.
 
+config BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
+	string "Additional domains to allow downloads from"
+	depends on BR2_PRIMARY_SITE_ONLY
+	help
+	  If BR2_PRIMARY_SITE_ONLY is enabled, version control downloads
+	  (git, hg, ...) on the 'internal' domain would also be
+	  disallowed.
+	  With this option, you can specify additional domains from
+	  which downloads will be allowed in BR2_PRIMARY_SITE_ONLY-mode.
+	  Domains should not include a protocol prefix, and multiple
+	  domains can be separated by spaces.
+
 if !BR2_PRIMARY_SITE_ONLY
 
 config BR2_BACKUP_SITE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 951d2fb554..d23838a329 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -78,7 +78,13 @@ DOWNLOAD_URIS += \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
-ifeq ($(BR2_PRIMARY_SITE_ONLY),)
+ifeq ($(BR2_PRIMARY_SITE_ONLY),y)
+# Conditionally add site download if it matches the configured extended domains
+DOWNLOAD_URIS += \
+	$(if $(filter $(call qstrip,$(BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS)),$(call domain,$(1))), \
+		$(patsubst %/,%,$(dir $(call qstrip,$(1)))))
+else
+# Unconditionally add site download
 DOWNLOAD_URIS += \
 	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
-- 
2.26.2
