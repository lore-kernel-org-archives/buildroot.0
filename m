From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:09:47 +0200
Subject: [Buildroot] [PATCH 4/8] Implement basic non-wget download methods
In-Reply-To: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422191-30926-5-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages can now be sourced from Git and Subversion repositories. The
download method will be autodetected from the URI (git://, svn://, etc).
If the repository is accessed through http(s), you can force the
download method by setting a _SITE_METHOD variable to either 'git' or
'svn', respectively and without the quotes.

The package's _VERSION variable defines which commit, revision, tag or
branch should be checked out. For Git, it can be HEAD, a commit ID, a
tag name or branch name (anything that can be checked out with `git
checkout`). For Subversion, it must be a revision number, or HEAD.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 package/Makefile.package.in |   68 ++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index ba0fd84..5444472 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -69,6 +69,35 @@ TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 ################################################################################
+# The DOWNLOAD_{GIT,SVN} helpers are in charge of getting a working copy of
+# the source repository for their corresponding SCM, checking out the requested
+# version / commit / tag, and create an archive out of it.
+################################################################################
+
+define DOWNLOAD_GIT
+	pushd $(DL_DIR) > /dev/null && \
+	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
+		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	popd > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null
+endef
+
+define DOWNLOAD_SVN
+	pushd $(DL_DIR) > /dev/null && \
+	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
+	rm -rf $($(PKG)_DL_DIR) && \
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
@@ -83,8 +112,20 @@ TERM_RESET := $(shell tput rmso)
 
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
@@ -244,13 +285,23 @@ ifndef $(2)_VERSION
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
 
@@ -269,6 +320,15 @@ ifndef $(2)_SITE
  endif
 endif
 
+ifndef $(2)_SITE_METHOD
+ ifdef $(3)_SITE_METHOD
+  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+ else
+	# Try automatic detection using the scheme part of the URI
+	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+ endif
+endif
+
 $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_TARGET		?= YES
-- 
1.6.3.3.346.g8a41d
