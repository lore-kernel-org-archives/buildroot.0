From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:19 +0200
Subject: [Buildroot] [PATCHv2 09/21] package: remove useless
	SHOW_EXTERNAL_DEPS support
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that a package-based 'make external-deps' support has been added,
the DL_MODE=SHOW_EXTERNAL_DEPS mechanism is no longer needed, so some
clean up is done in this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 44 ++------------------------------------------
 package/pkg-generic.mk  |  5 +----
 2 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8e4a1ec..208c83c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -18,9 +18,8 @@ SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
-# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
-# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
-# external-deps target.
+# Default spider mode is 'DOWNLOAD'. The possible value is
+# 'SOURCE_CHECK' used by the _source-check target.
 DL_MODE=DOWNLOAD
 
 # Override BR2_DL_DIR if shell variable defined
@@ -66,11 +65,6 @@ domainseparator=$(if $(1),$(1),/)
 # The SOURCE_CHECK_* helpers are in charge of simply checking that the source
 # is available for download. This can be used to make sure one will be able
 # to get all the sources needed for one's build configuration.
-#
-# The SHOW_EXTERNAL_DEPS_* helpers simply output to the console the names
-# of the files that will be downloaded, or path and revision of the
-# source repositories, producing a list of all the "external dependencies"
-# of a given build configuration.
 ################################################################################
 
 # Try a shallow clone - but that only works if the version is a ref (tag or
@@ -101,11 +95,6 @@ define SOURCE_CHECK_GIT
   $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_GIT
-	echo $($(PKG)_SOURCE)
-endef
-
-
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
@@ -115,10 +104,6 @@ define SOURCE_CHECK_BZR
 	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_BZR
-	echo $($(PKG)_SOURCE)
-endef
-
 define DOWNLOAD_CVS
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
@@ -134,10 +119,6 @@ define SOURCE_CHECK_CVS
 	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
 endef
 
-define SHOW_EXTERNAL_DEPS_CVS
-	echo $($(PKG)_SOURCE)
-endef
-
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
@@ -151,10 +132,6 @@ define SOURCE_CHECK_SVN
   $(SVN) ls $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_SVN
-  echo $($(PKG)_SOURCE)
-endef
-
 # SCP URIs should be of the form scp://[user@]host:filepath
 # Note that filepath is relative to the user's home directory, so you may want
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
@@ -167,11 +144,6 @@ define SOURCE_CHECK_SCP
 	$(SSH) $(call domain,$(1),:) ls '$(call notdomain,$(1),:)' > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_SCP
-	echo $(2)
-endef
-
-
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
@@ -188,10 +160,6 @@ define SOURCE_CHECK_HG
   $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_HG
-  echo $($(PKG)_SOURCE)
-endef
-
 # Download a file using wget. Only download the file if it doesn't
 # already exist in the download directory. If the download fails,
 # remove the file (because wget -O creates a 0-byte file even if the
@@ -209,10 +177,6 @@ define SOURCE_CHECK_WGET
   $(WGET) --spider '$(call qstrip,$(1))'
 endef
 
-define SHOW_EXTERNAL_DEPS_WGET
-  echo $(2)
-endef
-
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
 		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
@@ -222,10 +186,6 @@ define SOURCE_CHECK_LOCALFILES
   test -e $(call stripurischeme,$(call qstrip,$(1)))
 endef
 
-define SHOW_EXTERNAL_DEPS_LOCALFILES
-  echo $(2)
-endef
-
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91e79f5..438a954 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -70,13 +70,10 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
 	$(Q)touch $@
 
-# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
-# packages
+# Handle the SOURCE_CHECK case for rsynced packages
 $(BUILD_DIR)/%/.stamp_rsync_sourced:
 ifeq ($(DL_MODE),SOURCE_CHECK)
 	test -d $(SRCDIR)
-else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
-	echo "file://$(SRCDIR)"
 else
 	@true # Nothing to do to source a local package
 endif
-- 
1.8.1.2
