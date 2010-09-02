From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:19:30 +0200
Subject: [Buildroot] [PATCH 7/8] Re-implement the source-check and
	external-deps targets
In-Reply-To: <1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422770-31768-2-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new DL_MODE variable dispatches between the various download
implementations of each method (Git, Subversion, Wget) to deal with the
normal download (default mode, 'DOWNLOAD'), the source-check
('SOURCE_CHECK') and to show the external dependencies for external-deps
('SHOW_EXTERNAL_DEPS').

For the latter, the legacy script wget-show-external-deps.sh is no
longer required as $(WGET) isn't called directly anymore but always
through the DOWNLOAD helper.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 Makefile                             |   13 +----
 package/Makefile.package.in          |   86 ++++++++++++++++++++++++++++-----
 package/mpfr/mpfr.mk                 |    2 +
 toolchain/wget-show-external-deps.sh |    6 --
 4 files changed, 77 insertions(+), 30 deletions(-)
 delete mode 100755 toolchain/wget-show-external-deps.sh

diff --git a/Makefile b/Makefile
index 0d3c6d6..f243a4a 100644
--- a/Makefile
+++ b/Makefile
@@ -245,19 +245,10 @@ ifeq ($(ARCH),xtensa)
 ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
 
-WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
-BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
-GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-DL_DIR=$(call qstrip,$(BR2_DL_DIR))
-ifeq ($(DL_DIR),)
-DL_DIR:=$(TOPDIR)/dl
-endif
-
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
 STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
@@ -436,10 +427,10 @@ endif
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
-	@echo "TODO $@"
+	$(MAKE) DL_MODE=SOURCE_CHECK source
 
 external-deps:
-	@echo "TODO $@"
+	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS source
 
 show-targets:
 	@echo $(TARGETS)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 5444472..6f584a7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -68,35 +68,92 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESE
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
+# Download method commands
+WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
+SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
+BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
+GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+
+# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
+# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
+# external-deps target.
+DL_MODE=DOWNLOAD
+
+DL_DIR=$(call qstrip,$(BR2_DL_DIR))
+ifeq ($(DL_DIR),)
+DL_DIR:=$(TOPDIR)/dl
+endif
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN} helpers are in charge of getting a working copy of
 # the source repository for their corresponding SCM, checking out the requested
-# version / commit / tag, and create an archive out of it.
+# version / commit / tag, and create an archive out of it. DOWNLOAD_WGET is the
+# normal wget-based download mechanism.
+#
+# The SOURCE_CHECK_{GIT,SVN,WGET} helpers are in charge of simply checking that
+# the source is available for download. This can be used to make sure one will
+# be able to get all the sources needed for one's build configuration.
+#
+# The SHOW_EXTERNAL_DEPS_{GIT,SVN,WGET} helpers simply output to the console
+# the names of the files that will be downloaded, or path and revision of the
+# source repositories, producing a list of all the "external dependencies" of
+# a given build configuration.
 ################################################################################
 
 define DOWNLOAD_GIT
-	pushd $(DL_DIR) > /dev/null && \
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
 	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null
+	popd > /dev/null)
+endef
+
+# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
+# repository
+define SOURCE_CHECK_GIT
+  $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_GIT
+  echo "$($(PKG)_SITE) [git: $($(PKG)_DL_VERSION)]"
 endef
 
+
 define DOWNLOAD_SVN
-	pushd $(DL_DIR) > /dev/null && \
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
 	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
 	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null
+	popd > /dev/null)
+endef
+
+define SOURCE_CHECK_SVN
+  $(SVN) ls $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_SVN
+  echo "$($(PKG)_SITE) [svn: $($(PKG)_DL_VERSION)]"
 endef
 
+
 define DOWNLOAD_WGET
+	test -e $(DL_DIR)/$(2) || \
 	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
 endef
 
+define SOURCE_CHECK_WGET
+  $(WGET) --spider $(call qstrip,$(1))/$(2)
+endef
+
+define SHOW_EXTERNAL_DEPS_WGET
+  echo $(2)
+endef
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -111,21 +168,20 @@ endef
 ################################################################################
 
 define DOWNLOAD
-	$(Q)test -e $(DL_DIR)/$(2) || \
-	(if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-		$(call DOWNLOAD_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
+		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $(DOWNLOAD_GIT) && exit ;; \
-			svn) $(DOWNLOAD_SVN) && exit ;; \
-			*) $(call DOWNLOAD_WGET,$(1),$(2)) && exit ;; \
+			git) $($(DL_MODE)_GIT) && exit ;; \
+			svn) $($(DL_MODE)_SVN) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call DOWNLOAD_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
 	fi ; \
-	exit 1)
+	exit 1
 endef
 
 # Utility programs used to build packages
@@ -153,14 +209,18 @@ endef
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
 	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
+endif
 	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
+endif
 
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index b7b80a5..6979a9f 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -21,8 +21,10 @@ MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE)
 
 $(MPFR_PATCH_SOURCE):
 	$(call DOWNLOAD,$(MPFR_SITE),$(MPFR_PATCH))
+ifeq ($(DL_MODE),DOWNLOAD)
 	mv $(DL_DIR)/$(MPFR_PATCH) $@
 endif
+endif
 
 $(DL_DIR)/$(MPFR_SOURCE):
 	 $(call DOWNLOAD,$(MPFR_SITE),$(MPFR_SOURCE))
diff --git a/toolchain/wget-show-external-deps.sh b/toolchain/wget-show-external-deps.sh
deleted file mode 100755
index 20071c0..0000000
--- a/toolchain/wget-show-external-deps.sh
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-#
-# replacement for wget (see BR2_WGET) which simply shows the file name to be
-# downloaded. Used by the external-deps make target.
-
-exec basename ${!#}
\ No newline at end of file
-- 
1.6.3.3.346.g8a41d
