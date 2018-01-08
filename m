From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 21:25:46 +0100
Subject: [Buildroot] [git commit] pkg-{download,
 generic}: remove source-check
Message-ID: <20180108202724.044678356D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf28a165d992681a85b43a886005e669b3cb579b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This feature is not used by anyone in the core developpers and makes a
drastic simplification of the pkg-download infrastructure harder.

The future patch will move much of what's in the current pkg-download.mk
file into the dl-wrapper which is a shell script.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                |  7 +------
 package/pkg-download.mk | 44 --------------------------------------------
 package/pkg-generic.mk  | 14 +-------------
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/Makefile b/Makefile
index ed5642f..7d8ab51 100644
--- a/Makefile
+++ b/Makefile
@@ -141,7 +141,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 # We're building in two situations: when MAKECMDGOALS is empty
 # (default target is to build), or when MAKECMDGOALS contains
 # something else than one of the nobuild_targets.
-nobuild_targets := source %-source source-check \
+nobuild_targets := source %-source \
 	legal-info %-legal-info external-deps _external-deps \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
@@ -758,10 +758,6 @@ _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
-# check if download URLs are outdated
-.PHONY: source-check
-source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
-
 .PHONY: legal-info-clean
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
@@ -1048,7 +1044,6 @@ help:
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  printvars              - dump all the internal variables'
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fbbc2d7..3712b9c 100644
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
index fb5a1ca..a2a12e7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -719,10 +719,6 @@ $(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
 endif # actual sources != sources
 endif # actual sources != ""
 
-$(1)-source-check: PKG=$(2)
-$(1)-source-check:
-	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
-
 $(1)-external-deps:
 	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
 		echo `basename $$$$p` ; \
@@ -747,9 +743,6 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:
 $(1)-legal-source:
 
-$(1)-source-check:
-	test -d $$($(2)_OVERRIDE_SRCDIR)
-
 $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
 endif
@@ -775,9 +768,6 @@ $(1)-graph-rdepends: graph-depends-requirements
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
 
-$(1)-all-source-check:	$(1)-source-check
-$(1)-all-source-check:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source-check)
-
 $(1)-all-external-deps:	$(1)-external-deps
 $(1)-all-external-deps:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-external-deps)
 
@@ -977,7 +967,6 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-all-external-deps \
 	$(1)-all-legal-info \
 	$(1)-all-source \
-	$(1)-all-source-check \
 	$(1)-build \
 	$(1)-clean-for-rebuild \
 	$(1)-clean-for-reconfigure \
@@ -1002,8 +991,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-rsync \
 	$(1)-show-depends \
 	$(1)-show-version \
-	$(1)-source \
-	$(1)-source-check
+	$(1)-source
 
 ifneq ($$($(2)_SOURCE),)
 ifeq ($$($(2)_SITE),)
