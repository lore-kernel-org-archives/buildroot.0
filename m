From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  2 Oct 2011 02:28:14 +0200
Subject: [Buildroot] [PATCH 2/2] Refactored the download helpers
In-Reply-To: <1317515294-8699-1-git-send-email-arnout@mind.be>
References: <1317515294-8699-1-git-send-email-arnout@mind.be>
Message-ID: <1317515294-8699-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

All of the common work is now moved to DOWNLOAD. It tests if the
file already exists, and does the atomic move from DL_TMPDIR to
DL_DIR.  It also cleans up $(PKG)_DL_DIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.package.in |   77 ++++++++++++++++++------------------------
 1 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 6f23989..5ba13ba 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -110,7 +110,8 @@ DL_TMPDIR=$(DL_DIR)/partial
 # working copy of the source repository for their corresponding SCM,
 # checking out the requested version / commit / tag, and create an
 # archive out of it. DOWNLOAD_WGET is the normal wget-based download
-# mechanism.
+# mechanism.  The result is placed in DL_TMPDIR, and moved atomically to
+# DL_DIR by the DOWNLOAD helper.
 #
 # The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES} helpers are in charge of simply
 # checking that the source is available for download. This can be used
@@ -124,17 +125,11 @@ DL_TMPDIR=$(DL_DIR)/partial
 ################################################################################
 
 define DOWNLOAD_GIT
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_TMPDIR) > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
+	(cd $(DL_TMPDIR) && \
 	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
-	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	cd $($(PKG)_BASE_NAME) && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_TMPDIR)/$($(PKG)_SOURCE) && \
-	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE) && \
-	popd > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+		gzip -c > $(DL_TMPDIR)/$($(PKG)_SOURCE))
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
@@ -149,9 +144,7 @@ endef
 
 
 define DOWNLOAD_BZR
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	($(BZR) export $(DL_TMPDIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION) && \
-	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
+	$(BZR) export $(DL_TMPDIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
 endef
 
 define SOURCE_CHECK_BZR
@@ -164,14 +157,9 @@ endef
 
 
 define DOWNLOAD_SVN
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_TMPDIR) > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
+	(cd $(DL_TMPDIR) && \
 	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
-	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
-	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE) && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/)
 endef
 
 define SOURCE_CHECK_SVN
@@ -184,10 +172,7 @@ endef
 
 
 define DOWNLOAD_WGET
-	test -e $(DL_DIR)/$(2) || \
-	($(RM) $(DL_TMPDIR)/$($(PKG)_SOURCE); \
-	$(WGET) -P $(DL_TMPDIR) $(call qstrip,$(1))/$(2) && \
-	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
+	$(WGET) -P $(DL_TMPDIR) $(call qstrip,$(1))/$(2)
 endef
 
 define SOURCE_CHECK_WGET
@@ -199,10 +184,7 @@ define SHOW_EXTERNAL_DEPS_WGET
 endef
 
 define DOWNLOAD_LOCALFILES
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-		($(RM) -r $(DL_TMPDIR)/$($(PKG)_SOURCE); \
-		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_TMPDIR) && \
-		mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
+	$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_TMPDIR)
 endef
 
 define SOURCE_CHECK_LOCALFILES
@@ -227,22 +209,29 @@ endef
 ################################################################################
 
 define DOWNLOAD
-	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
-	fi ; \
-	if test -n "$(1)" ; then \
-		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(DL_MODE)_GIT) && exit ;; \
-			svn) $($(DL_MODE)_SVN) && exit ;; \
-			bzr) $($(DL_MODE)_BZR) && exit ;; \
-			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
-		esac ; \
-	fi ; \
-	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
-	fi ; \
-	exit 1
+	$(Q)if test ! -e $(DL_DIR)/$(2); then \
+		$(RM) -r $(DL_TMPDIR)/$(2) $($(PKG)_DL_DIR); \
+		if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
+			$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+		fi ; \
+		if test -n "$(1)" ; then \
+			case "$($(PKG)_SITE_METHOD)" in \
+				git) $($(DL_MODE)_GIT) && exit ;; \
+				svn) $($(DL_MODE)_SVN) && exit ;; \
+				bzr) $($(DL_MODE)_BZR) && exit ;; \
+				file) $($(DL_MODE)_LOCALFILES) && exit ;; \
+				*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
+			esac ; \
+		fi ; \
+		if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
+			$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+		fi ; \
+		exit 1; \
+	fi
+	$(Q)if test -e $(DL_TMPDIR)/$(2); then \
+		mv $(DL_TMPDIR)/$(2) $(DL_DIR)/$(2); \
+	fi
+	$(Q)test -z "$($(PKG)_DL_DIR)" || $(RM) -r $($(PKG)_DL_DIR)
 endef
 
 # Utility programs used to build packages
-- 
1.7.6.3
