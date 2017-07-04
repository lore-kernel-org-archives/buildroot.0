From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:21:59 +0200
Subject: [Buildroot] [PATCH 01/13] pkg-{download,
	generic}: remove source-check
In-Reply-To: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704162211.13238-2-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This feature is not used by anyone in the core developpers and makes a
drastic simplification of the pkg-download infrastructure harder.

The future patch will move much of what's in the current pkg-download.mk
file into the dl-wrapper which is a shell script.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 44 --------------------------------------------
 package/pkg-generic.mk  |  4 ----
 2 files changed, 48 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fbbc2d7391..3712b9ccc6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -68,9 +68,6 @@ export BR_NO_CHECK_HASH_FOR =
 # ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_* helpers are in charge of simply checking that the source
-# is available for download. This can be used to make sure one will be able
-# to get all the sources needed for one's build configuration.
 ################################################################################
 
 define DOWNLOAD_GIT
@@ -86,12 +83,6 @@ define DOWNLOAD_GIT
 		$($(PKG)_DL_OPTS)
 endef
 
-# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
-# repository
-define SOURCE_CHECK_GIT
-	$(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
-endef
-
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -103,10 +94,6 @@ define DOWNLOAD_BZR
 		$($(PKG)_DL_OPTS)
 endef
 
-define SOURCE_CHECK_BZR
-	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
-endef
-
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -119,11 +106,6 @@ define DOWNLOAD_CVS
 		$($(PKG)_DL_OPTS)
 endef
 
-# Not all CVS servers support ls/rls, use login to see if we can connect
-define SOURCE_CHECK_CVS
-	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
-endef
-
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -135,10 +117,6 @@ define DOWNLOAD_SVN
 		$($(PKG)_DL_OPTS)
 endef
 
-define SOURCE_CHECK_SVN
-	$(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
-endef
-
 # SCP URIs should be of the form scp://[user@]host:filepath
 # Note that filepath is relative to the user's home directory, so you may want
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
@@ -152,10 +130,6 @@ define DOWNLOAD_SCP
 		$($(PKG)_DL_OPTS)
 endef
 
-define SOURCE_CHECK_SCP
-	$(SSH) $(call domain,$(1),:) ls '$(call notdomain,$(1),:)' > /dev/null
-endef
-
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -167,12 +141,6 @@ define DOWNLOAD_HG
 		$($(PKG)_DL_OPTS)
 endef
 
-# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
-# repository
-define SOURCE_CHECK_HG
-	$(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
-endef
-
 define DOWNLOAD_WGET
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
@@ -183,10 +151,6 @@ define DOWNLOAD_WGET
 		$($(PKG)_DL_OPTS)
 endef
 
-define SOURCE_CHECK_WGET
-	$(WGET) --spider '$(call qstrip,$(1))'
-endef
-
 define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
@@ -197,10 +161,6 @@ define DOWNLOAD_LOCALFILES
 		$($(PKG)_DL_OPTS)
 endef
 
-define SOURCE_CHECK_LOCALFILES
-	test -e $(call stripurischeme,$(call qstrip,$(1)))
-endef
-
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -221,10 +181,6 @@ define DOWNLOAD
 	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
 endef
 
-define SOURCE_CHECK
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),SOURCE_CHECK)
-endef
-
 define DOWNLOAD_INNER
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
 	if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2916a7bbad..79bea906e2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -694,10 +694,6 @@ $(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
 endif # actual sources != sources
 endif # actual sources != ""
 
-$(1)-source-check: PKG=$(2)
-$(1)-source-check:
-	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
-
 $(1)-external-deps:
 	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
 		echo `basename $$$$p` ; \
-- 
2.13.2
