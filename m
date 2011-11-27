From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Nov 2011 22:39:23 +0100
Subject: [Buildroot] [git commit] Add support for packages stored in
	Mercurial (hg) repositories
Message-ID: <20111201085839.C5FF08F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f694c0761d15901b74e972b08938fecfda3b510b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for packages stored in Mercurial (hg) repositories.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                   |    4 ++++
 package/Makefile.package.in |   33 +++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 280ff03..ab77ef3 100644
--- a/Config.in
+++ b/Config.in
@@ -44,6 +44,10 @@ config BR2_SSH
 	string "Secure shell (ssh) command"
 	default "ssh"
 
+config BR2_HG
+	string "Mercurial (hg) command"
+	default "hg"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 7eddf17..8985d5a 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -92,6 +92,7 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN))
 BZR:=$(call qstrip,$(BR2_BZR))
 GIT:=$(call qstrip,$(BR2_GIT))
+HG:=$(call qstrip,$(BR2_HG)) $(QUIET)
 SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
 LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
@@ -125,20 +126,20 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 domainseparator=$(if $(1),$(1),/)
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN,BZR,LOCALFILES} helpers are in charge of getting a
+# The DOWNLOAD_{GIT,SVN,BZR,HG,LOCALFILES} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
 # ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers are in charge of
+# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers are in charge of
 # simply checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers simply output
-# to the console the names of the files that will be downloaded, or path
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers simply
+# output to the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
 ################################################################################
@@ -214,6 +215,27 @@ define SHOW_EXTERNAL_DEPS_SCP
 endef
 
 
+define DOWNLOAD_HG
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
+	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
+	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null)
+endef
+
+# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
+# repository
+define SOURCE_CHECK_HG
+  $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_HG
+  echo $($(PKG)_SOURCE)
+endef
+
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
@@ -267,6 +289,7 @@ define DOWNLOAD
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
 			scp) $($(DL_MODE)_SCP) && exit ;; \
+			hg) $($(DL_MODE)_HG) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
@@ -698,6 +721,8 @@ else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
 else ifeq ($$($(2)_SITE_METHOD),scp)
 DL_TOOLS_DEPENDENCIES += scp ssh
+else ifeq ($$($(2)_SITE_METHOD),hg)
+DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
 endif # $(2)_KCONFIG_VAR
