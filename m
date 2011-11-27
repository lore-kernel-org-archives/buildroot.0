From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Nov 2011 22:37:25 +0100
Subject: [Buildroot] [git commit branch/next] GENTARGETS: add support for
	scp://
Message-ID: <20111127214007.288D38F6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c61788f097670acd7643288c21fb86c2cc34d28a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds support for scp:// both for use in the package Makefiles, as for
the BR2_PRIMARY_SITE variable.

This patch was based on the work of Richard Guy Briggs
(see https://bugs.busybox.net/show_bug.cgi?id=3343).

[Peter: small whitespace fixes]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                   |   13 +++++++++-
 package/Makefile.package.in |   55 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/Config.in b/Config.in
index 0cf4d49..280ff03 100644
--- a/Config.in
+++ b/Config.in
@@ -36,6 +36,14 @@ config BR2_LOCALFILES
 	string "Local files retrieval command"
 	default "cp"
 
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
@@ -102,7 +110,10 @@ config BR2_PRIMARY_SITE
 	  Primary site to download from. If this option is set then buildroot
 	  will try to download package source first from this site and try the
 	  default if the file is not found.
-	  NOTE: This only works for packages using the Makefile.autotools.in
+	  Valid URIs are URIs recognized by $(WGET) and scp URIs of the form
+	  scp://[user@]host:path.
+	  NOTE: This works for all packages using the central package
+	  infrastructure (generic, autotools, cmake, ...)
 
 config BR2_BACKUP_SITE
 	string "Backup download site"
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b5ef57b..7eddf17 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -92,6 +92,8 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN))
 BZR:=$(call qstrip,$(BR2_BZR))
 GIT:=$(call qstrip,$(BR2_GIT))
+SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
+SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
 LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
@@ -104,20 +106,39 @@ ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
 
+#
+# URI scheme helper functions
+# Example URIs:
+# * http://www.example.com/dir/file
+# * scp://www.example.com:dir/file (with domainseparator :)
+#
+# geturischeme: http
+geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+# stripurischeme: www.example.com/dir/file
+stripurischeme=$(lastword $(subst ://, ,$(call qstrip,$(1))))
+# domain: www.example.com
+domain=$(firstword $(subst $(call domainseparator,$(2)), ,$(call stripurischeme,$(1))))
+# notdomain: dir/file
+notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(call stripurischeme,$(1)))
+#
+# default domainseparator is /, specify alternative value as first argument
+domainseparator=$(if $(1),$(1),/)
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR,LOCALFILES} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
-# archive out of it. DOWNLOAD_WGET is the normal wget-based download
+# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
+# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
 # mechanism.
 #
-# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES} helpers are in charge of simply
-# checking that the source is available for download. This can be used
+# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers are in charge of
+# simply checking that the source is available for download. This can be used
 # to make sure one will be able to get all the sources needed for
 # one's build configuration.
 #
-# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,LOCALFILES} helpers simply output to
-# the console the names of the files that will be downloaded, or path
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers simply output
+# to the console the names of the files that will be downloaded, or path
 # and revision of the source repositories, producing a list of all the
 # "external dependencies" of a given build configuration.
 ################################################################################
@@ -176,6 +197,22 @@ define SHOW_EXTERNAL_DEPS_SVN
   echo $($(PKG)_SOURCE)
 endef
 
+# SCP URIs should be of the form scp://[user@]host:filepath
+# Note that filepath is relative to the user's home directory, so you may want
+# to prepend the path with a slash: scp://[user@]host:/absolutepath
+define DOWNLOAD_SCP
+	test -e $(DL_DIR)/$(2) || \
+	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
+endef
+
+define SOURCE_CHECK_SCP
+	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1)/$(2),:) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_SCP
+	echo $(2)
+endef
+
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
@@ -218,7 +255,10 @@ endef
 
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
@@ -226,6 +266,7 @@ define DOWNLOAD
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
+			scp) $($(DL_MODE)_SCP) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
@@ -655,6 +696,8 @@ else ifeq ($$($(2)_SITE_METHOD),git)
 DL_TOOLS_DEPENDENCIES += git
 else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
+else ifeq ($$($(2)_SITE_METHOD),scp)
+DL_TOOLS_DEPENDENCIES += scp ssh
 endif # SITE_METHOD
 
 endif # $(2)_KCONFIG_VAR
