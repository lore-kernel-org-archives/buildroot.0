From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:05:43 +0200
Subject: [Buildroot] [git commit] downloads: add basic CVS support
Message-ID: <20130912223325.43DB39B723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15eb1fafa35cd9a9a0bbb70508699bdea1262b01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The support is for pserver mode anonymous CVS.
source-check is based on login since many servers don't support or have
ls/rls disabled.

Usage is pretty straightforward.
PKG_SITE defines the site hostname and remote directory.
The module is defined by the bare package name.
Version is date based.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in               |    4 ++++
 package/pkg-download.mk |   39 +++++++++++++++++++++++++++++----------
 package/pkg-generic.mk  |    2 ++
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/Config.in b/Config.in
index 65c29b4..1b30ce1 100644
--- a/Config.in
+++ b/Config.in
@@ -42,6 +42,10 @@ config BR2_GIT
 	string "Git command"
 	default "git"
 
+config BR2_CVS
+	string "CVS command"
+	default "cvs"
+
 config BR2_LOCALFILES
 	string "Local files retrieval command"
 	default "cp"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 97c9226..8e4a1ec 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -10,6 +10,7 @@
 # Download method commands
 WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN := $(call qstrip,$(BR2_SVN))
+CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
 GIT := $(call qstrip,$(BR2_GIT))
 HG := $(call qstrip,$(BR2_HG)) $(QUIET)
@@ -55,22 +56,21 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 domainseparator=$(if $(1),$(1),/)
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN,BZR,HG,LOCALFILES} helpers are in charge of getting a
-# working copy of the source repository for their corresponding SCM,
+# The DOWNLOAD_* helpers are in charge of getting a working copy
+# of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
 # ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers are in charge of
-# simply checking that the source is available for download. This can be used
-# to make sure one will be able to get all the sources needed for
-# one's build configuration.
+# The SOURCE_CHECK_* helpers are in charge of simply checking that the source
+# is available for download. This can be used to make sure one will be able
+# to get all the sources needed for one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers simply
-# output to the console the names of the files that will be downloaded, or path
-# and revision of the source repositories, producing a list of all the
-# "external dependencies" of a given build configuration.
+# The SHOW_EXTERNAL_DEPS_* helpers simply output to the console the names
+# of the files that will be downloaded, or path and revision of the
+# source repositories, producing a list of all the "external dependencies"
+# of a given build configuration.
 ################################################################################
 
 # Try a shallow clone - but that only works if the version is a ref (tag or
@@ -119,6 +119,24 @@ define SHOW_EXTERNAL_DEPS_BZR
 	echo $($(PKG)_SOURCE)
 endef
 
+define DOWNLOAD_CVS
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
+	$(CVS) -z3 -d:pserver:anonymous@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
+		co -d $($(PKG)_BASE_NAME) -r :$($(PKG)_DL_VERSION) -P $($(PKG)_RAWNAME) && \
+	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null)
+endef
+
+# Not all CVS servers support ls/rls, use login to see if we can connect
+define SOURCE_CHECK_CVS
+	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
+endef
+
+define SHOW_EXTERNAL_DEPS_CVS
+	echo $($(PKG)_SOURCE)
+endef
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
@@ -244,6 +262,7 @@ define DOWNLOAD_INNER
 		case "$$scheme" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
+			cvs) $($(DL_MODE)_CVS) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
 			scp) $($(DL_MODE)_SCP) && exit ;; \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4dd395b..bfc4dc1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -542,6 +542,8 @@ else ifeq ($$($(2)_SITE_METHOD),scp)
 DL_TOOLS_DEPENDENCIES += scp ssh
 else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
+else ifeq ($$($(2)_SITE_METHOD),cvs)
+DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
 # $(firstword) is used here because the extractor can have arguments, like
