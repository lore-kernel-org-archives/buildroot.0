From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:42:13 +0200
Subject: [Buildroot] [PATCH 2 of 3] Add support for packages stored in
 Mercurial (hg) repositories
In-Reply-To: <patchbomb.1316587331@localhost6.localdomain6>
References: <patchbomb.1316587331@localhost6.localdomain6>
Message-ID: <1319e8da5428ed393880.1316587333@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for packages stored in Mercurial (hg) repositories.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                   |   4 ++++
 package/Makefile.package.in |  31 ++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -40,6 +40,10 @@
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
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -76,6 +76,7 @@
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
+HG:=$(call qstrip,$(BR2_HG)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -92,19 +93,19 @@
 stripurischeme=$(lastword $(subst ://, ,$(call qstrip,$(1))))
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
+# The DOWNLOAD_{GIT,SVN,BZR,HG} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
 # ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,SCP,WGET} helpers are in charge of simply
+# The SOURCE_CHECK_{GIT,SVN,BZR,HG,SCP,WGET} helpers are in charge of simply
 # checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,SCP,WGET} helpers simply output to
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,SCP,WGET} helpers simply output to
 # the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
@@ -179,6 +180,27 @@
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
+  echo "$($(PKG)_SITE) [hg: $($(PKG)_DL_VERSION)]"
+endef
+
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
@@ -218,6 +240,7 @@
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			scp) $($(DL_MODE)_SCP) && exit ;; \
+			hg) $($(DL_MODE)_HG) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
@@ -575,6 +598,8 @@
 DL_TOOLS_DEPENDENCIES += bzr
 else ifeq ($$($(2)_SITE_METHOD),scp)
 DL_TOOLS_DEPENDENCIES += scp ssh
+else ifeq ($$($(2)_SITE_METHOD),hg)
+DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
 endif # $(2)_KCONFIG_VAR
