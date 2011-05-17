From: david.wagner at free-electrons.com <david.wagner@free-electrons.com>
Date: Tue, 17 May 2011 14:50:03 +0200
Subject: [Buildroot] [PATCH] Add support for local packages through
	'file://' pseudo-protocol
In-Reply-To: <1305636603-12726-1-git-send-email-david.wagner@free-electrons.com>
References: <1305636603-12726-1-git-send-email-david.wagner@free-electrons.com>
Message-ID: <1305636603-12726-2-git-send-email-david.wagner@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Wagner <david.wagner@free-electrons.com>

Can be useful to integrate a home-made project or for testing purposes.
The default command to retrieve files is 'cp' but 'rsync' could also be used.
Through sshfs, it should also be possible to get non-public remote files on a
ssh server.
---
 Config.in                   |    4 ++++
 package/Makefile.package.in |   21 ++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index a67c08d..954c4f3 100644
--- a/Config.in
+++ b/Config.in
@@ -32,6 +32,10 @@ config BR2_GIT
 	string "Git command"
 	default "git"
 
+config BR2_LOCALFILES
+	string "Local files retrieval command"
+	default "cp"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..4c45ddc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -73,6 +73,7 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
 BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -85,18 +86,18 @@ DL_DIR:=$(TOPDIR)/dl
 endif
 
 ################################################################################
-# The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
+# The DOWNLOAD_{GIT,SVN,BZR,LOCALFILES} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET} helpers are in charge of simply
+# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES} helpers are in charge of simply
 # checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET} helpers simply output to
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,LOCALFILES} helpers simply output to
 # the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
@@ -170,6 +171,19 @@ define SHOW_EXTERNAL_DEPS_WGET
   echo $(2)
 endef
 
+define DOWNLOAD_LOCALFILES
+	test -e $(DL_DIR)/$(2) || \
+		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1)))/$(2) $(DL_DIR)
+endef
+
+define SOURCE_CHECK_LOCALFILES
+  test -e $(call qstrip,$(subst file://,,$(1)))/$(2)
+endef
+
+define SHOW_EXTERNAL_DEPS_LOCALFILES
+  echo $(2)
+endef
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -192,6 +206,7 @@ define DOWNLOAD
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.0.4
