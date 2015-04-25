From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:42:48 +0200
Subject: [Buildroot] [PATCHv3 04/18] pkg-download: remove support for the
	SHOW_EXTERNAL_DEPS DL_MODE
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the external-deps implementation relies on the per-package
<pkg>-all-external-deps and <pkg>-external-deps targets and no longer
on the 'source' target with a custom DL_MODE, we can get rid of the
support for the SHOW_EXTERNAL_DEPS DL_MODE value in the pkg-download
logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 45 ++-------------------------------------------
 package/pkg-generic.mk  |  5 +----
 2 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1fc23c4..eee9e59 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,9 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
 
-# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
-# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
-# external-deps target.
+# Default spider mode is 'DOWNLOAD'. Other possible value is
+# 'SOURCE_CHECK' used by the _source-check target.
 DL_MODE = DOWNLOAD
 
 # DL_DIR may have been set already from the environment
@@ -74,11 +73,6 @@ export BR_NO_CHECK_HASH_FOR
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
@@ -103,11 +97,6 @@ define SOURCE_CHECK_GIT
   $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_GIT
-	echo $($(PKG)_SOURCE)
-endef
-
-
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -122,10 +111,6 @@ define SOURCE_CHECK_BZR
 	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_BZR
-	echo $($(PKG)_SOURCE)
-endef
-
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -142,10 +127,6 @@ define SOURCE_CHECK_CVS
 	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
 endef
 
-define SHOW_EXTERNAL_DEPS_CVS
-	echo $($(PKG)_SOURCE)
-endef
-
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -160,10 +141,6 @@ define SOURCE_CHECK_SVN
   $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_SVN
-  echo $($(PKG)_SOURCE)
-endef
-
 # SCP URIs should be of the form scp://[user@]host:filepath
 # Note that filepath is relative to the user's home directory, so you may want
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
@@ -180,11 +157,6 @@ define SOURCE_CHECK_SCP
 	$(SSH) $(call domain,$(1),:) ls '$(call notdomain,$(1),:)' > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_SCP
-	echo $(2)
-endef
-
-
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
@@ -201,11 +173,6 @@ define SOURCE_CHECK_HG
   $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
 endef
 
-define SHOW_EXTERNAL_DEPS_HG
-  echo $($(PKG)_SOURCE)
-endef
-
-
 define DOWNLOAD_WGET
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
@@ -219,10 +186,6 @@ define SOURCE_CHECK_WGET
   $(WGET) --spider '$(call qstrip,$(1))'
 endef
 
-define SHOW_EXTERNAL_DEPS_WGET
-  echo $(2)
-endef
-
 define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
@@ -236,10 +199,6 @@ define SOURCE_CHECK_LOCALFILES
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
index de63f2f..a12b868 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -122,13 +122,10 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
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
2.1.0
