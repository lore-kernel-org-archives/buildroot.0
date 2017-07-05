From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  5 Jul 2017 14:33:59 +0200
Subject: [Buildroot] [PATCH] download: allow for BR2_PRIMARY_SITE(_ONLY)
	environment override
Message-ID: <20170705123359.19116-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow BR2_PRIMARY_SITE and BR2_PRIMARY_SITE_ONLY .config options to be
overriden by environment variables with the same names.

This is usefull for CI build environments, so primary site can be
overridden without .config change. That way download can be speeded up
if using mirror servers in the same network as CI.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 Makefile                     | 6 ++++++
 docs/manual/common-usage.txt | 6 ++++++
 package/pkg-download.mk      | 8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/Makefile b/Makefile
index 19d8b442a3..d7a929fb41 100644
--- a/Makefile
+++ b/Makefile
@@ -208,6 +208,12 @@ endif
 ifneq ($(BR2_CCACHE_DIR),)
 BR_CACHE_DIR := $(BR2_CCACHE_DIR)
 endif
+ifneq ($(BR2_PRIMARY_SITE),)
+BR_PRIMARY_SITE := $(BR2_PRIMARY_SITE)
+endif
+ifneq ($(BR2_PRIMARY_SITE_ONLY),)
+BR_PRIMARY_SITE_ONLY := $(BR2_PRIMARY_SITE_ONLY)
+endif
 
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index a22da20188..e27e3ab2e7 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -90,6 +90,12 @@ to +make+ or set in the environment:
 * +BR2_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
+* +BR2_PRIMARY_SITE+ to override .config primary site to download
+  package sources from.
+  +
+* +BR2_PRIMARY_SITE_ONLY+ to override .config primary site only
+  download option.
+  +
   Note that the Buildroot download directory can also be set from the
   configuration interface, so through the Buildroot +.config+ file. See
   xref:download-location[] for more details on how you can set the download
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fbbc2d7391..e271371ceb 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -217,6 +217,14 @@ endef
 # sites serve just plain files.
 ################################################################################
 
+# Restore the BR2_PRIMARY_SITE(_ONLY) that were overridden by the .config file
+ifneq ($(origin BR_PRIMARY_SITE),undefined)
+BR2_PRIMARY_SITE = $(BR_PRIMARY_SITE)
+endif
+ifneq ($(origin BR_PRIMARY_SITE_ONLY),undefined)
+BR2_PRIMARY_SITE_ONLY = $(BR_PRIMARY_SITE_ONLY)
+endif
+
 define DOWNLOAD
 	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
 endef
-- 
2.13.2
