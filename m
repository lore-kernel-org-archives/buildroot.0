From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 13 Jul 2010 09:15:02 +0200
Subject: [Buildroot] [PATCH 2/4] Implement basic non-wget download methods
In-Reply-To: <1279005304-8780-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1279005304-8780-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1279005304-8780-3-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages can now be sourced from Git and Subversion repositories by
setting a _SITE_METHOD variable to 'git' or 'svn', respectively and
without the quotes.

The package's _VERSION variable defines which commit, revision, tag or
branch should be checked out. For Git, it can be HEAD, a commit ID, a
tag name or branch name (anything that can be checked out with `git
checkout`). For Subversion, it must be a revision number, or HEAD.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 Config.in                   |    4 ++
 Makefile                    |    1 +
 package/Makefile.package.in |   70 ++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 6adfe49..0fe4cd1 100644
--- a/Config.in
+++ b/Config.in
@@ -41,6 +41,10 @@ config BR2_GIT
 	string "Git command to download source tree"
 	default "git clone"
 
+config BR2_GIT_CO
+	string "Git command to checkout a given commit or tag"
+	default "git checkout"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/Makefile b/Makefile
index 2e49a6b..65b43f1 100644
--- a/Makefile
+++ b/Makefile
@@ -249,6 +249,7 @@ SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
 BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
 BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+GIT_CO:=$(call qstrip,$(BR2_GIT_CO)) $(QUIET)
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b21741f..624d006 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -69,6 +69,38 @@ TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 ################################################################################
+# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a working copy of
+# the source repository for their corresponding SCM, checkouting the requested
+# version / commit / tag, and create an archive out of it.
+################################################################################
+
+define VCS_PACK_SOURCE
+	$(TAR) czf $($(PKG)_SOURCE) --exclude-vcs $($(PKG)_BASE_NAME)/ && \
+	rm -rf $($(PKG)_DL_DIR)
+endef
+
+define DOWNLOAD_GIT
+	pushd $(DL_DIR) > /dev/null && \
+	$(GIT) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	pushd $($(PKG)_DL_DIR) > /dev/null && \
+	$(GIT_CO) $($(PKG)_DL_VERSION) && \
+	popd > /dev/null && \
+	$(VCS_PACK_SOURCE) && \
+	popd > /dev/null
+endef
+
+define DOWNLOAD_SVN
+	pushd $(DL_DIR) > /dev/null && \
+	$(SVN_CO) -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(VCS_PACK_SOURCE) && \
+	popd > /dev/null
+endef
+
+define DOWNLOAD_WGET
+	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
+endef
+
+################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
 # 2) Download site
@@ -83,8 +115,20 @@ TERM_RESET := $(shell tput rmso)
 
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
-	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
-	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
+	(if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
+		$(call DOWNLOAD_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+	fi ; \
+	if test -n "$(1)" ; then \
+		case "$($(PKG)_SITE_METHOD)" in \
+			git) $(DOWNLOAD_GIT) && exit ;; \
+			svn) $(DOWNLOAD_SVN) && exit ;; \
+			*) $(call DOWNLOAD_WGET,$(1),$(2)) && exit ;; \
+		esac ; \
+	fi ; \
+	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
+		$(call DOWNLOAD_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+	fi ; \
+	exit 1)
 endef
 
 # Utility programs used to build packages
@@ -244,13 +288,23 @@ ifndef $(2)_VERSION
  endif
 endif
 
-$(2)_DIR			=  $$(BUILD_DIR)/$(1)-$$($(2)_VERSION)
+# Keep the package version that may contain forward slashes in the _DL_VERSION
+# variable, then replace all forward slashes ('/') by underscores ('_') to
+# sanitize the package version that is used in paths, directory and file names.
+# Forward slashes may appear in the package's version when pointing to a
+# version control system branch or tag, for example remotes/origin/1_10_stable.
+$(2)_DL_VERSION	= $($(2)_VERSION)
+$(2)_VERSION = $(subst /,_,$($(2)_VERSION))
+
+$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
+$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $(1)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
  endif
 endif
 
@@ -269,6 +323,14 @@ ifndef $(2)_SITE
  endif
 endif
 
+ifndef $(2)_SITE_METHOD
+ ifdef $(3)_SITE_METHOD
+  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+ else
+	$(2)_SITE_METHOD = wget
+ endif
+endif
+
 $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_TARGET		?= YES
-- 
1.6.3.3.346.g8a41d
