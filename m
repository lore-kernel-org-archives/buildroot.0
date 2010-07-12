From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:49 +0200
Subject: [Buildroot] [PATCH 2/5] packages: allow different download
	protocols, with auto detection
In-Reply-To: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1278970252-23007-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Map the DOWNLOAD macro to a different specialized macro based on the URL.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Makefile.package.in |   46 +++++++++++++++++++++++++++++++-----------
 1 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 8243ed5..a212a38 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -69,30 +69,39 @@ TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 ################################################################################
-# DOWNLOAD -- Download helper. Will try to download source from:
-# 1) BR2_PRIMARY_SITE if enabled
-# 2) Download site
-# 3) BR2_BACKUP_SITE if enabled
-#
+# Download helpers.
+# Different download protocols are supported, and each has a helper function
+# named DOWNLAOD_$(PROTOCOL_NAME) taking three arguments:
 # Argument 1 is the source location
 # Argument 2 is the source filename
 # Argument 3 is the uppercase package name
 #
 # E.G. use like this:
-# $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
+# $(call DOWNLOAD_WGET,$(FOO_SITE),$(FOO_SOURCE),FOO)
 ################################################################################
 
+# $(call DOWNLOAD_WGET,$(PKG_SITE),$(PKG_SOURCE),irrelevant)
+# Will try to download source from:
+# 1) BR2_PRIMARY_SITE if enabled
+# 2) Download site specified in $(PKG)_SITE
+# 3) BR2_BACKUP_SITE if enabled
+
 # support make source-check/external-deps
 ifneq ($(SPIDER),)
-DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
+DOWNLOAD_WGET=$(WGET) -P $(DL_DIR) $(1)/$(2)
 else
-define DOWNLOAD
+define DOWNLOAD_WGET
 	$(Q)test -e $(DL_DIR)/$(2) || \
 	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
 	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
-endef
+endef # DOWNLOAD_WGET
 endif
 
+# Use wget for ftp://, http:// and https://.
+DOWNLOAD_FTP=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
+DOWNLOAD_HTTP=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
+DOWNLOAD_HTTPS=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
+
 # Utility programs used to build packages
 TAR ?= tar
 
@@ -123,10 +132,10 @@ ifeq ($(SPIDER),)
 # Only show the download message if it isn't already downloaded
 	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
-		$(call MESSAGE,"Downloading")
+		$(call MESSAGE,"Downloading via $($(PKG)_DOWNLOAD_PROTOCOL)")
 endif
-	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE),$(PKG))
-	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+	$(call $($(PKG)_DOWNLOAD),$($(PKG)_SITE),$($(PKG)_SOURCE),$(PKG))
+	$(if $($(PKG)_PATCH),$(call $($(PKG)_DOWNLOAD),$($(PKG)_SITE),$($(PKG)_PATCH)))
 ifeq ($(SPIDER),)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
@@ -280,6 +289,19 @@ ifndef $(2)_SITE
  endif
 endif
 
+ifndef $(2)_DOWNLOAD_PROTOCOL
+ ifdef $(3)_DOWNLOAD_PROTOCOL
+  # use user-provided protocol
+  $(2)_DOWNLOAD_PROTOCOL := $($(3)_DOWNLOAD_PROTOCOL)
+ else
+  # Try automatic detection: use the protocol part of the URL to decide
+  # which download utility to use.
+  $(2)_DOWNLOAD_PROTOCOL	:= \
+   $(call UPPERCASE,$(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE)))))
+ endif
+endif
+
+$(2)_DOWNLOAD			?= DOWNLOAD_$$($(2)_DOWNLOAD_PROTOCOL)
 $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_TARGET		?= YES
-- 
1.7.0.4
