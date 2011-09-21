From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:42:12 +0200
Subject: [Buildroot] [PATCH 1 of 3] GENTARGETS: add support for scp://
In-Reply-To: <patchbomb.1316587331@localhost6.localdomain6>
References: <patchbomb.1316587331@localhost6.localdomain6>
Message-ID: <8549a902c5c7070219ec.1316587332@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for scp:// both for use in the package Makefiles, as for
the BR2_PRIMARY_SITE variable.

This patch was based on the work of Richard Guy Briggs
(see https://bugs.busybox.net/show_bug.cgi?id=3343).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                   |   8 ++++++++
 package/Makefile.package.in |  34 +++++++++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -32,6 +32,14 @@
 	string "Git command"
 	default "git"
 
+config BR2_SCP
+	string "Secure copy (scp) command"
+	default "scp"
+
+config BR2_SSH
+	string "Secure shell (ssh) command"
+	default "ssh"
+
 config BR2_ZCAT
 	string "zcat command"
 	default "gzip -d -c"
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -74,6 +74,8 @@
 SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
 BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
+SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -85,19 +87,24 @@
 DL_DIR:=$(TOPDIR)/dl
 endif
 
+# URI scheme helper functions
+geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+stripurischeme=$(lastword $(subst ://, ,$(call qstrip,$(1))))
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
-# archive out of it. DOWNLOAD_WGET is the normal wget-based download
+# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
+# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET} helpers are in charge of simply
+# The SOURCE_CHECK_{GIT,SVN,BZR,SCP,WGET} helpers are in charge of simply
 # checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET} helpers simply output to
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,SCP,WGET} helpers simply output to
 # the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
@@ -158,6 +165,20 @@
 endef
 
 
+define DOWNLOAD_SCP
+	test -e $(DL_DIR)/$(2) || \
+	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
+endef
+
+define SOURCE_CHECK_SCP
+	$(SSH) $(call stripurischeme,`echo "$(call qstrip,$(1))" | cut -d/ -f1`) ls /`echo "$(call qstrip,$(1))/$(2)" | cut -d/ -f2-` > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_SCP
+	echo "$($(PKG)_SITE) [scp: $($(PKG)_DL_VERSION)]"
+endef
+
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
@@ -186,13 +207,17 @@
 
 define DOWNLOAD
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
+			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+		esac ; \
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			scp) $($(DL_MODE)_SCP) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
@@ -548,6 +573,8 @@
 DL_TOOLS_DEPENDENCIES += git
 else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
+else ifeq ($$($(2)_SITE_METHOD),scp)
+DL_TOOLS_DEPENDENCIES += scp ssh
 endif # SITE_METHOD
 
 endif # $(2)_KCONFIG_VAR
