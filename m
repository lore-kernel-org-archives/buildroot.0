From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:10 +0200
Subject: [Buildroot] [PATCH 11/12] Add support for local packages through
	'file://' pseudo-protocol
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c596c1abebee351179d9d58734ce0c46a774b5f0.1311141088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Wagner <david.wagner@free-electrons.com>

This can be used this way :

<pkg>_VERSION = 42
<pkg>_SITE = file:///some/local/directory
<pkg>_SOURCE = mypkg-$(<pkg>_VERSION).tar.bz2

Can be useful to integrate a home-made project or for testing purposes.
The default command to retrieve files is 'cp' but 'rsync' could also be used.
Through sshfs, it should also be possible to get non-public remote files on a
ssh server.

[ Thomas Petazzoni: use $(PKG)_SITE and $(PKG)_SOURCE variables
  instead of $(1) and $(2) ]

Signed-off-by: David Wagner <david.wagner@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                   |    4 ++++
 package/Makefile.package.in |   21 ++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 784f4ef..517c2de 100644
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
index cc26cdc..fdf09b6 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -91,6 +91,7 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
 BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -103,18 +104,18 @@ DL_DIR:=$(TOPDIR)/dl
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
@@ -188,6 +189,19 @@ define SHOW_EXTERNAL_DEPS_WGET
   echo $(1)/$(2)
 endef
 
+define DOWNLOAD_LOCALFILES
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_DIR)
+endef
+
+define SOURCE_CHECK_LOCALFILES
+  test -e $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE)
+endef
+
+define SHOW_EXTERNAL_DEPS_LOCALFILES
+  echo $($(PKG)_SITE)/$($(PKG)_SOURCE)
+endef
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -210,6 +224,7 @@ define DOWNLOAD
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.4.1
